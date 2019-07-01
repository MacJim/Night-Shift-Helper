# Night Shift Utility

This is a simple shell utility for macOS that can manipulate device Night Shift settings.

This tool has been tested and works in macOS 10.14.4

## Usage

### Enable Night Shift and choose a suitable temperature based on the system time

```bash
Night\ Shift\ Helper
```

### Enable / disable Night Shift

```bash
Night\ Shift\ Helper enable
```

```bash
Night\ Shift\ Helper disable
```

### Set color temperature

```bash
Night\ Shift\ Helper set newTemperature
```

Where `newTemperature` is a value between 0.0 and 1.0 (warmest).

### Display program version

```bash
Night\ Shift\ Helper version
```
