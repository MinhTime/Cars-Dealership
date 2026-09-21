#!/usr/bin/env bash
# Chạy từ thư mục gốc của repo, khi Django (8000), Node/Mongo (3030)
# và sentiment analyzer đều đang chạy. Mỗi file chứa lệnh + output thật.
#
# Sửa 3 biến dưới đây cho đúng môi trường của bạn:
DJANGO_URL="http://localhost:8000"
DB_URL="http://localhost:3030"
SENTIMENT_URL="https://sentianalyzer.XXXX.us-south.codeengine.appdomain.cloud"
USERNAME="root"
PASSWORD="your_password"
DEALER_ID=15

record () {             # record <file> <command...>
  local out="$1"; shift
  { echo "\$ $*"; eval "$@"; echo; } > "$out"
  echo "==> $out"; cat "$out"
}

record loginuser  "curl -s -X POST $DJANGO_URL/djangoapp/login -H 'Content-Type: application/json' -d '{\"userName\":\"$USERNAME\",\"password\":\"$PASSWORD\"}'"
record logoutuser "curl -s $DJANGO_URL/djangoapp/logout"

record getdealerreviews  "curl -s $DB_URL/fetchReviews/dealer/$DEALER_ID"
record getalldealers     "curl -s $DB_URL/fetchDealers"
record getdealerbyid     "curl -s $DB_URL/fetchDealer/$DEALER_ID"
record getdealersbyState "curl -s $DB_URL/fetchDealers/Kansas"

record getallcarmakes "curl -s $DJANGO_URL/djangoapp/get_cars"
record analyzereview  "curl -s $SENTIMENT_URL/analyze/Fantastic%20services"
