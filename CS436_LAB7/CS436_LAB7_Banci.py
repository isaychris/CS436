import socket

serverPort = 1024
serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(1)
print("listening on port", serverPort)

while True:
	connectionSocket, addr = serverSocket.accept()
	print("connection established");

	try:
		message = connectionSocket.recv(1024)
		filename = message.split()[1]
		
		f = open(filename[1:])
		output = f.read()
		connectionSocket.send("HTTP/1.1 200 OK\r\n\r\n")
		
        for i in range(0, len(output)):
			connectionSocket.send(output[i])
			
		connectionSocket.close()
		
	except IOError:
		connectionSocket.send("HTTP/1.1 404 Not Found\r\n\r\n")
		connectionSocket.close()

serverSocket.close()