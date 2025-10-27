Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E77BCCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4E710E547;
	Mon, 27 Oct 2025 18:17:22 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C3510E547;
 Mon, 27 Oct 2025 18:17:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Fix_a_couple_of_wedge_corner-c?=
 =?utf-8?q?ase_memory_leaks_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 18:17:20 -0000
Message-ID: <176158904091.59660.2314497415900577533@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027180412.63743-1-stuart.summers@intel.com>
In-Reply-To: <20251027180412.63743-1-stuart.summers@intel.com>
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

Series: Fix a couple of wedge corner-case memory leaks (rev6)
URL   : https://patchwork.freedesktop.org/series/155352/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/bitfield.h:10,
                 from ../drivers/gpu/drm/xe/xe_guc_submit.c:8:
../drivers/gpu/drm/xe/xe_guc_submit.c: In function ‘guc_submit_wedged_fini’:
../drivers/gpu/drm/xe/xe_guc_submit.c:300:31: error: implicit declaration of function ‘drm_sched_is_stopped’; did you mean ‘drm_sched_stop’? [-Werror=implicit-function-declaration]
  300 |                              !drm_sched_is_stopped(&q->guc->sched.base));
      |                               ^~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:30:63: note: in definition of macro ‘BUILD_BUG_ON_INVALID’
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
../drivers/gpu/drm/xe/xe_assert.h:112:9: note: in expansion of macro ‘__xe_assert_msg’
  112 |         __xe_assert_msg(__xe, condition,                                                        \
      |         ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:148:9: note: in expansion of macro ‘xe_assert_msg’
  148 |         xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,                  \
      |         ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:172:9: note: in expansion of macro ‘xe_tile_assert_msg’
  172 |         xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,                 \
      |         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:169:37: note: in expansion of macro ‘xe_gt_assert_msg’
  169 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_submit.c:299:17: note: in expansion of macro ‘xe_gt_assert’
  299 |                 xe_gt_assert(guc_to_gt(guc),
      |                 ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_guc_submit.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/kernel/Makefile:2010: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[18:16:47] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:16:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


