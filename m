Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CDAC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 05:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C5E10E38C;
	Thu,  4 Jan 2024 05:41:01 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764A10E38C;
 Thu,  4 Jan 2024 05:41:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_First_attempt_to_kill_mem=5Fac?=
 =?utf-8?q?cess?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 04 Jan 2024 05:41:00 -0000
Message-ID: <170434686042.1841.11726671416570217889@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
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

Series: First attempt to kill mem_access
URL   : https://patchwork.freedesktop.org/series/128044/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/uapi/linux/posix_types.h:5,
                 from ../include/uapi/linux/types.h:14,
                 from ../include/linux/types.h:6,
                 from ../include/linux/kasan-checks.h:5,
                 from ../include/asm-generic/rwonce.h:26,
                 from ./arch/x86/include/generated/asm/rwonce.h:1,
                 from ../include/linux/compiler.h:251,
                 from ../include/linux/array_size.h:5,
                 from ../include/linux/kernel.h:16,
                 from ../include/linux/interrupt.h:6,
                 from ../include/drm/drm_util.h:35,
                 from ../drivers/gpu/drm/xe/xe_device.h:12,
                 from ../drivers/gpu/drm/xe/xe_device.c:6:
../drivers/gpu/drm/xe/xe_device.c: In function ‘xe_drm_compat_ioctl’:
../include/linux/stddef.h:8:14: error: called object is not a function or function pointer
    8 | #define NULL ((void *)0)
      |              ^
../include/drm/drm_ioctl.h:165:26: note: in expansion of macro ‘NULL’
  165 | #define drm_compat_ioctl NULL
      |                          ^~~~
../drivers/gpu/drm/xe/xe_device.c:159:9: note: in expansion of macro ‘drm_compat_ioctl’
  159 |   ret = drm_compat_ioctl(file, cmd, arg);
      |         ^~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_device.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:480: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1911: .] Error 2
make[1]: *** [/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

[05:40:37] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:40:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


