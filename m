Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C065CCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 08:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E56112624;
	Fri, 16 Oct 2026 08:06:16 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726A8112624;
 Fri, 16 Oct 2026 08:06:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Introduce_xe=5Fwedge_=28rev9?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 08:06:15 -0000
Message-ID: <179213797546.34131.6003768415020903723@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016072623.457392-1-raag.jadav@intel.com>
In-Reply-To: <20261016072623.457392-1-raag.jadav@intel.com>
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

Series: Introduce xe_wedge (rev9)
URL   : https://patchwork.freedesktop.org/series/173011/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[08:05:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:05:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:05:33] Starting KUnit Kernel (1/1)...
[08:05:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:05:33] ================= gpu_buddy (14 subtests) ==================
[08:05:33] [PASSED] gpu_test_buddy_alloc_limit
[08:05:33] [PASSED] gpu_test_buddy_alloc_optimistic
[08:05:33] [PASSED] gpu_test_buddy_alloc_pessimistic
[08:05:33] [PASSED] gpu_test_buddy_alloc_pathological
[08:05:33] [PASSED] gpu_test_buddy_alloc_contiguous
[08:05:33] [PASSED] gpu_test_buddy_alloc_clear
[08:05:33] [PASSED] gpu_test_buddy_alloc_range
[08:05:34] [PASSED] gpu_test_buddy_alloc_range_bias
[08:05:35] [PASSED] gpu_test_buddy_fragmentation_performance
[08:05:35] [PASSED] gpu_test_buddy_dirty_tracker_performance
[08:05:35] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[08:05:35] [PASSED] gpu_test_buddy_offset_aligned_allocation
[08:05:35] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[08:05:35] [PASSED] gpu_test_buddy_addr_to_block
[08:05:35] ==================== [PASSED] gpu_buddy ====================
[08:05:35] ============================================================
[08:05:35] Testing complete. Ran 14 tests: passed: 14
[08:05:35] Elapsed time: 27.079s total, 4.428s configuring, 20.484s building, 2.083s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/bitmap.h:9,
                 from ../drivers/gpu/drm/xe/xe_hw_error.c:6:
../drivers/gpu/drm/xe/xe_hw_error.c: In function ‘csc_hw_error_work’:
../include/linux/cleanup.h:302:9: error: unknown type name ‘class_xe_pm_runtime_t’
  302 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
      |         ^~~~~~
../include/linux/cleanup.h:423:9: note: in expansion of macro ‘CLASS’
  423 |         CLASS(_name, __UNIQUE_ID(guard))
      |         ^~~~~
../drivers/gpu/drm/xe/xe_hw_error.c:173:9: note: in expansion of macro ‘guard’
  173 |         guard(xe_pm_runtime)(xe);
      |         ^~~~~
../drivers/gpu/drm/xe/xe_hw_error.c:173:9: error: cleanup argument not a function
../include/linux/cleanup.h:303:17: error: implicit declaration of function ‘class_xe_pm_runtime_constructor’; did you mean ‘class_xe_validation_constructor’? [-Werror=implicit-function-declaration]
  303 |                 class_##_name##_constructor
      |                 ^~~~~~
../include/linux/cleanup.h:423:9: note: in expansion of macro ‘CLASS’
  423 |         CLASS(_name, __UNIQUE_ID(guard))
      |         ^~~~~
../drivers/gpu/drm/xe/xe_hw_error.c:173:9: note: in expansion of macro ‘guard’
  173 |         guard(xe_pm_runtime)(xe);
      |         ^~~~~
../include/linux/compiler.h:165:17: warning: unused variable ‘__UNIQUE_ID_guard_442’ [-Wunused-variable]
  165 |         __PASTE(__UNIQUE_ID_,                                   \
      |                 ^~~~~~~~~~~~
../include/linux/cleanup.h:302:27: note: in definition of macro ‘CLASS’
  302 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
      |                           ^~~
./../include/linux/compiler_types.h:16:23: note: in expansion of macro ‘___PASTE’
   16 | #define __PASTE(a, b) ___PASTE(a, b)
      |                       ^~~~~~~~
../include/linux/compiler.h:165:9: note: in expansion of macro ‘__PASTE’
  165 |         __PASTE(__UNIQUE_ID_,                                   \
      |         ^~~~~~~
../include/linux/cleanup.h:423:22: note: in expansion of macro ‘__UNIQUE_ID’
  423 |         CLASS(_name, __UNIQUE_ID(guard))
      |                      ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_error.c:173:9: note: in expansion of macro ‘guard’
  173 |         guard(xe_pm_runtime)(xe);
      |         ^~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_hw_error.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[08:05:36] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:05:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


