Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD95BCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 01:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D9910E921;
	Thu, 28 Aug 2025 01:49:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD9310E113;
 Thu, 28 Aug 2025 01:49:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Add_user_commands_to?=
 =?utf-8?q?_WA_BB_via_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 01:49:56 -0000
Message-ID: <175634579662.275924.3030747952675533427@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
In-Reply-To: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
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

Series: drm/xe: Add user commands to WA BB via configfs
URL   : https://patchwork.freedesktop.org/series/153594/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_guc.c:19:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_hw_engine.c:20:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_lrc.c:19:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_module.c:14:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_pci.c:21:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_rtp.c:12:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_psmi.c:10:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_survivability_mode.c:13:
../drivers/gpu/drm/xe/xe_configfs.h:33:5: warning: no previous prototype for ‘xe_configfs_get_ctx_restore_post_bb’ [-Wmissing-prototypes]
   33 | u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_configfs_get_ctx_restore_post_bb':
xe_hw_engine.c:(.text+0x3f0): multiple definition of `xe_configfs_get_ctx_restore_post_bb'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x760): first defined here
ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_configfs_get_ctx_restore_post_bb':
xe_lrc.c:(.text+0xb00): multiple definition of `xe_configfs_get_ctx_restore_post_bb'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x760): first defined here
ld: drivers/gpu/drm/xe/xe_module.o: in function `xe_configfs_get_ctx_restore_post_bb':
xe_module.c:(.text+0x40): multiple definition of `xe_configfs_get_ctx_restore_post_bb'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x760): first defined here
ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_configfs_get_ctx_restore_post_bb':
xe_pci.c:(.text+0x1ce0): multiple definition of `xe_configfs_get_ctx_restore_post_bb'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x760): first defined here
ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_configfs_get_ctx_restore_post_bb':
xe_psmi.c:(.text+0x0): multiple definition of `xe_configfs_get_ctx_restore_post_bb'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x760): first defined here
ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_configfs_get_ctx_restore_post_bb':
xe_rtp.c:(.text+0xc20): multiple definition of `xe_configfs_get_ctx_restore_post_bb'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x760): first defined here
ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_configfs_get_ctx_restore_post_bb':
xe_survivability_mode.c:(.text+0x3b0): multiple definition of `xe_configfs_get_ctx_restore_post_bb'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x760): first defined here
make[3]: *** [../scripts/Makefile.vmlinux_o:72: vmlinux.o] Error 1
make[2]: *** [/kernel/Makefile:1225: vmlinux_o] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[01:49:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:49:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


