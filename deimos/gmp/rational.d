module deimos.gmp.rational;

import deimos.gmp.gmp;

import core.stdc.stdio : FILE;
import core.stdc.config : c_long, c_ulong;

extern (C) nothrow:

/**************** Rational (i.e. Q) routines.  ****************/

alias mpq_abs = __gmpq_abs;
extern (C) void __gmpq_abs (mpq_ptr, mpq_srcptr);

alias mpq_add = __gmpq_add;
extern (C) void __gmpq_add (mpq_ptr, mpq_srcptr, mpq_srcptr);

alias mpq_canonicalize = __gmpq_canonicalize;
extern (C) void __gmpq_canonicalize (mpq_ptr);

alias mpq_clear = __gmpq_clear;
extern (C) void __gmpq_clear (mpq_ptr);

alias mpq_clears = __gmpq_clears;
extern (C) void __gmpq_clears (mpq_ptr, ...);

alias mpq_cmp = __gmpq_cmp;
extern (C) int __gmpq_cmp (mpq_srcptr, mpq_srcptr) pure;

alias _mpq_cmp_si = __gmpq_cmp_si;
extern (C) int __gmpq_cmp_si (mpq_srcptr, c_long, c_long) pure;

alias _mpq_cmp_ui = __gmpq_cmp_ui;
extern (C) int __gmpq_cmp_ui (mpq_srcptr, c_ulong, c_ulong) pure;

alias mpq_cmp_z = __gmpq_cmp_z;
extern (C) int __gmpq_cmp_z (mpq_srcptr, mpz_srcptr) pure;

alias mpq_div = __gmpq_div;
extern (C) void __gmpq_div (mpq_ptr, mpq_srcptr, mpq_srcptr);

alias mpq_div_2exp = __gmpq_div_2exp;
extern (C) void __gmpq_div_2exp (mpq_ptr, mpq_srcptr, mp_bitcnt_t);

alias mpq_equal = __gmpq_equal;
extern (C) int __gmpq_equal (mpq_srcptr, mpq_srcptr) nothrow pure;

alias mpq_get_num = __gmpq_get_num;
extern (C) void __gmpq_get_num (mpz_ptr, mpq_srcptr);

alias mpq_get_den = __gmpq_get_den;
extern (C) void __gmpq_get_den (mpz_ptr, mpq_srcptr);

alias mpq_get_d = __gmpq_get_d;
extern (C) double __gmpq_get_d (mpq_srcptr) pure;

alias mpq_get_str = __gmpq_get_str;
extern (C) char * __gmpq_get_str (char *, int, mpq_srcptr);

alias mpq_init = __gmpq_init;
extern (C) void __gmpq_init (mpq_ptr);

alias mpq_inits = __gmpq_inits;
extern (C) void __gmpq_inits (mpq_ptr, ...);

alias mpq_inp_str = __gmpq_inp_str;
extern (C) size_t __gmpq_inp_str (mpq_ptr, FILE *, int);

alias mpq_inv = __gmpq_inv;
extern (C) void __gmpq_inv (mpq_ptr, mpq_srcptr);

alias mpq_mul = __gmpq_mul;
extern (C) void __gmpq_mul (mpq_ptr, mpq_srcptr, mpq_srcptr);

alias mpq_mul_2exp = __gmpq_mul_2exp;
extern (C) void __gmpq_mul_2exp (mpq_ptr, mpq_srcptr, mp_bitcnt_t);

alias mpq_neg = __gmpq_neg;
extern (C) void __gmpq_neg (mpq_ptr, mpq_srcptr);

alias mpq_out_str = __gmpq_out_str;
extern (C) size_t __gmpq_out_str (FILE *, int, mpq_srcptr);

alias mpq_set = __gmpq_set;
extern (C) void __gmpq_set (mpq_ptr, mpq_srcptr);

alias mpq_set_d = __gmpq_set_d;
extern (C) void __gmpq_set_d (mpq_ptr, double);

alias mpq_set_den = __gmpq_set_den;
extern (C) void __gmpq_set_den (mpq_ptr, mpz_srcptr);

alias mpq_set_f = __gmpq_set_f;
extern (C) void __gmpq_set_f (mpq_ptr, mpf_srcptr);

alias mpq_set_num = __gmpq_set_num;
extern (C) void __gmpq_set_num (mpq_ptr, mpz_srcptr);

alias mpq_set_si = __gmpq_set_si;
extern (C) void __gmpq_set_si (mpq_ptr, c_long, c_ulong);

alias mpq_set_str = __gmpq_set_str;
extern (C) int __gmpq_set_str (mpq_ptr, const char *, int);

alias mpq_set_ui = __gmpq_set_ui;
extern (C) void __gmpq_set_ui (mpq_ptr, c_ulong, c_ulong);

alias mpq_set_z = __gmpq_set_z;
extern (C) void __gmpq_set_z (mpq_ptr, mpz_srcptr);

alias mpq_sub = __gmpq_sub;
extern (C) void __gmpq_sub (mpq_ptr, mpq_srcptr, mpq_srcptr);

alias mpq_swap = __gmpq_swap;
extern (C) void __gmpq_swap (mpq_ptr, mpq_ptr) nothrow;
