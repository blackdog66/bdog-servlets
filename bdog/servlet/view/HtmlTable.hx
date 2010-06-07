package bdog.servlet;

import bdog.servlet.Servlet;

class HtmlTable<S,T> extends View<S,T> {

  public function new() {
    super();
  }

  public function
  generate(err:S,prms:T) {
    var sb = new StringBuf();
    if (Std.is(prms,Array)) {
      var recs = cast(prms,Array<Dynamic>),
        hdrs = Reflect.fields(prms[0]);
      if (recs.length > 0) {
        sb.add("<table>");
        sb.add("<tr>");
        for (h in hdrs) {
          sb.add('<th>' + h + '</th>');
        }
        sb.add("</tr>");
        for (r in recs) {
          sb.add("<tr>");
          for (f in hdrs) {
            var v = Reflect.field(r,f);
            if (!Reflect.isFunction(v)) {
              sb.add('<td>' + v + '</td>');
            }
          }
          sb.add("</tr>");
        }
      }
    }
    return sb.toString();
  }
}