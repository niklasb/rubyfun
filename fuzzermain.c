/**********************************************************************

  main.c -

  $Author$
  created at: Fri Aug 19 13:19:58 JST 1994

  Copyright (C) 1993-2007 Yukihiro Matsumoto

**********************************************************************/

#undef RUBY_EXPORT
#include "ruby.h"
#include "vm_debug.h"
#ifdef HAVE_LOCALE_H
#include <locale.h>
#endif
#if RUBY_DEVEL && !defined RUBY_DEBUG_ENV
# define RUBY_DEBUG_ENV 1
#endif
#if defined RUBY_DEBUG_ENV && !RUBY_DEBUG_ENV
# undef RUBY_DEBUG_ENV
#endif
#ifdef RUBY_DEBUG_ENV
#include <stdlib.h>
#endif

#include <stdint.h>
#include <stddef.h>



#include "internal.h"
#include "ruby/util.h"
#include "eval_intern.h"


#include "ruby.h"
#include "vm_debug.h"

#ifdef HAVE_DLADDR
# include <dlfcn.h>
#endif

#define RUBY_VM_INSNS_INFO 1
/* #define RUBY_MARK_FREE_DEBUG 1 */

#include "iseq.h"
#include "gc.h"

//const rb_iseq_t *rb_iseq_ibf_load(VALUE str);

static VALUE test(VALUE str) {
    rb_iseq_ibf_load(str);
    return Qnil;
}

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    int exc;
    VALUE str = rb_str_new((const char*)data, size);
    rb_protect(test, str, &exc);
    rb_gc();
    return 0;
}

int LLVMFuzzerInitialize(int *argc, char ***argv) {
    ruby_sysinit(argc, argv);
    {
      RUBY_INIT_STACK;
      ruby_init();
    }
    return 0;
}
