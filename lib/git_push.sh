# Файл для автоматического обнавления репозотории git

#!/bin/bash

# Добавить все изменения в индекс
git add .

# Создать коммит с сообщением "Auto commit"
git commit -m "Auto commit"

# Отправить изменения на удаленный репозиторий
git push origin main

#   Запуск      ./lib/git_push.sh