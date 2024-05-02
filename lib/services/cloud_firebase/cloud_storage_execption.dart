class CloudStorageException implements Exception {
  const CloudStorageException();
}

class CouldNotCreateEmployeeException implements CloudStorageException {}

class CouldNotGetAllEmployeeException implements CloudStorageException {}

class CouldNotUpdateEmployeeException implements CloudStorageException {}

class CouldNotDeleteEmployeeException implements CloudStorageException {}
