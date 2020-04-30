import argparse
import logging
import sys
import uuid

from psycopg2 import connect

QUERY = """
SELECT  DISTINCT t.table_schema as schema_name
    FROM information_schema.tables t
    WHERE t.table_schema NOT IN
        ('pg_catalog', 'information_schema',
            'pg_toast', 'gp_toolkit', 'pg_internal')
    ORDER BY t.table_schema;
"""


def get_conn(connection_args):
    return connect(database=connection_args['database'],
                   host=connection_args['host'],
                   user=connection_args['user'],
                   password=connection_args['pass'])


def cleanup_metadata(connection_args):
    conn = get_conn(connection_args)

    cursor = conn.cursor()
    cursor.execute(QUERY)
    rows = cursor.fetchall()
    for row in rows:
        schema_name = row[0]
        schema_stmt = build_drop_schema_cascade_statement(schema_name)
        cursor.execute(schema_stmt)
        print('Cleaned schema: {}'.format(schema_name))
        conn.commit()

    cursor.close()


def build_drop_schema_cascade_statement(schema_name):
    schema_stmt = 'DROP SCHEMA {} CASCADE;'.format(schema_name)
    return schema_stmt


def parse_args():
    parser = argparse.ArgumentParser(
        description='Command line to cleanup metadata from postgresql')
    parser.add_argument('--postgresql-host',
                        help='Your postgresql server host',
                        required=True)
    parser.add_argument('--postgresql-user',
                        help='Your postgresql credentials user',
                        required=True)
    parser.add_argument('--postgresql-pass',
                        help='Your postgresql credentials password',
                        required=True)
    parser.add_argument('--postgresql-database',
                        help='Your postgresql database name',
                        required=True)
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    # Enable logging
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

    cleanup_metadata({
        'database': args.postgresql_database,
        'host': args.postgresql_host,
        'user': args.postgresql_user,
        'pass': args.postgresql_pass
    })
