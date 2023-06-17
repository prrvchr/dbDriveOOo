#!/bin/bash
<<COMMENT
╔════════════════════════════════════════════════════════════════════════════════════╗
║                                                                                    ║
║   Copyright (c) 2020 https://prrvchr.github.io                                     ║
║                                                                                    ║
║   Permission is hereby granted, free of charge, to any person obtaining            ║
║   a copy of this software and associated documentation files (the "Software"),     ║
║   to deal in the Software without restriction, including without limitation        ║
║   the rights to use, copy, modify, merge, publish, distribute, sublicense,         ║
║   and/or sell copies of the Software, and to permit persons to whom the Software   ║
║   is furnished to do so, subject to the following conditions:                      ║
║                                                                                    ║
║   The above copyright notice and this permission notice shall be included in       ║
║   all copies or substantial portions of the Software.                              ║
║                                                                                    ║
║   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                  ║
║   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                  ║
║   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.        ║
║   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY             ║
║   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,             ║
║   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE       ║
║   OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                    ║
║                                                                                    ║
╚════════════════════════════════════════════════════════════════════════════════════╝
COMMENT
OOoPath=/usr/lib/libreoffice
Path=$(dirname "${0}")

rm -f ${Path}/types.rdb

${Path}/merge_rdb.sh ${OOoPath} com/sun/star/rest/XRequestResponse
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/rest/XRequestParameter
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/rest/HTTPStatusCode
${Path}/merge_rdb.sh ${OOoPath} io/github/prrvchr/css/util/Duration
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/auth/XOAuth2Service
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/json/JsonValueType
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/json/XJsonValue
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/json/XJsonNumber
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/json/XJsonStructure
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/json/XJsonArray
${Path}/merge_rdb.sh ${OOoPath} com/sun/star/json/XJsonObject

read -p "Press enter to continue"

if test -f "${Path}/types.rdb"; then
    ${OOoPath}/program/regview ${Path}/types.rdb
    read -p "Press enter to continue"
fi
