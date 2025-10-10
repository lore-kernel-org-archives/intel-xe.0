Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D428ACCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 14:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AB010EC1D;
	Fri, 10 Oct 2025 14:19:47 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500710E2AD;
 Fri, 10 Oct 2025 14:19:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/migrate=3A_Atomicize_CC?=
 =?utf-8?q?S_copy_command_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Oct 2025 14:19:46 -0000
Message-ID: <176010598666.294.3841171991105743190@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251010123900.15278-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251010123900.15278-5-satyanarayana.k.v.p@intel.com>
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

Series: drm/xe/migrate: Atomicize CCS copy command setup
URL   : https://patchwork.freedesktop.org/series/155744/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/bitfield.h:10,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:9:
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘emit_atomic’:
../drivers/gpu/drm/xe/xe_migrate.c:729:34: error: implicit declaration of function ‘static_cpu_has’; did you mean ‘static_key_false’? [-Werror=implicit-function-declaration]
  729 |                 xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
      |                                  ^~~~~~~~~~~~~~
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
../drivers/gpu/drm/xe/xe_migrate.c:729:17: note: in expansion of macro ‘xe_gt_assert’
  729 |                 xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
      |                 ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_migrate.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/kernel/Makefile:2011: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[14:19:12] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:19:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


