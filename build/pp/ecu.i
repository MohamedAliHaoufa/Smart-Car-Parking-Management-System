# 0 "Src/ecu.c"
# 1 "/home/mohamed/Downloads/test/corrected4/corrected/Smart Car Parking Managment System//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "Src/ecu.c"
# 24 "Src/ecu.c"
# 1 "Inc/ecu.h" 1
# 29 "Inc/ecu.h"
# 1 "bsp/Inc/servo_motor_driver.h" 1
# 24 "bsp/Inc/servo_motor_driver.h"
# 1 "drivers/Inc/stm32f401xx.h" 1
# 33 "drivers/Inc/stm32f401xx.h"
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/newlib.h" 1 3
# 10 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/_newlib_version.h" 1 3
# 11 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 1 3 4
# 214 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 3 4

# 214 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 3 4
typedef unsigned int size_t;
# 329 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 1 3 4
# 145 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 424 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 435 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 3 4
} max_align_t;
# 15 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 1 3 4
# 359 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 2 3


# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_types.h" 1 3






# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 8 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_types.h" 2 3
# 28 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;



typedef long _off_t;





typedef int __pid_t;



typedef short __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;







typedef unsigned short __ino_t;
# 90 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;







typedef long _fpos_t;
# 131 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 147 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 158 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef long __daddr_t;



typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;







typedef __builtin_va_list __va_list;
# 16 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 34 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/lock.h" 1 3
# 33 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/lock.h" 3
struct __lock;
typedef struct __lock * _LOCK_T;






extern void __retarget_lock_init(_LOCK_T *lock);

extern void __retarget_lock_init_recursive(_LOCK_T *lock);

extern void __retarget_lock_close(_LOCK_T lock);

extern void __retarget_lock_close_recursive(_LOCK_T lock);

extern void __retarget_lock_acquire(_LOCK_T lock);

extern void __retarget_lock_acquire_recursive(_LOCK_T lock);

extern int __retarget_lock_try_acquire(_LOCK_T lock);

extern int __retarget_lock_try_acquire_recursive(_LOCK_T lock);


extern void __retarget_lock_release(_LOCK_T lock);

extern void __retarget_lock_release_recursive(_LOCK_T lock);
# 35 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 2 3
typedef _LOCK_T _flock_t;







struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 98 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 115 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 152 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 269 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



extern __FILE __sf[3];

struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};

extern struct _glue __sglue;
# 305 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 567 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];




  struct __locale_t *_locale;





  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {



          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;







    } _new;







  void (**_sig_func)(int);
};
# 765 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;





extern struct _reent _impure_data ;
# 883 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/reent.h" 3
extern struct _atexit *__atexit;
extern struct _atexit __atexit0;

extern void (*__stdio_exit_handler) (void);

void _reclaim_reent (struct _reent *);

extern int _fwalk_sglue (struct _reent *, int (*)(struct _reent *, __FILE *),
    struct _glue *);
# 19 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 1 3 4
# 48 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/alloca.h" 1 3
# 23 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);

__uint32_t arc4random (void);
__uint32_t arc4random_uniform (__uint32_t);
void arc4random_buf (void *, size_t);

int atexit (void (*__func)(void));
double atof (const char *__nptr);

float atoff (const char *__nptr);

int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);



char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);

extern char *suboptarg;
int getsubopt (char **, char * const *, char **);

long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);


char * mkdtemp (char *);






int mkstemp (char *);


int mkstemps (char *, int);


char * mktemp (char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));


char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;

void *reallocarray(void *, size_t, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2, 3)));
void *reallocf(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2)));


char * realpath (const char *restrict path, char *restrict resolved_path);


int rpmatch (const char *response);




void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 191 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);


long a64l (const char *__input);
char * l64a (long __input);
char * _l64a_r (struct _reent *,long __input);


int on_exit (void (*__func)(int, void *),void *__arg);


void _Exit (int __status) __attribute__ ((__noreturn__));


int putenv (char *__string);

int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);

int setenv (const char *__string, const char *__value, int __overwrite);

int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 224 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);

char * itoa (int, char *, int);
char * utoa (unsigned, char *, int);


int rand_r (unsigned *__seed);



double drand48 (void);
double _drand48_r (struct _reent *);
double erand48 (unsigned short [3]);
double _erand48_r (struct _reent *, unsigned short [3]);
long jrand48 (unsigned short [3]);
long _jrand48_r (struct _reent *, unsigned short [3]);
void lcong48 (unsigned short [7]);
void _lcong48_r (struct _reent *, unsigned short [7]);
long lrand48 (void);
long _lrand48_r (struct _reent *);
long mrand48 (void);
long _mrand48_r (struct _reent *);
long nrand48 (unsigned short [3]);
long _nrand48_r (struct _reent *, unsigned short [3]);
unsigned short *
       seed48 (unsigned short [3]);
unsigned short *
       _seed48_r (struct _reent *, unsigned short [3]);
void srand48 (long);
void _srand48_r (struct _reent *, long);


char * initstate (unsigned, char *, size_t);
long random (void);
char * setstate (char *);
void srandom (unsigned);


long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);



void cfree (void *);


int unsetenv (const char *__string);

int _unsetenv_r (struct _reent *, const char *__string);



int posix_memalign (void **, size_t, size_t) __attribute__((__nonnull__ (1)))
     __attribute__((__warn_unused_result__));


char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 312 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 3
void qsort_r (void *__base, size_t __nmemb, size_t __size, void *__thunk, int (*_compar)(void *, const void *, const void *))
             __asm__ ("" "__bsd_qsort_r");
# 322 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);







void * aligned_alloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__alloc_align__(1)))
     __attribute__((__alloc_size__(2))) __attribute__((__warn_unused_result__));
int at_quick_exit(void (*)(void));
_Noreturn void
 quick_exit(int);



# 34 "drivers/Inc/stm32f401xx.h" 2
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stdint.h" 1 3 4
# 9 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stdint.h" 3 4
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stdint.h" 2 3 4
# 35 "drivers/Inc/stm32f401xx.h" 2
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 1 3
# 36 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h" 1 3 4
# 37 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 2 3



# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stdarg.h" 1 3 4
# 40 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 2 3





typedef __gnuc_va_list va_list;
# 63 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3



typedef __FILE FILE;



typedef _fpos_t fpos_t;





typedef __off_t off_t;




typedef _ssize_t ssize_t;



# 1 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/stdio.h" 1 3
# 86 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 2 3
# 187 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
char * ctermid (char *);




FILE * tmpfile (void);
char * tmpnam (char *);

char * tempnam (const char *, const char *) __attribute__((__malloc__)) __attribute__((__warn_unused_result__));

int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 263 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
int fseeko (FILE *, off_t, int);
off_t ftello (FILE *);







int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 290 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
int asiprintf (char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
char * asniprintf (char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * asnprintf (char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));

int diprintf (int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));

int fiprintf (FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fiscanf (FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int iprintf (const char *, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int iscanf (const char *, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int siprintf (char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int siscanf (const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int sniprintf (char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vasiprintf (char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
char * vasniprintf (char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * vasnprintf (char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vdiprintf (int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vfiprintf (FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vfiscanf (FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int viprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int viscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsiprintf (char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vsiscanf (const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vsniprintf (char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
# 345 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
FILE * fdopen (int, const char *);

int fileno (FILE *);


int pclose (FILE *);
FILE * popen (const char *, const char *);



void setbuffer (FILE *, char *, int);
int setlinebuf (FILE *);



int getw (FILE *);
int putw (int, FILE *);


int getc_unlocked (FILE *);
int getchar_unlocked (void);
void flockfile (FILE *);
int ftrylockfile (FILE *);
void funlockfile (FILE *);
int putc_unlocked (int, FILE *);
int putchar_unlocked (int);
# 380 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
int dprintf (int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));

FILE * fmemopen (void *restrict, size_t, const char *restrict);


FILE * open_memstream (char **, size_t *);
int vdprintf (int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));



int renameat (int, const char *, int, const char *);
# 402 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);


void clearerr_unlocked (FILE *);
int feof_unlocked (FILE *);
int ferror_unlocked (FILE *);
int fileno_unlocked (FILE *);
int fflush_unlocked (FILE *);
int fgetc_unlocked (FILE *);
int fputc_unlocked (int, FILE *);
size_t fread_unlocked (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite_unlocked (const void *restrict , size_t _size, size_t _n, FILE *);
# 583 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 607 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
FILE *funopen (const void *__cookie,
  int (*__readfn)(void *__cookie, char *__buf,
    int __n),
  int (*__writefn)(void *__cookie, const char *__buf,
     int __n),
  fpos_t (*__seekfn)(void *__cookie, fpos_t __off, int __whence),
  int (*__closefn)(void *__cookie));
FILE *_funopen_r (struct _reent *, const void *__cookie,
  int (*__readfn)(void *__cookie, char *__buf,
    int __n),
  int (*__writefn)(void *__cookie, const char *__buf,
     int __n),
  fpos_t (*__seekfn)(void *__cookie, fpos_t __off, int __whence),
  int (*__closefn)(void *__cookie));
# 691 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 745 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = _impure_ptr;
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = _impure_ptr;
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 801 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/stdio.h" 3

# 36 "drivers/Inc/stm32f401xx.h" 2
# 1 "drivers/Inc/Platform_Types.h" 1
# 67 "drivers/Inc/Platform_Types.h"

# 67 "drivers/Inc/Platform_Types.h"
typedef unsigned char boolean;
typedef signed char sint8;
typedef unsigned char uint8;
typedef signed short sint16;
typedef unsigned short uint16;
typedef signed long sint32;
typedef signed long long sint64;
typedef unsigned long uint32;
typedef unsigned long long uint64;






typedef unsigned long uint8_least;
typedef unsigned long uint16_least;
typedef unsigned long uint32_least;
typedef signed long sint8_least;
typedef signed long sint16_least;
typedef signed long sint32_least;






typedef float float32;
typedef double float64;






typedef void* VoidPtr;
typedef const void* ConstVoidPtr;






typedef volatile unsigned char vuint8_t;
typedef volatile unsigned short vuint16_t;
typedef volatile unsigned long vuint32_t;
# 37 "drivers/Inc/stm32f401xx.h" 2
# 178 "drivers/Inc/stm32f401xx.h"
typedef struct {
    vuint32_t ISER[3];
    uint32 RESERVED0[29];
    vuint32_t ICER[3];
    uint32 RESERVED1[29];
    vuint32_t ISPR[3];
    uint32 RESERVED2[29];
    vuint32_t ICPR[3];
    uint32 RESERVED3[29];
    vuint32_t IABR[3];
    uint32 RESERVED4[61];
    vuint8_t IP[80];
    uint32 RESERVED5[684];
    vuint32_t STIR;
} NVIC_TypeDef;






typedef struct {
    vuint32_t CPUID;
    vuint32_t ICSR;
    vuint32_t VTOR;
    vuint32_t AIRCR;
    vuint32_t SCR;
    vuint32_t CCR;
    vuint8_t SHP[12];
    vuint32_t SHCSR;
    vuint32_t CFSR;
    vuint32_t HFSR;
    uint32 RESERVED;
    vuint32_t MMAR;
    vuint32_t BFAR;
} SCB_TypeDef;






typedef struct {
    vuint32_t CTRL;
    vuint32_t LOAD;
    vuint32_t VAL;
    vuint32_t CALIB;
} STK_TypeDef;






typedef struct {
    vuint32_t MODER;
    vuint32_t OTYPER;
    vuint32_t OSPEEDR;
    vuint32_t PUPDR;
    vuint32_t IDR;
    vuint32_t ODR;
    vuint32_t BSRR;
    vuint32_t LCKR;
    vuint32_t AFR[2];
} GPIO_TypeDef;






typedef struct {
    vuint32_t CR;
    vuint32_t PLLCFGR;
    vuint32_t CFGR;
    vuint32_t CIR;
    vuint32_t AHB1RSTR;
    vuint32_t AHB2RSTR;
    uint32 RESERVED0[2];
    vuint32_t APB1RSTR;
    vuint32_t APB2RSTR;
    uint32 RESERVED1[2];
    vuint32_t AHB1ENR;
    vuint32_t AHB2ENR;
    uint32 RESERVED2[2];
    vuint32_t APB1ENR;
    vuint32_t APB2ENR;
    uint32 RESERVED3[2];
    vuint32_t AHB1LPENR;
    vuint32_t AHB2LPENR;
    uint32 RESERVED4[2];
    vuint32_t APB1LPENR;
    vuint32_t APB2LPENR;
    uint32 RESERVED5[2];
    vuint32_t BDCR;
    vuint32_t CSR;
    uint32 RESERVED6[2];
    vuint32_t SSCGR;
    vuint32_t PLLI2SCFGR;
    uint32 RESERVED7;
    vuint32_t DCKCFGR;
} RCC_TypeDef;






typedef struct {
    vuint32_t IMR;
    vuint32_t EMR;
    vuint32_t RTSR;
    vuint32_t FTSR;
    vuint32_t SWIER;
    vuint32_t PR;
} EXTI_TypeDef;






typedef struct {
    vuint32_t MEMRMP;
    vuint32_t PMC;
    vuint32_t EXTICR[4];
    uint32 RESERVED1[2];
    vuint32_t CMPCR;
    uint32 RESERVED2[2];
    vuint32_t CFGR;
} SYSCFG_RegDef_t;






typedef struct {
     uint32 SR;
     uint32 DR;
     uint32 BRR;
     uint32 CR1;
     uint32 CR2;
     uint32 CR3;
     uint32 GTPR;
} USART_TypeDef;






typedef struct {
     uint32 CR1;
     uint32 CR2;
     uint32 SR;
     uint32 DR;
     uint32 CRCPR;
     uint32 RXCRCR;
     uint32 TXCRCR;
     uint32 I2SCFGR;
     uint32 I2SPR;
} SPI_TypeDef;






typedef struct {
     uint32 CR1;
     uint32 CR2;
     uint32 OAR1;
     uint32 OAR2;
     uint32 DR;
     uint32 SR1;
     uint32 SR2;
     uint32 CCR;
     uint32 TRISE;
} I2C_TypeDef;






typedef struct {
    uint32 CR;
    uint32 SR;
    uint32 DR;
    uint32 IDR;
    uint32 POL;
    uint32 RESERVED;
    uint32 INIT;
} CRC_TypeDef;






typedef struct {
    uint32 CR1;
    uint32 CR2;
    uint32 SMCR;
    uint32 DIER;
    uint32 SR;
    uint32 EGR;
    uint32 CCMR1;
    uint32 CCMR2;
    uint32 CCER;
    uint32 CNT;
    uint32 PSC;
    uint32 ARR;
    uint32 RCR;
    uint32 CCR1;
    uint32 CCR2;
    uint32 CCR3;
    uint32 CCR4;
    uint32 BDTR;
    uint32 DCR;
    uint32 DMAR;
    uint32 OR;
} TIM1_TypeDef;
# 1135 "drivers/Inc/stm32f401xx.h"
# 1 "drivers/Inc/stm32f401xx_gpio_driver.h" 1
# 21 "drivers/Inc/stm32f401xx_gpio_driver.h"
# 1 "drivers/Inc/stm32f401xx.h" 1
# 22 "drivers/Inc/stm32f401xx_gpio_driver.h" 2
# 40 "drivers/Inc/stm32f401xx_gpio_driver.h"
typedef struct {
    uint8 GPIO_MODE;

    uint8 GPIO_PinSpeed;

    uint16 GPIO_PinNumber;

    uint32 GPIO_PinPuPdControl;
    uint32 GPIO_PinOPType;
    uint32 GPIO_PinAltFunMode;
} GPIO_PinConfig_t;
# 183 "drivers/Inc/stm32f401xx_gpio_driver.h"
void MCAL_GPIO_Init(GPIO_TypeDef *GPIOx, GPIO_PinConfig_t *PinConfig);
# 194 "drivers/Inc/stm32f401xx_gpio_driver.h"
void MCAL_GPIO_DeInit(GPIO_TypeDef *GPIOx);
# 206 "drivers/Inc/stm32f401xx_gpio_driver.h"
uint8 MCAL_GPIO_ReadPin(GPIO_TypeDef *GPIOx, uint16 PinNumber);
# 217 "drivers/Inc/stm32f401xx_gpio_driver.h"
uint16 MCAL_GPIO_ReadPort(GPIO_TypeDef *GPIOx);
# 230 "drivers/Inc/stm32f401xx_gpio_driver.h"
void MCAL_GPIO_WritePin(GPIO_TypeDef *GPIOx, uint16 PinNumber, uint8 Value);
# 242 "drivers/Inc/stm32f401xx_gpio_driver.h"
void MCAL_GPIO_WritePort(GPIO_TypeDef *GPIOx, uint16 Value);
# 254 "drivers/Inc/stm32f401xx_gpio_driver.h"
void MCAL_GPIO_TogglePin(GPIO_TypeDef *GPIOx, uint16 PinNumber);
# 267 "drivers/Inc/stm32f401xx_gpio_driver.h"
void MCAL_GPIO_TogglePort(GPIO_TypeDef *GPIOx);
# 279 "drivers/Inc/stm32f401xx_gpio_driver.h"
void MCAL_GPIO_TogglePort(GPIO_TypeDef *GPIOx);
# 292 "drivers/Inc/stm32f401xx_gpio_driver.h"
uint8 MCAL_GPIO_LockPin(GPIO_TypeDef *GPIOx, uint16 PinNumber);
# 1136 "drivers/Inc/stm32f401xx.h" 2
# 1 "drivers/Inc/stm32f401xx_rcc_driver.h" 1
# 85 "drivers/Inc/stm32f401xx_rcc_driver.h"
void MCAL_RCC_Select_Clock(uint8_t clock);
# 95 "drivers/Inc/stm32f401xx_rcc_driver.h"
void MCAL_RCC_Enable_Peripheral(uint8_t peripheral);
# 105 "drivers/Inc/stm32f401xx_rcc_driver.h"
void MCAL_RCC_Reset_Peripheral(uint8_t peripheral);
# 114 "drivers/Inc/stm32f401xx_rcc_driver.h"
uint32_t MCAL_RCC_GetSYS_CLKFreq(void);
# 123 "drivers/Inc/stm32f401xx_rcc_driver.h"
uint32_t MCAL_RCC_GetHCLKFreq(void);
# 132 "drivers/Inc/stm32f401xx_rcc_driver.h"
uint32_t MCAL_RCC_GetPCLK1Freq(void);
# 141 "drivers/Inc/stm32f401xx_rcc_driver.h"
uint32_t MCAL_RCC_GetPCLK2Freq(void);
# 150 "drivers/Inc/stm32f401xx_rcc_driver.h"
uint32_t RCC_GetPLLOutputClock(void);
# 1137 "drivers/Inc/stm32f401xx.h" 2
# 1 "drivers/Inc/stm32f401xx_usart_driver.h" 1
# 25 "drivers/Inc/stm32f401xx_usart_driver.h"
# 1 "drivers/Inc/stm32f401xx_nvic_driver.h" 1
# 274 "drivers/Inc/stm32f401xx_nvic_driver.h"
void MCAL_NVIC_SetPriorityGrouping(uint32 priority_grouping);





uint32 MCAL_NVIC_GetPriorityGrouping(void);






void MCAL_NVIC_EnableIRQ(uint8 IRQn);






void MCAL_NVIC_DisableIRQ(uint8 IRQn);






uint8 MCAL_NVIC_GetPendingIRQ(uint8 IRQn);






void MCAL_NVIC_SetPendingIRQ(uint8 IRQn);






void MCAL_NVIC_ClearPendingIRQ(uint8 IRQn);






uint8 MCAL_NVIC_GetActive(uint8 IRQn);







void MCAL_NVIC_SetPriority(uint8 IRQn, uint8 priority);
# 344 "drivers/Inc/stm32f401xx_nvic_driver.h"
uint8 MCAL_NVIC_GetPriority(uint8 IRQn);
# 357 "drivers/Inc/stm32f401xx_nvic_driver.h"
void MCAL_NVIC_SystemReset(void);
# 26 "drivers/Inc/stm32f401xx_usart_driver.h" 2
# 44 "drivers/Inc/stm32f401xx_usart_driver.h"
typedef struct{
 uint8 USART_Mode;

 uint32 BaudRate;

 uint8 Payload_Length;

 uint32 Parity;

 uint32 StopBits;

 uint8 HwFlowCtl;

 uint8 IRQ_Enable;

 void (*P_IRQ_CallBack)(void);
}USART_cfg_t;







typedef enum {
    enable,
    disable
} Polling_Mechanism;
# 136 "drivers/Inc/stm32f401xx_usart_driver.h"
void MCAL_USART_Init(USART_TypeDef* USARTx, USART_cfg_t* USART_cfg);





void MCAL_USART_DeInit(USART_TypeDef* USARTx);





void MCAL_USART_GPIO_Set_Pins(USART_TypeDef* USARTx);







void MCAL_USART_SendData(USART_TypeDef* USARTx, uint16_t *pTxBuffer, Polling_Mechanism PollingEn);







void MCAL_USART_SendString(USART_TypeDef* USARTx, uint8_t *str, uint8_t str_len);







void MCAL_USART_ReceiveData(USART_TypeDef* USARTx, uint16_t *pRxBuffer, Polling_Mechanism PollingEn);







void MCAL_USART_ReceiveBuffer(USART_TypeDef* USARTx, uint16_t *pRxBuffer, uint8_t length);





void MCAL_USART_Wait_TC(USART_TypeDef* USARTx);
# 1138 "drivers/Inc/stm32f401xx.h" 2
# 1 "drivers/Inc/stm32f401xx_i2c_driver.h" 1
# 38 "drivers/Inc/stm32f401xx_i2c_driver.h"
struct S_I2C_Slave_address
{
    uint16_t Enable_Dual_Address;
    uint16_t PrimaryAddress;
    uint16_t SecondaryAddress;
    uint16_t I2C_Addressing_Mode;
};




typedef enum
{
    I2C_EV_Stop,
    I2C_Error_AF,
    I2C_Ev_Address_Matched,
    I2C_Ev_Data_Req,
    I2C_Ev_Data_RCV
} Slave_State;




typedef struct
{
    uint32_t I2C_Speed;
    uint32_t I2C_stretchmode;
    uint32_t I2C_Mode;
    struct S_I2C_Slave_address I2C_Slave_address;
    uint32_t I2C_Ack_Conrtol;
    uint32_t General_Call_Address_Detection;
    void (*P_Slave_Event_CallBack)(Slave_State state);
} S_I2C_Config_t;




typedef enum
{
    WithStop,
    WithoutStop
} StopCondition;




typedef enum
{
    Start,
    Repeated
} Repeated_Start;




typedef enum
{
    DISABLE,
    ENABLE
} Functional_State;




typedef enum
{
    Reset,
    Set
} FlagStatus;




typedef enum
{
    I2C_Flag_Busy,
    EV5,
    EV6,
    EV7,
    EV8,
    EV8_1,
    Master_Byte_Transmitting = (uint32_t)(0x00070080)
} Status;




typedef enum
{
    I2C_Direction_Transmitter,
    I2C_Direction_Receiver
} I2C_Direction;
# 208 "drivers/Inc/stm32f401xx_i2c_driver.h"
void MCAL_I2C_Init(I2C_TypeDef *I2Cx, S_I2C_Config_t *I2C_Init_Struct);
# 217 "drivers/Inc/stm32f401xx_i2c_driver.h"
void MCAL_I2C_Deinit(I2C_TypeDef *I2Cx);
# 226 "drivers/Inc/stm32f401xx_i2c_driver.h"
void MCAL_I2C_Set_GPIO(I2C_TypeDef *I2Cx);
# 240 "drivers/Inc/stm32f401xx_i2c_driver.h"
void MCAL_I2C_Master_Tx(I2C_TypeDef *I2Cx, uint16_t SlaveAdd, uint8_t *dataout, uint32_t datalen, StopCondition Stop, Repeated_Start start);
# 254 "drivers/Inc/stm32f401xx_i2c_driver.h"
void MCAL_I2C_Master_Rx(I2C_TypeDef *I2Cx, uint16_t SlaveAdd, uint8_t *dataout, uint32_t datalen, StopCondition Stop, Repeated_Start start);
# 264 "drivers/Inc/stm32f401xx_i2c_driver.h"
void MCAL_I2C_Slave_SendData(I2C_TypeDef *I2Cx, uint8_t data);
# 275 "drivers/Inc/stm32f401xx_i2c_driver.h"
uint8_t MCAL_I2C_SlaveReceiveData(I2C_TypeDef *I2Cx);
# 286 "drivers/Inc/stm32f401xx_i2c_driver.h"
void I2C_Generate_Start(I2C_TypeDef *I2Cx, Functional_State state, Repeated_Start start);
# 298 "drivers/Inc/stm32f401xx_i2c_driver.h"
FlagStatus I2C_Get_FlagStatus(I2C_TypeDef *I2Cx, Status flag);
# 309 "drivers/Inc/stm32f401xx_i2c_driver.h"
void I2C_SendAddress(I2C_TypeDef *I2Cx, uint16_t SlaveAddress, I2C_Direction I2C_Direction);
# 319 "drivers/Inc/stm32f401xx_i2c_driver.h"
void I2C_Generate_Stop(I2C_TypeDef *I2Cx, Functional_State NewState);
# 329 "drivers/Inc/stm32f401xx_i2c_driver.h"
void I2C_ACKnowlageConfig(I2C_TypeDef *I2Cx, Functional_State NewState);
# 1139 "drivers/Inc/stm32f401xx.h" 2
# 1 "drivers/Inc/stm32f401xx_spi_driver.h" 1
# 33 "drivers/Inc/stm32f401xx_spi_driver.h"
struct S_IRQ_SRC
{
    uint8_t TXE:1;
    uint8_t RXE:1;
    uint8_t ERRI:1;
    uint8_t Reserved:5;
};
# 48 "drivers/Inc/stm32f401xx_spi_driver.h"
typedef struct
{
    uint16_t Device_Mode;
    uint16_t Communication_Mode;
    uint16_t Payload_Length;
    uint16_t Frame_Format;
    uint16_t Clock_Polarity;
    uint16_t Clock_Phase;
    uint16_t NSS;
    uint16_t SPI_Prescaler;
    uint16_t IRQ_Enable;
    void(*P_IRQ_CallBack)(struct S_IRQ_SRC IRQ);
} S_SPI_Config_t;




enum SPI_PollingMechanism
{
    Enabled,
    Disabled
};
# 161 "drivers/Inc/stm32f401xx_spi_driver.h"
void MCAL_SPI_Init(SPI_TypeDef *SPIx, S_SPI_Config_t *Config);





void MCAL_SPI_DeInit(SPI_TypeDef *SPIx);





void MCAL_SPI_GPIO_Set_Pins(SPI_TypeDef *SPIx);







void MCAL_SPI_SendData(SPI_TypeDef *SPIx, uint16_t *pTXBuffer, enum SPI_PollingMechanism Polling_En);







void MCAL_SPI_ReceiveData(SPI_TypeDef *SPIx, uint16_t *pRXBuffer, enum SPI_PollingMechanism Polling_En);







void MCAL_SPI_Tx_Rx(SPI_TypeDef *SPIx, uint16_t *TX_RX_pBuffer, enum SPI_PollingMechanism Polling_En);
# 1140 "drivers/Inc/stm32f401xx.h" 2

# 1 "drivers/Inc/stm32f401xx_systick_driver.h" 1
# 48 "drivers/Inc/stm32f401xx_systick_driver.h"
typedef struct {
    uint8 running_mode;
    uint8 clock_config;
    uint8 interrupt_config;
    uint32 reload_value;
    void (*Callback_Function)(void);
} STK_config_t;
# 123 "drivers/Inc/stm32f401xx_systick_driver.h"
void MCAL_STK_Config(STK_config_t *_cfg);
# 133 "drivers/Inc/stm32f401xx_systick_driver.h"
void MCAL_STK_SetReload(uint32 value);
# 144 "drivers/Inc/stm32f401xx_systick_driver.h"
void MCAL_STK_SetCallback(void (*pfCallback)(void));
# 154 "drivers/Inc/stm32f401xx_systick_driver.h"
void MCAL_STK_StartTimer();
# 163 "drivers/Inc/stm32f401xx_systick_driver.h"
void MCAL_STK_StopTimer();
# 175 "drivers/Inc/stm32f401xx_systick_driver.h"
void MCAL_STK_Delay(uint32 delay_ticks);
# 187 "drivers/Inc/stm32f401xx_systick_driver.h"
void MCAL_STK_Delay1ms(uint32 delay_ms);
# 1142 "drivers/Inc/stm32f401xx.h" 2
# 1 "drivers/Inc/stm32f401xx_timer_driver.h" 1
# 100 "drivers/Inc/stm32f401xx_timer_driver.h"
void Timer2_init(void);







void dus(int us);







void dms(int ms);
# 1143 "drivers/Inc/stm32f401xx.h" 2
# 25 "bsp/Inc/servo_motor_driver.h" 2
# 1 "drivers/Inc/stm32f401xx_gpio_driver.h" 1
# 26 "bsp/Inc/servo_motor_driver.h" 2
# 1 "drivers/Inc/stm32f401xx_timer_driver.h" 1
# 27 "bsp/Inc/servo_motor_driver.h" 2
# 67 "bsp/Inc/servo_motor_driver.h"
void Servo1_Entry_Gate_Init(void);
# 83 "bsp/Inc/servo_motor_driver.h"
void Servo1_Entry_Gate(uint8 Direction);
# 95 "bsp/Inc/servo_motor_driver.h"
void Servo2_Exit_Gate_Init(void);
# 111 "bsp/Inc/servo_motor_driver.h"
void Servo2_Exit_Gate(uint8 Direction);
# 30 "Inc/ecu.h" 2
# 1 "bsp/Inc/lcd_driver.h" 1
# 29 "bsp/Inc/lcd_driver.h"
# 1 "drivers/Inc/stm32f401xx_systick_driver.h" 1
# 30 "bsp/Inc/lcd_driver.h" 2







typedef enum {
    LCD_8BIT,
    LCD_4BIT
} LCD_MODE_t;




typedef enum {
    LCD_2ROWS,
    LCD_4ROWS
} LCD_ROWS_t;




typedef struct {
    LCD_MODE_t Mode;
    LCD_ROWS_t Rows;
    uint8 Display_Mode;
    uint8 Entry_Mode;
    GPIO_TypeDef* GPIO_PORT;
    uint16 RS_PIN;
    uint16 EN_PIN;
    uint16 D0_PIN;
    uint16 D1_PIN;
    uint16 D2_PIN;
    uint16 D3_PIN;
    uint16 D4_PIN;
    uint16 D5_PIN;
    uint16 D6_PIN;
    uint16 D7_PIN;
} LCD_t;
# 154 "bsp/Inc/lcd_driver.h"
void LCD_Init(LCD_t* LCD_cfg);
# 167 "bsp/Inc/lcd_driver.h"
void LCD_Send_Command(LCD_t* LCD_cfg, uint8 command);
# 180 "bsp/Inc/lcd_driver.h"
void LCD_Send_Char(LCD_t* LCD_cfg, uint8 Char);
# 195 "bsp/Inc/lcd_driver.h"
void LCD_Send_Char_Pos(LCD_t* LCD_cfg, uint8 Char, uint8 row, uint8 column);
# 208 "bsp/Inc/lcd_driver.h"
void LCD_Send_String(LCD_t* LCD_cfg, uint8 *string);
# 223 "bsp/Inc/lcd_driver.h"
void LCD_Send_String_Pos(LCD_t* LCD_cfg, uint8 *string, uint8 row, uint8 column);
# 240 "bsp/Inc/lcd_driver.h"
void LCD_Send_Enable_Signal(LCD_t* LCD_cfg);
# 258 "bsp/Inc/lcd_driver.h"
void LCD_Set_Cursor(LCD_t* LCD_cfg, uint8 row, uint8 column);
# 31 "Inc/ecu.h" 2
# 1 "bsp/Inc/led_driver.h" 1
# 37 "bsp/Inc/led_driver.h"
typedef enum {
    LED_Active_High,
    LED_Active_Low,
    LED_Mode_max
} LED_Mode_t;






typedef struct {
    GPIO_TypeDef* LED_Port;
    GPIO_PinConfig_t LED_Pin;
    LED_Mode_t LED_Mode;
} LED_cfg_t;
# 73 "bsp/Inc/led_driver.h"
void LED_Init(const LED_cfg_t* led_cfg);
# 89 "bsp/Inc/led_driver.h"
void LED_TurnOn(const LED_cfg_t* led_cfg);
# 105 "bsp/Inc/led_driver.h"
void LED_TurnOff(const LED_cfg_t* led_cfg);
# 122 "bsp/Inc/led_driver.h"
void LED_Toggle(const LED_cfg_t* led_cfg);
# 32 "Inc/ecu.h" 2
# 1 "bsp/Inc/keypad_driver.h" 1
# 79 "bsp/Inc/keypad_driver.h"
void keypad_init(void);
# 93 "bsp/Inc/keypad_driver.h"
uint8 keypad_Get_Pressed_Key(void);
# 33 "Inc/ecu.h" 2
# 1 "bsp/Inc/eeprom_flash.h" 1
# 31 "bsp/Inc/eeprom_flash.h"
# 1 "drivers/Inc/stm32f401xx_i2c_driver.h" 1
# 32 "bsp/Inc/eeprom_flash.h" 2
# 56 "bsp/Inc/eeprom_flash.h"
void EEPROM_Init(void);
# 69 "bsp/Inc/eeprom_flash.h"
unsigned char EEPROM_Write_NBytes(unsigned int Memory_address, unsigned char* bytes, uint8_t Data_Length);
# 82 "bsp/Inc/eeprom_flash.h"
unsigned char EEPROM_Read_byte(unsigned int Memory_address, uint8_t *dataout, uint8_t datalen);
# 34 "Inc/ecu.h" 2
# 44 "Inc/ecu.h"
typedef enum {
    ID_NOT_Found,
    ID_Found
} ID_Check_Result;
# 112 "Inc/ecu.h"
void ECU_Init(void);
# 122 "Inc/ecu.h"
void Admin_Init(void);
# 133 "Inc/ecu.h"
void UserLCD_PrintFreeSlots(void);
# 143 "Inc/ecu.h"
ID_Check_Result Check_ID(uint8 _ID);
# 156 "Inc/ecu.h"
uint8 Check_Flag(uint8 _ID);
# 166 "Inc/ecu.h"
void Flag_SET_RESET(uint8 _ID);
# 179 "Inc/ecu.h"
uint8 Check_Password(uint8 _ID);
# 202 "Inc/ecu.h"
void combineArrays(uint8_t* array1, int size1, uint8_t* array2, int size2, uint8_t* array3, int size3, uint8_t* array4, int size4, uint8_t* combinedArray);
# 212 "Inc/ecu.h"
void Enter_Gate_Open(void);
# 222 "Inc/ecu.h"
void Exit_Gate_Open(void);
# 232 "Inc/ecu.h"
void Wrong_RFID(void);
# 243 "Inc/ecu.h"
void Trigger_Alarm(USART_TypeDef* _USART);
# 25 "Src/ecu.c" 2







void Enter_UART_CallBack(void);
void Exit_UART_CallBack(void);






static LED_cfg_t Green_LED;
static LED_cfg_t Red_LED;
static LCD_t Admin_LCD;
static LCD_t User_LCD;
static USART_cfg_t Enter_Gate_UART;
static USART_cfg_t Exit_Gate_UART;
static GPIO_PinConfig_t PIR;
volatile uint8 Enter_Flag, Exit_Flag;
uint8 Free_Slots = 3;
uint8 Print_Slots_LCD_Flag;
static uint8 Users_IDs[3];
static uint8 User1_Password[4];
static uint8 User2_Password[4];
static uint8 User3_Password[4];
static uint8 User1_flag = 1;
static uint8 User2_flag = 1;
static uint8 User3_flag = 1;
# 78 "Src/ecu.c"
static uint8_t combinedArray[(3 + 4 + 4 + 4)];
# 98 "Src/ecu.c"
void ECU_Init(void){

    MCAL_RCC_Enable_Peripheral(((uint8_t)0x00));
    MCAL_RCC_Enable_Peripheral(((uint8_t)0x01));
    MCAL_RCC_Enable_Peripheral(((uint8_t)0x04));
    MCAL_RCC_Enable_Peripheral(((uint8_t)0x03));
    MCAL_RCC_Enable_Peripheral(((uint8_t)0x10));


    EEPROM_Init();



    Green_LED.LED_Port = ((GPIO_TypeDef*)0x40020000UL);
    Green_LED.LED_Mode = LED_Active_Low;
    Green_LED.LED_Pin.GPIO_PinNumber = 11;
    Green_LED.LED_Pin.GPIO_MODE = 1;
    Green_LED.LED_Pin.GPIO_PinOPType = 0;
    Green_LED.LED_Pin.GPIO_PinPuPdControl = 0;
    Green_LED.LED_Pin.GPIO_PinSpeed = 2;
    LED_Init(&Green_LED);

    Red_LED.LED_Port = ((GPIO_TypeDef*)0x40020000UL);
    Red_LED.LED_Mode = LED_Active_Low;
    Red_LED.LED_Pin.GPIO_PinNumber = 0;
    Red_LED.LED_Pin.GPIO_MODE = 1;
    Red_LED.LED_Pin.GPIO_PinOPType = 0;
    Red_LED.LED_Pin.GPIO_PinPuPdControl = 0;
    Red_LED.LED_Pin.GPIO_PinSpeed = 2;
    LED_Init(&Red_LED);


    Admin_LCD.Mode = LCD_4BIT;
    Admin_LCD.GPIO_PORT = ((GPIO_TypeDef*)0x40020C00UL);
    Admin_LCD.Entry_Mode = (0x06);
    Admin_LCD.Display_Mode = (0x0C);
    Admin_LCD.EN_PIN = 10;
    Admin_LCD.RS_PIN = 11;
    Admin_LCD.D4_PIN = 12;
    Admin_LCD.D5_PIN = 13;
    Admin_LCD.D6_PIN = 14;
    Admin_LCD.D7_PIN = 15;
    LCD_Init(&Admin_LCD);

    User_LCD.Mode = LCD_4BIT;
    User_LCD.GPIO_PORT = ((GPIO_TypeDef*)0x40020000UL);
    User_LCD.Entry_Mode = (0x06);
    User_LCD.Display_Mode = (0x0C);
    User_LCD.RS_PIN = 5;
    User_LCD.EN_PIN = 6;
    User_LCD.D4_PIN = 12;
    User_LCD.D5_PIN = 13;
    User_LCD.D6_PIN = 14;
    User_LCD.D7_PIN = 15;
    LCD_Init(&User_LCD);


    Enter_Gate_UART.USART_Mode = ((uint32_t)(1UL << 2 | 1UL << 3));
    Enter_Gate_UART.BaudRate = 115200;
    Enter_Gate_UART.HwFlowCtl = ((uint32_t)(0));
    Enter_Gate_UART.IRQ_Enable = ((uint32_t)(1UL << 5));
    Enter_Gate_UART.P_IRQ_CallBack = Enter_UART_CallBack;
    Enter_Gate_UART.Parity = ((uint32_t)(0));
    Enter_Gate_UART.Payload_Length = ((uint32_t)(0));
    Enter_Gate_UART.StopBits = ((uint32_t)(0));
    MCAL_USART_Init(((USART_TypeDef*)0x40011000UL), &Enter_Gate_UART);

    Exit_Gate_UART.USART_Mode = ((uint32_t)(1UL << 2 | 1UL << 3));
    Exit_Gate_UART.BaudRate = 115200;
    Exit_Gate_UART.HwFlowCtl = ((uint32_t)(0));
    Exit_Gate_UART.IRQ_Enable = ((uint32_t)(1UL << 5));
    Exit_Gate_UART.P_IRQ_CallBack = Exit_UART_CallBack;
    Exit_Gate_UART.Parity = ((uint32_t)(0));
    Exit_Gate_UART.Payload_Length = ((uint32_t)(0));
    Exit_Gate_UART.StopBits = ((uint32_t)(0));
    MCAL_USART_Init(((USART_TypeDef*)0x40004400UL), &Exit_Gate_UART);


    PIR.GPIO_MODE = 0;
    PIR.GPIO_PinPuPdControl = 0;
    PIR.GPIO_PinNumber = 7;
    PIR.GPIO_PinSpeed = 2;
    MCAL_GPIO_Init(((GPIO_TypeDef*)0x40020000UL), &PIR);

    PIR.GPIO_MODE = 0;
    PIR.GPIO_PinPuPdControl = 0;
    PIR.GPIO_PinNumber = 1;
    PIR.GPIO_PinSpeed = 2;
    MCAL_GPIO_Init(((GPIO_TypeDef*)0x40020000UL), &PIR);


    Timer2_init();
    Servo1_Entry_Gate_Init();
    Servo2_Exit_Gate_Init();


    keypad_init();


}
# 209 "Src/ecu.c"
void Admin_Init(void) {






    uint8 keypad_buffer;




    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user1 ID:", (0x80), 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User1 ID: ", (0xC0), 1);

    do {
        keypad_buffer = keypad_Get_Pressed_Key();
    } while('F' == keypad_buffer);
    LCD_Send_Char(&Admin_LCD, keypad_buffer);
    Users_IDs[0] = keypad_buffer;

    LCD_Send_Command(&Admin_LCD, (0x01));
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user1 PWD:", (0x80), 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User1 Password: ", (0xC0), 1);
    for(int i=0; i<4; i++){
      do {
        keypad_buffer = keypad_Get_Pressed_Key();
      } while('F' == keypad_buffer);
      User1_Password[i] = keypad_buffer;
      LCD_Send_Char_Pos(&Admin_LCD, keypad_buffer,(0x94),i);
      for(int j=0; j<30000; j++);
    }


    LCD_Send_Command(&Admin_LCD, (0x01));
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user2 ID:", (0x80), 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User2 ID: ", (0xC0), 2);
    do {
        keypad_buffer = keypad_Get_Pressed_Key();
    } while('F' == keypad_buffer);
    LCD_Send_Char(&Admin_LCD, keypad_buffer);
    Users_IDs[1] = keypad_buffer;

    LCD_Send_Command(&Admin_LCD, (0x01));
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user2 PWD:", (0x80), 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User2 Password: ", (0xC0), 1);
    for(int i=0; i<4; i++){
      do {
        keypad_buffer = keypad_Get_Pressed_Key();
      } while('F' == keypad_buffer);
      User2_Password[i] = keypad_buffer;
      LCD_Send_Char_Pos(&Admin_LCD, keypad_buffer,(0x94),i);
      for(int j=0; j<30000; j++);
    }


    LCD_Send_Command(&Admin_LCD, (0x01));
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user3 ID:", (0x80), 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User3 ID: ", (0xC0), 2);
    do {
        keypad_buffer = keypad_Get_Pressed_Key();
    } while('F' == keypad_buffer);
    LCD_Send_Char(&Admin_LCD, keypad_buffer);
    Users_IDs[2] = keypad_buffer;

    LCD_Send_Command(&Admin_LCD, (0x01));
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user3 PWD:", (0x80), 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User3 Password: ", (0xC0), 1);
    for(int i=0; i<4; i++){
      do {
        keypad_buffer = keypad_Get_Pressed_Key();
      } while('F' == keypad_buffer);
      User3_Password[i] = keypad_buffer;
      LCD_Send_Char_Pos(&Admin_LCD, keypad_buffer,(0x94),i);
      for(int j=0; j<30000; j++);
    }


    combineArrays(Users_IDs, 3, User1_Password, 4, User2_Password, 4, User3_Password, 4, combinedArray);


    EEPROM_Write_NBytes(0x0AAF, combinedArray, 15);


    LCD_Send_Command(&Admin_LCD, (0x01));
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"System is ON", (0x80), 3);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User1 ID: ", (0xC0), 6);
    LCD_Send_Char(&Admin_LCD, Users_IDs[0]);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User2 ID: ", (0x94), 2);
    LCD_Send_Char(&Admin_LCD, Users_IDs[1]);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User3 ID: ", (0xD4), 2);
    LCD_Send_Char(&Admin_LCD, Users_IDs[2]);
}
# 315 "Src/ecu.c"
void UserLCD_PrintFreeSlots(void) {

    if (Print_Slots_LCD_Flag) {
        Print_Slots_LCD_Flag = 0;
        LCD_Send_Command(&User_LCD, (0x01));
        if (0 >= Free_Slots) {
            LCD_Send_String_Pos(&User_LCD, (uint8*)"----Welcome!---", (0x80), 4);
            LCD_Send_String_Pos(&User_LCD, (uint8*)"Parking is full!", (0xC0), 1);
     LCD_Send_String_Pos(&User_LCD, (uint8*)"ID not allowed", (0x94), -3);

        } else {
            LCD_Send_String_Pos(&User_LCD, (uint8*)"----Welcome!---", (0x80), 4);
     LCD_Send_String_Pos(&User_LCD, (uint8*)"Please Scan ID!!", (0xC0), 1);
            LCD_Send_Char_Pos(&User_LCD, (Free_Slots + '0'), (0x94), -2);
            LCD_Send_String_Pos(&User_LCD, (uint8*)"Slots free!", (0x94), 0);
        }
    }

}
# 344 "Src/ecu.c"
ID_Check_Result Check_ID(uint8 _ID) {
    uint8 counter;
    uint8 found_flag = 0;

    for (counter = 0; counter < 3; counter++) {
        if (_ID == Users_IDs[counter]) {
            found_flag = 1;
            break;
        }
    }

    return (found_flag == 1) ? ID_Found : ID_NOT_Found;
}
# 369 "Src/ecu.c"
uint8 Check_Flag(uint8 _ID) {
   if (_ID == Users_IDs[0]) {
      return User1_flag;
    } else if (_ID == Users_IDs[1]) {
      return User2_flag;
    } else if (_ID == Users_IDs[2]) {
      return User3_flag;
    } else {
      return 0;
    }
}
# 389 "Src/ecu.c"
void Flag_SET_RESET(uint8 _ID) {
   if (_ID == Users_IDs[0]) {
      User1_flag = !User1_flag;
   } else if (_ID == Users_IDs[1]) {
      User2_flag = !User2_flag;
   } else if (_ID == Users_IDs[2]) {
      User3_flag = !User3_flag;
   }
}
# 410 "Src/ecu.c"
uint8 Check_Password(uint8 _ID) {
   LCD_Send_Command(&User_LCD, (0x01));
   LCD_Send_String_Pos(&User_LCD, (uint8*)"ID Scanned!!", (0x80), 1);
   LCD_Send_String_Pos(&User_LCD, (uint8*)"Enter Password:", (0xC0), 1);

   uint8 count = 0;
   uint8 keypad_buffer;
   uint8 enteredPassword[4];

   if (_ID == Users_IDs[0]) {
      for (int i = 0; i < 4; i++) {
         do {
            keypad_buffer = keypad_Get_Pressed_Key();
         } while ('F' == keypad_buffer);
         enteredPassword[i] = keypad_buffer;
         LCD_Send_Char_Pos(&User_LCD, '*', (0x94), i);
         for (int j = 0; j < 5000; j++);
         if (enteredPassword[i] == User1_Password[i]) {
            count++;
         }
      }
   } else if (_ID == Users_IDs[1]) {
      for (int i = 0; i < 4; i++) {
         do {
            keypad_buffer = keypad_Get_Pressed_Key();
         } while ('F' == keypad_buffer);
         enteredPassword[i] = keypad_buffer;
         LCD_Send_Char_Pos(&User_LCD, '*', (0x94), i);
         for (int j = 0; j < 5000; j++);
         if (enteredPassword[i] == User2_Password[i]) {
            count++;
         }
      }
   } else if (_ID == Users_IDs[2]) {
      for (int i = 0; i < 4; i++) {
         do {
            keypad_buffer = keypad_Get_Pressed_Key();
         } while ('F' == keypad_buffer);
         enteredPassword[i] = keypad_buffer;
         LCD_Send_Char_Pos(&User_LCD, '*', (0x94), i);
         for (int j = 0; j < 5000; j++);
         if (enteredPassword[i] == User3_Password[i]) {
            count++;
         }
      }
   }

   return (count == 4) ? 1 : 0;
}
# 482 "Src/ecu.c"
 void combineArrays(uint8_t* array1, int size1, uint8_t* array2, int size2, uint8_t* array3, int size3, uint8_t* array4, int size4, uint8_t* combinedArray) {
    int index = 0;


    for (int i = 0; i < size1; i++) {
        combinedArray[index++] = array1[i];
    }


    for (int i = 0; i < size2; i++) {
        combinedArray[index++] = array2[i];
    }


    for (int i = 0; i < size3; i++) {
        combinedArray[index++] = array3[i];
    }


    for (int i = 0; i < size4; i++) {
        combinedArray[index++] = array4[i];
    }
}
# 517 "Src/ecu.c"
void Enter_Gate_Open(void) {
    LCD_Send_Command(&User_LCD, (0x01));
    LCD_Send_String(&User_LCD, (uint8*)" Enter gate open!");
    Servo1_Entry_Gate(0);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    while (MCAL_GPIO_ReadPin(((GPIO_TypeDef*)0x40020000UL), 7));
    Servo1_Entry_Gate(1);
}
# 547 "Src/ecu.c"
void Exit_Gate_Open(void) {
    LCD_Send_Command(&User_LCD, (0x01));
    LCD_Send_String(&User_LCD, (uint8*)" Exit gate open!");
    Servo2_Exit_Gate(0);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    while (MCAL_GPIO_ReadPin(((GPIO_TypeDef*)0x40020000UL), 1));
    Servo2_Exit_Gate(1);
}
# 577 "Src/ecu.c"
void Wrong_RFID(void) {
    LCD_Send_Command(&User_LCD, (0x01));
    LCD_Send_String(&User_LCD, (uint8*)" UNKNOWN ID!");
    Servo1_Entry_Gate(1);
    Servo2_Exit_Gate(1);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
}
# 609 "Src/ecu.c"
void Trigger_Alarm(USART_TypeDef* _USART) {
    uint8_t ID;




    MCAL_USART_ReceiveData(_USART, (uint16*)&ID, disable);


    MCAL_USART_SendData(_USART, (uint16*)&ID, disable);


    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
}
# 644 "Src/ecu.c"
void Enter_UART_CallBack(void) {
    Enter_Flag = 1;
}
# 657 "Src/ecu.c"
void Exit_UART_CallBack(void) {
    Exit_Flag = 1;
}
