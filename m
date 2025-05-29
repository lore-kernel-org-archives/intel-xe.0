Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18FC5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 20:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6968310E109;
	Thu, 29 May 2025 20:31:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6D910E109;
 Thu, 29 May 2025 20:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_debugfs_node_to_expose_pci?=
 =?utf-8?q?e_link_state_residency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 20:31:41 -0000
Message-ID: <174855070138.33093.10215827377344380906@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529192620.1227468-1-soham.purkait@intel.com>
In-Reply-To: <20250529192620.1227468-1-soham.purkait@intel.com>
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

Series: Add debugfs node to expose pcie link state residency
URL   : https://patchwork.freedesktop.org/series/149660/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_debugfs.c: In function ‘read_residency_counter’:
../drivers/gpu/drm/xe/xe_debugfs.c:191:19: error: implicit declaration of function ‘xe_pmt_telem_read’ [-Werror=implicit-function-declaration]
  191 |         int ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
      |                   ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_debugfs.c:192:33: error: implicit declaration of function ‘xe_mmio_read32’; did you mean ‘xe_map_read32’? [-Werror=implicit-function-declaration]
  192 |                                 xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
      |                                 ^~~~~~~~~~~~~~
      |                                 xe_map_read32
../drivers/gpu/drm/xe/xe_debugfs.c:192:54: error: ‘PUNIT_TELEMETRY_GUID’ undeclared (first use in this function)
  192 |                                 xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
      |                                                      ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_debugfs.c:192:54: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/xe_debugfs.c: In function ‘dgfx_link_state_residencys_show’:
../drivers/gpu/drm/xe/xe_debugfs.c:211:16: error: implicit declaration of function ‘xe_root_tile_mmio’ [-Werror=implicit-function-declaration]
  211 |         mmio = xe_root_tile_mmio(xe);
      |                ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_debugfs.c:211:14: warning: assignment to ‘struct xe_mmio *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  211 |         mmio = xe_root_tile_mmio(xe);
      |              ^
../drivers/gpu/drm/xe/xe_debugfs.c:214:53: error: ‘PCIE_LINK_L0_RESIDENCY_COUNTER’ undeclared (first use in this function)
  214 |         read_residency_counter(xe, mmio, &link_res, PCIE_LINK_L0_RESIDENCY_COUNTER, "PCIE LINK L0");
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_debugfs.c:218:53: error: ‘PCIE_LINK_L1_RESIDENCY_COUNTER’ undeclared (first use in this function)
  218 |         read_residency_counter(xe, mmio, &link_res, PCIE_LINK_L1_RESIDENCY_COUNTER, "PCIE LINK L1");
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_debugfs.c:222:53: error: ‘PCIE_LINK_L1_2_RESIDENCY_COUNTER’ undeclared (first use in this function)
  222 |         read_residency_counter(xe, mmio, &link_res, PCIE_LINK_L1_2_RESIDENCY_COUNTER, "PCIE LINK L1.2");
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/xe/xe_debugfs.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[20:31:07] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:31:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


