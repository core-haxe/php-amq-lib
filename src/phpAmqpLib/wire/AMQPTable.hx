package phpAmqpLib.wire;

@:native("PhpAmqpLib\\Wire\\AMQPTable")
extern class AMQPTable {
    public function new(array:Dynamic = null);
    public function set(key:String, value:Dynamic, type:Dynamic = null):Void;
}