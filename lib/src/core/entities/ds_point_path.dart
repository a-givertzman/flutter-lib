/// Contains full path and name 
class DsPointPath {
  final String _path;
  final String _name;
  DsPointPath({
    required String path,
    required String name,
  }) :
    _path = path,
    _name = name;
  String get path => _path;
  String get name => _name;
}