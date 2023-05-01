Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0798C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 08:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE47310E315;
	Mon,  1 May 2023 07:54:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 032D810E315;
 Mon,  1 May 2023 07:54:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DB04BA41FB;
 Mon,  1 May 2023 07:54:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 01 May 2023 07:54:54 -0000
Message-ID: <168292769489.29666.18193338653616675817@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230501075114.3108352-1-matthew.brost@intel.com>
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Upstrea?=
 =?utf-8?q?ming_prep_/_all_of_mbrosts_patches?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Upstreaming prep / all of mbrosts patches
URL   : https://patchwork.freedesktop.org/series/117156/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘evict_test_run_gt’:
../drivers/gpu/drm/xe/tests/xe_bo.c:185:18: error: passing argument 2 of ‘xe_vm_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  185 |   xe_vm_lock(vm, &ww, 0, false);
      |                  ^~~
      |                  |
      |                  struct ww_acquire_ctx *
In file included from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_bo.c:26:
../drivers/gpu/drm/xe/xe_vm.h:42:51: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
   42 | int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
      |                                  ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:188:20: error: passing argument 2 of ‘xe_vm_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  188 |   xe_vm_unlock(vm, &ww);
      |                    ^~~
      |                    |
      |                    struct ww_acquire_ctx *
In file included from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_bo.c:26:
../drivers/gpu/drm/xe/xe_vm.h:44:54: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
   44 | void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec);
      |                                     ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:201:24: error: passing argument 2 of ‘xe_bo_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  201 |   xe_bo_lock(external, &ww, 0, false);
      |                        ^~~
      |                        |
      |                        struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1733:51: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1733 | int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
      |                                  ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:203:26: error: passing argument 2 of ‘xe_bo_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  203 |   xe_bo_unlock(external, &ww);
      |                          ^~~
      |                          |
      |                          struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1754:54: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1754 | void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
      |                                     ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:243:19: error: passing argument 2 of ‘xe_vm_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  243 |    xe_vm_lock(vm, &ww, 0, false);
      |                   ^~~
      |                   |
      |                   struct ww_acquire_ctx *
In file included from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_bo.c:26:
../drivers/gpu/drm/xe/xe_vm.h:42:51: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
   42 | int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
      |                                  ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:245:21: error: passing argument 2 of ‘xe_vm_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  245 |    xe_vm_unlock(vm, &ww);
      |                     ^~~
      |                     |
      |                     struct ww_acquire_ctx *
In file included from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_bo.c:26:
../drivers/gpu/drm/xe/xe_vm.h:44:54: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
   44 | void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec);
      |                                     ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:252:25: error: passing argument 2 of ‘xe_bo_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  252 |    xe_bo_lock(external, &ww, 0, false);
      |                         ^~~
      |                         |
      |                         struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1733:51: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1733 | int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
      |                                  ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:254:27: error: passing argument 2 of ‘xe_bo_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  254 |    xe_bo_unlock(external, &ww);
      |                           ^~~
      |                           |
      |                           struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1754:54: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1754 | void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
      |                                     ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:262:24: error: passing argument 2 of ‘xe_bo_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  262 |   xe_bo_lock(external, &ww, 0, false);
      |                        ^~~
      |                        |
      |                        struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1733:51: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1733 | int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
      |                                  ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:264:26: error: passing argument 2 of ‘xe_bo_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  264 |   xe_bo_unlock(external, &ww);
      |                          ^~~
      |                          |
      |                          struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1754:54: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1754 | void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
      |                                     ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:271:24: error: passing argument 2 of ‘xe_bo_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  271 |   xe_bo_lock(external, &ww, 0, false);
      |                        ^~~
      |                        |
      |                        struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1733:51: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1733 | int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
      |                                  ~~~~~~~~~~~~~~~~~^~~~
In file included from ../drivers/gpu/drm/xe/xe_bo.c:1969:
../drivers/gpu/drm/xe/tests/xe_bo.c:273:26: error: passing argument 2 of ‘xe_bo_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  273 |   xe_bo_unlock(external, &ww);
      |                          ^~~
      |                          |
      |                          struct ww_acquire_ctx *
../drivers/gpu/drm/xe/xe_bo.c:1754:54: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
 1754 | void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
      |                                     ~~~~~~~~~~~~~~~~~^~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[07:54:32] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:54:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


