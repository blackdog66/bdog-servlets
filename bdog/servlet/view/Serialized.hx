package bdog.servlet.view;

import js.Node;
import bdog.servlet.Servlet;

class Serialized<S,T> extends View<S,T> {
  public function new() {
    super();
  }

  public override function
  generate(status:S,results:T) {
    return
      Node.stringify({
        status:Type.enumConstructor(status),
        payload:haxe.Serializer.run(results)
      });    
  }
}