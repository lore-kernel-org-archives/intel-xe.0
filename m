Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C804BE77180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 14:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B8D10E763;
	Mon,  9 Dec 2024 14:44:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1310E763;
 Mon,  9 Dec 2024 14:44:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Revert_=22lockdep=3A_Enable_PR?=
 =?utf-8?q?OVE=5FRAW=5FLOCK=5FNESTING_with_PROVE=5FLOCKING=2E=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Dec 2024 14:44:54 -0000
Message-ID: <173375549434.490008.8224992696817101661@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209135602.2716023-1-luciano.coelho@intel.com>
In-Reply-To: <20241209135602.2716023-1-luciano.coelho@intel.com>
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

Series: Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING."
URL   : https://patchwork.freedesktop.org/series/142297/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:44:21] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:44:25] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
ERROR:root:../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
In file included from ../include/linux/module.h:22,
                 from ../include/linux/device/driver.h:21,
                 from ../include/linux/device.h:32,
                 from ../include/linux/auxiliary_bus.h:11,
                 from ../include/linux/intel_vsec.h:5,
                 from ../drivers/gpu/drm/xe/xe_vsec.c:7:
../drivers/gpu/drm/xe/xe_vsec.c:233:18: error: expected ‘,’ or ‘;’ before ‘INTEL_VSEC’
  233 | MODULE_IMPORT_NS(INTEL_VSEC);
      |                  ^~~~~~~~~~
../include/linux/moduleparam.h:26:61: note: in definition of macro ‘__MODULE_INFO’
   26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
      |                                                             ^~~~
../include/linux/module.h:299:33: note: in expansion of macro ‘MODULE_INFO’
  299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
      |                                 ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vsec.c:233:1: note: in expansion of macro ‘MODULE_IMPORT_NS’
  233 | MODULE_IMPORT_NS(INTEL_VSEC);
      | ^~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:194: drivers/gpu/drm/xe/xe_vsec.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:440: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:440: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:440: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:440: drivers] Error 2
make[2]: *** [/kernel/Makefile:1989: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


