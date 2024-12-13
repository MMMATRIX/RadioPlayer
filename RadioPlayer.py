import os
import subprocess
import sys
import socket
from http.server import BaseHTTPRequestHandler, HTTPServer


s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
ipAddress = s.getsockname()[0]
s.close()

print(ipAddress)

#proc1 = subprocess.Popen("ffplay -i https://audio.radio-banovina.hr:9998/stream")
#input();
#subprocess.Popen.kill(proc1)
class Player(object):
    @classmethod
    def start(self):
        print ('Start subrocess')
        self.proc1 = subprocess.Popen("ffplay -i https://audio.radio-banovina.hr:9998/stream")

    @classmethod
    def stop(self):
        subprocess.Popen.kill(self.proc1) 

        
class Serv(BaseHTTPRequestHandler):
    
    def do_GET(self):
        if self.path == '/':
           self.path = '/test.html'
           
        if(self.path == '/startRadio'):
            Player.start()
        if(self.path == '/stopRadio'):
            Player.stop()
            
        try:
           file_to_open = open(self.path[1:]).read()
           self.send_response(200)
        except:
           file_to_open = "File not found"
           self.send_response(404)
        self.end_headers()
        self.wfile.write(bytes(file_to_open, 'utf-8'))

    
httpd = HTTPServer((ipAddress,8080),Serv)
httpd.serve_forever()
