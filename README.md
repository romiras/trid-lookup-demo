# trid-lookup-demo

trid-lookup-demo is an application that allows to detect type of uploaded file.

Powered by [TrID](https://mark0.net/soft-trid-e.html) and [Sinatra](https://sinatrarb.com).

## Usage

```
curl --form file='@/Users/myname/Downloads/file.gif' https://trid-lookup-demo.herokuapp.com/detect
```

### Sample output

```
59.1% (.GIF) GIF animated bitmap (14500/1/2)
24.4% (.GIF) GIF89a bitmap (6000/1)
12.2% (.GIF) GIF bitmap (generic) (3000/1)
4.0% (.BS/BIN) PrintFox/Pagefox bitmap (var. G) (1000/1)
```
