# NanoMock

[![Pub](https://img.shields.io/pub/v/nano_mock.svg)](https://pub.dev/packages/nano_mock)
![Build](https://github.com/oborgen/nano_mock/actions/workflows/build.yaml/badge.svg)
[![codecov](https://codecov.io/gh/oborgen/nano_mock/branch/master/graph/badge.svg?token=TPAR3AH2JD)](https://codecov.io/gh/oborgen/nano_mock)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

A lightweight mock library without any dependencies or requirements to use code
generation.

## Usage

Let's say you want to unit test this function:

```
T? exampleImplementation<T>(int x, int y, T Function(int x, int y) callback) {
  if (x + y > 10) {
    return callback(x, y);
  } else {
    return null;
  }
}
```

This function calls a given callback and return its result if the sum of x and
y is greater than 10.
Otherwise, if the sum of x and y is less than or equal to 10, then this
function returns null.

### Step 1

Create a `NanoMock` instance:

```
final mock = NanoMock<bool>();
```

The generic type corresponds to the return type of the callback you want to
mock.

### Step 2

Instruct `mock` to return a given value when called with a given list
of arguments:

```
final verify = mock.when(true, [5, 7]);
```

You need to keep a reference to the return value if you want to verify that
the function has been called with the given arguments.

### Step 3

Call the function provided with the mock:

```_exampleImplementation(5, 7, (x, y) => mock([x, y]))```

Notice that the mock cannot be passed directly to the function.
Instead, you have to wrap the call with a function that places the arguments in
a list that is then passed to the mock.
This is so code generation becomes unnecessary.

### Step 4

Verify that the mock has been called by the function:

```
verify.called(1);
```

Alternatively, if you expect the callback to not have been called, you can call
`neverCalled` instead:

```
verify.neverCalled();
```
