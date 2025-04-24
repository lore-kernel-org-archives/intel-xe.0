Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37558C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 17:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED63810E025;
	Thu, 24 Apr 2025 17:46:27 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456EF10E025;
 Thu, 24 Apr 2025 17:46:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Replace_xe=5Fhmm_with_gpusvm_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 17:46:27 -0000
Message-ID: <174551678728.7603.10390363970368673696@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424121827.862729-9-matthew.auld@intel.com>
In-Reply-To: <20250424121827.862729-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev3)
URL   : https://patchwork.freedesktop.org/series/146553/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:45:53] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:45:57] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_res_cursor.h:38,
                 from ../drivers/gpu/drm/xe/xe_bo.c:32:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
In file included from ../drivers/gpu/drm/xe/xe_gt_pagefault.c:22:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
In file included from ../drivers/gpu/drm/xe/xe_res_cursor.h:38,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:32:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
In file included from ../drivers/gpu/drm/xe/xe_res_cursor.h:38,
                 from ../drivers/gpu/drm/xe/xe_pt.c:20:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
../drivers/gpu/drm/drm_gpusvm.c: In function ‘drm_gpusvm_get_devmem_page’:
../drivers/gpu/drm/drm_gpusvm.c:1709:9: error: implicit declaration of function ‘zone_device_page_init’ [-Werror=implicit-function-declaration]
 1709 |         zone_device_page_init(page);
      |         ^~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/drm_gpusvm.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_tile.c:16:
../drivers/gpu/drm/xe/xe_svm.h: In function ‘xe_svm_init’:
../drivers/gpu/drm/xe/xe_svm.h:128:16: error: implicit declaration of function ‘drm_gpusvm_init’; did you mean ‘drm_mm_init’? [-Werror=implicit-function-declaration]
  128 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
      |                ^~~~~~~~~~~~~~~
      |                drm_mm_init
../drivers/gpu/drm/xe/xe_svm.h:128:35: error: invalid use of undefined type ‘struct xe_vm’
  128 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
      |                                   ^~
../drivers/gpu/drm/xe/xe_svm.h:128:71: error: invalid use of undefined type ‘struct xe_vm’
  128 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
      |                                                                       ^~
In file included from ../drivers/gpu/drm/xe/xe_sriov.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:13,
                 from ../drivers/gpu/drm/xe/xe_tile.c:10:
../drivers/gpu/drm/xe/xe_svm.h: In function ‘xe_svm_fini’:
../drivers/gpu/drm/xe/xe_svm.h:135:21: error: invalid use of undefined type ‘struct xe_vm’
  135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
      |                     ^~
../drivers/gpu/drm/xe/xe_assert.h:110:41: note: in definition of macro ‘xe_assert_msg’
  110 |         const struct xe_device *__xe = (xe);                                                    \
      |                                         ^~
../drivers/gpu/drm/xe/xe_svm.h:135:9: note: in expansion of macro ‘xe_assert’
  135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
      |         ^~~~~~~~~
In file included from ../include/linux/bits.h:22,
                 from ../include/linux/gfp_types.h:5,
                 from ../include/linux/gfp.h:5,
                 from ../include/drm/drm_managed.h:6,
                 from ../drivers/gpu/drm/xe/xe_tile.c:8:
../drivers/gpu/drm/xe/xe_svm.h:135:27: error: implicit declaration of function ‘xe_vm_is_closed’ [-Werror=implicit-function-declaration]
  135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
      |                           ^~~~~~~~~~~~~~~
../include/linux/build_bug.h:30:63: note: in definition of macro ‘BUILD_BUG_ON_INVALID’
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
../drivers/gpu/drm/xe/xe_assert.h:111:9: note: in expansion of macro ‘__xe_assert_msg’
  111 |         __xe_assert_msg(__xe, condition,                                                        \
      |         ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:108:34: note: in expansion of macro ‘xe_assert_msg’
  108 | #define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_svm.h:135:9: note: in expansion of macro ‘xe_assert’
  135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
      |         ^~~~~~~~~
../drivers/gpu/drm/xe/xe_svm.h:137:9: error: implicit declaration of function ‘drm_gpusvm_fini’; did you mean ‘drm_buddy_fini’? [-Werror=implicit-function-declaration]
  137 |         drm_gpusvm_fini(&vm->svm.gpusvm);
      |         ^~~~~~~~~~~~~~~
      |         drm_buddy_fini
../drivers/gpu/drm/xe/xe_svm.h:137:28: error: invalid use of undefined type ‘struct xe_vm’
  137 |         drm_gpusvm_fini(&vm->svm.gpusvm);
      |                            ^~
../drivers/gpu/drm/xe/xe_svm.h: At top level:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/xe/xe_tile.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_res_cursor.h:38,
                 from ../drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:23:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
In file included from ../drivers/gpu/drm/xe/xe_res_cursor.h:38,
                 from ../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:16:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
In file included from ../drivers/gpu/drm/xe/xe_res_cursor.h:38,
                 from ../drivers/gpu/drm/xe/xe_vm.c:38:
../drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
  182 | #define xe_svm_assert_in_notifier(vm__) \
      | 
../drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
  170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
      | 
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[2]: *** [/kernel/Makefile:2011: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


