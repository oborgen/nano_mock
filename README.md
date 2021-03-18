# NanoMock

[![Pub](https://img.shields.io/pub/v/nano_mock.svg?label=nano_mock)](https://pub.dev/packages/nano_mock)
[![Build](https://github.com/oborgen/nano_mock/actions/workflows/build.yaml/badge.svg)](https://github.com/oborgen/nano_mock/actions)
[![codecov](https://codecov.io/gh/oborgen/nano_mock/branch/master/graph/badge.svg?token=TPAR3AH2JD)](https://codecov.io/gh/oborgen/nano_mock)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

A lightweight mock library without any dependencies or requirements to use code
generation.

## Usage

### Tutorial

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

This function calls a given callback and return its result if the sum of `x` and
`y` is greater than `10`.
Otherwise, if the sum of `x` and `y` is less than or equal to `10`, this
function returns `null`.

#### Step 1

Create a `NanoMock` instance:

```
final mock = NanoMock<bool>();
```

The generic type corresponds to the return type of the callback you want to
mock.

#### Step 2

Instruct `mock` to return a given value when called with a given list
of arguments:

```
final verify = mock.when(true, [5, 7]);
```

You need to keep a reference to the return value if you want to verify that
the function has been called with the given arguments.

#### Step 3

Call the function provided with the mock:

```
_exampleImplementation(5, 7, (x, y) => mock([x, y]));
```

Notice that the mock cannot be passed directly to the function.
Instead, you have to wrap the call with a function that places the arguments in
a list that is then passed to the mock.
This is so code generation becomes unnecessary.

#### Step 4

Verify that the mock has been called by the function:

```
verify.called(1);
```

Alternatively, if you expect the callback to not have been called, you can call
`neverCalled` instead:

```
verify.neverCalled();
```

### Miscellaneous

Certain functionality are not covered by the tutorial yet are described below.

#### Mocking functions returning void

Functions returning void can be mocked by calling `whenVoid`:

```
final verify = mock.whenVoid([1, 3]);
```

In this case, no return value is specified.

#### Accessing the number of calls

The number of calls to a mock can be accessed without performing any
assertions by reading `calls`:

```
_exampleImplementation(5, 7, (x, y) => mock([x, y]));

print(verify.calls); // Prints 1
```

## Motivation

The go-to library for mocking calls in Dart is currently
[Mockito](https://pub.dev/packages/mockito).
Mockito does a great job when it comes to mocking entire objects and the
developers behind NanoMock uses Mockito for various purposes.
However, when dealing with callbacks that does not require a certain interface
to use, Mockito requires users to create new classes to be used only for
testing purposes.
This means boilerplate is introduced.
Also, as Dart has introduced null safety, using code generation is a
requirement to use Mockito.
Additionally, as of writing, neither Mockito nor
[`build_runner`](https://pub.dev/packages/build_runner) supports the
latest versions of certain packages.

NanoMock aims to mitigate some of these issues by providing an alternative
mocking library, which can mock callbacks without any dependencies or code
generation requirements. This means NanoMock is compatible with any Dart
project supporting SDK version 2.12.0 or higher.
