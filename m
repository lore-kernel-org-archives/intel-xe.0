Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6349DC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 14:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2765F10E391;
	Wed,  1 Jul 2026 14:54:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877BF10E7E7;
 Wed,  1 Jul 2026 14:54:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/gpusvm=3A_split_MM_and_dev?=
 =?utf-8?q?ice_state_across_gpusvm/range/pages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honglei1.huang@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 14:54:02 -0000
Message-ID: <178291764255.139063.9883870155816763093@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260628111455.9831-1-honglei1.huang@amd.com>
In-Reply-To: <20260628111455.9831-1-honglei1.huang@amd.com>
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

Series: drm/gpusvm: split MM and device state across gpusvm/range/pages
URL   : https://patchwork.freedesktop.org/series/169606/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_pt.c: In function ‘xe_pt_stage_bind’:
../drivers/gpu/drm/xe/xe_pt.c:763:47: error: ‘struct xe_svm_range’ has no member named ‘pages’
  763 |                         xe_res_first_dma(range->pages.dma_addr, 0,
      |                                               ^~
../drivers/gpu/drm/xe/xe_pt.c: At top level:
../drivers/gpu/drm/xe/xe_pt.c:1420:13: warning: ‘xe_pt_svm_userptr_notifier_lock’ defined but not used [-Wunused-function]
 1420 | static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_pt.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:549: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:549: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:549: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:549: drivers] Error 2
make[2]: *** [/kernel/Makefile:2184: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[14:53:28] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:53:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


