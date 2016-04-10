"""LCM type definitions
This file automatically generated by lcm.
DO NOT MODIFY BY HAND!!!!
"""

try:
    import cStringIO.StringIO as BytesIO
except ImportError:
    from io import BytesIO
import struct

import rnp.route2_table_t

class route2_tree_t(object):
    __slots__ = ["timestamp", "n", "rtable"]

    def __init__(self):
        self.timestamp = 0
        self.n = 0
        self.rtable = []

    def encode(self):
        buf = BytesIO()
        buf.write(route2_tree_t._get_packed_fingerprint())
        self._encode_one(buf)
        return buf.getvalue()

    def _encode_one(self, buf):
        buf.write(struct.pack(">qi", self.timestamp, self.n))
        for i0 in range(self.n):
            assert self.rtable[i0]._get_packed_fingerprint() == rnp.route2_table_t._get_packed_fingerprint()
            self.rtable[i0]._encode_one(buf)

    def decode(data):
        if hasattr(data, 'read'):
            buf = data
        else:
            buf = BytesIO(data)
        if buf.read(8) != route2_tree_t._get_packed_fingerprint():
            raise ValueError("Decode error")
        return route2_tree_t._decode_one(buf)
    decode = staticmethod(decode)

    def _decode_one(buf):
        self = route2_tree_t()
        self.timestamp, self.n = struct.unpack(">qi", buf.read(12))
        self.rtable = []
        for i0 in range(self.n):
            self.rtable.append(rnp.route2_table_t._decode_one(buf))
        return self
    _decode_one = staticmethod(_decode_one)

    _hash = None
    def _get_hash_recursive(parents):
        if route2_tree_t in parents: return 0
        newparents = parents + [route2_tree_t]
        tmphash = (0x429a3807c1b0e08a+ rnp.route2_table_t._get_hash_recursive(newparents)) & 0xffffffffffffffff
        tmphash  = (((tmphash<<1)&0xffffffffffffffff)  + (tmphash>>63)) & 0xffffffffffffffff
        return tmphash
    _get_hash_recursive = staticmethod(_get_hash_recursive)
    _packed_fingerprint = None

    def _get_packed_fingerprint():
        if route2_tree_t._packed_fingerprint is None:
            route2_tree_t._packed_fingerprint = struct.pack(">Q", route2_tree_t._get_hash_recursive([]))
        return route2_tree_t._packed_fingerprint
    _get_packed_fingerprint = staticmethod(_get_packed_fingerprint)

