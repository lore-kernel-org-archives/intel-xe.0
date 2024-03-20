Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107C8CD11BF
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 18:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9A810FEDC;
	Wed, 20 Mar 2024 18:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKl3izDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78CF10FED9
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710960008; x=1742496008;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ev+AarTBqlb5+FvqbxSqIhHk7geodR8yyNMTNd8uvyk=;
 b=WKl3izDjOiTee6mwWwbMkiUSWlP875sn5ME5rNkVvd3qqw5CL0u8erLf
 6dSAt2MMU0H0wCHh+Vjx01vKlQ0Z38UAcHRglxKfWmVJQ9hNI/fIT0xkG
 60GKM/X2K1uojy5CB8ut8lyAkgyUPTNs9SUsbxhRPEIdQ5dzd5519Jb2l
 WQGB1iwdnzCd0NWfO5zrWogunLvIY1NeR6cw0HATXeZczKw71Hd9BtrV6
 5zgo8B7AnGY1QYFEusO+lwa3kYscejqr6KmnZAgbDUBS9KB5qczaDQH8W
 IsVleKlZ5/ScYrykFRsuvjHYSkPMqvJRupO8x6SHkk4sNBjFp9qadZtz+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28382680"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="28382680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14262460"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:22 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI  1/8] drm/xe/svm: Remap and provide memmap backing for GPU vram
Date: Wed, 20 Mar 2024 14:45:35 -0400
Message-Id: <20240320184542.2239076-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Memory remap GPU vram using devm_memremap_pages, so each GPU vram
page is backed by a struct page.

Those struct pages are created to allow hmm migrate buffer b/t
GPU vram and CPU system memory using existing Linux migration
mechanism (i.e., migrating b/t CPU system memory and hard disk).

This is prepare work to enable svm (shared virtual memory) through
Linux kernel hmm framework. The memory remap's page map type is set
to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
vram page get a struct page and can be mapped in CPU page table,
but such pages are treated as GPU's private resource, so CPU can't
access them. If CPU access such page, a page fault is triggered
and page will be migrate to system memory.

For GPU device which supports coherent memory protocol b/t CPU and
GPU (such as CXL and CAPI protocol), we can remap device memory as
MEMORY_DEVICE_COHERENT. This is TBD.

v1:
Changes per code review feedback from Matt:
    change .o order in Makefile
    fix indentation
    change code order in mmio_fini
    remove unnecessary header file
    uniform xe_svm_devm_add/_remove parameter
    use tile (vs dev) as pagemap.owner during memremap
    only remap vram for platform that support usm
Changes per review feedback from Brian:
    s/xe_svm_devm_add/xe_devm_add
    s/xe_svm_devm_remove/xe_devm_remove
    move calling of xe_devm_add to xe_tile.c

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++
 drivers/gpu/drm/xe/xe_mmio.c         |  6 ++
 drivers/gpu/drm/xe/xe_svm.h          | 15 +++++
 drivers/gpu/drm/xe/xe_svm_devmem.c   | 89 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.c         |  4 ++
 6 files changed, 123 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..e2ec6d1375c0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -128,6 +128,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_svm_devmem.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..607b61326c9a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -99,6 +99,14 @@ struct xe_mem_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 1de9de4f94b6..bee3c89bc380 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -22,6 +22,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
+#include "xe_svm.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -354,6 +355,11 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 static void mmio_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		xe_devm_remove(tile, &tile->mem.vram);
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	if (xe->mem.vram.mapping)
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..e944971cfc6d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_SVM_H
+#define __XE_SVM_H
+
+struct xe_tile;
+struct xe_mem_region;
+
+int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
+void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
new file mode 100644
index 000000000000..31af56e8285a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/mm_types.h>
+#include <linux/sched/mm.h>
+
+#include "xe_device_types.h"
+#include "xe_svm.h"
+
+
+static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
+{
+	return 0;
+}
+
+static void xe_devm_page_free(struct page *page)
+{
+}
+
+static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
+	.page_free = xe_devm_page_free,
+	.migrate_to_ram = xe_devm_migrate_to_ram,
+};
+
+/**
+ * xe_devm_add: Remap and provide memmap backing for device memory
+ * @tile: tile that the memory region blongs to
+ * @mr: memory region to remap
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct resource *res;
+	void *addr;
+	int ret;
+
+	res = devm_request_free_mem_region(dev, &iomem_resource,
+					   mr->usable_size);
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		return ret;
+	}
+
+	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	mr->pagemap.range.start = res->start;
+	mr->pagemap.range.end = res->end;
+	mr->pagemap.nr_range = 1;
+	mr->pagemap.ops = &xe_devm_pagemap_ops;
+	mr->pagemap.owner = xe;
+	addr = devm_memremap_pages(dev, &mr->pagemap);
+	if (IS_ERR(addr)) {
+		devm_release_mem_region(dev, res->start, resource_size(res));
+		ret = PTR_ERR(addr);
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);
+		return ret;
+	}
+	mr->hpa_base = res->start;
+
+	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
+	return 0;
+}
+
+/**
+ * xe_devm_remove: Unmap device memory and free resources
+ * @tile: xe tile
+ * @mr: memory region to remove
+ */
+void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr)
+{
+	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
+
+	/*FIXME: Does below cause a kernel hange during moduel remove?*/
+	if (mr->hpa_base) {
+		devm_memunmap_pages(dev, &mr->pagemap);
+		devm_release_mem_region(dev, mr->pagemap.range.start,
+			mr->pagemap.range.end - mr->pagemap.range.start + 1);
+	}
+}
+
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0650b2fa75ef..f1c4f9de51df 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -14,6 +14,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_svm.h"
 
 /**
  * DOC: Multi-tile Design
@@ -158,6 +159,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
 	xe_device_mem_access_get(tile_to_xe(tile));
@@ -175,6 +177,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_tile_sysfs_init(tile);
 
+	if (xe->info.has_usm)
+		xe_devm_add(tile, &tile->mem.vram);
 err_mem_access:
 	xe_device_mem_access_put(tile_to_xe(tile));
 	return err;
-- 
2.26.3

