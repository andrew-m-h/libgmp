module gmp.operators;

import gmp.gmp;
import gmp.integer;
import gmp.rational;
import gmp.floating;

import std.traits;
import std.string;

static import core.stdc.stdio;

enum DefaultBase = 10;

struct Integer
{
    __mpz_struct storage;
    mpz_ptr value;

    this(in long v){
        this.value = &storage;
        mpz_init_set_ui(value, v);
    }
    this(in ulong v){
        this.value = &storage;
        mpz_init_set_si(value, v);
    }
    this(in double v){
        this.value = &storage;
        mpz_init_set_d(value, v);
    }
    this(in string v){
        this.value = &storage;
        mpz_init_set_str(value, toStringz(v), DefaultBase);
    }
    this()(auto ref const Integer v){
        this.value = &storage;
        mpz_init_set(value, v.value);
    }

    ~this(){
        mpz_clear(value);
    }
    this(this){
        mpz_ptr old = value;
        value = &storage;
        mpz_init_set(value, old);
    }

    Integer opAssign(in ulong v){
        mpz_set_ui(value, v);
        return this;
    }
    Integer opAssign(in long v){
        mpz_set_si(value, v);
        return this;
    }
    Integer opAssign(in double v){
        mpz_set_d(value, v);
        return this;
    }
    Integer opAssign(in string v){
        mpz_set_str(value, toStringz(v), DefaultBase);
        return this;
    }
    Integer opAssign()(auto ref const Integer v){
        mpz_set(value, v.value);
        return this;
    }

    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "+"){
            mpz_add_ui(value, value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "+"){
            mpz_add(value, value, v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "-"){
            mpz_sub_ui(value, value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "-"){
            mpz_sub(value, value, v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "*"){
            mpz_mul_ui(value, value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(in long v)
        if (op == "*"){
            mpz_mul_si(value, value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "*"){
            mpz_mul(value, value, v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "/"){
            mpz_fdiv_q_ui(value, value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "/"){
            mpz_fdiv_q(value, value, v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "%"){
            mpz_mod_ui(value, value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "%"){
            mpz_mod(value, value, v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "^^"){
            mpz_pow_ui(value, value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "&"){
            mpz_and(value, value, v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "|"){
            mpz_ior(value, value, v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "^"){
            mpz_xor(value, value, v.value);
            return this;
        }

    ref Integer opUnary(string op)()
        if (op == "-"){
            mpz_neg(value, value);
            return this;
        }
    ref Integer opUnary(string op)()
        if (op == "--")
        {
            mpz_sub_ui(value, value, 1UL);
            return this;
        }
    ref Integer opUnary(string op)()
        if  (op == "++"){
            mpz_add_ui(value, value, 1UL);
            return this;
        }
    __gmpz_struct opUnary(string op)() const
        if (op == "*"){
            return *value;
        }

    Integer opBinary(string op)(in ulong v) const
        if (op == "+"){
            Integer ret = this;
            mpz_add_ui(ret.value, value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "+"){
            Integer ret = this;
            mpz_add(ret.value, value, v.value);
            return ret;
        }
    Integer opBinary(string op)(in ulong v) const
        if (op == "-"){
        Integer ret = this;
        mpz_sub_ui(ret.value, value, v);
        return ret;
        }
    Integer opBinaryRight(string op)(in ulong v) const
        if (op == "-"){
            Integer ret = this;
            mpz_ui_sub(ret.value, v, value);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "-"){
            Integer ret = this;
            mpz_sub(ret.value, value, v);
            return ret;
        }
    Integer opBinary(string op)(in ulong v) const
        if (op == "*"){
            Integer ret = this;
            mpz_mul_ui(ret.value, value, v);
            return ret;
        }
    Integer opBinary(string op)(in long v) const
        if (op == "*"){
            Integer ret = this;
            mpz_mul_si(ret.value, value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "*"){
            Integer ret = this;
            mpz_mul(ret.value, value, v.value);
            return ret;
        }
    ref Integer abs() {
        mpz_abs(value, value);
        return this;
    }
    Integer opBinary(string op)(in ulong v) const
        if (op == "/"){
            Integer ret = this;
            mpz_fdiv_q_ui(ret.value, value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "/"){
            Integer ret = this;
            mpz_fdiv_q(ret.value, value, v.value);
            return ret;
        }
    Integer opBinary(string op)(in ulong v) const
        if (op == "%"){
            Integer ret = this;
            mpz_mod_ui(ret.value, value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "%"){
            Integer ret = this;
            mpz_mod(ret.value, value, v.value);
            return ret;
        }
    Integer opBinary(string op)(in ulong v) const
        if (op == "^^"){
            Integer ret = this;
            mpz_pow_ui(ret.value, value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "&"){
            Integer ret = this;
            mpz_and(ret.value, value, v);
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "|"){
            Integer ret = this;
            mpz_ior(ret.value, value, v);
        }
    Integer opBinary(string op)(auto ref const Integer v) const
        if (op == "^"){
            Integer ret = this;
            mpz_xor(ret.value, value, v);
        }

    ulong opCast(T : Integer)() const {
        return mpz_get_ui(value);
    }
    long opCast(T : Integer)() const {
        return mpz_get_si(value);
    }
    double opCast(T : Integer)() const {
        return mpz_get_d(value);
    }
    string opCast(T : Integer)() const {
        return toString(mpz_get_str(null, DefaultBase, value));
    }

    bool opEquals(in ulong v) const {
        return mpz_cmp_ui(value, v) == 0;
    }
    bool opEquals(in long v) const {
        return mpz_cmp_si(value, v) == 0;
    }
    bool opEquals(in double v) const {
        return mpz_cmp_d(value, v) == 0;
    }
    bool opEquals()(auto ref const Integer v) const {
        return mpz_cmp(value, v.value) == 0;
    }

    int opCmp(in ulong v) const {
        return mpz_cmp_ui(value, v);
    }
    int opCmp(in long v) const {
        return mpz_cmp_si(value, v);
    }
    int opCmp(in double v) const {
        return mpz_cmp_d(value, v);
    }
    int opCmp()(auto ref const Integer v) const {
        return mpz_cmp(value, v.value);
    }

    void print() const {
        mpz_out_str(core.stdc.stdio.stdout, DefaultBase, this.value);
    }
    void println() const{
        print();
        core.stdc.stdio.printf("\n");
    }
}
