Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805D7C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 19:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E4B10E2E4;
	Mon,  1 May 2023 19:07:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00E9110E45D;
 Mon,  1 May 2023 19:07:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F1664A882E;
 Mon,  1 May 2023 19:07:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Mon, 01 May 2023 19:07:00 -0000
Message-ID: <168296802098.29666.3413861365980187294@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230501190314.609261-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230501190314.609261-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Killing?=
 =?utf-8?q?_the_undesired_drm=5Fpt=5Fwalk?=
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

Series: Killing the undesired drm_pt_walk
URL   : https://patchwork.freedesktop.org/series/117173/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bb.c:15:
../drivers/gpu/drm/xe/xe_pt_types.h:9:10: fatal error: xe_pt_walk.h: No such file or directory
    9 | #include "xe_pt_walk.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bb.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/xe_pt_types.h:9:10: fatal error: xe_pt_walk.h: No such file or directory
    9 | #include "xe_pt_walk.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bo.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../drivers/gpu/drm/xe/xe_pt_types.h:9:10: fatal error: xe_pt_walk.h: No such file or directory
    9 | #include "xe_pt_walk.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bo_evict.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_debugfs.c:12:
../drivers/gpu/drm/xe/xe_pt_types.h:9:10: fatal error: xe_pt_walk.h: No such file or directory
    9 | #include "xe_pt_walk.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_debugfs.o] Error 1
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[19:06:37] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:06:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


