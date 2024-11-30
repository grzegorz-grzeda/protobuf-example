/*
MIT License

Copyright (c) 2024 G2Labs Grzegorz Grzęda

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
#ifndef CONNECTION_H
#define CONNECTION_H

typedef struct connection connection_t;

typedef void (*connection_receive_callback_t)(connection_t* connection,
                                              void* data,
                                              int size);

connection_t* connection_create(const char* host,
                                int port,
                                connection_receive_callback_t callback);

void connection_destroy(connection_t* connection);

void connection_open(connection_t* connection);

void connection_close(connection_t* connection);

void connection_send(connection_t* connection, void* data, int size);

void connection_receive(connection_t* connection, void* data, int size);

#endif  // CONNECTION_H