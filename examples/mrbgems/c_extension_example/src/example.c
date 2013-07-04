#include <mruby.h>
#include <stdio.h>

static mrb_value
mrb_c_method(mrb_state *mrb, mrb_value self)
{
  puts("A C Extension");
  return self;
}

mrb_value my_class_print_name(mrb_state* mrb, mrb_value self)
{
  mrb_int n;

  mrb_get_args(mrb, "i", &n);

  printf("my_class_print_name method n=%d\n", n);
  return self;
}

void
mrb_c_extension_example_gem_init(mrb_state* mrb) {
  //struct RClass *class_cextension = mrb_define_module(mrb, "CExtension");
  //mrb_define_class_method(mrb, class_cextension, "c_method", mrb_c_method, MRB_ARGS_NONE());
  struct RClass *my_class = mrb_define_class(mrb, "MyClass", mrb->object_class);
  mrb_define_method(mrb, my_class, "print_name", my_class_print_name, MRB_ARGS_REQ(1));
}

void
mrb_c_extension_example_gem_final(mrb_state* mrb) {
  // finalizer
}
