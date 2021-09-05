import os
from ctypes import Structure, c_int, c_char, sizeof
from base64 import b64decode, b64encode


class Message(Structure):
    _fields_ = [
        ('id', c_int),
        ('content', c_char * 10),
        ('bin', c_char * 4)
    ]

    @classmethod
    def deserialize(cls, buffer: str) -> Structure:
        """从base64的字符串中还原structure"""
        buffer = b64decode(buffer.encode('ascii'))
        return cls.from_buffer(bytearray(buffer))

    def serialize(self) -> str:
        """序列化为base64的字符串"""
        buffer = bytearray(self)
        return b64encode(buffer).decode('ascii')


msg = Message(13, b'zhang jie')

print(msg.id)
print('msg: {}'.format(msg.serialize()))

os.environ['msg'] = msg.serialize()
# os.system('./main')

from ctypes import cdll, c_char_p
import json

clib = cdll.LoadLibrary('test.dylib')
# print(clib.print_env)
# print(clib.__dict__)
print_env = clib.print_env
print_env.argtypes = []
print_env.restype = c_char_p

rv = print_env()
print(type(rv))
print(rv)
print(json.loads(rv.decode()))