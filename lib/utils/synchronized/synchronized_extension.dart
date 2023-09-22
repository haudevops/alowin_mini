/*
 * @copyright
 * Copyright (c) 2023 OVTeam
 *
 * All Rights Reserved
 *
 * Licensed under the MIT License;
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://choosealicense.com/licenses/mit/
 *
 */

import 'dart:async';
import 'synchronized_extension_impl.dart' as impl;

extension SynchronizedLock on Object {
  Future<T> synchronized<T>(FutureOr<T> Function() computation,
      {Duration? timeout}) {
    return impl.objectSynchronized<T>(this, computation, timeout: timeout);
  }
}
