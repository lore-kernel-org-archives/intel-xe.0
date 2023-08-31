Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF18DC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E0A10E19B;
	Thu, 31 Aug 2023 08:58:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B368410E5DA
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693472302; x=1725008302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WdsXUDhS4B56X3d7dWdgB7yjIflzSXYQgVP1lAX4Cgs=;
 b=SNnxt4t3IC49mkxI3Kh0wZ1h3hd6qS+O3k3zGgWUdgnPQWeGTtobJOG6
 D1utVWxzRjr2BnMXJk5u8qTBujXA0eTMyxSP3DCuxgYBKEvKptJxnDUk9
 3eWch0gMxEjls6yH9H5CYw9xwCjGNk5u9WXM0h+99SEEslRrK5ZUUGFYf
 NDtPtw8YzoR4zssog4c+Yc76R0IGD1flk91VWAWuE34ym2JVFQ7ECgnqq
 mVcyrq8JZtsZK4E6rAcIxpJkpPDeZY+8+HYEFRB/vZh8Eff+i+UkLZ6Bq
 i+WR2k5v7/3tWCcN4nkI+/e5CptfFt46Nt3N6HTicUyVodHvvWPCXQbw+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375814205"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375814205"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 01:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716257408"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="716257408"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 01:58:20 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 14:35:36 +0530
Message-Id: <20230831090536.2949934-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/7] drm/xe: Implement fdinfo memory stats
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h         |  11 +++
 drivers/gpu/drm/xe/xe_drm_client.c | 103 ++++++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0823dda0f31b..538a9ec7f4c3 100644
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
@@ -258,6 +260,15 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
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
index 00b28a08909f..28b4c8e608f8 100644
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
@@ -110,6 +112,105 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
 	return true;
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
+	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
+	struct xe_file *xef = file->driver_priv;
+	struct ttm_device *bdev = &xef->xe->ttm;
+	struct ttm_resource_manager *man;
+	struct xe_drm_client *client;
+	struct list_head *pos;
+	struct xe_bo *bo;
+	unsigned int id;
+	char name[16];
+	u32 mem_type;
+	int ret = 0;
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
+	list_for_each_rcu(pos, &client->bos_list) {
+		bo = xe_bo_get(list_entry(pos, typeof(*bo),
+					  client_link));
+		if (!bo)
+			continue;
+		bo_meminfo(bo, stats);
+		xe_bo_put(bo);
+	}
+	rcu_read_unlock();
+	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_type) {
+
+		switch (mem_type) {
+		case XE_PL_SYSTEM:
+			sprintf(name, "system");
+			break;
+		case XE_PL_TT:
+			sprintf(name, "gtt");
+			break;
+		case XE_PL_VRAM0:
+			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
+			break;
+		case XE_PL_VRAM1:
+			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
+			break;
+		case XE_PL_STOLEN:
+			sprintf(name, "stolen");
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+
+		if (ret == -EINVAL)
+			continue;
+
+		man = ttm_manager_type(bdev, mem_type);
+
+		if (man) {
+			drm_print_memory_stats(p,
+					       &stats[mem_type],
+					       DRM_GEM_OBJECT_RESIDENT |
+					       DRM_GEM_OBJECT_PURGEABLE,
+					       name);
+		}
+	}
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
@@ -122,6 +223,6 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
  */
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	/* show_meminfo() will be developed here */
+	show_meminfo(p, file);
 }
 #endif
-- 
2.25.1

