Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8724BCDD560
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 23:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FAB10E273;
	Wed, 18 Sep 2024 23:51:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7599810E273;
 Wed, 18 Sep 2024 23:51:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Xe2_performance_tuning_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 23:51:33 -0000
Message-ID: <172670349347.1027297.7825219234023382204@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
In-Reply-To: <20240918204830.49880-1-gustavo.sousa@intel.com>
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

Series: Xe2 performance tuning updates
URL   : https://patchwork.freedesktop.org/series/138844/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_rtp.h:14,
                 from ../drivers/gpu/drm/xe/xe_tuning.c:13:
../drivers/gpu/drm/xe/xe_rtp_helpers.h:81:39: error: ‘DROP_FIRST_ARG’ undeclared here (not in a function)
   81 | #define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST_ARG _XE_ESC __VA_ARGS__)
      |                                       ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:18:22: note: in definition of macro ‘_XE_ESC’
   18 | #define _XE_ESC(...) __VA_ARGS__
      |                      ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:261:11: note: in expansion of macro ‘XE_RTP_DROP_CAST’
  261 |  { .reg = XE_RTP_DROP_CAST(reg_),     \
      |           ^~~~~~~~~~~~~~~~
../include/linux/args.h:25:24: note: in expansion of macro ‘XE_RTP_ACTION_SET’
   25 | #define __CONCAT(a, b) a ## b
      |                        ^
../include/linux/args.h:26:27: note: in expansion of macro ‘__CONCAT’
   26 | #define CONCATENATE(a, b) __CONCAT(a, b)
      |                           ^~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:22:30: note: in expansion of macro ‘CONCATENATE’
   22 | #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
      |                              ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:57:46: note: in expansion of macro ‘_XE_RTP_CONCAT’
   57 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_)
      |                                              ^~~~~~~~~~~~~~
../include/linux/args.h:25:24: note: in expansion of macro ‘XE_RTP_PASTE_1’
   25 | #define __CONCAT(a, b) a ## b
      |                        ^
../include/linux/args.h:26:27: note: in expansion of macro ‘__CONCAT’
   26 | #define CONCATENATE(a, b) __CONCAT(a, b)
      |                           ^~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:22:30: note: in expansion of macro ‘CONCATENATE’
   22 | #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
      |                              ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:56:52: note: in expansion of macro ‘_XE_RTP_CONCAT’
   56 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
      |                                                    ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:420:3: note: in expansion of macro ‘XE_RTP_PASTE_FOREACH’
  420 |   XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__)) \
      |   ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_tuning.c:85:4: note: in expansion of macro ‘XE_RTP_ACTIONS’
   85 |    XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
      |    ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:81:54: error: expected ‘}’ before ‘_XE_ESC’
   81 | #define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST_ARG _XE_ESC __VA_ARGS__)
      |                                                      ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:18:22: note: in definition of macro ‘_XE_ESC’
   18 | #define _XE_ESC(...) __VA_ARGS__
      |                      ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:261:11: note: in expansion of macro ‘XE_RTP_DROP_CAST’
  261 |  { .reg = XE_RTP_DROP_CAST(reg_),     \
      |           ^~~~~~~~~~~~~~~~
../include/linux/args.h:25:24: note: in expansion of macro ‘XE_RTP_ACTION_SET’
   25 | #define __CONCAT(a, b) a ## b
      |                        ^
../include/linux/args.h:26:27: note: in expansion of macro ‘__CONCAT’
   26 | #define CONCATENATE(a, b) __CONCAT(a, b)
      |                           ^~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:22:30: note: in expansion of macro ‘CONCATENATE’
   22 | #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
      |                              ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:57:46: note: in expansion of macro ‘_XE_RTP_CONCAT’
   57 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_)
      |                                              ^~~~~~~~~~~~~~
../include/linux/args.h:25:24: note: in expansion of macro ‘XE_RTP_PASTE_1’
   25 | #define __CONCAT(a, b) a ## b
      |                        ^
../include/linux/args.h:26:27: note: in expansion of macro ‘__CONCAT’
   26 | #define CONCATENATE(a, b) __CONCAT(a, b)
      |                           ^~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:22:30: note: in expansion of macro ‘CONCATENATE’
   22 | #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
      |                              ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:56:52: note: in expansion of macro ‘_XE_RTP_CONCAT’
   56 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
      |                                                    ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:420:3: note: in expansion of macro ‘XE_RTP_PASTE_FOREACH’
  420 |   XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__)) \
      |   ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_tuning.c:85:4: note: in expansion of macro ‘XE_RTP_ACTIONS’
   85 |    XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
      |    ^~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_tuning.c:13:
../drivers/gpu/drm/xe/xe_rtp.h:261:2: note: to match this ‘{’
  261 |  { .reg = XE_RTP_DROP_CAST(reg_),     \
      |  ^
../include/linux/args.h:25:24: note: in expansion of macro ‘XE_RTP_ACTION_SET’
   25 | #define __CONCAT(a, b) a ## b
      |                        ^
../include/linux/args.h:26:27: note: in expansion of macro ‘__CONCAT’
   26 | #define CONCATENATE(a, b) __CONCAT(a, b)
      |                           ^~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:22:30: note: in expansion of macro ‘CONCATENATE’
   22 | #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
      |                              ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:57:46: note: in expansion of macro ‘_XE_RTP_CONCAT’
   57 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_)
      |                                              ^~~~~~~~~~~~~~
../include/linux/args.h:25:24: note: in expansion of macro ‘XE_RTP_PASTE_1’
   25 | #define __CONCAT(a, b) a ## b
      |                        ^
../include/linux/args.h:26:27: note: in expansion of macro ‘__CONCAT’
   26 | #define CONCATENATE(a, b) __CONCAT(a, b)
      |                           ^~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:22:30: note: in expansion of macro ‘CONCATENATE’
   22 | #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
      |                              ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:56:52: note: in expansion of macro ‘_XE_RTP_CONCAT’
   56 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
      |                                                    ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:420:3: note: in expansion of macro ‘XE_RTP_PASTE_FOREACH’
  420 |   XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__)) \
      |   ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_tuning.c:85:4: note: in expansion of macro ‘XE_RTP_ACTIONS’
   85 |    XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
      |    ^~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_tuning.o] Error 1
make[7]: *** Waiting for unfinished jobs....
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[2]: *** [/kernel/Makefile:1926: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

[23:51:05] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:51:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


