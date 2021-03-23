#!/usr/bin/env python3

import sys

def a ( m, n ):
    return m / n

def f ( v ):
    try:
        return float ( v )
    except ValueError:
        return v

class A:
    def __init__ ( self, s ):
        self.s = s
        self.lut = {}
        self.elems = []
        
    def run ( self ):
        self.init()
        self.parse()
        self.consume()
        return self.elems[0]

    def init ( self ):
        def d ( d, e ):
            return d + e
        self.lut = {
            "a" : d,
            "m" : lambda p, q : p * q,
            "s" : self.m,
            "d" : a,
            }

    def m ( self, z1, z2 ):
        return z1 - z2

    def parse ( self ):
        self.elems = [ f ( e ) for e in self.s.split ( ',' ) ]

    def consume ( self ):
        while len ( self.elems ) > 2:
            a, b, o = self.elems[0:3]
            self.elems = self.elems[3:]
            r = self.lut[o](a, b)
            self.elems.insert(0, r)

print ( A( sys.argv[1] ).run() )

