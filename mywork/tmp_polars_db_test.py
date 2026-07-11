import sqlite3
import polars as pl

print('polars', pl.__version__)
con = sqlite3.connect(':memory:')
con.execute('CREATE TABLE t (a INTEGER)')
con.commit()
try:
    df = pl.read_database('SELECT * FROM t', con)
    print('success', df)
except Exception as e:
    import traceback
    traceback.print_exc()
