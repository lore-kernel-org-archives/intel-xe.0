Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2413BF8E48F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 23:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9410E24A;
	Thu, 16 Apr 2026 23:26:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD66810E949;
 Thu, 16 Apr 2026 23:26:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/xe=5Fsurvivability=3A_F?=
 =?utf-8?q?ix_runtime_survivability_error_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 23:26:02 -0000
Message-ID: <177638196289.470620.1668302024401916166@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416223934.769040-2-mallesh.koujalagi@intel.com>
In-Reply-To: <20260416223934.769040-2-mallesh.koujalagi@intel.com>
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

Series: drm/xe/xe_survivability: Fix runtime survivability error handling (rev3)
URL   : https://patchwork.freedesktop.org/series/164855/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_survivability_mode.c: In function ‘xe_survivability_mode_runtime_enable’:
../drivers/gpu/drm/xe/xe_survivability_mode.c:412:9: error: ‘ret’ undeclared (first use in this function); did you mean ‘net’?
  412 |         ret = create_survivability_sysfs(pdev);
      |         ^~~
      |         net
../drivers/gpu/drm/xe/xe_survivability_mode.c:412:9: note: each undeclared identifier is reported only once for each function it appears in
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_survivability_mode.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:549: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:549: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:549: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:549: drivers] Error 2
make[2]: *** [/kernel/Makefile:2105: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[23:25:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:25:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


