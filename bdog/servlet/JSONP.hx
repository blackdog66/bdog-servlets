package bdog.servlet;

import js.Node;
import bdog.servlet.Servlet;


/**
 * The JSONP servlet looks for a callback parameter. If callback exists
 * then a jsonp response is returned. However, the servlet does not
 * enforce callback so that it can still be used with non jsonp requests.
 *
 * If you want to enforce the callback parameter add to the required params.
 */

class JSONP<S,T> extends Servlet<S,T> {
  public function
  new(e:Dynamic,a:Action<S,T>) {
    super(e,a);
    contentType = "text/json";
  }

  public override function
  post(req:IRequest,status:S,results:T) {
    var cb = Reflect.field(req.params,"callback") ;
    return (cb != null) ? cb+"("+Node.stringify(results)+");" : Std.string(results);
  }
}