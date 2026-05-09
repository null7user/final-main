FROM golang:1.25.5

WORKDIR /app

# Копируем файлы зависимостей (если есть go.mod)
COPY go.mod ./
# Если файла go.sum нет, закомментируй следующую строку
COPY go.sum ./ 
RUN go mod download

# Копируем весь исходный код
COPY . .

# Собираем приложение
RUN go build -o /parcel-tracker ./main.go

# Запуск приложения
CMD [ "/parcel-tracker" ]
