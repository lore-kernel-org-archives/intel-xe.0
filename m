Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC792CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 13:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805A410E432;
	Mon, 20 Oct 2025 13:04:45 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4648310E432;
 Mon, 20 Oct 2025 13:04:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Some_migration_fixes/improveme?=
 =?utf-8?q?nts_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Oct 2025 13:04:44 -0000
Message-ID: <176096548428.32873.13593736706329308958@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251020125431.41153-9-matthew.auld@intel.com>
In-Reply-To: <20251020125431.41153-9-matthew.auld@intel.com>
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

Series: Some migration fixes/improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/155997/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:04:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:04:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_guc.c:20:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_hw_engine.c:20:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_lrc.c:20:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_module.c:14:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_pci.c:21:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_rtp.c:12:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_psmi.c:10:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_survivability_mode.c:13:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_sriov_pf.c:11:
../drivers/gpu/drm/xe/xe_configfs.h:46:6: warning: no previous prototype for ‘xe_configfs_migrate_disable_mem_copy’ [-Wmissing-prototypes]
   46 | bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_hw_engine.c:(.text+0x410): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_lrc.c:(.text+0xbe0): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
ld: drivers/gpu/drm/xe/xe_module.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_module.c:(.text+0x40): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_pci.c:(.text+0x23b0): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_psmi.c:(.text+0x0): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_rtp.c:(.text+0xbd0): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_survivability_mode.c:(.text+0x3b0): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_configfs_migrate_disable_mem_copy':
xe_sriov_pf.c:(.text+0x40): multiple definition of `xe_configfs_migrate_disable_mem_copy'; drivers/gpu/drm/xe/xe_guc.o:xe_guc.c:(.text+0x15a0): first defined here
make[3]: *** [../scripts/Makefile.vmlinux_o:72: vmlinux.o] Error 1
make[2]: *** [/kernel/Makefile:1223: vmlinux_o] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


