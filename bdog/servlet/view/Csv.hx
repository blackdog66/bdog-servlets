package bdog.servlet;

import bdog.servlet.Servlet;

class Csv<S,T> extends View<S,T> {

  public function new() {
    super();
  }
  
  static function
  getFldHeaders(o:Dynamic) {
    return Reflect.fields(o).join(",") + "\n";
  }
  
  static function
  getRec(o:Dynamic) {
    var
      flds = Reflect.fields(o),
      acc = new Array<Dynamic>();
    
    for (f in flds) {
      var v = Reflect.field(o,f);
      if (!Reflect.isFunction(v)) {
        if (Std.is(v,String)) {
          acc.push('"' + v + '"');
        } else
          acc.push(v);
      }
    }
    return acc.join(",") + "\n";
  }

  public function
  generate(err:S,prms:T) {
    var
      sb = new StringBuf();
    
    if (Std.is(prms,Array)) {
      sb.add(getFldHeaders(prms[0]));
      var recs = cast(prms,Array<Dynamic>);
      if (recs.length > 0) {
        for (r in recs)
          sb.add(getRec(r));
      }
    } else {
      sb.add(getFldHeaders(prms));
      sb.add(getRec(prms));
    }
    
    return sb.toString();
  }

}