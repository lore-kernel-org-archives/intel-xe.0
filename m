Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA4AC678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B8710E0C6;
	Fri,  3 Mar 2023 10:56:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2881A10E0C6;
 Fri,  3 Mar 2023 10:56:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 249CDA0BCB;
 Fri,  3 Mar 2023 10:56:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Fri, 03 Mar 2023 10:56:06 -0000
Message-ID: <167784096614.9997.9822812608959828099@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230303105222.3550161-1-jani.nikula@intel.com>
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_clean_up_i915_includes_both_sides_=28rev2=29?=
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

Series: drm/xe: clean up i915 includes both sides (rev2)
URL   : https://patchwork.freedesktop.org/series/114573/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/i915/display/intel_display_core.h:28,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:22,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h:11:10: fatal error: display/intel_display.h: No such file or directory
   11 | #include "display/intel_display.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/xe_bb.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/i915/display/intel_display_core.h:28,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:22,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:14,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h:11:10: fatal error: display/intel_display.h: No such file or directory
   11 | #include "display/intel_display.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[5]: *** [../scripts/Makefile.build:500: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:500: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:500: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:500: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:1992: .] Error 2
make: *** [Makefile:231: __sub-make] Error 2

[10:55:46] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:55:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


