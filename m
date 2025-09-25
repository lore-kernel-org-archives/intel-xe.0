Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F3ECAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 12:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4D910E8F8;
	Thu, 25 Sep 2025 12:27:36 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650DD10E8F8;
 Thu, 25 Sep 2025 12:27:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_GPU_work_period_support_fo?=
 =?utf-8?q?r_Xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Sep 2025 12:27:35 -0000
Message-ID: <175880325540.366634.7706452871613220799@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
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

Series: Add GPU work period support for Xe driver
URL   : https://patchwork.freedesktop.org/series/155039/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_device.c:68:
../drivers/gpu/drm/xe/xe_user.h:97:6: warning: no previous prototype for ‘xe_user_cancel_workers’ [-Wmissing-prototypes]
   97 | void xe_user_cancel_workers(struct xe_device* xe)
      |      ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_user.h:101:6: warning: no previous prototype for ‘xe_user_resume_workers’ [-Wmissing-prototypes]
  101 | void xe_user_resume_workers(struct xe_device* xe)
      |      ^~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_pm.c:29:
../drivers/gpu/drm/xe/xe_user.h:97:6: warning: no previous prototype for ‘xe_user_cancel_workers’ [-Wmissing-prototypes]
   97 | void xe_user_cancel_workers(struct xe_device* xe)
      |      ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_user.h:101:6: warning: no previous prototype for ‘xe_user_resume_workers’ [-Wmissing-prototypes]
  101 | void xe_user_resume_workers(struct xe_device* xe)
      |      ^~~~~~~~~~~~~~~~~~~~~~
ld: drivers/gpu/drm/xe/xe_pm.o: in function `xe_user_cancel_workers':
xe_pm.c:(.text+0x0): multiple definition of `xe_user_cancel_workers'; drivers/gpu/drm/xe/xe_device.o:xe_device.c:(.text+0xee0): first defined here
ld: drivers/gpu/drm/xe/xe_pm.o: in function `xe_user_resume_workers':
xe_pm.c:(.text+0x10): multiple definition of `xe_user_resume_workers'; drivers/gpu/drm/xe/xe_device.o:xe_device.c:(.text+0xef0): first defined here
make[3]: *** [../scripts/Makefile.vmlinux_o:72: vmlinux.o] Error 1
make[2]: *** [/kernel/Makefile:1225: vmlinux_o] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[12:27:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:27:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


