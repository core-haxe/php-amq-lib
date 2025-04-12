package phpAmqpLib.connection;

import phpAmqpLib.channel.AMQPChannel;

@:native("PhpAmqpLib\\Connection\\AMQPStreamConnection")
extern class AMQPStreamConnection {
    public function new(host:String, port:Int, username:String, password:String);
    public function channel():AMQPChannel;
    public function close():Void;
}