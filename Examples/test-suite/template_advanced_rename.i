%module template_advanced_rename

%inline %{
namespace Quirky {
template<typename T> T funky(T a, T b) { return a+b; }
template<typename T> T funky(T a) { return a; }
template<typename T> void funky() {}
}
%}

%rename("%s_void") Quirky::funky<int>();
%template(funky_int) Quirky::funky<int>;

%rename("%(firstuppercase)s_NoParms") Quirky::funky<double>();
%template(funky_double) Quirky::funky<double>;

%rename("%(uppercase)s") Quirky::funky<bool>;
%template() Quirky::funky<bool>;

%inline %{
namespace Golden {
  template<typename T> T goose(T t);
}
%}

%{
template<typename T> T Golden::goose(T t) { return t; }
%}

%rename("%(firstuppercase)s") Golden::goose<int>(int t);
%template() Golden::goose<int>;

%rename("%(regex:/^(.*)::(.*)/\\1_\\2/)s", fullname=1) Golden::goose<bool>;
%template() Golden::goose<bool>;

/* Advanced renaming of instantiated class templates, not just function templates */
%inline %{
namespace Quirky {
template<typename T> struct Wonky {
  T twiddle(T t) { return t; }
};
}
%}

%rename("%s_Renamed") Quirky::Wonky<int>;
%template(WonkyInt) Quirky::Wonky<int>;

%rename("%(uppercase)s") Quirky::Wonky<double>;
%template(WonkyDouble) Quirky::Wonky<double>;

%rename("%(regex:/^(.*)::(.*)/\\1_\\2/)s", fullname=1) Quirky::Wonky<bool>;
%template(WonkyBool) Quirky::Wonky<bool>;
