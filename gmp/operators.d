module gmp.operators;

import gmp.gmp;
import gmp.integer;
import gmp.rational;
import gmp.floating;

import std.string;
import std.stdio;

static import core.stdc.stdio;

debug int TestCount = 0;

enum DefaultBase = 10;

struct Integer
{
    __mpz_struct value;

    void init(){
        mpz_init(&value);
    }

    this(in long v){
        mpz_init_set_si(&value, v);
    }
    this(in ulong v){
        mpz_init_set_ui(&value, v);
    }
    this(in double v){
        mpz_init_set_d(&value, v);
    }
    this(in string v){
        mpz_init_set_str(&value, toStringz(v), DefaultBase);
    }
    this()(auto ref const Integer v){
        mpz_init_set(&value, &v.value);
    }

    ~this(){
        mpz_clear(&value);
    }
    this(this){
        __mpz_struct tmp;
        mpz_init_set(&tmp, &value);
        value = tmp;
    }

    Integer opAssign(in ulong v) out(result){
        assert(mpz_cmp_ui(&result.value, v) == 0);
    } body {
        mpz_set_ui(&value, v);
        return this;
    }
    Integer opAssign(in long v) out(result){
        assert(mpz_cmp_si(&result.value, v) == 0);
    } body {
        mpz_set_si(&value, v);
        return this;
    }
    Integer opAssign(in double v) out(result){
        assert(mpz_cmp_d(&result.value, v) == 0);
    }body{
        mpz_set_d(&value, v);
        return this;
    }
    Integer opAssign(in string v){
        mpz_set_str(&value, toStringz(v), DefaultBase);
        return this;
    }
    Integer opAssign()(auto ref const Integer v) out(result) {
        assert(mpz_cmp(&result.value, &v.value) == 0);
    }body{
        mpz_set(&value, &v.value);
        return this;
    }

    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "+") {
            mpz_add_ui(&value, &value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "+"){
            mpz_add(&value, &value, &v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "-"){
            mpz_sub_ui(&value, &value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "-"){
            mpz_sub(&value, &value, &v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "*"){
            mpz_mul_ui(&value, &value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(in long v)
        if (op == "*"){
            mpz_mul_si(&value, &value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "*"){
            mpz_mul(&value, &value, &v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "/"){
            mpz_fdiv_q_ui(&value, &value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "/"){
            mpz_fdiv_q(&value, &value, &v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "%"){
            mpz_mod_ui(&value, &value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "%"){
            mpz_mod(&value, &value, &v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(in ulong v)
        if (op == "^^"){
            mpz_pow_ui(&value, &value, v);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "&"){
            mpz_and(&value, &value, &v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "|"){
            mpz_ior(&value, &value, &v.value);
            return this;
        }
    ref Integer opOpAssign(string op)(auto ref const Integer v)
        if (op == "^"){
            mpz_xor(&value, &value, &v.value);
            return this;
        }

    Integer opUnary(string op)()
        if (op == "-"){
            Integer res = this;
            mpz_neg(&res.value, &value);
            return res;
        }
    ref Integer opUnary(string op)()
        if (op == "--"){
            mpz_sub_ui(&value, &value, 1UL);
            return this;
        }
    ref Integer opUnary(string op)()
        if  (op == "++"){
            mpz_add_ui(&value, &value, 1UL);
            return this;
        }
    __gmpz_struct opUnary(string op)() const
        if (op == "*"){
            return *&value;
        }

    Integer opBinary(string op)(in ulong v)
        if (op == "+"){
            Integer ret = this;
            mpz_add_ui(&ret.value, &value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "+"){
            Integer ret = this;
            mpz_add(&ret.value, &value, &v.value);
            return ret;
        }
    Integer opBinary(string op)(in ulong v)
        if (op == "-"){
        Integer ret = this;
        mpz_sub_ui(&ret.value, &value, v);
        return ret;
        }
    Integer opBinaryRight(string op)(in ulong v)
        if (op == "-"){
            Integer ret = this;
            mpz_ui_sub(&ret.value, v, &value);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "-"){
            Integer ret = this;
            mpz_sub(&ret.value, &value, &v.value);
            return ret;
        }
    Integer opBinary(string op)(ulong v)
        if (op == "*"){
            Integer ret = this;
            mpz_mul_ui(&ret.value, &value, v);
            return ret;
        }
    Integer opBinary(string op)(long v)
        if (op == "*"){
            Integer ret = this;
            mpz_mul_si(&ret.value, &value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "*"){
            Integer ret = this;
            mpz_mul(&ret.value, &value, &v.value);
            return ret;
        }
    ref Integer abs() {
        mpz_abs(&value, &value);
        return this;
    }
    Integer opBinary(string op)(in ulong v)
        if (op == "/"){
            Integer ret = this;
            mpz_fdiv_q_ui(&ret.value, &value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "/"){
            Integer ret = this;
            mpz_fdiv_q(&ret.value, &value, &v.value);
            return ret;
        }
    Integer opBinary(string op)(in ulong v)
        if (op == "%"){
            Integer ret = this;
            mpz_mod_ui(&ret.value, &value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "%"){
            Integer ret = this;
            mpz_mod(&ret.value, &value, &v.value);
            return ret;
        }
    Integer opBinary(string op)(in ulong v)
        if (op == "^^"){
            Integer ret = this;
            mpz_pow_ui(&ret.value, &value, v);
            return ret;
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "&"){
            Integer ret = this;
            mpz_and(&ret.value, &value, &v.value);
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "|"){
            Integer ret = this;
            mpz_ior(&ret.value, &value, &v.value);
        }
    Integer opBinary(string op)(auto ref const Integer v)
        if (op == "^"){
            Integer ret = this;
            mpz_xor(&ret.value, &value, &v.value);
        }

    ulong opCast(T : ulong)() const {
        return mpz_get_ui(&value);
    }
    long opCast(T : long)() const {
        return mpz_get_si(&value);
    }
    double opCast(T : double)() const {
        return mpz_get_d(&value);
    }
    string opCast(T : string)() const {
        return toString(mpz_get_str(null, DefaultBase, &value));
    }
    mpz_ptr opCast(T : mpz_ptr)() const {
        return cast(mpz_ptr)&value;
    }

    bool opEquals(in ulong v) const {
        return mpz_cmp_ui(&value, v) == 0;
    }
    bool opEquals(in long v) const {
        return mpz_cmp_si(&value, v) == 0;
    }
    bool opEquals(in double v) const {
        return mpz_cmp_d(&value, v) == 0;
    }
    bool opEquals()(auto ref const Integer v) const {
        return mpz_cmp(&value, &v.value) == 0;
    }

    int opCmp(in ulong v) const {
        return mpz_cmp_ui(&value, v);
    }
    int opCmp(in long v) const {
        return mpz_cmp_si(&value, v);
    }
    int opCmp(in double v) const {
        return mpz_cmp_d(&value, v);
    }
    int opCmp()(auto ref const Integer v) const {
        return mpz_cmp(&value, &v.value);
    }

    void print() const {
        mpz_out_str(core.stdc.stdio.stdout, DefaultBase, &value);
    }
    void println() const{
        print();
        core.stdc.stdio.printf("\n");
    }
}

//Addition
unittest{
    pragma(msg, "Compiling Test: Addition");
    debug writeln("Running Test: Addition");
    Integer x = 4L;
    Integer y = 10UL;
    auto z = x;
    auto ans    =   x + 12 + y  + 5 + z;
    assert(ans == 4UL + 12 + 10 + 5 + 4);
    ans += x;
    ans += 5UL;
    assert(ans == 4UL + 12 + 10 + 5 + 4 + 4 + 5);
    ans++;
    assert(ans == 4UL + 12 + 10 + 5 + 4 + 4 + 5 + 1);
    debug ++TestCount;
}

//Subtraction
unittest{
    pragma(msg, "Compiling Test: Subtraction");
    debug writeln("Running Test: Subtraction");
    Integer x = 100L;
    auto y = Integer(9.8); //9
    Integer z = ulong.max;
    auto ans = z - x - 200 - y;
    assert(ans == ulong.max - 100 - 200 - 9);
    ans -= Integer(4.3);
    ans -= 100000UL;
    assert(ans == ulong.max - 100 - 200 - 9 - 4 - 100000);
    debug ++TestCount;
}

//Multiplication
unittest{
    pragma(msg, "Compiling Test: Multiplication");
    debug writeln("Running Test: Multiplication");
    auto x = Integer("10");
    Integer y = 20UL;
    Integer z = -320L;
    auto ans = x * y * z;
    assert(ans == -10L * 20 * 320);
    ans *= 3L;
    ans *= Integer(100UL);
    assert(ans == -10L * 20 * 320 * 3 * 100);
    debug ++TestCount;
}

//Division
unittest{
    pragma(msg, "Compiling Test: Division");
    debug writeln("Running Test: Division");
    auto x = Integer(100UL);
    Integer y = 10UL;
    Integer z = -1L;
    auto ans = (x / y) / z;
    assert(ans == (100L / 10) / (-1));
    ans /= 5L;
    ans /= Integer(2.3);
    assert(ans == -1L);
    debug ++TestCount;
}

//Fermats Little Theorem
unittest{
    //calculate a mersenne prime, M(p) = 2 ^ p - 1
    Integer M(in ulong p) {
        Integer x = 2UL;
        x ^^= p;
        return x - 1;
    }

    pragma(msg, "Compiling Test: Fermats Little Theorem");
    debug writeln("Running Test: Fermats Little Theorem");
    /*
      Fermats little theorem: a ^ p ≡ a (mod p) ∀ prime p
      check Fermats little theorem for a ≤ 100000 and all mersene primes M(p) : p ≤ 127
     */
    foreach (const ulong i; [2, 3, 5, 7, 13, 17, 19, 31, 61, 89, 107, 127])
    {
        for (ulong j = 2; j <= 100000; j++){
            Integer p = M(i);
            Integer a = j;
            Integer lhs = 0L;
            mpz_powm(
                     cast(mpz_ptr)lhs,
                     cast(mpz_ptr)a,
                     cast(mpz_ptr)p,
                     cast(mpz_ptr)p);
            //lhs = a^p (mod p)
            assert(lhs == a % p);
        }
    }
    debug ++TestCount;
}

//Euler's Sum of Powers Conjecture counter example
unittest{

    pragma(msg, "Compiling Test: Euler's Sum of Powers Conjecture counter example");
    debug writeln("Running Test: Euler's Sum of Powers Conjecture counter example");

    /*
      a^5 + b^5 + c^5 + d^5 = e^5
      Lander & Parkin, 1966 found the first counter example:
      27^5 + 84^5 + 110^5 + 133^5 = 144^5
      this test is going to search for this counter example by
      brute force for all positive a, b, c, d ≤ 200
    */

    enum LIMIT = 200;
    enum POWER = 5;

    bool found = false;

    Integer r1;
    r1.init();
 outermost: for (ulong a = 1; a <= LIMIT; a++){
        for (ulong b = a; b <= LIMIT; b++){
            for (ulong c = b; c <= LIMIT; c++){
                for (ulong d = c; d <= LIMIT; d++){
                    r1 = (Integer(a) ^^ POWER) +
                        (Integer(b) ^^ POWER) +
                        (Integer(c) ^^ POWER) +
                        (Integer(d) ^^ POWER);
                    Integer rem = 0L;
                    mpz_rootrem(cast(mpz_ptr)r1,
                                cast(mpz_ptr)rem,
                                cast(mpz_ptr)r1,
                                POWER);
                    if (rem == 0UL){
                        debug printf("Counter Example Found: %lu^5 + %lu^5 + %lu^5 + %lu^5 = %lu^5\n",
                                     a, b, c, d, cast(ulong)r1);
                        found = true;
                        break outermost;
                    }
                }
            }
        }
    }
    assert(found);
    debug  ++TestCount;
}

unittest{
    debug writeln("Number of Tests Run: ", TestCount);
}

void main(){}
