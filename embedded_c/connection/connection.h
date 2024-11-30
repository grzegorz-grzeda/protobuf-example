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