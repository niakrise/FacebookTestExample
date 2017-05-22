# FacebookTestExample
Test Task description: https://gist.github.com/Monnoroch/9996ce1813e29e3400a575c1299a7c69.

Для запуска build и test скриптов, в качестве параметра нужно указать target device в формате "platform=iOS Simulator,OS=10.3,name=iPhone 6".

```
./build.sh "platform=iOS Simulator,OS=10.3,name=iPhone 6"
./test.sh "platform=iOS Simulator,OS=10.3,name=iPhone 6"
```

Предполагается, что менеджер зависимостей cocoapods установлен в системе.
