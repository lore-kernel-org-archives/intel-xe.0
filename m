Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9F1C28B2E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 21:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272E710E7CB;
	Wed, 12 Mar 2025 21:11:31 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D26710E7CB;
 Wed, 12 Mar 2025 21:11:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=2C_drm/xe=3A_Multi-de?=
 =?utf-8?q?vice_GPUSVM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 21:11:30 -0000
Message-ID: <174181389011.26561.13485031402569015426@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Series: drm, drm/xe: Multi-device GPUSVM
URL   : https://patchwork.freedesktop.org/series/146227/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7a3808875589ed8834a3e6276dc5698614ebbabf
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 12 22:04:16 2025 +0100

    drm/xe: HAX: Use pcie p2p dma to test fast interconnect
    
    Knowing that this is not the correct way to support pcie_p2p over hmm
    + the dma api, pretend that pcie_p2p is a driver-private fast
    interconnect to demonstrate how multi-device SVM can be done.
    
    This has been used to test SVM on a BMG client with a pagemap
    created on a DG1 GPU over pcie p2p.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e drm-intel
bae35255bc54 drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
-:34: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#34: FILE: drivers/gpu/drm/xe/Kconfig:77:
+config DRM_XE_GPUSVM
+	bool "Enable CPU to GPU address mirroring"
+	depends on DRM_XE
+	depends on !UML
+	default y
+	select DEVICE_PRIVATE
+	help
+	  Enable this option if you want support for CPU to GPU address
+	  mirroring.
+
+	  If in doubut say "Y".
+

total: 0 errors, 1 warnings, 0 checks, 260 lines checked
5a734dd87c36 drm/xe/svm: Fix a potential bo UAF
6f3ac9d6be57 drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
-:925: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#925: 
new file mode 100644

-:960: WARNING:REPEATED_WORD: Possible repeated word: 'Migration'
#960: FILE: drivers/gpu/drm/drm_pagemap.c:31:
+ * DOC: Migration
+ * Migration granularity typically follows the GPU SVM range requests, but

-:1724: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#1724: FILE: drivers/gpu/drm/xe/Kconfig:89:
+config DRM_XE_PAGEMAP
+	bool "Enable device memory pool for SVM"
 	depends on DRM_XE_GPUSVM
 	select GET_FREE_REGION
 	default y
 	help
+	  Disable this option only if you don't want to expose local device
+	  Disable this option only if you don't want to expose local device
+	  Disable this option only if you don't want to expose local device
+	  memory for SVM. Will reduce KMD memory footprint when disabled.
+
+	  If in doubut say "Y".
 
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"

-:2143: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 1 errors, 3 warnings, 0 checks, 2035 lines checked
c08530d432dc drm/pagemap: Add a populate_mm op
265c2ec7acfc drm/xe: Implement and use the drm_pagemap populate_mm op
929458ea70b8 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap and manage lifetime
eeea42f35219 drm/pagemap: Get rid of the struct drm_pagemap_zdd::device_private_page_owner field
9752ad9f0e8c drm/xe/bo: Add a bo remove callback
8c0cea0792b2 drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:211: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#211: FILE: include/drm/drm_pagemap_util.h:37:
+	struct mutex lock;

-:218: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#218: FILE: include/drm/drm_pagemap_util.h:44:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	.lock = __MUTEX_INITIALIZER(_name.lock), \
+	.peers = LIST_HEAD_INIT(_name.peers) }

total: 0 errors, 1 warnings, 2 checks, 189 lines checked
3a04b229e96f drm/gpusvm, drm/xe: Move the device private owner to the drm_gpusvm_ctx
20e160fd046a drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
bbedcd87fc2e drm/xe: Make the PT code handle placement per PTE rather than per vma / range
c2c0d38fc7d3 drm/gpusvm: Allow mixed mappings
4718032295fe drm/xe: Add a preferred dpagemap
357d20904d2a drm/pagemap/util: Add file descriptors pointing to struct drm_pagemap
baf641b27dfa drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
0d6de0b2403f drm/xe/uapi: Add the devmem_open ioctl
-:143: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#143: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_DEVMEM_OPEN                DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVMEM_OPEN, struct drm_xe_devmem_open)

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
2e3bd9cc99c7 drm/xe/uapi: HAX: Add the xe_madvise_prefer_devmem IOCTL
-:161: WARNING:LONG_LINE: line length of 141 exceeds 100 columns
#161: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_MADVISE_PREFER_DEVMEM      DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE_PREFER_DEVMEM, struct drm_xe_madvise_prefer_devmem)

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
7a3808875589 drm/xe: HAX: Use pcie p2p dma to test fast interconnect


