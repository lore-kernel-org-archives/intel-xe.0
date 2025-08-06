Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4F3C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB7B10E3A6;
	Wed,  6 Aug 2025 06:36:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DE210E3A6;
 Wed,  6 Aug 2025 06:36:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Pagefault_refactor=2C_fine_gra?=
 =?utf-8?q?ined_fault_locking=2C_threaded_prefetch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 06:36:53 -0000
Message-ID: <175446221300.215948.10683936409004233569@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806062242.1090416-1-matthew.brost@intel.com>
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
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

Series: Pagefault refactor, fine grained fault locking, threaded prefetch
URL   : https://patchwork.freedesktop.org/series/152565/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_vm.c: In function ‘prefetch_thread_func’:
../drivers/gpu/drm/xe/xe_vm.c:2984:32: error: ‘struct xe_svm_range’ has no member named ‘lock’
 2984 |         guard(mutex)(&svm_range->lock);
      |                                ^~
../drivers/gpu/drm/xe/xe_vm.c:2986:13: error: implicit declaration of function ‘xe_svm_range_is_removed’; did you mean ‘xe_svm_range_size’? [-Werror=implicit-function-declaration]
 2986 |         if (xe_svm_range_is_removed(svm_range)) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~
      |             xe_svm_range_size
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_vm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:555: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:555: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:555: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:555: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[06:36:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:36:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


