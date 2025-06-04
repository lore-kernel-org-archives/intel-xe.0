Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98314C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 11:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5072E10E745;
	Wed,  4 Jun 2025 11:27:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EE010E738;
 Wed,  4 Jun 2025 11:27:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gpusvm=2C_drm/pagemap?=
 =?utf-8?q?=2C_drm/xe=3A_Restructure_migration_in_preparation_for_multi-devi?=
 =?utf-8?q?ce_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 11:27:13 -0000
Message-ID: <174903643309.48110.4191668183799370562@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/gpusvm, drm/pagemap, drm/xe: Restructure migration in preparation for multi-device (rev2)
URL   : https://patchwork.freedesktop.org/series/147902/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a9ef225fa9ffcfd9c2ca05ed667d63e053baf635
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 4 11:35:36 2025 +0200

    drm/xe: Implement and use the drm_pagemap populate_mm op
    
    Add runtime PM since we might call populate_mm on a foreign device.
    Also create the VRAM bos as ttm_bo_type_kernel. This avoids the
    initial clearing and the creation of an mmap handle.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 6517275da428d10d60b2762385ca7daa3a382754 drm-intel
10a1ca9ba720 drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
-:934: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#934: 
new file mode 100644

-:969: WARNING:REPEATED_WORD: Possible repeated word: 'Migration'
#969: FILE: drivers/gpu/drm/drm_pagemap.c:31:
+ * DOC: Migration
+ * Migration granularity typically follows the GPU SVM range requests, but

-:1210: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1210: FILE: drivers/gpu/drm/drm_pagemap.c:272:
+
+

-:1328: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1328: FILE: drivers/gpu/drm/drm_pagemap.c:390:
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+					   migrate.src, npages, DMA_TO_DEVICE);

-:1355: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1355: FILE: drivers/gpu/drm/drm_pagemap.c:417:
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+				       DMA_TO_DEVICE);

-:1383: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1383: FILE: drivers/gpu/drm/drm_pagemap.c:445:
+static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
+					       struct page *fault_page,

-:1490: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1490: FILE: drivers/gpu/drm/drm_pagemap.c:552:
+	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
+						  src, dst, 0);

-:1495: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1495: FILE: drivers/gpu/drm/drm_pagemap.c:557:
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+					   dst, npages, DMA_FROM_DEVICE);

-:1512: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1512: FILE: drivers/gpu/drm/drm_pagemap.c:574:
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+				       DMA_FROM_DEVICE);

-:1545: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1545: FILE: drivers/gpu/drm/drm_pagemap.c:607:
+static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
+				       void *device_private_page_owner,

-:1625: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1625: FILE: drivers/gpu/drm/drm_pagemap.c:687:
+	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
+						  migrate.src, migrate.dst,

-:1631: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1631: FILE: drivers/gpu/drm/drm_pagemap.c:693:
+	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
+					   DMA_FROM_DEVICE);

-:1649: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1649: FILE: drivers/gpu/drm/drm_pagemap.c:711:
+		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
+					       DMA_FROM_DEVICE);

-:1760: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#1760: FILE: drivers/gpu/drm/xe/Kconfig:90:
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

-:1905: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1905: FILE: drivers/gpu/drm/xe/xe_svm.c:859:
+^I^I.check_pages_threshold = IS_DGFX(vm->xe) &&^I^I$

-:2183: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 2 errors, 3 warnings, 11 checks, 2079 lines checked
6494cc0808dd drm/pagemap: Add a populate_mm op
a9ef225fa9ff drm/xe: Implement and use the drm_pagemap populate_mm op


