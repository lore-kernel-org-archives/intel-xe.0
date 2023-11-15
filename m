Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF42CC00A4D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A962710E381;
	Wed, 15 Nov 2023 00:16:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 936DA10E381;
 Wed, 15 Nov 2023 00:16:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 91367AADEB;
 Wed, 15 Nov 2023 00:16:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Wed, 15 Nov 2023 00:16:52 -0000
Message-ID: <170000741259.646.3876157262521126774@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231114230558.1774-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231114230558.1774-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_?=
 =?utf-8?q?starting_with_=5B1/3=5D_drm/xe=3A_Add_device_flag_to_indicate_S?=
 =?utf-8?q?R-IOV_support?=
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

Series: series starting with [1/3] drm/xe: Add device flag to indicate SR-IOV support
URL   : https://patchwork.freedesktop.org/series/126431/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_bb.c:10:
../drivers/gpu/drm/xe/xe_device_types.h:21:10: fatal error: xe_sriov_types.h: No such file or directory
   21 | #include "xe_sriov_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_bb.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../drivers/gpu/drm/xe/xe_device_types.h:21:10: fatal error: xe_sriov_types.h: No such file or directory
   21 | #include "xe_sriov_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[8]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/tests/xe_pci_test.o] Error 1
make[8]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../drivers/gpu/drm/xe/xe_device_types.h:21:10: fatal error: xe_sriov_types.h: No such file or directory
   21 | #include "xe_sriov_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[8]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/tests/xe_rtp_test.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/xe_device_types.h:21:10: fatal error: xe_sriov_types.h: No such file or directory
   21 | #include "xe_sriov_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_bo.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../drivers/gpu/drm/xe/xe_device_types.h:21:10: fatal error: xe_sriov_types.h: No such file or directory
   21 | #include "xe_sriov_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[8]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/tests/xe_wa_test.o] Error 1
make[7]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe/tests] Error 2
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:480: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1913: .] Error 2
make[1]: *** [/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

[00:16:29] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:16:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


