Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD42CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD8410EF73;
	Wed, 24 Jun 2026 14:44:01 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C310EF73;
 Wed, 24 Jun 2026 14:44:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/=7Bi915=2Cxe=7D=3A_unify_r?=
 =?utf-8?q?untime_pm_calls_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 14:44:00 -0000
Message-ID: <178231224016.112078.2103744769532832326@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1782311749.git.jani.nikula@intel.com>
In-Reply-To: <cover.1782311749.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: unify runtime pm calls (rev2)
URL   : https://patchwork.freedesktop.org/series/168519/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_pm.c: In function ‘xe_pm_runtime_resume’:
../drivers/gpu/drm/xe/xe_pm.c:703:9: error: implicit declaration of function ‘xe_display_pm_runtime_resume_early’; did you mean ‘xe_display_pm_runtime_resume’? [-Werror=implicit-function-declaration]
  703 |         xe_display_pm_runtime_resume_early(xe);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         xe_display_pm_runtime_resume
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_pm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:548: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:548: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
make[2]: *** [/kernel/Makefile:2144: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[14:43:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:43:30] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


