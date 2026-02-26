Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88A7FD4611
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 03:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD910E0C7;
	Thu, 26 Feb 2026 03:51:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD58810E07B;
 Thu, 26 Feb 2026 03:51:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Fine_grained_fault_locking=2C_?=
 =?utf-8?q?threaded_prefetch=2C_storm_cache_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 03:51:46 -0000
Message-ID: <177207790688.289884.1117682548421596881@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260225202736.2723250-1-matthew.brost@intel.com>
In-Reply-To: <20260225202736.2723250-1-matthew.brost@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Fine grained fault locking, threaded prefetch, storm cache (rev3)
URL   : https://patchwork.freedesktop.org/series/162167/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ./arch/um/include/generated/asm/bug.h:1,
                 from ../arch/x86/include/asm/alternative.h:9,
                 from ../arch/x86/include/asm/atomic.h:7,
                 from ../include/linux/atomic.h:7,
                 from ../include/linux/jump_label.h:257,
                 from ../arch/x86/include/asm/string_64.h:6,
                 from ../arch/x86/include/asm/string.h:8,
                 from ../include/linux/string.h:65,
                 from ../include/linux/string_helpers.h:8,
                 from ../drivers/gpu/drm/xe/xe_assert.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../drivers/gpu/drm/xe/xe_vm.c: In function ‘xe_vm_range_rebind’:
../drivers/gpu/drm/xe/xe_vm.c:852:35: error: ‘struct xe_svm_range’ has no member named ‘lock’
  852 |         lockdep_assert_held(&range->lock);
      |                                   ^~
../include/asm-generic/bug.h:155:32: note: in definition of macro ‘WARN_ON’
  155 |         int __ret_warn_on = !!(condition);                              \
      |                                ^~~~~~~~~
../include/linux/lockdep.h:285:14: note: in expansion of macro ‘lockdep_assert’
  285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
      |              ^~~~~~~~~~~~~~
../include/linux/lockdep.h:285:29: note: in expansion of macro ‘lockdep_is_held’
  285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
      |                             ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:852:9: note: in expansion of macro ‘lockdep_assert_held’
  852 |         lockdep_assert_held(&range->lock);
      |         ^~~~~~~~~~~~~~~~~~~
In file included from ./../include/linux/compiler_types.h:44,
                 from <command-line>:
../drivers/gpu/drm/xe/xe_vm.c:852:35: error: ‘struct xe_svm_range’ has no member named ‘lock’
  852 |         lockdep_assert_held(&range->lock);
      |                                   ^~
../include/linux/compiler-context-analysis.h:172:61: note: in definition of macro ‘__assume_ctx_lock’
  172 | # define __assume_ctx_lock(var)                 do { (void)(var); } while (0)
      |                                                             ^~~
../drivers/gpu/drm/xe/xe_vm.c:852:9: note: in expansion of macro ‘lockdep_assert_held’
  852 |         lockdep_assert_held(&range->lock);
      |         ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c: In function ‘xe_vm_range_unbind’:
../drivers/gpu/drm/xe/xe_vm.c:935:35: error: ‘struct xe_svm_range’ has no member named ‘lock’
  935 |         lockdep_assert_held(&range->lock);
      |                                   ^~
../include/asm-generic/bug.h:155:32: note: in definition of macro ‘WARN_ON’
  155 |         int __ret_warn_on = !!(condition);                              \
      |                                ^~~~~~~~~
../include/linux/lockdep.h:285:14: note: in expansion of macro ‘lockdep_assert’
  285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
      |              ^~~~~~~~~~~~~~
../include/linux/lockdep.h:285:29: note: in expansion of macro ‘lockdep_is_held’
  285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
      |                             ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:935:9: note: in expansion of macro ‘lockdep_assert_held’
  935 |         lockdep_assert_held(&range->lock);
      |         ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:935:35: error: ‘struct xe_svm_range’ has no member named ‘lock’
  935 |         lockdep_assert_held(&range->lock);
      |                                   ^~
../include/linux/compiler-context-analysis.h:172:61: note: in definition of macro ‘__assume_ctx_lock’
  172 | # define __assume_ctx_lock(var)                 do { (void)(var); } while (0)
      |                                                             ^~~
../drivers/gpu/drm/xe/xe_vm.c:935:9: note: in expansion of macro ‘lockdep_assert_held’
  935 |         lockdep_assert_held(&range->lock);
      |         ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c: In function ‘vm_bind_ioctl_ops_create’:
../drivers/gpu/drm/xe/xe_vm.c:2450:29: error: too many arguments to function ‘xe_svm_range_validate’
 2450 |                         if (xe_svm_range_validate(vm, svm_range, tile_mask,
      |                             ^~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_vm.c:37:
../drivers/gpu/drm/xe/xe_svm.h:376:6: note: declared here
  376 | bool xe_svm_range_validate(struct xe_vm *vm,
      |      ^~~~~~~~~~~~~~~~~~~~~
In file included from ../include/linux/string.h:7:
../drivers/gpu/drm/xe/xe_vm.c: In function ‘prefetch_thread_func’:
../drivers/gpu/drm/xe/xe_vm.c:3001:32: error: ‘struct xe_svm_range’ has no member named ‘lock’
 3001 |         guard(mutex)(&svm_range->lock);
      |                                ^~
../include/linux/cleanup.h:553:37: note: in definition of macro ‘WITH_LOCK_GUARD_1_ATTRS’
  553 |         class_##_name##_constructor(_T),                                \
      |                                     ^~
../include/linux/cleanup.h:300:17: note: in expansion of macro ‘class_mutex_constructor’
  300 |                 class_##_name##_constructor
      |                 ^~~~~~
../include/linux/cleanup.h:419:9: note: in expansion of macro ‘CLASS’
  419 |         CLASS(_name, __UNIQUE_ID(guard))
      |         ^~~~~
../drivers/gpu/drm/xe/xe_vm.c:3001:9: note: in expansion of macro ‘guard’
 3001 |         guard(mutex)(&svm_range->lock);
      |         ^~~~~
../drivers/gpu/drm/xe/xe_vm.c:3001:32: error: ‘struct xe_svm_range’ has no member named ‘lock’
 3001 |         guard(mutex)(&svm_range->lock);
      |                                ^~
../include/linux/cleanup.h:554:97: note: in definition of macro ‘WITH_LOCK_GUARD_1_ATTRS’
  554 |         *__UNIQUE_ID(unlock) __cleanup(__class_##_name##_cleanup_ctx) = (void *)(unsigned long)(_T)
      |                                                                                                 ^~
../include/linux/cleanup.h:300:17: note: in expansion of macro ‘class_mutex_constructor’
  300 |                 class_##_name##_constructor
      |                 ^~~~~~
../include/linux/cleanup.h:419:9: note: in expansion of macro ‘CLASS’
  419 |         CLASS(_name, __UNIQUE_ID(guard))
      |         ^~~~~
../drivers/gpu/drm/xe/xe_vm.c:3001:9: note: in expansion of macro ‘guard’
 3001 |         guard(mutex)(&svm_range->lock);
      |         ^~~~~
../drivers/gpu/drm/xe/xe_vm.c:3003:13: error: implicit declaration of function ‘xe_svm_range_is_removed’; did you mean ‘xe_svm_range_size’? [-Werror=implicit-function-declaration]
 3003 |         if (xe_svm_range_is_removed(svm_range)) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~
      |             xe_svm_range_size
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_vm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:546: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:546: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:546: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:546: drivers] Error 2
make[2]: *** [/kernel/Makefile:2101: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[03:51:12] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:51:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


