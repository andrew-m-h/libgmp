module deimos.gmp.floating;

import core.stdc.stdio : FILE;
import core.stdc.config : c_long, c_ulong;

import deimos.gmp.gmp;

extern (C) nothrow @nogc:

/**************** Float (i.e. F) routines.  ****************/

alias mpf_abs = __gmpf_abs;
extern (C) void __gmpf_abs (mpf_ptr, mpf_srcptr);

alias mpf_add = __gmpf_add;
extern (C) void __gmpf_add (mpf_ptr, mpf_srcptr, mpf_srcptr);

alias mpf_add_ui = __gmpf_add_ui;
extern (C) void __gmpf_add_ui (mpf_ptr, mpf_srcptr, c_ulong);

alias mpf_ceil = __gmpf_ceil;
extern (C) void __gmpf_ceil (mpf_ptr, mpf_srcptr);

alias mpf_clear = __gmpf_clear;
extern (C) void __gmpf_clear (mpf_ptr);

alias mpf_clears = __gmpf_clears;
extern (C) void __gmpf_clears (mpf_ptr, ...);

alias mpf_cmp = __gmpf_cmp;
extern (C) int __gmpf_cmp (mpf_srcptr, mpf_srcptr) nothrow pure;

alias mpf_cmp_z = __gmpf_cmp_z;
extern (C) int __gmpf_cmp_z (mpf_srcptr, mpz_srcptr) nothrow pure;

alias mpf_cmp_d = __gmpf_cmp_d;
extern (C) int __gmpf_cmp_d (mpf_srcptr, double) pure;

alias mpf_cmp_si = __gmpf_cmp_si;
extern (C) int __gmpf_cmp_si (mpf_srcptr, c_long) nothrow pure;

alias mpf_cmp_ui = __gmpf_cmp_ui;
extern (C) int __gmpf_cmp_ui (mpf_srcptr, c_ulong) nothrow pure;

alias mpf_div = __gmpf_div;
extern (C) void __gmpf_div (mpf_ptr, mpf_srcptr, mpf_srcptr);

alias mpf_div_2exp = __gmpf_div_2exp;
extern (C) void __gmpf_div_2exp (mpf_ptr, mpf_srcptr, mp_bitcnt_t);

alias mpf_div_ui = __gmpf_div_ui;
extern (C) void __gmpf_div_ui (mpf_ptr, mpf_srcptr, c_ulong);

alias mpf_dump = __gmpf_dump;
extern (C) void __gmpf_dump (mpf_srcptr);

alias mpf_eq = __gmpf_eq;
extern (C) int __gmpf_eq (mpf_srcptr, mpf_srcptr, mp_bitcnt_t) pure;

alias mpf_fits_sint_p = __gmpf_fits_sint_p;
extern (C) int __gmpf_fits_sint_p (mpf_srcptr) nothrow pure;

alias mpf_fits_slong_p = __gmpf_fits_slong_p;
extern (C) int __gmpf_fits_slong_p (mpf_srcptr) nothrow pure;

alias mpf_fits_sshort_p = __gmpf_fits_sshort_p;
extern (C) int __gmpf_fits_sshort_p (mpf_srcptr) nothrow pure;

alias mpf_fits_uint_p = __gmpf_fits_uint_p;
extern (C) int __gmpf_fits_uint_p (mpf_srcptr) nothrow pure;

alias mpf_fits_c_ulong_p = __gmpf_fits_c_ulong_p;
extern (C) int __gmpf_fits_c_ulong_p (mpf_srcptr) nothrow pure;

alias mpf_fits_ushort_p = __gmpf_fits_ushort_p;
extern (C) int __gmpf_fits_ushort_p (mpf_srcptr) nothrow pure;

alias mpf_floor = __gmpf_floor;
extern (C) void __gmpf_floor (mpf_ptr, mpf_srcptr);

alias mpf_get_d = __gmpf_get_d;
extern (C) double __gmpf_get_d (mpf_srcptr) pure;

alias mpf_get_d_2exp = __gmpf_get_d_2exp;
extern (C) double __gmpf_get_d_2exp (c_long *, mpf_srcptr);

alias mpf_get_default_prec = __gmpf_get_default_prec;
extern (C) mp_bitcnt_t __gmpf_get_default_prec () nothrow pure;

alias mpf_get_prec = __gmpf_get_prec;
extern (C) mp_bitcnt_t __gmpf_get_prec (mpf_srcptr) nothrow pure;

alias mpf_get_si = __gmpf_get_si;
extern (C) c_long __gmpf_get_si (mpf_srcptr) nothrow pure;

alias mpf_get_str = __gmpf_get_str;
extern (C) char *__gmpf_get_str (char *, mp_exp_t *, int, size_t, mpf_srcptr);

alias mpf_get_ui = __gmpf_get_ui;
extern (C) c_ulong __gmpf_get_ui (mpf_srcptr) nothrow pure;

alias mpf_init = __gmpf_init;
extern (C) void __gmpf_init (mpf_ptr);

alias mpf_init2 = __gmpf_init2;
extern (C) void __gmpf_init2 (mpf_ptr, mp_bitcnt_t);

alias mpf_inits = __gmpf_inits;
extern (C) void __gmpf_inits (mpf_ptr, ...);

alias mpf_init_set = __gmpf_init_set;
extern (C) void __gmpf_init_set (mpf_ptr, mpf_srcptr);

alias mpf_init_set_d = __gmpf_init_set_d;
extern (C) void __gmpf_init_set_d (mpf_ptr, double);

alias mpf_init_set_si = __gmpf_init_set_si;
extern (C) void __gmpf_init_set_si (mpf_ptr, c_long);

alias mpf_init_set_str = __gmpf_init_set_str;
extern (C) int __gmpf_init_set_str (mpf_ptr, const char *, int);

alias mpf_init_set_ui = __gmpf_init_set_ui;
extern (C) void __gmpf_init_set_ui (mpf_ptr, c_ulong);

alias mpf_inp_str = __gmpf_inp_str;
extern (C) size_t __gmpf_inp_str (mpf_ptr, FILE *, int);

alias mpf_integer_p = __gmpf_integer_p;
extern (C) int __gmpf_integer_p (mpf_srcptr) nothrow pure;

alias mpf_mul = __gmpf_mul;
extern (C) void __gmpf_mul (mpf_ptr, mpf_srcptr, mpf_srcptr);

alias mpf_mul_2exp = __gmpf_mul_2exp;
extern (C) void __gmpf_mul_2exp (mpf_ptr, mpf_srcptr, mp_bitcnt_t);

alias mpf_mul_ui = __gmpf_mul_ui;
extern (C) void __gmpf_mul_ui (mpf_ptr, mpf_srcptr, c_ulong);

alias mpf_neg = __gmpf_neg;
extern (C) void __gmpf_neg (mpf_ptr, mpf_srcptr);

alias mpf_out_str = __gmpf_out_str;
extern (C) size_t __gmpf_out_str (FILE *, int, size_t, mpf_srcptr);

alias mpf_pow_ui = __gmpf_pow_ui;
extern (C) void __gmpf_pow_ui (mpf_ptr, mpf_srcptr, c_ulong);

alias mpf_random2 = __gmpf_random2;
extern (C) void __gmpf_random2 (mpf_ptr, mp_size_t, mp_exp_t);

alias mpf_reldiff = __gmpf_reldiff;
extern (C) void __gmpf_reldiff (mpf_ptr, mpf_srcptr, mpf_srcptr);

alias mpf_set = __gmpf_set;
extern (C) void __gmpf_set (mpf_ptr, mpf_srcptr);

alias mpf_set_d = __gmpf_set_d;
extern (C) void __gmpf_set_d (mpf_ptr, double);

alias mpf_set_default_prec = __gmpf_set_default_prec;
extern (C) void __gmpf_set_default_prec (mp_bitcnt_t) nothrow;

alias mpf_set_prec = __gmpf_set_prec;
extern (C) void __gmpf_set_prec (mpf_ptr, mp_bitcnt_t);

alias mpf_set_prec_raw = __gmpf_set_prec_raw;
extern (C) void __gmpf_set_prec_raw (mpf_ptr, mp_bitcnt_t) nothrow;

alias mpf_set_q = __gmpf_set_q;
extern (C) void __gmpf_set_q (mpf_ptr, mpq_srcptr);

alias mpf_set_si = __gmpf_set_si;
extern (C) void __gmpf_set_si (mpf_ptr, c_long);

alias mpf_set_str = __gmpf_set_str;
extern (C) int __gmpf_set_str (mpf_ptr, const char *, int);

alias mpf_set_ui = __gmpf_set_ui;
extern (C) void __gmpf_set_ui (mpf_ptr, c_ulong);

alias mpf_set_z = __gmpf_set_z;
extern (C) void __gmpf_set_z (mpf_ptr, mpz_srcptr);

alias mpf_size = __gmpf_size;
extern (C) size_t __gmpf_size (mpf_srcptr) nothrow pure;

alias mpf_sqrt = __gmpf_sqrt;
extern (C) void __gmpf_sqrt (mpf_ptr, mpf_srcptr);

alias mpf_sqrt_ui = __gmpf_sqrt_ui;
extern (C) void __gmpf_sqrt_ui (mpf_ptr, c_ulong);

alias mpf_sub = __gmpf_sub;
extern (C) void __gmpf_sub (mpf_ptr, mpf_srcptr, mpf_srcptr);

alias mpf_sub_ui = __gmpf_sub_ui;
extern (C) void __gmpf_sub_ui (mpf_ptr, mpf_srcptr, c_ulong);

alias mpf_swap = __gmpf_swap;
extern (C) void __gmpf_swap (mpf_ptr, mpf_ptr) nothrow;

alias mpf_trunc = __gmpf_trunc;
extern (C) void __gmpf_trunc (mpf_ptr, mpf_srcptr);

alias mpf_ui_div = __gmpf_ui_div;
extern (C) void __gmpf_ui_div (mpf_ptr, c_ulong, mpf_srcptr);

alias mpf_ui_sub = __gmpf_ui_sub;
extern (C) void __gmpf_ui_sub (mpf_ptr, c_ulong, mpf_srcptr);

alias mpf_urandomb = __gmpf_urandomb;
extern (C) void __gmpf_urandomb (mpf_t, gmp_randstate_t, mp_bitcnt_t);
