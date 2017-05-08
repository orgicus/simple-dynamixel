package SimpleDynamixel;

import processing.core.*;
import processing.serial.*;


public class SerialWrapper
    {
        protected Serial        _p5Serial;
        protected SerialBase    _nativeSerial;

        public SerialWrapper(PApplet parent,String devStr,int baudrate)
        {
            _nativeSerial = null;
            _p5Serial = new Serial(parent,devStr, baudrate);
        }

        public SerialWrapper(String devStr,int baudrate)
        {
            _p5Serial = null;
            _nativeSerial = new SerialBase();
            _nativeSerial.open(devStr, baudrate);
        }

        public void clear()
        {
            if(_nativeSerial != null)
                _nativeSerial.clear();
            else
                _p5Serial.clear();
        }

        public void write(int data)
        {
            if(_nativeSerial != null)
                _nativeSerial.write(data);
            else
                _p5Serial.write(data);
        }

        public int read()
        {
            if(_nativeSerial != null)
                return _nativeSerial.read();
            else
                return _p5Serial.read();
        }

        public int available()
        {
            if(_nativeSerial != null)
                return _nativeSerial.available();
            else
                return _p5Serial.available();
        }

        public void setReadBlock(boolean enable)
        {
            if(_nativeSerial != null)
                _nativeSerial.setReadBlock(enable);
                /*
            else
                _p5Serial.setReadBlock(enable);
                */
        }

        public void addReadBlockCount(int count)
        {
            if(_nativeSerial != null)
                _nativeSerial.addReadBlockCount(count);
                /*
            else
                _p5Serial.setReadBlock(enable);
                */
        }
    }