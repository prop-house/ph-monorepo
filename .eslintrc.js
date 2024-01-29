// eslint-disable-next-line @typescript-eslint/no-var-requires
const path = require('path');

module.exports = {
  root: true,
  env: { node: true },
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/recommended-requiring-type-checking',
    'prettier'
  ],
  rules: {
    '@typescript-eslint/no-namespace': [
      'off',
      path.join(__dirname, 'packages/sdk')
    ],
    '@typescript-eslint/no-unsafe-assignment': [
      'off',
      path.join(__dirname, 'packages/frontend')
    ],
    '@typescript-eslint/no-unsafe-call': [
      'off',
      path.join(__dirname, 'packages/frontend')
    ]
  },
  plugins: ['@typescript-eslint'],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    tsconfigRootDir: __dirname,
    project: './tsconfig.json'
  }
};
