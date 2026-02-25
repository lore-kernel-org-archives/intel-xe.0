Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD567FD45E4
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 19:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC9D10E376;
	Wed, 25 Feb 2026 19:45:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6900610E376;
 Wed, 25 Feb 2026 19:45:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Fine_grained_fault_locking=2C_?=
 =?utf-8?q?threaded_prefetch=2C_storm_cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 19:45:35 -0000
Message-ID: <177204873541.286940.5445645560631794811@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260225184713.2606772-1-matthew.brost@intel.com>
In-Reply-To: <20260225184713.2606772-1-matthew.brost@intel.com>
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

Series: Fine grained fault locking, threaded prefetch, storm cache
URL   : https://patchwork.freedesktop.org/series/162167/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_pagefault.c: In function ‘xe_pagefault_service’:
../drivers/gpu/drm/xe/xe_pagefault.c:274:56: error: passing argument 3 of ‘xe_svm_handle_pagefault’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  274 |                 err = xe_svm_handle_pagefault(vm, vma, pf, gt,
      |                                                        ^~
      |                                                        |
      |                                                        struct xe_pagefault *
In file included from ../drivers/gpu/drm/xe/xe_pagefault.c:19:
../drivers/gpu/drm/xe/xe_svm.h:299:43: note: expected ‘struct xe_gt *’ but argument is of type ‘struct xe_pagefault *’
  299 |                             struct xe_gt *gt, u64 fault_addr,
      |                             ~~~~~~~~~~~~~~^~
../drivers/gpu/drm/xe/xe_pagefault.c:274:60: warning: passing argument 4 of ‘xe_svm_handle_pagefault’ makes integer from pointer without a cast [-Wint-conversion]
  274 |                 err = xe_svm_handle_pagefault(vm, vma, pf, gt,
      |                                                            ^~
      |                                                            |
      |                                                            struct xe_gt *
../drivers/gpu/drm/xe/xe_svm.h:299:51: note: expected ‘u64’ {aka ‘long long unsigned int’} but argument is of type ‘struct xe_gt *’
  299 |                             struct xe_gt *gt, u64 fault_addr,
      |                                               ~~~~^~~~~~~~~~
../drivers/gpu/drm/xe/xe_pagefault.c:274:23: error: too many arguments to function ‘xe_svm_handle_pagefault’
  274 |                 err = xe_svm_handle_pagefault(vm, vma, pf, gt,
      |                       ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_svm.h:298:5: note: declared here
  298 | int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
      |     ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_pagefault.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:546: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:546: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:546: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:546: drivers] Error 2
make[2]: *** [/kernel/Makefile:2101: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[19:45:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:45:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


