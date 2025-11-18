Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C34CEE351
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 20:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9A10E532;
	Tue, 18 Nov 2025 20:20:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDCB10E532;
 Tue, 18 Nov 2025 20:20:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/vm=3A_Use_for=5Feach=5F?=
 =?utf-8?q?tlb=5Finval=28=29_to_calculate_invalidation_fences?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 20:20:44 -0000
Message-ID: <176349724418.6922.5529216746143307367@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118201439.3688178-2-matthew.d.roper@intel.com>
In-Reply-To: <20251118201439.3688178-2-matthew.d.roper@intel.com>
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

Series: drm/xe/vm: Use for_each_tlb_inval() to calculate invalidation fences
URL   : https://patchwork.freedesktop.org/series/157743/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_vm.c:29:
../drivers/gpu/drm/xe/xe_vm.c: In function ‘ops_execute’:
../drivers/gpu/drm/xe/xe_vm.c:3118:44: error: ‘i’ undeclared (first use in this function); did you mean ‘id’?
 3118 |                         for_each_tlb_inval(i)
      |                                            ^
../drivers/gpu/drm/xe/xe_exec_queue.h:18:14: note: in definition of macro ‘for_each_tlb_inval’
   18 |         for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
      |              ^~~
../drivers/gpu/drm/xe/xe_vm.c:3118:44: note: each undeclared identifier is reported only once for each function it appears in
 3118 |                         for_each_tlb_inval(i)
      |                                            ^
../drivers/gpu/drm/xe/xe_exec_queue.h:18:14: note: in definition of macro ‘for_each_tlb_inval’
   18 |         for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
      |              ^~~
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_vm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/kernel/Makefile:2010: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[20:20:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:20:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


