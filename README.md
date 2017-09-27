# halk

Halk is a simple haskel web app,
designed to be a dummy application for
developing Heat framework (bundled if src/Heat)

This is very beginning of development, no issues / PR welcome
except they are about

- Issues about code style.
  Note that code style is not stabilized in Haskell in general.
  I also don't sure about code style that i should use and i really want to
  understand it from my mistakes.
  However if i miss something oblivious, you are welcome.

- Issues and PRs that was explicitly reqeusted

- Issues and PRs about documentation and grammar

- PRs (not issues!) which improves readability by adding comments in code.

# Heat framework

Primary targets:

- Wrap FFI I need for halk.

Other targets:

- Heat.JSVal seems to be simplier than ghcjs-base, but less performant.
  after FFI wrap be finished, it should be refactored to use ghcjs-base
  or its alternative

- Make react-style components

- Build native version and test it ghc instead of ghcjs
