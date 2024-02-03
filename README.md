## Try to Decode the Message Encoded with DTMF

1. Clone the repository
```bash
git clone https://github.com/man1207/dtmf-example.git
```
2. Create a spectrogram using sox
```bash
cd dtmf-example
sox audio.wav -n spectrogram -o example.png
```
3. Decode the encoded message using the DTMF frequency table

|                |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   *  |   0  |   #  |
|----------------|------|------|------|------|------|------|------|------|------|------|------|------|
| Low Frequency  |  697 |  697 |  697 |  770 |  770 |  770 |  852 |  852 |  852 |  941 |  941 |  941 |
| High Frequency | 1209 | 1336 | 1477 | 1209 | 1336 | 1477 | 1209 | 1336 | 1477 | 1209 | 1336 | 1477 |
  
5. Verify the result using the multimon-ng tool
```bash
multimon-ng -t wav -a DTMF audio.wav
```
5. Consider what the obtained digits might mean

### Run multimon-ng in Docker
```bash
docker build -t multimon-ng .
docker run --rm -it --name multimon-ng \
-v $(pwd)/audio.wav:/audio.wav multimon-ng -t wav -a DTMF audio.wav
```
