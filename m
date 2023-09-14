Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09DEEDE9AD
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 12:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6410E571;
	Thu, 14 Sep 2023 12:11:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9E910E571
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 12:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694693497; x=1726229497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dN75j8YI80Rs8kZwmCzC05VUWTCR3brodG1I+hCmx8I=;
 b=PMEzGXimNrnloTymdAqfiTQAbJ0ZfpQ4QOtyuXui2Xab0OVsw9bJauhW
 laJuuCfXM1Ee31PDFShEVN1AhXhor7D9g/5acP1E0M0xhKonsEuSfLuHt
 EY/3i66BuJ8Ux+l4SoC25koCLPdDXilTeGgfxIaSRRb/UJRrf1GGEbHex
 jbp3w+wfh8AlfxbCzYkzNPiM5qosyX3PxYSC7OlEi2nX41MzHdVqzWP50
 KvQYrERGmMkMslsiij3aPF481dj6jPyFoSPuNJ26lWdsmM1jgQhmU/2E6
 b8Gf7WbJbCzM3CppCxZrt7kbYYTnzsL/6a1Ibs+o0SInC0C1g2muanTsv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377838182"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="377838182"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918223810"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918223810"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 05:11:35 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 17:49:09 +0530
Message-Id: <20230914121909.3860392-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
References: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 7/7] drm/xe: Implement fdinfo memory stats
 printing
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

Use the newly added drm_print_memory_stats helper to show memory
utilisation of our objects in drm/driver specific fdinfo output.

To collect the stats we walk the per memory regions object lists
and accumulate object size into the respective drm_memory_stats
categories.

Objects with multiple possible placements are reported in multiple
regions for total and shared sizes, while other categories are
counted only for the currently active region.

V3:
  - dont use xe_bo_get/put, not needed
  - use designated initializer - Jani
  - use list_for_each_entry_rcu
  - Fix Checkpatch err - CI
V2:
  - Use static initializer for mem_type - Himal/Jani

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h         | 11 ++++
 drivers/gpu/drm/xe/xe_drm_client.c | 84 +++++++++++++++++++++++++++++-
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 4a68d869b3b5..b4c371f17bfb 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -6,6 +6,8 @@
 #ifndef _XE_BO_H_
 #define _XE_BO_H_
 
+#include <drm/ttm/ttm_tt.h>
+
 #include "xe_bo_types.h"
 #include "xe_macros.h"
 #include "xe_vm_types.h"
@@ -238,6 +240,15 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 	return PAGE_ALIGN(bo->ttm.base.size);
 }
 
+static inline bool xe_bo_has_pages(struct xe_bo *bo)
+{
+	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
+	    xe_bo_is_vram(bo))
+		return true;
+
+	return false;
+}
+
 void __xe_bo_release_dummy(struct kref *kref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 7abc1db1dc9c..0ff23708f51b 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -4,10 +4,12 @@
  */
 
 #include <drm/drm_print.h>
+#include <drm/xe_drm.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_device_types.h"
 #include "xe_drm_client.h"
@@ -103,6 +105,86 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
 	xe_drm_client_put(client);
 }
 
+static void bo_meminfo(struct xe_bo *bo,
+		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
+{
+	u64 sz = bo->size;
+	u32 mem_type;
+
+	if (bo->placement.placement)
+		mem_type = bo->placement.placement->mem_type;
+	else
+		mem_type = XE_PL_TT;
+
+	if (bo->ttm.base.handle_count > 1)
+		stats[mem_type].shared += sz;
+	else
+		stats[mem_type].private += sz;
+
+	if (xe_bo_has_pages(bo)) {
+		stats[mem_type].resident += sz;
+
+		if (!dma_resv_test_signaled(bo->ttm.base.resv,
+					    dma_resv_usage_rw(true) |
+					    DMA_RESV_USAGE_BOOKKEEP))
+			stats[mem_type].active += sz;
+		else if (mem_type == XE_PL_SYSTEM)
+			stats[mem_type].purgeable += sz;
+	}
+}
+
+static void show_meminfo(struct drm_printer *p, struct drm_file *file)
+{
+	static const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
+		[XE_PL_SYSTEM] = "system",
+		[XE_PL_TT] = "gtt",
+		[XE_PL_VRAM0] = "vram0",
+		[XE_PL_VRAM1] = "vram1",
+		[4 ... 6] = NULL,
+		[XE_PL_STOLEN] = "stolen"
+	};
+	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
+	struct xe_file *xef = file->driver_priv;
+	struct ttm_device *bdev = &xef->xe->ttm;
+	struct ttm_resource_manager *man;
+	struct xe_drm_client *client;
+	struct xe_bo *bo;
+	unsigned int id;
+	u32 mem_type;
+
+	client = xef->client;
+
+	/* Public objects. */
+	spin_lock(&file->table_lock);
+	idr_for_each_entry(&file->object_idr, bo, id)
+		bo_meminfo(bo, stats);
+	spin_unlock(&file->table_lock);
+
+	/* Internal objects. */
+	rcu_read_lock();
+	list_for_each_entry_rcu(bo, &client->bos_list, client_link) {
+		if (!bo)
+			continue;
+		bo_meminfo(bo, stats);
+	}
+	rcu_read_unlock();
+	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_type) {
+		if (!mem_type_to_name[mem_type])
+			continue;
+
+		man = ttm_manager_type(bdev, mem_type);
+
+		if (man) {
+			drm_print_memory_stats(p,
+					       &stats[mem_type],
+					       DRM_GEM_OBJECT_RESIDENT |
+					       (mem_type != XE_PL_SYSTEM ? 0 :
+					       DRM_GEM_OBJECT_PURGEABLE),
+					       mem_type_to_name[mem_type]);
+		}
+	}
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
@@ -115,6 +197,6 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
  */
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	/* show_meminfo() will be developed here */
+	show_meminfo(p, file);
 }
 #endif
-- 
2.25.1

