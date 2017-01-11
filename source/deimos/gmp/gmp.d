module deimos.gmp.gmp;

enum GMP_LIMB_BITS = 64;
enum GMP_NAIL_BITS = 0;

enum GMP_NUMB_BITS = GMP_LIMB_BITS - GMP_NAIL_BITS;
enum GMP_NUMB_MASK = ((~ cast(mp_limb_t)(0)) >> GMP_NAIL_BITS);
enum GMP_NUMB_MAX = GMP_NUMB_MASK;
enum GMP_NAIL_MASK = ~ GMP_NUMB_MASK;

import core.stdc.stddef;
import core.stdc.limits;
import core.stdc.config : c_long, c_ulong;

extern (C) nothrow:

version (__GMP_SHORT_LIMB){
    alias mp_limb_t = uint;
    alias mp_limb_signed_t = int;
} else {
    alias mp_limb_t = c_ulong;
    alias mp_limb_signed_t = c_long;
}
alias mp_bitcnt_t = c_ulong;

struct __mpz_struct {
    int _mp_alloc;
    int _mp_size;
    mp_limb_t * _mp_d;
}

alias MP_INT = __mpz_struct;
alias mpz_t = __mpz_struct;

alias mp_ptr = mp_limb_t*;
alias mp_srcptr = const mp_limb_t*;

alias mp_size_t = c_long;
alias mp_exp_t = c_long;

struct __mpq_struct {
    __mpz_struct _mp_num;
    __mpz_struct _mp_den;
}

alias MP_RAT = __mpq_struct;
alias mpq_t = __mpq_struct;

struct __mpf_struct {
    int _mp_prec;
    int _mp_size;
    mp_exp_t _mp_exp;
    mp_limb_t *_mp_d;
}

alias mpf_t = __mpf_struct[1];

enum gmp_randalg_t {
    GMP_RAND_ALG_DEFAULT = 0,
    GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT
}

struct __gmp_randstate_struct {
    mpz_t _mp_seed;
    gmp_randalg_t _mp_alg;
    union _mp_algdata {
        void * _mp_lc;
    };
}

alias gmp_randstate_t = __gmp_randstate_struct;

alias mpz_srcptr = const __mpz_struct*;
alias mpz_ptr = __mpz_struct*;
alias mpf_srcptr = const __mpf_struct*;
alias mpf_ptr = __mpf_struct*;
alias mpq_srcptr = const __mpq_struct*;
alias mpq_ptr = __mpq_struct*;

T __GMP_ABS(T)(T x){return x >= 0 ? x : -x;}
T __GMP_MAX(T)(T x, T y){return x > y ? x : y;}

mpz_t mpq_numref(mpq_t Q){return Q._mp_num;}
mpz_t mpq_denref(mpq_t Q){return Q._mp_den;}

alias mp_set_memory_functions = __gmp_set_memory_functions;
extern (C) void __gmp_set_memory_functions (void *function(size_t),
                              void *function(void *, size_t, size_t),
                              void function(void *, size_t));

alias  mp_get_memory_functions = __gmp_get_memory_functions;
extern (C) void __gmp_get_memory_functions (void*function(size_t)*,
                              void * function(void*, size_t, size_t)*,
                              void function(void *, size_t)*);

alias mp_bits_per_limb = __gmp_bits_per_limb;
extern (C) extern __gshared const int __gmp_bits_per_limb;

alias gmp_errno = __gmp_errno;
extern (C) extern __gshared int __gmp_errno;

alias gmp_version = __gmp_version;
extern (C) extern __gshared const char * __gmp_version;


/**************** Random number routines.  ****************/

alias gmp_randinit = __gmp_randinit;
extern (C) void __gmp_randinit(gmp_randstate_t, gmp_randalg_t, ...);

alias gmp_randinit_default = __gmp_randinit_default;
extern (C) void __gmp_randinit_default(gmp_randstate_t);

alias gmp_randinit_lc_2exp = __gmp_randinit_lc_2exp;
extern (C) void __gmp_randinit_lc_2exp(gmp_randstate_t, mpz_srcptr, c_ulong, mp_bitcnt_t);

alias gmp_randinit_lc_2exp_size = __gmp_randinit_lc_2exp_size;
extern (C) void __gmp_randinit_lc_2exp_size(gmp_randstate_t, mp_bitcnt_t);

alias gmp_randinit_mt = __gmp_randinit_mt;
extern (C) void __gmp_randinit_mt (gmp_randstate_t);

alias gmp_randinit_set = __gmp_randinit_set;
extern (C) void __gmp_randinit_set (gmp_randstate_t, const __gmp_randstate_struct *);

alias gmp_randseed = __gmp_randseed;
extern (C) void __gmp_randseed (gmp_randstate_t, mpz_srcptr);

alias gmp_randseed_ui = __gmp_randseed_ui;
extern (C) void __gmp_randseed_ui (gmp_randstate_t, c_ulong);

alias gmp_randclear = __gmp_randclear;
extern (C) void __gmp_randclear (gmp_randstate_t);

alias gmp_urandomb_ui = __gmp_urandomb_ui;
extern (C) c_ulong __gmp_urandomb_ui (gmp_randstate_t, c_ulong);

alias gmp_urandomm_ui = __gmp_urandomm_ui;
extern (C) c_ulong __gmp_urandomm_ui (gmp_randstate_t, c_ulong);
