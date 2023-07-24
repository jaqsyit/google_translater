#!/bin/bash

# Добавить все изменения в индекс
git add .

# Создать коммит с сообщением "Auto commit"
git commit -m "Auto commit"

# Отправить изменения на удаленный репозиторий
git push origin main
