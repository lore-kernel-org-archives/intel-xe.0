Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5EBC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 20:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF97B10E3F5;
	Tue,  6 Aug 2024 20:18:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82D410E3F5;
 Tue,  6 Aug 2024 20:18:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_drm/xe/gt=3A_Add_APIs_for_printing_stats_over_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 20:18:47 -0000
Message-ID: <172297552781.544132.4198365766008464596@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806194510.13044-1-nirmoy.das@intel.com>
In-Reply-To: <20240806194510.13044-1-nirmoy.das@intel.com>
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

Series: series starting with [1/2] drm/xe/gt: Add APIs for printing stats over debugfs
URL   : https://patchwork.freedesktop.org/series/136950/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../drivers/gpu/drm/xe/xe_gt_stats.h:23:5: warning: no previous prototype for ‘xe_gt_stats_print_info’ [-Wmissing-prototypes]
   23 | int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_stats.h:27:6: warning: no previous prototype for ‘xe_gt_stats_incr’ [-Wmissing-prototypes]
   27 | void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
      |      ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../drivers/gpu/drm/xe/xe_gt_stats.h: In function ‘xe_gt_stats_print_info’:
../drivers/gpu/drm/xe/xe_gt_stats.h:25:1: error: control reaches end of non-void function [-Werror=return-type]
   25 | }
      | ^
cc1: some warnings being treated as errors
make[8]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/tests/xe_pci_test.o] Error 1
make[8]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../drivers/gpu/drm/xe/xe_gt_stats.h:23:5: warning: no previous prototype for ‘xe_gt_stats_print_info’ [-Wmissing-prototypes]
   23 | int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_stats.h:27:6: warning: no previous prototype for ‘xe_gt_stats_incr’ [-Wmissing-prototypes]
   27 | void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
      |      ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../drivers/gpu/drm/xe/xe_gt_stats.h: In function ‘xe_gt_stats_print_info’:
../drivers/gpu/drm/xe/xe_gt_stats.h:25:1: error: control reaches end of non-void function [-Werror=return-type]
   25 | }
      | ^
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../drivers/gpu/drm/xe/xe_gt_stats.h:23:5: warning: no previous prototype for ‘xe_gt_stats_print_info’ [-Wmissing-prototypes]
   23 | int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_stats.h:27:6: warning: no previous prototype for ‘xe_gt_stats_incr’ [-Wmissing-prototypes]
   27 | void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
      |      ^~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_bb.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../drivers/gpu/drm/xe/xe_gt_stats.h: In function ‘xe_gt_stats_print_info’:
../drivers/gpu/drm/xe/xe_gt_stats.h:25:1: error: control reaches end of non-void function [-Werror=return-type]
   25 | }
      | ^
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../drivers/gpu/drm/xe/xe_gt_stats.h:23:5: warning: no previous prototype for ‘xe_gt_stats_print_info’ [-Wmissing-prototypes]
   23 | int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_stats.h:27:6: warning: no previous prototype for ‘xe_gt_stats_incr’ [-Wmissing-prototypes]
   27 | void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
      |      ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../drivers/gpu/drm/xe/xe_gt_stats.h: In function ‘xe_gt_stats_print_info’:
../drivers/gpu/drm/xe/xe_gt_stats.h:25:1: error: control reaches end of non-void function [-Werror=return-type]
   25 | }
      | ^
cc1: some warnings being treated as errors
make[8]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/tests/xe_rtp_test.o] Error 1
cc1: some warnings being treated as errors
make[8]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/tests/xe_wa_test.o] Error 1
make[7]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe/tests] Error 2
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/xe_gt_stats.h:23:5: warning: no previous prototype for ‘xe_gt_stats_print_info’ [-Wmissing-prototypes]
   23 | int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_stats.h:27:6: warning: no previous prototype for ‘xe_gt_stats_incr’ [-Wmissing-prototypes]
   27 | void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
      |      ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:13,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:17,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/xe_gt_stats.h: In function ‘xe_gt_stats_print_info’:
../drivers/gpu/drm/xe/xe_gt_stats.h:25:1: error: control reaches end of non-void function [-Werror=return-type]
   25 | }
      | ^
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
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
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1925: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

[20:18:20] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:18:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


