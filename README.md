# Canadian Weather AI

Environment Canada's Jet Stream map to a spoken weather forecast using multi-modal LLMs and TTS.

I thought it would be a very cool project to build something that allows for us to experience the intersection of nostalgia from the 2000s with the advances we have made recently. I added a “Canadian-emphasis" to it, to see how an LLM perceives and mimics Canadian linguistics and semantics. This was done through iterative Prompt Engineering, and it was quite the experience!

## Architecture
- Cloud Run Jobs
- Cloud Scheduler
- GCS for Storage
- OpenAI for LLMs and TTS

## Collaboration
- Message me and/or submit a Pull Request

## Notes
- Use GitHub Actions for deploying Cloud Run Jobs using this link: https://github.com/google-github-actions/deploy-cloudrun?tab=readme-ov-file#custom-metadata-yaml
- You can use a custom metadata .yaml file to deploy a Cloud Run Job