package phpAmqpLib.macros;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.macro.Compiler;
import haxe.macro.Context;

class Macros {
    static function copyLibFiles() {
        var targetPath = Path.normalize(Sys.getCwd() + "/" + Compiler.getOutput());
        var sourcePath = null;
        for (entry in Context.getClassPath()) {
            var candidatePath = Path.normalize(entry + "../lib/PhpAmqpLib");
            if (FileSystem.exists(candidatePath) && FileSystem.isDirectory(candidatePath)) {
                sourcePath = candidatePath;
                break;
            }
        }

        if (sourcePath == null) {
            Sys.println("php-amq-lib > WARNING: could not find PhpAmqpLib");
        } else {
            targetPath = Path.normalize(targetPath + "/PhpAmqpLib");
            if (FileSystem.exists(targetPath) && FileSystem.isDirectory(targetPath)) {
                Sys.println("php-amq-lib > PhpAmqpLib found in target, skipping copy");
            } else {
                Sys.println("php-amq-lib > copying PhpAmqpLib to " + targetPath);
                copyFiles(sourcePath, targetPath);
            }                
        }
    }

    static function copyFiles(source:String, target:String) {
        for (item in FileSystem.readDirectory(source)) {
            var fullSourcePath = Path.normalize(source + "/" + item);
            var fullTargetPath = Path.normalize(target + "/" + item);
            if (FileSystem.isDirectory(fullSourcePath)) {
                if (!FileSystem.exists(fullTargetPath)) {
                    FileSystem.createDirectory(fullTargetPath);
                }
                copyFiles(fullSourcePath, fullTargetPath);
            } else {
                File.copy(fullSourcePath, fullTargetPath);
            }
        }
    }
}