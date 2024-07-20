def foo(v):
    while True:
        v = (yield v)
b = foo(1)
print(next(b))
print(next(b))
print(b.send(2))