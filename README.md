# LanguageTool Server
Host your own [LanguageTool server](https://languagetool.org) on [Railway](https://railway.app) or [Render](https://render.com)!

## Railway Deployment
1. Fork this repository.
2. Create a new project on Railway.
3. Connect your GitHub repository.
4. Deploy! Railway will automatically detect the Dockerfile and deploy your LanguageTool server.

## Render Deployment
1. Fork this repository.
2. Create a new Web Service on Render.
3. Connect the repository on Render.

## Environment Variables
- `PORT`: Automatically set by Railway/Render. The server will listen on this port.
- `JAVA_OPTS`: (Optional) Java options for the LanguageTool server. Default: `-Xms256m -Xmx512m`

## Ngram support
If you use a higher tier instance type, ngram can be enabled by adding the necessary configuration to `Dockerfile` and `languagetool.sh`. Ngram are disabled by default due to memory constraints on free tiers.

Inspired by [silvio/docker-languagetool](https://github.com/silvio/docker-languagetool)