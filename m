Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B6CC04AAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169EC10E5D0;
	Thu, 21 Sep 2023 11:42:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA9B10E5D3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296539; x=1726832539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8TIUNiR2ExCHWLFiHTvCLa4wo+wm2UuhkGhdXNYBPFY=;
 b=F9Jwqj0AnXX/xZobxW3sKju8UcQVWr6Eq4/8DtrNyHkSQOQsorsLUK4y
 OSdQJMCe6vzCuwOfjDr74T/lyDoRrgM1rofErriv2onqCht7zJ4pD2zIx
 WOckPc2je8x0sC9W5RBCpJ5ZRhYiQg1wo0oIz/IrZRsbEnYrrut3LzAhk
 CyCRec2nQwH9OAtnXsFsL2UedHPcnRyynz9RByCU5x8OO+CoK+0CYRK4J
 YEa+b0fdsIcrXmWjWsLpuJ0cmAjNsl35DKRDxBQiv2vJ4EKJKYkUKFpDj
 6RA29XLEQs0jbtiFBlRqef3mAL+YYOpopeXQJ9l0YilNAwRtySffc2U20 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370812857"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="370812857"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696697361"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696697361"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 04:42:17 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 17:20:02 +0530
Message-Id: <20230921115002.22884-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921115002.22884-1-tejas.upadhyay@intel.com>
References: <20230921115002.22884-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 7/7] drm/xe: Implement fdinfo memory stats
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

V4:
  - Remove rcu lock - Auld/Thomas
  - take refcnt only if its non-zero - Auld
  - DMA_RESV_USAGE_BOOKKEEP covers all fences - Auld
  - covert to xe_bo for public objects
V3:
  - dont use xe_bo_get/put, not needed
  - use designated initializer - Jani
  - use list_for_each_entry_rcu
  - Fix Checkpatch err - CI
V2:
  - Use static initializer for mem_type - Himal/Jani

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h         | 11 ++++
 drivers/gpu/drm/xe/xe_drm_client.c | 89 +++++++++++++++++++++++++++++-
 2 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9097bcc13209..e3c90d45e723 100644
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
index b5ac9bc1f685..82d1305e831f 100644
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
@@ -100,6 +102,91 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
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
+	struct drm_gem_object *obj;
+	struct xe_bo *bo;
+	unsigned int id;
+	u32 mem_type;
+
+	client = xef->client;
+
+	/* Public objects. */
+	spin_lock(&file->table_lock);
+	idr_for_each_entry(&file->object_idr, obj, id) {
+		struct xe_bo *bo = gem_to_xe_bo(obj);
+
+		bo_meminfo(bo, stats);
+	}
+	spin_unlock(&file->table_lock);
+
+	/* Internal objects. */
+	spin_lock(&client->bos_lock);
+	list_for_each_entry_rcu(bo, &client->bos_list, client_link) {
+		if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
+			continue;
+		bo_meminfo(bo, stats);
+		xe_bo_put(bo);
+	}
+	spin_unlock(&client->bos_lock);
+
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
@@ -112,6 +199,6 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
  */
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	/* show_meminfo() will be developed here */
+	show_meminfo(p, file);
 }
 #endif
-- 
2.25.1

