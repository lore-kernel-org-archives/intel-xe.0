Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDC9C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFF010E134;
	Tue, 30 May 2023 10:38:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1739510E134;
 Tue, 30 May 2023 10:38:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 13538AADD8;
 Tue, 30 May 2023 10:38:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 30 May 2023 10:38:30 -0000
Message-ID: <168544311007.18934.9247314043916876236@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Clean-u?=
 =?utf-8?q?p_Xe_FBC_additions?=
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

Series: Clean-up Xe FBC additions
URL   : https://patchwork.freedesktop.org/series/118560/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/display/xe_fb_pin.c:6:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/xe_fb_pin.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/i915/display/intel_hdcp_gsc.h:11,
                 from ../drivers/gpu/drm/xe/display/xe_hdcp_gsc.c:6:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/xe_hdcp_gsc.o] Error 1
In file included from ../drivers/gpu/drm/xe/display/xe_plane_initial.c:11:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/xe_plane_initial.o] Error 1
In file included from ../drivers/gpu/drm/xe/display/ext/i915_irq.c:37:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/ext/i915_irq.o] Error 1
In file included from ../drivers/gpu/drm/i915/display/intel_de.h:9,
                 from ../drivers/gpu/drm/xe/display/ext/intel_device_info.c:26:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
In file included from ../drivers/gpu/drm/i915/display/intel_de.h:9,
                 from ../drivers/gpu/drm/xe/display/ext/intel_clock_gating.c:28:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/ext/intel_device_info.o] Error 1
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/ext/intel_clock_gating.o] Error 1
In file included from ../drivers/gpu/drm/xe/display/ext/intel_dram.c:8:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/ext/intel_dram.o] Error 1
In file included from ../drivers/gpu/drm/xe/display/ext/intel_pch.c:6:
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:10: fatal error: intel_gt_types.h: No such file or directory
   22 | #include "intel_gt_types.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/display/ext/intel_pch.o] Error 1
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[10:38:07] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:38:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


