Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D30C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB14210E428;
	Wed, 30 Jul 2025 08:10:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331FA10E428;
 Wed, 30 Jul 2025 08:10:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Patch_=22Revert_=22drm/xe/forc?=
 =?utf-8?q?ewake=3A_Add_a_helper_xe=5Fforce=5Fwake=5Fref=5Fhas=5Fdomain=28?=
 =?utf-8?q?=29=22=22_has_been_added_to_the_6=2E12-stable_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: gregkh@linuxfoundation.org
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 08:10:52 -0000
Message-ID: <175386305220.197930.16066747820045107544@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729110525.49838-5-tomitamoeko@gmail.com>
In-Reply-To: <20250729110525.49838-5-tomitamoeko@gmail.com>
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

Series: Patch "Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"" has been added to the 6.12-stable tree
URL   : https://patchwork.freedesktop.org/series/152264/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_devcoredump.c: In function ‘xe_devcoredump_deferred_snap_work’:
../drivers/gpu/drm/xe/xe_devcoredump.c:294:14: error: implicit declaration of function ‘xe_force_wake_ref_has_domain’ [-Werror=implicit-function-declaration]
  294 |         if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_devcoredump.o] Error 1
make[7]: *** Waiting for unfinished jobs....
../drivers/gpu/drm/xe/xe_drm_client.c: In function ‘force_wake_get_any_engine’:
../drivers/gpu/drm/xe/xe_drm_client.c:305:14: error: implicit declaration of function ‘xe_force_wake_ref_has_domain’ [-Werror=implicit-function-declaration]
  305 |         if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_drm_client.o] Error 1
../drivers/gpu/drm/xe/xe_eu_stall.c: In function ‘xe_eu_stall_stream_enable’:
../drivers/gpu/drm/xe/xe_eu_stall.c:646:14: error: implicit declaration of function ‘xe_force_wake_ref_has_domain’ [-Werror=implicit-function-declaration]
  646 |         if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_RENDER)) {
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_eu_stall.o] Error 1
make[6]: *** [../scripts/Makefile.build:555: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:555: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:555: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:555: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[08:10:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:10:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


