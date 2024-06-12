Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9524C2BA2B
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6611E10E779;
	Wed, 12 Jun 2024 02:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrXLMPLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07610E460
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158541; x=1749694541;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vqI6Q79Shgu6/RSabVHeZqEp/y4rnwuo0OIRDKsbWNA=;
 b=VrXLMPLyeqMCkC633EWj1JmmF+fw/pvq5MrWKVkEF8Q7wTQtaT7RlzQ5
 kePyY7/FfTtdU6ksZ4CpQoz0n4BXTk20dU4rlQYNWTlGWn55QWq9CAgJJ
 p8pbSlP60Cc1BsqdJuGfdkHoLAOiotqf895USg0uKNuVgQFLXQIggbq/n
 7XKsva85XrRMk4S/AaaJ/70qvoubQUogMZ4nBQQnKx19Rqbls8XRsL3Jm
 56Nh6UEiIna9HKqwAFbsXsEY33sx8QuGcsNymu/Tg9FPwFEWvL8dOOOja
 FCAKtWGRMx3QKP1nYSRSgcApvA3dh9tB4cSFIwBf+uNamGki7AtURcygN A==;
X-CSE-ConnectionGUID: akaaj1t/SD6yaU/AixlZ7A==
X-CSE-MsgGUID: 1cT/TeSvSTS5CKXExqTr7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427821"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: bla99wWkTeqOAF/axphzPg==
X-CSE-MsgGUID: PNvVTfYDSB+vbOmZDYEYPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763656"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 37/43] drm/xe/svm: introduce svm migration function
Date: Tue, 11 Jun 2024 22:25:59 -0400
Message-Id: <20240612022605.385062-37-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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
index d2838ce46eaf..014b70250abd 100644
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
@@ -154,3 +156,47 @@ void* xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr)
 
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
+struct dma_fence* xe_svm_migrate(struct migrate_vec *src_vec,
+            struct migrate_vec *dst_vec)
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
index b70551d12578..1b891b2a7587 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -8,10 +8,13 @@
 
 struct drm_mem_region;
 struct page;
+struct migrate_vec;
 
 int xe_svm_alloc_pages(struct drm_mem_region *mr,
             unsigned long npages, unsigned long *pfn);
 void xe_svm_free_page(struct page *page);
 void* xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr);
+struct dma_fence* xe_svm_migrate(struct migrate_vec *src_vec,
+            struct migrate_vec *dst_vec);
 
 #endif
-- 
2.26.3

