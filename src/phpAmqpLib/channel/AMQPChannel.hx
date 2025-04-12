package phpAmqpLib.channel;

import phpAmqpLib.message.AMQPMessage;

@:native("PhpAmqpLib\\Channel\\AMQPChannel")
extern class AMQPChannel {
    public function exchange_declare(exchange:String, type:String, passive:Bool = false, durable:Bool = false, auto_delete:Bool = true, internal:Bool = false, nowait:Bool = false, arguments:Dynamic = null, ticket:Null<Int> = null):Dynamic;
    public function queue_declare(queue:String = '', passive:Bool = false, durable:Bool = false, exclusive:Bool = false, auto_delete:Bool = true, nowait:Bool = false, arguments:Dynamic = null, ticket:Null<Int> = null):Dynamic;
    public function queue_bind(queue:String, exchange:String, routing_key:String = '', nowait:Bool = false, arguments:Dynamic = null, ticket:Null<Int> = null):Void;
    public function basic_consume(queue:String = '', consumer_tag:String = '', no_local:Bool = false, no_ack:Bool = false, exclusive:Bool = false, nowait:Bool = false, callback:Dynamic = null, ticket:Null<Int> = null, arguments:Dynamic = null):String;
    public function basic_cancel(consumer_tag:String, nowait:Bool = false, noreturn:Bool = false):Dynamic;
    public function basic_publish(msg:AMQPMessage, exhange:String = '', routing_key:String = '', mandatory:Bool = false, immediate:Bool = false, ticket:Null<Int> = null):Void;
    public function basic_qos(prefetch_size:Int, prefetch_count:Int, a_global:Bool = false):Void;
    public function close():Void;
    public function is_consuming():Bool;
    public function wait(allowed_methods:Array<Dynamic> = null, non_blocking:Bool = false, timeout:Int = 0):Dynamic;
}