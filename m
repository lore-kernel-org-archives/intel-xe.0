Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191B0C5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFBA10F890;
	Thu, 14 Mar 2024 03:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL82lSqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02DD10F888
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 03:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710386628; x=1741922628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y+9FCXHTYiq3vSPQGSYeoyRROHWovpe/zQHJfMU8Wjc=;
 b=SL82lSqa3n5dUFdfUwkhp7OsDFglADFYmicSq9WdzY3sDrrfiGIMXh7g
 T6znMCC7tsREvtSxJaYDXVCBA9itymD688yjqN1vAHs5XpyRwLtmep1oZ
 XZ9LjlUXgOoHbnu3R9hs2yaLf6LP9w4YSTvXRi9FWYgNrpmeaKTaoEsLF
 R8eLDEyxczNj4tMQUFgHEd+EF8D+FoaulOioEZShHjJ+/0ouly1Uf3iGp
 tCaZJPKISD5vL5FgtCq/eROnahXlEX9j3lp/x7AoZV4QEzH9x3Y+PgLll
 snWCiemuwj7RGOU8mRsHQm6xdgzd4iFLKvRkTyYX9M2+tD976CWN2YJYE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8966475"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="8966475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12084616"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, airlied@gmail.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU vram
Date: Wed, 13 Mar 2024 23:35:49 -0400
Message-Id: <20240314033553.1379444-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240314033553.1379444-1-oak.zeng@intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++
 drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
 drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
 drivers/gpu/drm/xe/xe_svm_devmem.c   | 91 ++++++++++++++++++++++++++++
 5 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c531210695db..840467080e59 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -142,7 +142,8 @@ xe-y += xe_bb.o \
 	xe_vram_freq.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
-	xe_wopcm.o
+	xe_wopcm.o \
+	xe_svm_devmem.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..f27c3bee8ce7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -99,6 +99,15 @@ struct xe_mem_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+    struct dev_pagemap pagemap;
+    /**
+     * @hpa_base: base host physical address
+     *
+     * This is generated when remap device memory as ZONE_DEVICE
+     */
+    resource_size_t hpa_base;
+
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index e3db3a178760..0d795394bc4c 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -22,6 +22,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
+#include "xe_svm.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
+		xe_svm_devm_add(tile, &tile->mem.vram);
 	}
 
 	xe->mem.vram.actual_physical_size = total_size;
@@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 static void mmio_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
+    struct xe_tile *tile;
+    u8 id;
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	if (xe->mem.vram.mapping)
 		iounmap(xe->mem.vram.mapping);
+
+	for_each_tile(tile, xe, id)
+		xe_svm_devm_remove(xe, &tile->mem.vram);
+
 }
 
 static int xe_verify_lmem_ready(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..09f9afb0e7d4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_SVM_H
+#define __XE_SVM_H
+
+#include "xe_device_types.h"
+
+int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
+void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mem);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
new file mode 100644
index 000000000000..63b7a1961cc6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/mm_types.h>
+#include <linux/sched/mm.h>
+
+#include "xe_device_types.h"
+#include "xe_trace.h"
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
+ * xe_svm_devm_add: Remap and provide memmap backing for device memory
+ * @tile: tile that the memory region blongs to
+ * @mr: memory region to remap
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
+{
+	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
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
+	mr->pagemap.owner = tile->xe->drm.dev;
+	addr = devm_memremap_pages(dev, &mr->pagemap);
+	if (IS_ERR(addr)) {
+		devm_release_mem_region(dev, res->start, resource_size(res));
+		ret = PTR_ERR(addr);
+		drm_err(&tile->xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);
+		return ret;
+	}
+	mr->hpa_base = res->start;
+
+	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
+	return 0;
+}
+
+/**
+ * xe_svm_devm_remove: Unmap device memory and free resources
+ * @xe: xe device
+ * @mr: memory region to remove
+ */
+void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mr)
+{
+	/*FIXME: below cause a kernel hange during moduel remove*/
+#if 0
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+
+	if (mr->hpa_base) {
+		devm_memunmap_pages(dev, &mr->pagemap);
+		devm_release_mem_region(dev, mr->pagemap.range.start,
+			mr->pagemap.range.end - mr->pagemap.range.start +1);
+	}
+#endif
+}
+
-- 
2.26.3

