Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B31DC5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 22:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533E710E321;
	Thu,  5 Jun 2025 22:31:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD8810E314;
 Thu,  5 Jun 2025 22:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_CPU_binds_and_ULLS_on_migratio?=
 =?utf-8?q?n_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 22:31:41 -0000
Message-ID: <174916270103.53928.137152434476427363@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605153223.2789122-1-matthew.brost@intel.com>
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue
URL   : https://patchwork.freedesktop.org/series/149888/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/drm/ttm/ttm_resource.h:31,
                 from ../include/drm/ttm/ttm_device.h:30,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:14,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:21:
../drivers/gpu/drm/xe/tests/xe_migrate.c: In function ‘xe_migrate_sanity_test’:
../drivers/gpu/drm/xe/tests/xe_migrate.c:242:50: error: ‘NUM_KERNEL_PDE’ undeclared (first use in this function)
  242 |         xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
      |                                                  ^~~~~~~~~~~~~~
../include/linux/iosys-map.h:372:27: note: in definition of macro ‘__iosys_map_wr_io’
  372 |         u8: writeb(val__, vaddr_iomem__),                                       \
      |                           ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_map.h:78:9: note: in expansion of macro ‘iosys_map_wr’
   78 |         iosys_map_wr(map__, offset__, type__, val__);                   \
      |         ^~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:242:9: note: in expansion of macro ‘xe_map_wr’
  242 |         xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
      |         ^~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:242:50: note: each undeclared identifier is reported only once for each function it appears in
  242 |         xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
      |                                                  ^~~~~~~~~~~~~~
../include/linux/iosys-map.h:372:27: note: in definition of macro ‘__iosys_map_wr_io’
  372 |         u8: writeb(val__, vaddr_iomem__),                                       \
      |                           ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_map.h:78:9: note: in expansion of macro ‘iosys_map_wr’
   78 |         iosys_map_wr(map__, offset__, type__, val__);                   \
      |         ^~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:242:9: note: in expansion of macro ‘xe_map_wr’
  242 |         xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
      |         ^~~~~~~~~
make[7]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/xe/xe_migrate.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[22:31:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:31:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


