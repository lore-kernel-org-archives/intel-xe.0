Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A892CC2BA15
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB610EE69;
	Fri, 14 Jun 2024 21:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp6IXSdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A406010E2E0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401658; x=1749937658;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=N9ROBsahc0oDavW+XaAix8pYRU1Gb+GK5eqSbJVr1ZM=;
 b=Sp6IXSdIOZegw5gVO95uZzF/P/LRsKrD7+I2EOcbGoNQjjSnvESfidMI
 RRrIfeS+O46LZ0XNc9GHotvM/yTOqh6/ISFsLFQUE/nMP6SZxhkWI/Xsl
 NHESj22rx4eHLDqGsjC+JDZHgkhH6b01TejmkN5d/Jkq+vZ+i+fnAdEca
 cbo5FCRVqP/BseUtZmhZUlVoSaOJ68d2yLjm5uXC45M+uyeHppXr252xv
 aLbnHwJHGsa2JQV8GdrfUJs5UZH7UVuhLmACGDvBymdHnRXu4LXhLEHeZ
 PpsIXMCVArjGjTigGoaNVtUODJbga/taX19R4I4sXYNCtGuWq/hEUuEXY g==;
X-CSE-ConnectionGUID: w9hsyvdTRECuZgOydtGrUA==
X-CSE-MsgGUID: GBKWB1UUR7Ow+FwvFWskYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886597"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: pPuW46ONRYCYVZIThazZgg==
X-CSE-MsgGUID: yE8wMTUNRzGbBIzxzIM98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572432"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 38/44] drm/xe/svm: introduce svm migration function
Date: Fri, 14 Jun 2024 17:58:11 -0400
Message-Id: <20240614215817.1097633-38-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

xe_svm_migrate is introduced to migrate b/t two migration
vectors. This will be a callback function registered to
drm layer for svm memory migration.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 46 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  3 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 5ea851ce5083..76795c572454 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -7,8 +7,10 @@
 #include <linux/sched/mm.h>
 #include <linux/gfp.h>
 #include <drm/drm_buddy.h>
+#include <drm/drm_svm.h>
 #include "xe_ttm_vram_mgr_types.h"
 #include "xe_device_types.h"
+#include "xe_migrate.h"
 #include "xe_device.h"
 #include "xe_tile.h"
 #include "xe_svm.h"
@@ -154,3 +156,47 @@ void *xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr)
 
 	return tile->xe;
 }
+
+/**
+ * xe_svm_migrate() - migrate b/t two migration vectors.
+ * @src_vec: source migration vector
+ * @dst_vec: dst migration vector
+ *
+ * For now this function only support migration b/t system memory
+ * and device memory. It can be extended to support migration b/t
+ * two device memory regions.
+ *
+ * FIXME: right now it requires vram dpa to be physically contiguous.
+ * This is guaranteed by the DRM_BUDDY_CONTIGUOUS_ALLOCATION in
+ * xe_svm_alloc_pages. In the future we can support migration with
+ * non-contiguous vram. This requires change to xe_migrate_vram
+ * to map non-contiguous vram to contiguous device virtual address
+ * space (aka not using identity vram migrate vm mapping)
+ */
+struct dma_fence *xe_svm_migrate(struct migrate_vec *src_vec,
+				 struct migrate_vec *dst_vec)
+{
+	unsigned long npages = src_vec->npages;
+	struct xe_mem_region *xe_mr;
+	struct drm_mem_region *mr;
+	bool dst_vram = false;
+	struct xe_tile *tile;
+	dma_addr_t *sram_addr;
+	u64 vram_addr;
+
+	if (dst_vec->mr) {
+		mr = dst_vec->mr;
+		dst_vram = true;
+		vram_addr = dst_vec->addr_vec[0].dpa;
+		sram_addr = &src_vec->addr_vec[0].dma_addr;
+	} else {
+		mr = src_vec->mr;
+		vram_addr = src_vec->addr_vec[0].dpa;
+		sram_addr = &dst_vec->addr_vec[0].dma_addr;
+	}
+
+	xe_mr = container_of(mr, struct xe_mem_region, drm_mr);
+	tile = xe_mem_region_to_tile(xe_mr);
+
+	return xe_migrate_vram(tile->migrate, npages, sram_addr, vram_addr, dst_vram);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 4d7dccb97378..3c53200e85a2 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -8,10 +8,13 @@
 
 struct drm_mem_region;
 struct page;
+struct migrate_vec;
 
 int xe_svm_alloc_pages(struct drm_mem_region *mr,
 		       unsigned long npages, unsigned long *pfn);
 void xe_svm_free_page(struct page *page);
 void *xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr);
+struct dma_fence *xe_svm_migrate(struct migrate_vec *src_vec,
+				 struct migrate_vec *dst_vec);
 
 #endif
-- 
2.26.3

