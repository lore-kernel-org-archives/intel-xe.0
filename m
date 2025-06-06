Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B6DC5B555
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 00:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE94710E322;
	Fri,  6 Jun 2025 00:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lygqsJeB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E4010E322
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 00:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749169108; x=1780705108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n8mazqgM1q6SCMio6q7gMW2LsdDv+aqNyBUQH6cndCY=;
 b=lygqsJeBgpgbCEN02xoNyV2HjPftc6VNNQi/KCE87CKFJoWYpNVBk9Ts
 ZHcpo1Tqah15nVDpfL0KVqGYTLpoCTQm4KR7Ia+vEuY57CNOK44MmARYF
 MEMJrlyMsRsDDoKA2ozf/v0PqzdrhpFDltMgDoBV4QG+dy55podRw0XIw
 aPOA25ADdVxOVo0ahDSiTJvm4v3s9c9MoZPd21jErN5bgoiYlvw13bRxw
 qyeUkrLBRxWaOhTt70J7nVLtEJXJm9clZ8nEpaUIuf/7tkGTik7utL0OJ
 S5JLezM6E5wglJiekoR/ckFTvyk3ZCSvLpbvA91vcInJKmLHOidgwN6h0 g==;
X-CSE-ConnectionGUID: H2nB0xDEQoGBT4ps23y+XQ==
X-CSE-MsgGUID: L5YXzSh2Qcis5YUMugjNjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61973472"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61973472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 17:18:28 -0700
X-CSE-ConnectionGUID: 7sr0RF6GSvq7aywnOq3Qww==
X-CSE-MsgGUID: dA+9Zg5rRMeFZVQev7fS+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="149507865"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 17:18:26 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 1/8] drm/xe/sa: Avoid caching GGTT address within the
 manager
Date: Fri,  6 Jun 2025 02:18:16 +0200
Message-Id: <20250606001823.1010994-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606001823.1010994-1-tomasz.lis@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
MIME-Version: 1.0
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

Non-virtualized resources require fixups after SRIOV VF migration.
Caching GGTT references rather than re-computing them from the
underlying Buffer Object is something we want to avoid, as such
code would require additional fixup step and additional locking
around all the places where the address is accessed.

This change removes the cached GPU address from the Sub-Allocation
Manager, and introduces a function which recomputes and returns
the address instead.

v2: renamed xe_sa_manager_gpu_addr(), added kerneldoc

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  3 ++-
 drivers/gpu/drm/xe/xe_guc_buf.c    |  2 +-
 drivers/gpu/drm/xe/xe_sa.c         |  1 -
 drivers/gpu/drm/xe/xe_sa.h         | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_sa_types.h   |  1 -
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 848618acdca8..d277db00018e 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -29,6 +29,7 @@
 #include "xe_pm.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
+#include "xe_sa.h"
 #include "xe_sriov.h"
 #include "xe_tuning.h"
 #include "xe_uc_debugfs.h"
@@ -128,7 +129,7 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 
 	xe_pm_runtime_get(gt_to_xe(gt));
 	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
-				     tile->mem.kernel_bb_pool->gpu_addr);
+				     xe_sa_manager_gpu_addr(tile->mem.kernel_bb_pool));
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 14a07dca48e7..502ca3a4ee60 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -164,7 +164,7 @@ u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *p
 	if (offset < 0 || offset + size > cache->sam->base.size)
 		return 0;
 
-	return cache->sam->gpu_addr + offset;
+	return xe_sa_manager_gpu_addr(cache->sam) + offset;
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 1d43e183ca21..fedd017d6dd3 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -69,7 +69,6 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
 	}
 	sa_manager->bo = bo;
 	sa_manager->is_iomem = bo->vmap.is_iomem;
-	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
 
 	if (bo->vmap.is_iomem) {
 		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 1170ee5a81a8..99dbf0eea540 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -7,6 +7,8 @@
 
 #include <linux/sizes.h>
 #include <linux/types.h>
+
+#include "xe_bo.h"
 #include "xe_sa_types.h"
 
 struct dma_fence;
@@ -43,9 +45,20 @@ to_xe_sa_manager(struct drm_suballoc_manager *mng)
 	return container_of(mng, struct xe_sa_manager, base);
 }
 
+/**
+ * xe_sa_manager_gpu_addr - Retrieve GPU address of a back storage BO
+ * within suballocator.
+ * @sa_manager: the &xe_sa_manager struct instance
+ * Return: GGTT address of the back storage BO.
+ */
+static inline u64 xe_sa_manager_gpu_addr(struct xe_sa_manager *sa_manager)
+{
+	return xe_bo_ggtt_addr(sa_manager->bo);
+}
+
 static inline u64 xe_sa_bo_gpu_addr(struct drm_suballoc *sa)
 {
-	return to_xe_sa_manager(sa->manager)->gpu_addr +
+	return xe_sa_manager_gpu_addr(to_xe_sa_manager(sa->manager)) +
 		drm_suballoc_soffset(sa);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
index 2b070ff1292e..cb7238799dcb 100644
--- a/drivers/gpu/drm/xe/xe_sa_types.h
+++ b/drivers/gpu/drm/xe/xe_sa_types.h
@@ -12,7 +12,6 @@ struct xe_bo;
 struct xe_sa_manager {
 	struct drm_suballoc_manager base;
 	struct xe_bo *bo;
-	u64 gpu_addr;
 	void *cpu_ptr;
 	bool is_iomem;
 };
-- 
2.25.1

