Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767A1EB1074
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 15:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387EA10E717;
	Tue, 10 Mar 2026 15:50:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2943B10E2C4;
 Tue, 10 Mar 2026 15:50:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_AuxCCS_handling_and_render_com?=
 =?utf-8?q?pression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Mar 2026 15:50:51 -0000
Message-ID: <177315785115.340340.6035750282889431459@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310123453.54346-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260310123453.54346-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers
URL   : https://patchwork.freedesktop.org/series/162953/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_lrc.c: In function ‘xe_lrc_ctx_init’:
../drivers/gpu/drm/xe/xe_lrc.c:1577:43: error: implicit declaration of function ‘_MASKED_BIT_ENABLE’; did you mean ‘REG_MASKED_FIELD_ENABLE’? [-Werror=implicit-function-declaration]
 1577 |                 state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
      |                                           ^~~~~~~~~~~~~~~~~~
      |                                           REG_MASKED_FIELD_ENABLE
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_lrc.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:548: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:548: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
make[2]: *** [/kernel/Makefile:2101: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[15:50:17] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:50:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


