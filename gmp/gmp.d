module gmp.gmp;

public import gmp.integer;

enum GMP_LIMB_BITS = 64;
enum GMP_NAIL_BITS = 0;

enum GMP_NUMB_BITS = GMP_LIMB_BITS - GMP_NAIL_BITS;
enum GMP_NUMB_MASK = ((~ cast(mp_limb_t)(0)) >> GMP_NAIL_BITS);
enum GMP_NUMB_MAX = GMP_NUMB_MASK;
enum GMP_NAIL_MASK = ~ GMP_NUMB_MASK;

import core.stdc.stddef;
import core.stdc.limits;

version (__GMP_SHORT_LIMB){
    alias mp_limb_t = uint;
    alias mp_limb_signed_t = int;
} else {
    alias mp_limb_t = ulong;
    alias mp_limb_signed_t = long;
}
alias mp_bitcnt_t = ulong;

struct __mpz_struct {
    int _mp_alloc;
    int _mp_size;
    mp_limb_t * _mp_d;
}

alias MP_INT = __mpz_struct;
alias mpz_t = __mpz_struct[1];

alias mp_ptr = mp_limb_t*;
alias mp_srcptr = const mp_limb_t*;

alias mp_size_t = long;
alias mp_exp_t = long;

struct __mpq_struct {
    __mpz_struct _mp_num;
    __mpz_struct _mp_den;
}

alias MP_RAT = __mpq_struct;
alias mpq_t = __mpq_struct[1];

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

T __GMP_ABS(T)(x){return x >= 0 ? x : -x;}
T __GMP_MAX(T)(T x, T y){return x > y ? x : y;}

mpz_t mpq_numref(mpq_t Q){return [Q[0]._mp_num];}
mpz_t mpq_denref(mpq_t Q){return [Q[0]._mp_den];}

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
extern (C) void __gmp_randinit_lc_2exp(gmp_randstate_t, mpz_srcptr, ulong, mp_bitcnt_t);

alias gmp_randinit_lc_2exp_size = __gmp_randinit_lc_2exp_size;
extern (C) void __gmp_randinit_lc_2exp_size(gmp_randstate_t, mp_bitcnt_t);

alias gmp_randinit_mt = __gmp_randinit_mt;
extern (C) void __gmp_randinit_mt (gmp_randstate_t);

alias gmp_randinit_set = __gmp_randinit_set;
extern (C) void __gmp_randinit_set (gmp_randstate_t, const __gmp_randstate_struct *);

alias gmp_randseed = __gmp_randseed;
extern (C) void __gmp_randseed (gmp_randstate_t, mpz_srcptr);

alias gmp_randseed_ui = __gmp_randseed_ui;
extern (C) void __gmp_randseed_ui (gmp_randstate_t, ulong);

alias gmp_randclear = __gmp_randclear;
extern (C) void __gmp_randclear (gmp_randstate_t);

alias gmp_urandomb_ui = __gmp_urandomb_ui;
extern (C) ulong __gmp_urandomb_ui (gmp_randstate_t, ulong);

alias gmp_urandomm_ui = __gmp_urandomm_ui;
extern (C) ulong __gmp_urandomm_ui (gmp_randstate_t, ulong);


/**************** Formatted output routines.  ****************/
/*
#define gmp_asprintf __gmp_asprintf
__GMP_DECLSPEC int gmp_asprintf (char **, const char *, ...);

#define gmp_fprintf __gmp_fprintf
#ifdef _GMP_H_HAVE_FILE
__GMP_DECLSPEC int gmp_fprintf (FILE *, const char *, ...);
#endif

#define gmp_obstack_printf __gmp_obstack_printf
#if defined (_GMP_H_HAVE_OBSTACK)
__GMP_DECLSPEC int gmp_obstack_printf (struct obstack *, const char *, ...);
#endif

#define gmp_obstack_vprintf __gmp_obstack_vprintf
#if defined (_GMP_H_HAVE_OBSTACK) && defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_obstack_vprintf (struct obstack *, const char *, va_list);
#endif

#define gmp_printf __gmp_printf
__GMP_DECLSPEC int gmp_printf (const char *, ...);

#define gmp_snprintf __gmp_snprintf
__GMP_DECLSPEC int gmp_snprintf (char *, size_t, const char *, ...);

#define gmp_sprintf __gmp_sprintf
__GMP_DECLSPEC int gmp_sprintf (char *, const char *, ...);

#define gmp_vasprintf __gmp_vasprintf
#if defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vasprintf (char **, const char *, va_list);
#endif

#define gmp_vfprintf __gmp_vfprintf
#if defined (_GMP_H_HAVE_FILE) && defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vfprintf (FILE *, const char *, va_list);
#endif

#define gmp_vprintf __gmp_vprintf
#if defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vprintf (const char *, va_list);
#endif

#define gmp_vsnprintf __gmp_vsnprintf
#if defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vsnprintf (char *, size_t, const char *, va_list);
#endif

#define gmp_vsprintf __gmp_vsprintf
#if defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vsprintf (char *, const char *, va_list);
#endif

*/

/**************** Formatted input routines.  ****************/

/*
#define gmp_fscanf __gmp_fscanf
#ifdef _GMP_H_HAVE_FILE
__GMP_DECLSPEC int gmp_fscanf (FILE *, const char *, ...);
#endif

#define gmp_scanf __gmp_scanf
__GMP_DECLSPEC int gmp_scanf (const char *, ...);

#define gmp_sscanf __gmp_sscanf
__GMP_DECLSPEC int gmp_sscanf (const char *, const char *, ...);

#define gmp_vfscanf __gmp_vfscanf
#if defined (_GMP_H_HAVE_FILE) && defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vfscanf (FILE *, const char *, va_list);
#endif

#define gmp_vscanf __gmp_vscanf
#if defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vscanf (const char *, va_list);
#endif

#define gmp_vsscanf __gmp_vsscanf
#if defined (_GMP_H_HAVE_VA_LIST)
__GMP_DECLSPEC int gmp_vsscanf (const char *, const char *, va_list);
#endif
*/



/*
...
*/
