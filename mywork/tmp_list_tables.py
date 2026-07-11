import sqlite3
con = sqlite3.connect('lahmansbaseballdb.sqlite')
cur = con.cursor()
print([row[0] for row in cur.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")])
