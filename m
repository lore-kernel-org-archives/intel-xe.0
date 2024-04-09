Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863B2C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DA810E96D;
	Tue,  9 Apr 2024 20:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoQ4orYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F51D112F14
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693094; x=1744229094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2ghyJt981rHQ5b4lkJGto+QIAjeMH4SsY+sNoBrGHc=;
 b=XoQ4orYAsmebo5Fq9XpaZzDFbYG8B01d5A+bXHPuWvv0DohUsAF7NwsL
 MpxbEN6bQHU2LfjKXTr700RR/Z5dwl/0ffp62m8WeCFRUxo8LkL5d97WE
 VWSGsYmTqlNMwJKLlT0YePIpyCDioiDIdSWypFllVv1U7OFkMD/Ux2oz9
 8GkpClkPTBMr/es+ZU3SpFOwBt50vHB1OBCWAKPNpeMv/UQBCe7MGM9EG
 JoxQgL9JtmpR7kLgOT4UYe5940LKlZci0Y8ljX6sgmpeqdzqXk2/RPQUF
 o2mTWiO0IYcTaPaAxP/40w9/87DFRGzyND/RrWLWh24h+uIzraA361lDG w==;
X-CSE-ConnectionGUID: cqHEx0yDQq60TcNa25ls7Q==
X-CSE-MsgGUID: 8T4EIC1BRmGHn2qf8BvOPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803748"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803748"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: p/XPlH/tQ7OCK/eZWp8nZw==
X-CSE-MsgGUID: /vl8+Z9aQiSlIxhDAPw3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773748"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 12/31] drm/xe/svm: Remap and provide memmap backing for GPU vram
Date: Tue,  9 Apr 2024 16:17:23 -0400
Message-Id: <20240409201742.3042626-13-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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
index fff70fc9a09e..cd5213ba182b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -129,6 +129,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_svm_devmem.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e73b9a086718..d6a14327986b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -103,6 +103,14 @@ struct xe_mem_region {
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
index 7ba2477452d7..12923fe6abae 100644
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

