Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A155C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 17:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BA210E264;
	Tue, 20 May 2025 17:06:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114A010E264;
 Tue, 20 May 2025 17:06:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Add_configfs_to_load?=
 =?utf-8?q?_with_fewer_engines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 17:06:35 -0000
Message-ID: <174776079504.6224.4360868318913509191@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520-engine-mask-v1-1-ce6daf16d23b@intel.com>
In-Reply-To: <20250520-engine-mask-v1-1-ce6daf16d23b@intel.com>
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

Series: drm/xe: Add configfs to load with fewer engines
URL   : https://patchwork.freedesktop.org/series/149259/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_hw_engine.c:20:
../drivers/gpu/drm/xe/xe_configfs.h:23:5: warning: no previous prototype for ‘xe_configfs_get_engine_allowed’ [-Wmissing-prototypes]
   23 | u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_module.c:14:
../drivers/gpu/drm/xe/xe_configfs.h:23:5: warning: no previous prototype for ‘xe_configfs_get_engine_allowed’ [-Wmissing-prototypes]
   23 | u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_survivability_mode.c:13:
../drivers/gpu/drm/xe/xe_configfs.h:23:5: warning: no previous prototype for ‘xe_configfs_get_engine_allowed’ [-Wmissing-prototypes]
   23 | u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ld: drivers/gpu/drm/xe/xe_module.o: in function `xe_configfs_get_engine_allowed':
xe_module.c:(.text+0x40): multiple definition of `xe_configfs_get_engine_allowed'; drivers/gpu/drm/xe/xe_hw_engine.o:xe_hw_engine.c:(.text+0x3f0): first defined here
ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_configfs_get_engine_allowed':
xe_survivability_mode.c:(.text+0x2b0): multiple definition of `xe_configfs_get_engine_allowed'; drivers/gpu/drm/xe/xe_hw_engine.o:xe_hw_engine.c:(.text+0x3f0): first defined here
make[3]: *** [../scripts/Makefile.vmlinux_o:72: vmlinux.o] Error 1
make[2]: *** [/kernel/Makefile:1217: vmlinux_o] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[17:06:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:06:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


