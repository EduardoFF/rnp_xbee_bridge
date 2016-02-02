"""LCM type definitions
This file automatically generated by lcm.
DO NOT MODIFY BY HAND!!!!
"""

try:
    import cStringIO.StringIO as BytesIO
except ImportError:
    from io import BytesIO
import struct

class plan2_entry_t(object):
    __slots__ = ["latitude", "longitude", "altitude", "action", "option", "timestamp"]

    def __init__(self):
        self.latitude = 0.0
        self.longitude = 0.0
        self.altitude = 0.0
        self.action = ""
        self.option = ""
        self.timestamp = 0

    def encode(self):
        buf = BytesIO()
        buf.write(plan2_entry_t._get_packed_fingerprint())
        self._encode_one(buf)
        return buf.getvalue()

    def _encode_one(self, buf):
        buf.write(struct.pack(">fff", self.latitude, self.longitude, self.altitude))
        __action_encoded = self.action.encode('utf-8')
        buf.write(struct.pack('>I', len(__action_encoded)+1))
        buf.write(__action_encoded)
        buf.write(b"\0")
        __option_encoded = self.option.encode('utf-8')
        buf.write(struct.pack('>I', len(__option_encoded)+1))
        buf.write(__option_encoded)
        buf.write(b"\0")
        buf.write(struct.pack(">h", self.timestamp))

    def decode(data):
        if hasattr(data, 'read'):
            buf = data
        else:
            buf = BytesIO(data)
        if buf.read(8) != plan2_entry_t._get_packed_fingerprint():
            raise ValueError("Decode error")
        return plan2_entry_t._decode_one(buf)
    decode = staticmethod(decode)

    def _decode_one(buf):
        self = plan2_entry_t()
        self.latitude, self.longitude, self.altitude = struct.unpack(">fff", buf.read(12))
        __action_len = struct.unpack('>I', buf.read(4))[0]
        self.action = buf.read(__action_len)[:-1].decode('utf-8', 'replace')
        __option_len = struct.unpack('>I', buf.read(4))[0]
        self.option = buf.read(__option_len)[:-1].decode('utf-8', 'replace')
        self.timestamp = struct.unpack(">h", buf.read(2))[0]
        return self
    _decode_one = staticmethod(_decode_one)

    _hash = None
    def _get_hash_recursive(parents):
        if plan2_entry_t in parents: return 0
        tmphash = (0xa1177897013cc305) & 0xffffffffffffffff
        tmphash  = (((tmphash<<1)&0xffffffffffffffff)  + (tmphash>>63)) & 0xffffffffffffffff
        return tmphash
    _get_hash_recursive = staticmethod(_get_hash_recursive)
    _packed_fingerprint = None

    def _get_packed_fingerprint():
        if plan2_entry_t._packed_fingerprint is None:
            plan2_entry_t._packed_fingerprint = struct.pack(">Q", plan2_entry_t._get_hash_recursive([]))
        return plan2_entry_t._packed_fingerprint
    _get_packed_fingerprint = staticmethod(_get_packed_fingerprint)

