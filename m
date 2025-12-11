Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C918D41C1B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 10:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085DF10E7D0;
	Thu, 11 Dec 2025 10:23:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0938010E7D8;
 Thu, 11 Dec 2025 10:23:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Dynamic_drm=5Fpagemaps_and_Ini?=
 =?utf-8?q?tial_multi-device_SVM_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 10:23:53 -0000
Message-ID: <176544863303.76770.16031188526684576850@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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

Series: Dynamic drm_pagemaps and Initial multi-device SVM (rev4)
URL   : https://patchwork.freedesktop.org/series/156525/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/bitfield.h:10,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:8:
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘build_pt_update_batch_sram’:
../drivers/gpu/drm/xe/xe_migrate.c:2052:62: error: ‘XE_INTERCONNECT_P2P’ undeclared (first use in this function); did you mean ‘XE_INTERCONNECT_VRAM’?
 2052 |                                        sram_addr[i].proto == XE_INTERCONNECT_P2P);
      |                                                              ^~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:30:63: note: in definition of macro ‘BUILD_BUG_ON_INVALID’
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
../drivers/gpu/drm/xe/xe_assert.h:112:9: note: in expansion of macro ‘__xe_assert_msg’
  112 |         __xe_assert_msg(__xe, condition,                                                        \
      |         ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:148:9: note: in expansion of macro ‘xe_assert_msg’
  148 |         xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,                  \
      |         ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:144:41: note: in expansion of macro ‘xe_tile_assert_msg’
  144 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:2050:25: note: in expansion of macro ‘xe_tile_assert’
 2050 |                         xe_tile_assert(m->tile, sram_addr[i].proto ==
      |                         ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:2052:62: note: each undeclared identifier is reported only once for each function it appears in
 2052 |                                        sram_addr[i].proto == XE_INTERCONNECT_P2P);
      |                                                              ^~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:30:63: note: in definition of macro ‘BUILD_BUG_ON_INVALID’
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
../drivers/gpu/drm/xe/xe_assert.h:112:9: note: in expansion of macro ‘__xe_assert_msg’
  112 |         __xe_assert_msg(__xe, condition,                                                        \
      |         ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:148:9: note: in expansion of macro ‘xe_assert_msg’
  148 |         xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,                  \
      |         ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:144:41: note: in expansion of macro ‘xe_tile_assert_msg’
  144 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:2050:25: note: in expansion of macro ‘xe_tile_assert’
 2050 |                         xe_tile_assert(m->tile, sram_addr[i].proto ==
      |                         ^~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_migrate.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/kernel/Makefile:2010: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[10:23:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:23:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


