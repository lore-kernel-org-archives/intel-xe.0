Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F21C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 23:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6811710E063;
	Tue, 24 Jun 2025 23:03:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7949A10E011;
 Tue, 24 Jun 2025 23:03:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Drop_bo-=3Esize_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 23:03:04 -0000
Message-ID: <175080618449.106491.15396104108146121913@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624225018.2790110-1-matthew.brost@intel.com>
In-Reply-To: <20250624225018.2790110-1-matthew.brost@intel.com>
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

Series: drm/xe: Drop bo->size (rev2)
URL   : https://patchwork.freedesktop.org/series/150710/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:7:
../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function ‘encode_config’:
../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:285:58: error: ‘struct xe_bo’ has no member named ‘size’
  285 |                 cfg[n++] = lower_32_bits(config->lmem_obj->size);
      |                                                          ^~
../include/linux/wordpart.h:20:34: note: in definition of macro ‘lower_32_bits’
   20 | #define lower_32_bits(n) ((u32)((n) & 0xffffffff))
      |                                  ^
../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:286:58: error: ‘struct xe_bo’ has no member named ‘size’
  286 |                 cfg[n++] = upper_32_bits(config->lmem_obj->size);
      |                                                          ^~
../include/linux/wordpart.h:14:35: note: in definition of macro ‘upper_32_bits’
   14 | #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
      |                                   ^
../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function ‘xe_gt_sriov_pf_config_print_lmem’:
../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2555:49: error: ‘struct xe_bo’ has no member named ‘size’
 2555 |                 string_get_size(config->lmem_obj->size, 1, STRING_UNITS_2,
      |                                                 ^~
../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2558:47: error: ‘struct xe_bo’ has no member named ‘size’
 2558 |                            n, config->lmem_obj->size, buf);
      |                                               ^~
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:554: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:554: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:554: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:554: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[23:02:30] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:02:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


