Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71CEC001DF
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 07:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997EA10E2EE;
	Wed, 16 Aug 2023 07:04:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B0EE10E2EE;
 Wed, 16 Aug 2023 07:04:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 674EFACC1F;
 Wed, 16 Aug 2023 07:04:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Date: Wed, 16 Aug 2023 07:04:46 -0000
Message-ID: <169216948641.10282.3665165875865755645@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230809064213.375269-1-shekhar.chauhan@intel.com>
In-Reply-To: <20230809064213.375269-1-shekhar.chauhan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/?=
 =?utf-8?q?mtl=3A_Disable_RNE_in_SF_Unit?=
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

Series: drm/xe/mtl: Disable RNE in SF Unit
URL   : https://patchwork.freedesktop.org/series/122199/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_rtp.h:14,
                 from ../drivers/gpu/drm/xe/xe_wa.c:22:
../drivers/gpu/drm/xe/xe_rtp_helpers.h:79:39: error: ‘_XE_DROP_FIRST’ undeclared here (not in a function)
   79 | #define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
      |                                       ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:16:22: note: in definition of macro ‘_XE_ESC’
   16 | #define _XE_ESC(...) __VA_ARGS__
      |                      ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:79:31: note: in expansion of macro ‘_XE_ESC’
   79 | #define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:212:11: note: in expansion of macro ‘XE_RTP_DROP_CAST’
  212 |  { .reg = XE_RTP_DROP_CAST(reg_),     \
      |           ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:28:31: note: in expansion of macro ‘XE_RTP_ACTION_SET’
   28 | #define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:27:30: note: in expansion of macro ‘__XE_RTP_CONCAT’
   27 | #define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
      |                              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:63:46: note: in expansion of macro ‘_XE_RTP_CONCAT’
   63 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
      |                                              ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:28:31: note: in expansion of macro ‘XE_RTP_PASTE_1’
   28 | #define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:27:30: note: in expansion of macro ‘__XE_RTP_CONCAT’
   27 | #define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
      |                              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:62:60: note: in expansion of macro ‘_XE_RTP_CONCAT’
   62 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))
      |                                                            ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:372:3: note: in expansion of macro ‘XE_RTP_PASTE_FOREACH’
  372 |   XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__)) \
      |   ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_wa.c:614:4: note: in expansion of macro ‘XE_RTP_ACTIONS’
  614 |    XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
      |    ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:79:54: error: expected ‘}’ before ‘_XE_ESC’
   79 | #define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
      |                                                      ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:16:22: note: in definition of macro ‘_XE_ESC’
   16 | #define _XE_ESC(...) __VA_ARGS__
      |                      ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:79:31: note: in expansion of macro ‘_XE_ESC’
   79 | #define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:212:11: note: in expansion of macro ‘XE_RTP_DROP_CAST’
  212 |  { .reg = XE_RTP_DROP_CAST(reg_),     \
      |           ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:28:31: note: in expansion of macro ‘XE_RTP_ACTION_SET’
   28 | #define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:27:30: note: in expansion of macro ‘__XE_RTP_CONCAT’
   27 | #define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
      |                              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:63:46: note: in expansion of macro ‘_XE_RTP_CONCAT’
   63 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
      |                                              ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:28:31: note: in expansion of macro ‘XE_RTP_PASTE_1’
   28 | #define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:27:30: note: in expansion of macro ‘__XE_RTP_CONCAT’
   27 | #define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
      |                              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:62:60: note: in expansion of macro ‘_XE_RTP_CONCAT’
   62 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))
      |                                                            ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:372:3: note: in expansion of macro ‘XE_RTP_PASTE_FOREACH’
  372 |   XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__)) \
      |   ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_wa.c:614:4: note: in expansion of macro ‘XE_RTP_ACTIONS’
  614 |    XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
      |    ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:212:2: note: to match this ‘{’
  212 |  { .reg = XE_RTP_DROP_CAST(reg_),     \
      |  ^
../drivers/gpu/drm/xe/xe_rtp_helpers.h:16:22: note: in definition of macro ‘_XE_ESC’
   16 | #define _XE_ESC(...) __VA_ARGS__
      |                      ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:28:31: note: in expansion of macro ‘XE_RTP_ACTION_SET’
   28 | #define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:27:30: note: in expansion of macro ‘__XE_RTP_CONCAT’
   27 | #define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
      |                              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:63:46: note: in expansion of macro ‘_XE_RTP_CONCAT’
   63 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
      |                                              ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:28:31: note: in expansion of macro ‘XE_RTP_PASTE_1’
   28 | #define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
      |                               ^~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:27:30: note: in expansion of macro ‘__XE_RTP_CONCAT’
   27 | #define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
      |                              ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp_helpers.h:62:60: note: in expansion of macro ‘_XE_RTP_CONCAT’
   62 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))
      |                                                            ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_rtp.h:372:3: note: in expansion of macro ‘XE_RTP_PASTE_FOREACH’
  372 |   XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__)) \
      |   ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_wa.c:614:4: note: in expansion of macro ‘XE_RTP_ACTIONS’
  614 |    XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
      |    ^~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_wa.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[1]: *** [/kernel/Makefile:2026: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[07:04:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:04:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


