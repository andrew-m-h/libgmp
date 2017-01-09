module gmp.integer;

import std.format;
import std.stdio;
import gmp.gmp;
import core.stdc.stdio; //FILE

enum TestConstant = 42;

debug uint TestCount = 0;

void TestPred(string FuncName)(){
    pragma(msg, format("Compiling Function: %s", FuncName));
    writeln("Running Test: ", FuncName);

    mpz_t a1_;
    mpz_ptr a1 = &a1_[0];
    mpz_init_set_ui(a1, TestConstant);
    mixin(format(`%s(a1);`, FuncName));

    mpz_clear(a1);
    debug ++TestCount;
}

void TestUnary(string FuncName)(){
    pragma(msg, format("Compiling Function: %s", FuncName));
    writeln("Running Test: ", FuncName);

    mpz_t a1_;
    mpz_ptr a1 = &a1_[0];
    mpz_init_set_ui(a1, TestConstant);
    mixin(format(`%s(a1, a1);`, FuncName));

    mpz_clear(a1);
    debug ++TestCount;
}

void TestUnary_ui(string FuncName)(){
    pragma(msg, format("Compiling Function: %s", FuncName));
    writeln("Running Test: ", FuncName);

    mpz_t a1_;
    mpz_ptr a1 = &a1_[0];
    mpz_init_set_ui(a1, TestConstant);
    mixin(format(`%s(a1, TestConstant);`, FuncName));

    mpz_clear(a1);
    debug ++TestCount;
}

void TestBinary(string FuncName)(){
    pragma(msg, format("Compiling Function: %s", FuncName));
    writeln("Running Test: ", FuncName);

    mpz_t a1_;
    mpz_ptr a1 = &a1_[0];
    mpz_init_set_ui(a1, TestConstant);
    mixin(format(`%s(a1, a1, a1);`, FuncName));

    mpz_clear(a1);
    debug ++TestCount;
}

void TestBinary_ui(string FuncName)(){
    pragma(msg, format("Compiling Function: %s", FuncName));
    writeln("Running Test: ", FuncName);

    mpz_t a1_;
    mpz_ptr a1 = &a1_[0];
    mpz_init_set_ui(a1, TestConstant);
    mixin(format(`%s(a1, a1, TestConstant);`, FuncName));

    mpz_clear(a1);
    debug ++TestCount;
}

void TestBinary_uiui(string FuncName)(){
    pragma(msg, format("Compiling Function: %s", FuncName));
    writeln("Running Test: ", FuncName);

    mpz_t a1_;
    mpz_ptr a1 = &a1_[0];
    mpz_init_set_ui(a1, TestConstant);
    mixin(format(`%s(a1, TestConstant, TestConstant);`, FuncName));

    mpz_clear(a1);
    debug ++TestCount;
}

/**************** Integer (i.e. Z) routines.  ****************/

alias _mpz_realloc = __gmpz_realloc;
alias mpz_realloc = __gmpz_realloc;
extern (C) void *__gmpz_realloc (mpz_ptr, mp_size_t);
unittest{TestUnary_ui!"__gmpz_realloc";}

alias mpz_abs = __gmpz_abs;
extern (C) void __gmpz_abs (mpz_ptr, mpz_srcptr);
unittest{TestUnary!"__gmpz_abs";}

alias mpz_add = __gmpz_add;
extern (C) void __gmpz_add (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_add";}

alias mpz_add_ui = __gmpz_add_ui;
extern (C) void __gmpz_add_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_add_ui";}

alias mpz_addmul = __gmpz_addmul;
extern (C) void __gmpz_addmul (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_addmul";}

alias mpz_addmul_ui = __gmpz_addmul_ui;
extern (C) void __gmpz_addmul_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_addmul_ui";}

alias mpz_and = __gmpz_and;
extern (C) void __gmpz_and (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_and";}

alias mpz_bin_ui = __gmpz_bin_ui;
extern (C) void __gmpz_bin_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_bin_ui";}

alias mpz_bin_uiui = __gmpz_bin_uiui;
extern (C) void __gmpz_bin_uiui (mpz_ptr, ulong, ulong);
unittest{TestBinary_uiui!"__gmpz_bin_uiui";}

alias mpz_cdiv_q = __gmpz_cdiv_q;
extern (C) void __gmpz_cdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_cdiv_q";}

alias mpz_cdiv_q_2exp = __gmpz_cdiv_q_2exp;
extern (C) void __gmpz_cdiv_q_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);
unittest{TestBinary_ui!"__gmpz_cdiv_q_2exp";}

alias mpz_cdiv_q_ui = __gmpz_cdiv_q_ui;
extern (C) ulong __gmpz_cdiv_q_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary!"__gmpz_cdiv_q";}

alias mpz_cdiv_qr = __gmpz_cdiv_qr;
extern (C) void __gmpz_cdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_cdiv_qr_ui = __gmpz_cdiv_qr_ui;
extern (C) ulong __gmpz_cdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, ulong);

alias mpz_cdiv_r = __gmpz_cdiv_r;
extern (C) void __gmpz_cdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_cdiv_r";}

alias mpz_cdiv_r_2exp = __gmpz_cdiv_r_2exp;
extern (C) void __gmpz_cdiv_r_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);
unittest{TestBinary_ui!"__gmpz_cdiv_r_2exp";}

alias mpz_cdiv_r_ui = __gmpz_cdiv_r_ui;
extern (C) ulong __gmpz_cdiv_r_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_cdiv_r_ui";}

alias mpz_cdiv_ui = __gmpz_cdiv_ui;
extern (C) ulong __gmpz_cdiv_ui (mpz_srcptr, ulong) pure;
unittest{TestUnary_ui!"__gmpz_cdiv_ui";}

alias mpz_clear = __gmpz_clear;
extern (C) void __gmpz_clear (mpz_ptr);

alias mpz_clears = __gmpz_clears;
extern (C) void __gmpz_clears (mpz_ptr, ...);

alias mpz_clrbit = __gmpz_clrbit;
extern (C) void __gmpz_clrbit (mpz_ptr, mp_bitcnt_t);
unittest{TestUnary_ui!"__gmpz_clrbit";}

alias mpz_cmp = __gmpz_cmp;
extern (C) int __gmpz_cmp (mpz_srcptr, mpz_srcptr) nothrow pure;
unittest{TestUnary!"__gmpz_cmp";}

alias mpz_cmp_d = __gmpz_cmp_d;
extern (C) int __gmpz_cmp_d (mpz_srcptr, double) pure;
unittest{TestUnary_ui!"__gmpz_cmp_d";}

alias mpz_cmp_si  = __gmpz_cmp_si;
extern (C) int __gmpz_cmp_si (mpz_srcptr, long) nothrow pure;
unittest{TestUnary_ui!"__gmpz_cmp_si";}

alias mpz_cmp_ui  = __gmpz_cmp_ui;
extern (C) int __gmpz_cmp_ui (mpz_srcptr, ulong) nothrow pure;
unittest{TestUnary_ui!"__gmpz_cmp_ui";}

alias mpz_cmpabs = __gmpz_cmpabs;
extern (C) int __gmpz_cmpabs (mpz_srcptr, mpz_srcptr) nothrow pure;
unittest{TestUnary!"__gmpz_cmpabs";}

alias mpz_cmpabs_d = __gmpz_cmpabs_d;
extern (C) int __gmpz_cmpabs_d (mpz_srcptr, double) pure;
unittest{TestUnary_ui!"__gmpz_cmpabs_d";}

alias mpz_cmpabs_ui = __gmpz_cmpabs_ui;
extern (C) int __gmpz_cmpabs_ui (mpz_srcptr, ulong) nothrow pure;
unittest{TestUnary_ui!"__gmpz_cmpabs_ui";}

alias mpz_com = __gmpz_com;
extern (C) void __gmpz_com (mpz_ptr, mpz_srcptr);
unittest{TestUnary!"__gmpz_com";}

alias mpz_combit = __gmpz_combit;
extern (C) void __gmpz_combit (mpz_ptr, mp_bitcnt_t);
unittest{TestUnary_ui!"__gmpz_combit";}

alias mpz_congruent_p = __gmpz_congruent_p;
extern (C) int __gmpz_congruent_p (mpz_srcptr, mpz_srcptr, mpz_srcptr) pure;
unittest{TestBinary!"__gmpz_congruent_p";}

alias mpz_congruent_2exp_p = __gmpz_congruent_2exp_p;
extern (C) int __gmpz_congruent_2exp_p (mpz_srcptr, mpz_srcptr, mp_bitcnt_t) nothrow pure;
unittest{TestBinary_ui!"__gmpz_congruent_2exp_p";}

alias mpz_congruent_ui_p = __gmpz_congruent_ui_p;
extern (C) int __gmpz_congruent_ui_p (mpz_srcptr, ulong, ulong) pure;

alias mpz_divexact = __gmpz_divexact;
extern (C) void __gmpz_divexact (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_divexact";}

alias mpz_divexact_ui = __gmpz_divexact_ui;
extern (C) void __gmpz_divexact_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_divexact_ui";}

alias mpz_divisible_p = __gmpz_divisible_p;
extern (C) int __gmpz_divisible_p (mpz_srcptr, mpz_srcptr) pure;
unittest{TestUnary!"__gmpz_divisible_p";}

alias mpz_divisible_ui_p = __gmpz_divisible_ui_p;
extern (C) int __gmpz_divisible_ui_p (mpz_srcptr, ulong) pure;
unittest{TestUnary_ui!"__gmpz_divisible_ui_p";}

alias mpz_divisible_2exp_p = __gmpz_divisible_2exp_p;
extern (C) int __gmpz_divisible_2exp_p (mpz_srcptr, mp_bitcnt_t) nothrow pure;
unittest{TestUnary_ui!"__gmpz_divisible_2exp_p";}

alias mpz_dump = __gmpz_dump;
extern (C) void __gmpz_dump (mpz_srcptr);

alias mpz_export = __gmpz_export;
extern (C) void * __gmpz_export (void *, size_t *, int, size_t, int, size_t, mpz_srcptr);

alias mpz_fac_ui = __gmpz_fac_ui;
extern (C) void __gmpz_fac_ui (mpz_ptr, ulong);
unittest{TestUnary_ui!"__gmpz_fac_ui";}

alias mpz_2fac_ui = __gmpz_2fac_ui;
extern (C) void __gmpz_2fac_ui (mpz_ptr, ulong);
unittest{TestUnary_ui!"__gmpz_2fac_ui";}

alias mpz_mfac_uiui = __gmpz_mfac_uiui;
extern (C) void __gmpz_mfac_uiui (mpz_ptr, ulong, ulong);
unittest{TestBinary_uiui!"__gmpz_mfac_uiui";}

alias mpz_primorial_ui = __gmpz_primorial_ui;
extern (C) void __gmpz_primorial_ui (mpz_ptr, ulong);
unittest{TestUnary_ui!"__gmpz_primorial_ui";}

alias mpz_fdiv_q = __gmpz_fdiv_q;
extern (C) void __gmpz_fdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_fdiv_q";}

alias mpz_fdiv_q_2exp = __gmpz_fdiv_q_2exp;
extern (C) void __gmpz_fdiv_q_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);
unittest{TestBinary_ui!"__gmpz_fdiv_q_2exp";}

alias mpz_fdiv_q_ui = __gmpz_fdiv_q_ui;
extern (C) ulong __gmpz_fdiv_q_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_fdiv_q_ui";}

alias mpz_fdiv_qr = __gmpz_fdiv_qr;
extern (C) void __gmpz_fdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_fdiv_qr_ui = __gmpz_fdiv_qr_ui;
extern (C) ulong __gmpz_fdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, ulong);

alias mpz_fdiv_r = __gmpz_fdiv_r;
extern (C) void __gmpz_fdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_fdiv_r";}

alias mpz_fdiv_r_2exp = __gmpz_fdiv_r_2exp;
extern (C) void __gmpz_fdiv_r_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);
unittest{TestBinary_ui!"__gmpz_fdiv_r_2exp";}

alias mpz_fdiv_r_ui = __gmpz_fdiv_r_ui;
extern (C) ulong __gmpz_fdiv_r_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_fdiv_r_ui";}

alias mpz_fdiv_ui = __gmpz_fdiv_ui;
extern (C) ulong __gmpz_fdiv_ui (mpz_srcptr, ulong) pure;
unittest{TestUnary_ui!"__gmpz_fdiv_ui";}

alias mpz_fib_ui = __gmpz_fib_ui;
extern (C) void __gmpz_fib_ui (mpz_ptr, ulong);
unittest{TestUnary_ui!"__gmpz_fib_ui";}

alias mpz_fib2_ui = __gmpz_fib2_ui;
extern (C) void __gmpz_fib2_ui (mpz_ptr, mpz_ptr, ulong);
unittest{TestBinary_ui!"__gmpz_fib2_ui";}

alias mpz_fits_sint_p = __gmpz_fits_sint_p;
extern (C) int __gmpz_fits_sint_p (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_fits_sint_p";}

alias mpz_fits_slong_p = __gmpz_fits_slong_p;
extern (C) int __gmpz_fits_slong_p (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_fits_slong_p";}

alias mpz_fits_sshort_p = __gmpz_fits_sshort_p;
extern (C) int __gmpz_fits_sshort_p (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_fits_sshort_p";}

alias mpz_fits_uint_p = __gmpz_fits_uint_p;
extern (C) int __gmpz_fits_uint_p (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_fits_uint_p";}

alias mpz_fits_ulong_p = __gmpz_fits_ulong_p;
extern (C) int __gmpz_fits_ulong_p (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_fits_ulong_p";}

alias mpz_fits_ushort_p = __gmpz_fits_ushort_p;
extern (C) int __gmpz_fits_ushort_p (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_fits_ushort_p";}

alias mpz_gcd = __gmpz_gcd;
extern (C) void __gmpz_gcd (mpz_ptr, mpz_srcptr, mpz_srcptr);
unittest{TestBinary!"__gmpz_gcd";}

alias mpz_gcd_ui = __gmpz_gcd_ui;
extern (C) ulong __gmpz_gcd_ui (mpz_ptr, mpz_srcptr, ulong);
unittest{TestBinary_ui!"__gmpz_gcd_ui";}

alias mpz_gcdext = __gmpz_gcdext;
extern (C) void __gmpz_gcdext (mpz_ptr, mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_get_d = __gmpz_get_d;
extern (C) double __gmpz_get_d (mpz_srcptr) pure;
unittest{TestPred!"__gmpz_get_d";}

alias mpz_get_d_2exp = __gmpz_get_d_2exp;
extern (C) double __gmpz_get_d_2exp (long *, mpz_srcptr);

alias mpz_get_si = __gmpz_get_si;
extern (C) /* signed */ long __gmpz_get_si (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_get_si";}

alias mpz_get_str = __gmpz_get_str;
extern (C) char * __gmpz_get_str (char *, int, mpz_srcptr);

alias mpz_get_ui = __gmpz_get_ui;
extern (C) ulong __gmpz_get_ui (mpz_srcptr) nothrow pure;
unittest{TestPred!"__gmpz_get_ui";}

alias mpz_getlimbn = __gmpz_getlimbn;
extern (C) mp_limb_t __gmpz_getlimbn (mpz_srcptr, mp_size_t) nothrow pure;
unittest{TestUnary_ui!"__gmpz_getlimbn";}

alias mpz_hamdist = __gmpz_hamdist;
extern (C) mp_bitcnt_t __gmpz_hamdist (mpz_srcptr, mpz_srcptr) nothrow pure;
unittest{TestUnary!"__gmpz_hamdist";}

alias mpz_import = __gmpz_import;
extern (C) void __gmpz_import (mpz_ptr, size_t, int, size_t, int, size_t, const void *);

alias mpz_init = __gmpz_init;
extern (C) void __gmpz_init (mpz_ptr);

alias mpz_init2 = __gmpz_init2;
extern (C) void __gmpz_init2 (mpz_ptr, mp_bitcnt_t);

alias mpz_inits = __gmpz_inits;
extern (C) void __gmpz_inits (mpz_ptr, ...);

alias mpz_init_set = __gmpz_init_set;
extern (C) void __gmpz_init_set (mpz_ptr, mpz_srcptr);

alias mpz_init_set_d = __gmpz_init_set_d;
extern (C) void __gmpz_init_set_d (mpz_ptr, double);

alias mpz_init_set_si = __gmpz_init_set_si;
extern (C) void __gmpz_init_set_si (mpz_ptr, long);

alias mpz_init_set_str = __gmpz_init_set_str;
extern (C) int __gmpz_init_set_str (mpz_ptr, const char *, int);

alias mpz_init_set_ui = __gmpz_init_set_ui;
extern (C) void __gmpz_init_set_ui (mpz_ptr, ulong);

alias mpz_inp_raw = __gmpz_inp_raw;
extern (C) size_t __gmpz_inp_raw (mpz_ptr, FILE *);

alias mpz_inp_str = __gmpz_inp_str;
extern (C) size_t __gmpz_inp_str (mpz_ptr, FILE *, int);

alias mpz_invert = __gmpz_invert;
extern (C) int __gmpz_invert (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_ior = __gmpz_ior;
extern (C) void __gmpz_ior (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_jacobi = __gmpz_jacobi;
extern (C) int __gmpz_jacobi (mpz_srcptr, mpz_srcptr) pure;

alias mpz_kronecker = mpz_jacobi  /* alias */;

alias mpz_kronecker_si = __gmpz_kronecker_si;
extern (C) int __gmpz_kronecker_si (mpz_srcptr, long) pure;

alias mpz_kronecker_ui = __gmpz_kronecker_ui;
extern (C) int __gmpz_kronecker_ui (mpz_srcptr, ulong) pure;

alias mpz_si_kronecker = __gmpz_si_kronecker;
extern (C) int __gmpz_si_kronecker (long, mpz_srcptr) pure;

alias mpz_ui_kronecker = __gmpz_ui_kronecker;
extern (C) int __gmpz_ui_kronecker (ulong, mpz_srcptr) pure;

alias mpz_lcm = __gmpz_lcm;
extern (C) void __gmpz_lcm (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_lcm_ui = __gmpz_lcm_ui;
extern (C) void __gmpz_lcm_ui (mpz_ptr, mpz_srcptr, ulong);

alias mpz_legendre = mpz_jacobi  /* alias */;

alias mpz_lucnum_ui = __gmpz_lucnum_ui;
extern (C) void __gmpz_lucnum_ui (mpz_ptr, ulong);

alias mpz_lucnum2_ui = __gmpz_lucnum2_ui;
extern (C) void __gmpz_lucnum2_ui (mpz_ptr, mpz_ptr, ulong);

alias mpz_millerrabin = __gmpz_millerrabin;
extern (C) int __gmpz_millerrabin (mpz_srcptr, int) pure;

alias mpz_mod = __gmpz_mod;
extern (C) void __gmpz_mod (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_mod_ui = mpz_fdiv_r_ui /* same as fdiv_r because divisor unsigned */;

alias mpz_mul = __gmpz_mul;
extern (C) void __gmpz_mul (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_mul_2exp = __gmpz_mul_2exp;
extern (C) void __gmpz_mul_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

alias mpz_mul_si = __gmpz_mul_si;
extern (C) void __gmpz_mul_si (mpz_ptr, mpz_srcptr, long);

alias mpz_mul_ui = __gmpz_mul_ui;
extern (C) void __gmpz_mul_ui (mpz_ptr, mpz_srcptr, ulong);

alias mpz_neg = __gmpz_neg;
extern (C) void __gmpz_neg (mpz_ptr, mpz_srcptr);

alias mpz_nextprime = __gmpz_nextprime;
extern (C) void __gmpz_nextprime (mpz_ptr, mpz_srcptr);

alias mpz_out_raw = __gmpz_out_raw;
extern (C) size_t __gmpz_out_raw (FILE *, mpz_srcptr);

alias mpz_out_str = __gmpz_out_str;
extern (C) size_t __gmpz_out_str (FILE *, int, mpz_srcptr);

alias mpz_perfect_power_p = __gmpz_perfect_power_p;
extern (C) int __gmpz_perfect_power_p (mpz_srcptr) pure;

alias mpz_perfect_square_p = __gmpz_perfect_square_p;
extern (C) int __gmpz_perfect_square_p (mpz_srcptr) pure;

alias mpz_popcount = __gmpz_popcount;
extern (C) mp_bitcnt_t __gmpz_popcount (mpz_srcptr) nothrow pure;

alias mpz_pow_ui = __gmpz_pow_ui;
extern (C) void __gmpz_pow_ui (mpz_ptr, mpz_srcptr, ulong);

alias mpz_powm = __gmpz_powm;
extern (C) void __gmpz_powm (mpz_ptr, mpz_srcptr, mpz_srcptr, mpz_srcptr);

alias mpz_powm_sec = __gmpz_powm_sec;
extern (C) void __gmpz_powm_sec (mpz_ptr, mpz_srcptr, mpz_srcptr, mpz_srcptr);

alias mpz_powm_ui = __gmpz_powm_ui;
extern (C) void __gmpz_powm_ui (mpz_ptr, mpz_srcptr, ulong, mpz_srcptr);

alias mpz_probab_prime_p = __gmpz_probab_prime_p;
extern (C) int __gmpz_probab_prime_p (mpz_srcptr, int) pure;

alias mpz_random = __gmpz_random;
extern (C) void __gmpz_random (mpz_ptr, mp_size_t);

alias mpz_random2 = __gmpz_random2;
extern (C) void __gmpz_random2 (mpz_ptr, mp_size_t);

alias mpz_realloc2 = __gmpz_realloc2;
extern (C) void __gmpz_realloc2 (mpz_ptr, mp_bitcnt_t);

alias mpz_remove = __gmpz_remove;
extern (C) mp_bitcnt_t __gmpz_remove (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_root = __gmpz_root;
extern (C) int __gmpz_root (mpz_ptr, mpz_srcptr, ulong);

alias mpz_rootrem = __gmpz_rootrem;
extern (C) void __gmpz_rootrem (mpz_ptr, mpz_ptr, mpz_srcptr, ulong);

alias mpz_rrandomb = __gmpz_rrandomb;
extern (C) void __gmpz_rrandomb (mpz_ptr, gmp_randstate_t, mp_bitcnt_t);

alias mpz_scan0 = __gmpz_scan0;
extern (C) mp_bitcnt_t __gmpz_scan0 (mpz_srcptr, mp_bitcnt_t) nothrow pure;

alias mpz_scan1 = __gmpz_scan1;
extern (C) mp_bitcnt_t __gmpz_scan1 (mpz_srcptr, mp_bitcnt_t) nothrow pure;

alias mpz_set = __gmpz_set;
extern (C) void __gmpz_set (mpz_ptr, mpz_srcptr);

alias mpz_set_d = __gmpz_set_d;
extern (C) void __gmpz_set_d (mpz_ptr, double);

alias mpz_set_f = __gmpz_set_f;
extern (C) void __gmpz_set_f (mpz_ptr, mpf_srcptr);

alias mpz_set_q = __gmpz_set_q;
extern (C) void __gmpz_set_q (mpz_ptr, mpq_srcptr);

alias mpz_set_si = __gmpz_set_si;
extern (C) void __gmpz_set_si (mpz_ptr, long);

alias mpz_set_str = __gmpz_set_str;
extern (C) int __gmpz_set_str (mpz_ptr, const char *, int);

alias mpz_set_ui = __gmpz_set_ui;
extern (C) void __gmpz_set_ui (mpz_ptr, ulong);

alias mpz_setbit = __gmpz_setbit;
extern (C) void __gmpz_setbit (mpz_ptr, mp_bitcnt_t);

alias mpz_size = __gmpz_size;
extern (C) size_t __gmpz_size (mpz_srcptr) nothrow pure;

alias mpz_sizeinbase = __gmpz_sizeinbase;
extern (C) size_t __gmpz_sizeinbase (mpz_srcptr, int) nothrow pure;

alias mpz_sqrt = __gmpz_sqrt;
extern (C) void __gmpz_sqrt (mpz_ptr, mpz_srcptr);

alias mpz_sqrtrem = __gmpz_sqrtrem;
extern (C) void __gmpz_sqrtrem (mpz_ptr, mpz_ptr, mpz_srcptr);

alias mpz_sub = __gmpz_sub;
extern (C) void __gmpz_sub (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_sub_ui = __gmpz_sub_ui;
extern (C) void __gmpz_sub_ui (mpz_ptr, mpz_srcptr, ulong);

alias mpz_ui_sub = __gmpz_ui_sub;
extern (C) void __gmpz_ui_sub (mpz_ptr, ulong, mpz_srcptr);

alias mpz_submul = __gmpz_submul;
extern (C) void __gmpz_submul (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_submul_ui = __gmpz_submul_ui;
extern (C) void __gmpz_submul_ui (mpz_ptr, mpz_srcptr, ulong);

alias mpz_swap = __gmpz_swap;
extern (C) void __gmpz_swap (mpz_ptr, mpz_ptr) nothrow;

alias mpz_tdiv_ui = __gmpz_tdiv_ui;
extern (C) ulong __gmpz_tdiv_ui (mpz_srcptr, ulong) pure;

alias mpz_tdiv_q = __gmpz_tdiv_q;
extern (C) void __gmpz_tdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_tdiv_q_2exp = __gmpz_tdiv_q_2exp;
extern (C) void __gmpz_tdiv_q_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

alias mpz_tdiv_q_ui = __gmpz_tdiv_q_ui;
extern (C) ulong __gmpz_tdiv_q_ui (mpz_ptr, mpz_srcptr, ulong);

alias mpz_tdiv_qr = __gmpz_tdiv_qr;
extern (C) void __gmpz_tdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_tdiv_qr_ui = __gmpz_tdiv_qr_ui;
extern (C) ulong __gmpz_tdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, ulong);

alias mpz_tdiv_r = __gmpz_tdiv_r;
extern (C) void __gmpz_tdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_tdiv_r_2exp = __gmpz_tdiv_r_2exp;
extern (C) void __gmpz_tdiv_r_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

alias mpz_tdiv_r_ui = __gmpz_tdiv_r_ui;
extern (C) ulong __gmpz_tdiv_r_ui (mpz_ptr, mpz_srcptr, ulong);

alias mpz_tstbit = __gmpz_tstbit;
extern (C) int __gmpz_tstbit (mpz_srcptr, mp_bitcnt_t) nothrow pure;

alias mpz_ui_pow_ui = __gmpz_ui_pow_ui;
extern (C) void __gmpz_ui_pow_ui (mpz_ptr, ulong, ulong);

alias mpz_urandomb = __gmpz_urandomb;
extern (C) void __gmpz_urandomb (mpz_ptr, gmp_randstate_t, mp_bitcnt_t);

alias mpz_urandomm = __gmpz_urandomm;
extern (C) void __gmpz_urandomm (mpz_ptr, gmp_randstate_t, mpz_srcptr);

alias mpz_xor = __gmpz_xor;
alias mpz_eor = __gmpz_xor;
extern (C) void __gmpz_xor (mpz_ptr, mpz_srcptr, mpz_srcptr);

alias mpz_limbs_read = __gmpz_limbs_read;
extern (C) mp_srcptr __gmpz_limbs_read (mpz_srcptr);

alias mpz_limbs_write = __gmpz_limbs_write;
extern (C) mp_ptr __gmpz_limbs_write (mpz_ptr, mp_size_t);

alias mpz_limbs_modify = __gmpz_limbs_modify;
extern (C) mp_ptr __gmpz_limbs_modify (mpz_ptr, mp_size_t);

alias mpz_limbs_finish = __gmpz_limbs_finish;
extern (C) void __gmpz_limbs_finish (mpz_ptr, mp_size_t);

alias mpz_roinit_n = __gmpz_roinit_n;
extern (C) mpz_srcptr __gmpz_roinit_n (mpz_ptr, mp_srcptr, mp_size_t);

unittest {
    debug writeln("Number of Tests Run: ", TestCount);
}

//alias MPZ_ROINIT_N(xp, xs) {{0, (xs),(xp) }}
