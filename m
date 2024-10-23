Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E95D2E01E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 08:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CF710E788;
	Wed, 23 Oct 2024 08:12:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299FF10E788;
 Wed, 23 Oct 2024 08:12:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_kernel/cgroups=3A_Add_=22dev?=
 =?utf-8?q?=22_memory_accounting_cgroup=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 08:12:43 -0000
Message-ID: <172967116316.1322977.4130578856209921239@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

Series: kernel/cgroups: Add "dev" memory accounting cgroup.
URL   : https://patchwork.freedesktop.org/series/140361/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:12:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:12:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../include/drm/drm_device.h:4,
                 from ../include/drm/drm_crtc.h:33,
                 from ../include/drm/drm_atomic.h:31,
                 from ../drivers/gpu/drm/tests/drm_kunit_helpers.c:3:
../include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |            ^~~
../include/linux/cgroup_dev.h:65:1: error: expected identifier or ‘(’ before ‘{’ token
   65 | {
      | ^
../include/linux/cgroup_dev.h:61:16: warning: ‘dev_cgroup_try_charge’ declared ‘static’ but never defined [-Wunused-function]
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |                ^~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/tests/drm_kunit_helpers.o] Error 1
make[6]: *** [../scripts/Makefile.build:478: drivers/gpu/drm/tests] Error 2
make[6]: *** Waiting for unfinished jobs....
In file included from ../include/drm/drm_device.h:4,
                 from ../drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:31:
../include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |            ^~~
../include/linux/cgroup_dev.h:65:1: error: expected identifier or ‘(’ before ‘{’ token
   65 | {
      | ^
../include/linux/cgroup_dev.h:61:16: warning: ‘dev_cgroup_try_charge’ declared ‘static’ but never defined [-Wunused-function]
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |                ^~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/display/drm_dp_dual_mode_helper.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../include/drm/drm_device.h:4,
                 from ../drivers/gpu/drm/ttm/ttm_tt.c:41:
../include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |            ^~~
../include/linux/cgroup_dev.h:65:1: error: expected identifier or ‘(’ before ‘{’ token
   65 | {
      | ^
../include/linux/cgroup_dev.h:61:16: warning: ‘dev_cgroup_try_charge’ declared ‘static’ but never defined [-Wunused-function]
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |                ^~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/ttm/ttm_tt.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/ttm/ttm_bo.c:45:
../include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |            ^~~
../include/linux/cgroup_dev.h:65:1: error: expected identifier or ‘(’ before ‘{’ token
   65 | {
      | ^
../include/linux/cgroup_dev.h:61:16: warning: ‘dev_cgroup_try_charge’ declared ‘static’ but never defined [-Wunused-function]
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |                ^~~~~~~~~~~~~~~~~~~~~
In file included from ../include/drm/drm_device.h:4,
                 from ../include/drm/drm_crtc.h:33,
                 from ../include/drm/drm_atomic.h:31,
                 from ../include/drm/display/drm_dp_mst_helper.h:27,
                 from ../drivers/gpu/drm/display/drm_dp_helper.c:36:
../include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |            ^~~
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/ttm/ttm_bo.o] Error 1
../include/linux/cgroup_dev.h:65:1: error: expected identifier or ‘(’ before ‘{’ token
   65 | {
      | ^
../include/linux/cgroup_dev.h:61:16: warning: ‘dev_cgroup_try_charge’ declared ‘static’ but never defined [-Wunused-function]
   61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
      |                ^~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/display/drm_dp_helper.o] Error 1
make[6]: *** [../scripts/Makefile.build:478: drivers/gpu/drm/display] Error 2
make[6]: *** [../scripts/Makefile.build:478: drivers/gpu/drm/ttm] Error 2
make[5]: *** [../scripts/Makefile.build:478: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:478: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:478: drivers] Error 2
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
make[2]: *** [/kernel/Makefile:1936: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


