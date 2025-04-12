package phpAmqpLib.channel;

import phpAmqpLib.message.AMQPMessage;

@:native("PhpAmqpLib\\Channel\\AMQPChannel")
extern class AMQPChannel {
    public function queue_declare(queue:String = '', passive:Bool = false, durable:Bool = false, exclusive:Bool = false, auto_delete:Bool = true, nowait:Bool = false):Dynamic;
    public function basic_publish(msg:AMQPMessage, exhange:String = '' , routing_key:String = '', mandatory:Bool = false, immediate:Bool = false, ticket:Dynamic = null):Void;
    public function close():Void;
}