<?php
declare(strict_types=1);

function autoload($className) {
    $baseDir = __DIR__;
    $iterator = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($baseDir));
    foreach ($iterator as $file) {
        if ($file->isFile() && $file->getExtension() === 'php') {
            $fileName = $file->getBasename('.php');
            if ($fileName === $className) {
                require $file->getPathname();
                return;
            }
        }
    }
}

spl_autoload_register('autoload');
