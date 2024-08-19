Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F7BC5320E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 13:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A7010E275;
	Mon, 19 Aug 2024 13:37:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190F510E275;
 Mon, 19 Aug 2024 13:37:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/display=3A_Fixes_to_mak?=
 =?utf-8?q?e_kexec_work=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Aug 2024 13:37:54 -0000
Message-ID: <172407467409.694757.2440053453115084100@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe/display: Fixes to make kexec work. (rev2)
URL   : https://patchwork.freedesktop.org/series/137453/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_device.c: In function ‘xe_device_shutdown’:
../drivers/gpu/drm/xe/xe_device.c:820:3: error: too many arguments to function ‘xe_display_pm_suspend’
  820 |   xe_display_pm_suspend(xe, false, true);
      |   ^~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device.c:20:
../drivers/gpu/drm/xe/display/xe_display.h:67:20: note: declared here
   67 | static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
      |                    ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_device.c:827:3: error: implicit declaration of function ‘xe_display_pm_shutdown_late’; did you mean ‘xe_display_pm_suspend_late’? [-Werror=implicit-function-declaration]
  827 |   xe_display_pm_shutdown_late(xe);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   xe_display_pm_suspend_late
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_device.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
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
make[2]: *** [/kernel/Makefile:1925: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

[13:37:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:37:29] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


