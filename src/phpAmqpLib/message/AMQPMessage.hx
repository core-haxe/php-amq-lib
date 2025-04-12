package phpAmqpLib.message;

@:native("PhpAmqpLib\\Message\\AMQPMessage")
extern class AMQPMessage {
    public function new(body:Dynamic);
    public function ack():Void;
    public function nack():Void;
    public function getBody():String;
}