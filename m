Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7D2C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 06:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A484A10F26C;
	Fri, 28 Aug 2026 06:38:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332E010F26B;
 Fri, 28 Aug 2026 06:38:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5Bv4=2C1?=
 =?utf-8?q?/2=5D_drm=3A_Add_common_drm=5Fuser=5Ffence_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivasan Shanmugam" <srinivasan.shanmugam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Aug 2026 06:38:47 -0000
Message-ID: <178789912720.94692.17712411820816416724@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260828062917.4106569-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260828062917.4106569-1-srinivasan.shanmugam@amd.com>
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

Series: series starting with [v4,1/2] drm: Add common drm_user_fence helper
URL   : https://patchwork.freedesktop.org/series/172929/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_sync.h:9,
                 from ../drivers/gpu/drm/xe/xe_exec.c:21:
../drivers/gpu/drm/xe/xe_sync_types.h:6: error: unterminated #ifndef
    6 | #ifndef _XE_SYNC_TYPES_H_
      | 
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_exec.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:549: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:549: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:549: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:549: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2187: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[06:38:13] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:38:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


