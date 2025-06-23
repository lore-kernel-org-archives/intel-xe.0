Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6252C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 15:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A2010E010;
	Mon, 23 Jun 2025 15:24:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE9E10E010;
 Mon, 23 Jun 2025 15:24:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Implement_clear_VRAM_on_free_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Jun 2025 15:24:31 -0000
Message-ID: <175069227158.101184.13171388518985556927@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250623151929.2422584-1-matthew.brost@intel.com>
In-Reply-To: <20250623151929.2422584-1-matthew.brost@intel.com>
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

Series: Implement clear VRAM on free (rev2)
URL   : https://patchwork.freedesktop.org/series/150635/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_bo.c:3204:
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘ccs_test_migrate’:
../drivers/gpu/drm/xe/tests/xe_bo.c:46:57: error: passing argument 2 of ‘xe_migrate_clear’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   46 |                 fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
      |                                                         ^~
      |                                                         |
      |                                                         struct xe_bo *
In file included from ../drivers/gpu/drm/xe/xe_bo.c:28:
../drivers/gpu/drm/xe/xe_migrate.h:127:57: note: expected ‘struct ttm_resource *’ but argument is of type ‘struct xe_bo *’
  127 |                                    struct ttm_resource *dst,
      |                                    ~~~~~~~~~~~~~~~~~~~~~^~~
../drivers/gpu/drm/xe/tests/xe_bo.c:46:68: error: passing argument 3 of ‘xe_migrate_clear’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   46 |                 fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
      |                                                             ~~~~~~~^~~~~~~~~
      |                                                                    |
      |                                                                    struct ttm_resource *
../drivers/gpu/drm/xe/xe_migrate.h:128:53: note: expected ‘struct dma_resv *’ but argument is of type ‘struct ttm_resource *’
  128 |                                    struct dma_resv *resv,
      |                                    ~~~~~~~~~~~~~~~~~^~~~
../drivers/gpu/drm/xe/xe_migrate.h:124:41: warning: passing argument 4 of ‘xe_migrate_clear’ makes pointer from integer without a cast [-Wint-conversion]
  124 | #define XE_MIGRATE_CLEAR_FLAG_FULL      (XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                         |
      |                                         long unsigned int
  125 |                                         XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
      |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:47:42: note: in expansion of macro ‘XE_MIGRATE_CLEAR_FLAG_FULL’
   47 |                                          XE_MIGRATE_CLEAR_FLAG_FULL);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.h:129:53: note: expected ‘struct sg_table *’ but argument is of type ‘long unsigned int’
  129 |                                    struct sg_table *sgt,
      |                                    ~~~~~~~~~~~~~~~~~^~~
../drivers/gpu/drm/xe/tests/xe_bo.c:46:25: error: too few arguments to function ‘xe_migrate_clear’
   46 |                 fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
      |                         ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.h:126:19: note: declared here
  126 | struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
      |                   ^~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:554: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:554: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:554: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:554: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[15:24:03] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:24:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


