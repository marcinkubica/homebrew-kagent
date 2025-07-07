# You are expert software engineer engaged in and deep thinking process for following
1. read README.md
2. learn about current kagent release process, repo https://github.com/kagent-dev
3. https://github.com/kagent-dev/kagent/blob/main/.github/workflows/tag.yaml
4. understand releases https://github.com/kagent-dev/kagent/releases

This repo will hold code for homebrew tap. We need

1. Know what script to produce so user can install with `brew install ...` via this repo for now
2. We won't integrate with Homebrew Core
3. How to integrate in kagent release process?
4. Do we need to know darwin and linux kagent release SHAs, 
for example release v0.3.19
```
kagent-darwin-amd64
sha256:c953cab57ba3188c415d9dbefe4aa0fcb877d3496284eda82f3786d4b486f636
15.7 MB
2 weeks ago
kagent-darwin-amd64.sha256
sha256:6cf293f98b0cd580dee1fd45bec8781a77b4fbe57c7f53433843cb0726d2ffef
90 Bytes
2 weeks ago
kagent-darwin-arm64
sha256:c03434d40973f0e044bebe973291ef697cf76569280be85161b7bbb1385e518a
15 MB
2 weeks ago
kagent-darwin-arm64.sha256
sha256:3e01dca48d11b8347e40d1e0b469314039ebfeff835b50e53dd8d7ad3a5df96d
```

5. can we be dynamic here or do we have to build list of sha's every time to store in this brew repo?
6. How do we maintain list of versions with brew? Or do we only keep hardcoded shas of latest?



