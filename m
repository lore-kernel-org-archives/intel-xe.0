Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99976C61DA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 13:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7570E10E0E5;
	Mon,  6 Mar 2023 13:58:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DF3110E0E5;
 Mon,  6 Mar 2023 13:58:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2A958A00CC;
 Mon,  6 Mar 2023 13:58:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 06 Mar 2023 13:58:09 -0000
Message-ID: <167811108916.4160.6563561292847789400@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230306135504.8642-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230306135504.8642-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/?=
 =?utf-8?q?migrate=3A_Use_proper_batch_base_address?=
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

Series: drm/xe/migrate: Use proper batch base address
URL   : https://patchwork.freedesktop.org/series/114709/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_display.c: In function ‘xe_display_info_init’:
../drivers/gpu/drm/xe/xe_display.c:409:14: error: ‘CURSOR_C_OFFSET’ undeclared (first use in this function); did you mean ‘CURSOR_A_OFFSET’?
  409 |   [PIPE_C] = CURSOR_C_OFFSET, \
      |              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:422:2: note: in expansion of macro ‘__DISPLAY_DEFAULTS’
  422 |  __DISPLAY_DEFAULTS,      \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:476:56: note: in expansion of macro ‘GEN12_DISPLAY’
  476 |   xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
      |                                                        ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:409:14: note: each undeclared identifier is reported only once for each function it appears in
  409 |   [PIPE_C] = CURSOR_C_OFFSET, \
      |              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:422:2: note: in expansion of macro ‘__DISPLAY_DEFAULTS’
  422 |  __DISPLAY_DEFAULTS,      \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:476:56: note: in expansion of macro ‘GEN12_DISPLAY’
  476 |   xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
      |                                                        ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:410:14: error: ‘CURSOR_D_OFFSET’ undeclared (first use in this function); did you mean ‘CURSOR_A_OFFSET’?
  410 |   [PIPE_D] = CURSOR_D_OFFSET, \
      |              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:422:2: note: in expansion of macro ‘__DISPLAY_DEFAULTS’
  422 |  __DISPLAY_DEFAULTS,      \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_display.c:476:56: note: in expansion of macro ‘GEN12_DISPLAY’
  476 |   xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
      |                                                        ^~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/xe_display.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:500: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:500: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:500: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:500: drivers] Error 2
make[1]: *** [/kernel/Makefile:1992: .] Error 2
make: *** [Makefile:231: __sub-make] Error 2

[13:57:46] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:57:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


