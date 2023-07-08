Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEEFEB64DC
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jul 2023 06:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CA410E651;
	Sat,  8 Jul 2023 06:47:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19F1710E651;
 Sat,  8 Jul 2023 06:47:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 15FFBA0BA8;
 Sat,  8 Jul 2023 06:47:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 08 Jul 2023 06:47:26 -0000
Message-ID: <168879884608.9512.12737061165537601673@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230708064359.1743796-1-matthew.brost@intel.com>
In-Reply-To: <20230708064359.1743796-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_GPUVA_w?=
 =?utf-8?q?ith_no_uAPI_changes?=
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

Series: GPUVA with no uAPI changes
URL   : https://patchwork.freedesktop.org/series/120385/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../include/drm/drm_gpuva_mgr.h:205:34: error: conflicting types for ‘lockdep_map_p’
  205 | typedef struct { /* nothing */ } lockdep_map_p;
      |                                  ^~~~~~~~~~~~~
In file included from ../include/linux/mm_types.h:12,
                 from ../include/drm/drm_mm.h:43,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.h:9,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../include/linux/maple_tree.h:191:34: note: previous declaration of ‘lockdep_map_p’ was here
  191 | typedef struct { /* nothing */ } lockdep_map_p;
      |                                  ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../include/drm/drm_gpuva_mgr.h:205:34: error: conflicting types for ‘lockdep_map_p’
  205 | typedef struct { /* nothing */ } lockdep_map_p;
      |                                  ^~~~~~~~~~~~~
In file included from ../include/linux/mm_types.h:12,
                 from ../include/drm/drm_mm.h:43,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.h:9,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../include/linux/maple_tree.h:191:34: note: previous declaration of ‘lockdep_map_p’ was here
  191 | typedef struct { /* nothing */ } lockdep_map_p;
      |                                  ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_vm_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_bb.c:15:
../include/drm/drm_gpuva_mgr.h:205:34: error: conflicting types for ‘lockdep_map_p’
  205 | typedef struct { /* nothing */ } lockdep_map_p;
      |                                  ^~~~~~~~~~~~~
In file included from ../include/linux/mm_types.h:12,
                 from ../include/linux/mmzone.h:22,
                 from ../include/linux/topology.h:33,
                 from ../include/linux/irq.h:19,
                 from ../include/asm-generic/hardirq.h:17,
                 from ../arch/um/include/asm/hardirq.h:5,
                 from ../include/linux/hardirq.h:11,
                 from ../include/linux/interrupt.h:11,
                 from ../include/drm/drm_util.h:35,
                 from ../drivers/gpu/drm/xe/xe_device.h:12,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../include/linux/maple_tree.h:191:34: note: previous declaration of ‘lockdep_map_p’ was here
  191 | typedef struct { /* nothing */ } lockdep_map_p;
      |                                  ^~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bb.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bo_evict.o] Error 1
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2026: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[06:47:02] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:47:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


