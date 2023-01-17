/// Константы состояний общие
const stateIsEnabled = 0xff1000;
const stateIsDisabled = 0xff1001;
const stateIsLoading = 0xff0000;
const stateIsLoaded = 0xff0001;

/// DPS | Double Point status
enum DsDps {
  undefined(0x000000),
  off(0x000001),
  on(0x000002),
  transient(0x000003);
  const DsDps(this.value);
  final int value;
}

/// DPC | Double Point command
enum DsDpc {
  undefined(0x000000),
  off(0x000001),
  on(0x000002),
  transient(0x000003);
  const DsDpc(this.value);
  final int value;
}
