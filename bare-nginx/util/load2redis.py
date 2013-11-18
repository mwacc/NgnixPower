import redis
r = redis.StrictRedis(host='localhost', port=6164, db=0)

f=open('dummy.txt', 'r')
id=None
q=None
a=[]
for line in f:
	if not line.strip():
		j = "{\"question\":\"%s\", \"id\":\"%s\", \"answers\":[" % (q,id)
		j += ", ".join(a)
		j += "]}"
		r.set(id,j)

		id = q = None
		a = []
	elif id is None:
		id = line.rstrip()
	elif q is None:
		q = line.rstrip()
	else:
		a.append("\"%s\"" % line.rstrip())
f.close()	
