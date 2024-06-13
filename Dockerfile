FROM dart:stable

WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN dart compile exe ./bin/main.dart -o bin/main

CMD ["./bin/main"]