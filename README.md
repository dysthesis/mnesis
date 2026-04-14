# Mnesis

A basic Verso book for the Mnesis project, following the
`verso-templates/basic-book` layout.

Build with:

```sh
lake build
lake exe generate-book
```

The generated site will be in `_out/html-multi/`.

You can also build the rendered book with Nix:

```sh
nix build
```

The generated static site will be available under `result/`.
