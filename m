Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3165EB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 06:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FF710E3A4;
	Wed,  6 Sep 2023 06:03:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEE2E10E04A;
 Wed,  6 Sep 2023 06:03:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DDF9EA3ECB;
 Wed,  6 Sep 2023 06:03:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Date: Wed, 06 Sep 2023 06:03:12 -0000
Message-ID: <169398019290.17390.11770143798787108154@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/?=
 =?utf-8?q?display=3A_Print_display_ip_version?=
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

Series: drm/xe/display: Print display ip version
URL   : https://patchwork.freedesktop.org/series/123311/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/drm/ttm/ttm_resource.h:34,
                 from ../include/drm/ttm/ttm_device.h:30,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pci.c:19:
../drivers/gpu/drm/xe/xe_pci.c: In function ‘xe_pci_probe’:
../drivers/gpu/drm/xe/xe_pci.c:723:12: error: ‘struct intel_device_info’ has no member named ‘display_runtime’
  723 |    xe->info.display_runtime.ip.ver,
      |            ^
../include/drm/drm_print.h:410:39: note: in definition of macro ‘drm_dev_dbg’
  410 |  __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
      |                                       ^~~~~~~~~~~
../include/drm/drm_print.h:510:32: note: in expansion of macro ‘drm_dbg_driver’
  510 | #define drm_dbg(drm, fmt, ...) drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
      |                                ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pci.c:722:3: note: in expansion of macro ‘drm_dbg’
  722 |   drm_dbg(&xe->drm, "Display: %d.%02d\n",
      |   ^~~~~~~
../drivers/gpu/drm/xe/xe_pci.c:724:12: error: ‘struct intel_device_info’ has no member named ‘display_runtime’
  724 |    xe->info.display_runtime.ip.rel);
      |            ^
../include/drm/drm_print.h:410:39: note: in definition of macro ‘drm_dev_dbg’
  410 |  __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
      |                                       ^~~~~~~~~~~
../include/drm/drm_print.h:510:32: note: in expansion of macro ‘drm_dbg_driver’
  510 | #define drm_dbg(drm, fmt, ...) drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
      |                                ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pci.c:722:3: note: in expansion of macro ‘drm_dbg’
  722 |   drm_dbg(&xe->drm, "Display: %d.%02d\n",
      |   ^~~~~~~
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_pci.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:480: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2032: .] Error 2
make[1]: *** [/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

[06:02:49] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:02:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


