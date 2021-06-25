FROM docker.io/haskell:latest
RUN mkdir splitTill-hs
WORKDIR splitTill-hs
COPY walkTill-hs walkTill-hs
RUN cp walkTill-hs/test.hs .
COPY main.hs main.hs
COPY splitTill.hs splitTill.hs
RUN ghc splitTill.hs test.hs main.hs
CMD ["./main"]
