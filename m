Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A615FCED63D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 19:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FAC10E1E9;
	Tue, 18 Nov 2025 19:14:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA1B10E1D3;
 Tue, 18 Nov 2025 19:14:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Fix_and_refactor_CON?=
 =?utf-8?q?FIG=5FDRM=5FXE=5FDEBUG=5FGUC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 19:14:36 -0000
Message-ID: <176349327645.6922.3702648231856155992@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
In-Reply-To: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
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

Series: drm/xe: Fix and refactor CONFIG_DRM_XE_DEBUG_GUC
URL   : https://patchwork.freedesktop.org/series/157742/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:14:02] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:14:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:../drivers/gpu/drm/xe/xe_guc_ct.c:168:33: warning: ‘struct xe_dead_ct’ declared inside parameter list will not be visible outside of this definition or declaration
  168 | static void ct_dead_fini(struct xe_dead_ct *dead) { }
      |                                 ^~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:169:33: warning: ‘struct xe_dead_ct’ declared inside parameter list will not be visible outside of this definition or declaration
  169 | static void ct_dead_init(struct xe_dead_ct *dead) { }
      |                                 ^~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘guc_ct_fini’:
../drivers/gpu/drm/xe/xe_guc_ct.c:287:25: error: ‘struct xe_guc_ct’ has no member named ‘dead’
  287 |         ct_dead_fini(&ct->dead);
      |                         ^~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘xe_guc_ct_init_noalloc’:
../drivers/gpu/drm/xe/xe_guc_ct.c:320:25: error: ‘struct xe_guc_ct’ has no member named ‘dead’
  320 |         ct_dead_init(&ct->dead);
      |                         ^~
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_guc_ct.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2010: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


