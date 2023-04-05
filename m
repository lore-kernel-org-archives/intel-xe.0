Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD82C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31F810EA61;
	Wed,  5 Apr 2023 23:34:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EFF10EA7A
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680737642; x=1712273642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0qd5ig6gywawCIMWMhl4ycFxj5/OdnZ0Ey/pLsjmaw4=;
 b=gMG/S0CzgMkknTaQbpQloT5T2rww/Ryjf+r26amjOQhi38y98MdNJBuQ
 uVMLMY/470Zll/UInvoyXfOSbMjyVfg3kuqAQYX09/s6AbA/QuF6Lydxu
 Vxz6KnpZtJdYS1JBKs0mHi4yiYskhUweS5ASO9zSwz+5BJrS+/i83sy+9
 9M6R8YA8HXq7dL++1ka/UKhpA7LeRyTZqjt+NL6nD71Df5rNkaLA9vLTa
 VpkGSF03ELMbvbl20ROggLqDahaWXF1dB7RO0csasHzwGYF6TmGR1qtCa
 ioMDv4demrVcudZEWGAcAiJkWet4Wf+d1uYZ+YvCF2YTYUthvF7D9TVwy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326632207"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="326632207"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756165815"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="756165815"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:33:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  5 Apr 2023 16:34:03 -0700
Message-Id: <20230405233403.151088-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405233403.151088-1-matthew.brost@intel.com>
References: <20230405233403.151088-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Drop coalescing of GGTT invalidations
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

Causing a bunch of hangs driver load and in user space. Benefit is
rather small too, so just drop this for to stablize the stack.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  1 -
 drivers/gpu/drm/xe/xe_bo_types.h   |  2 --
 drivers/gpu/drm/xe/xe_ggtt.c       | 25 +------------------------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
 4 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5460e6fe3c1f..c7f175a149be 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -975,7 +975,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 			return bo;
 	}
 
-	bo->requested_size = size;
 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index db217500a970..6071611a2b29 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -23,8 +23,6 @@ struct xe_vm;
 struct xe_bo {
 	/** @ttm: TTM base buffer object */
 	struct ttm_buffer_object ttm;
-	/** @requested_size: Requested size of this buffer object */
-	size_t requested_size;
 	/** @size: Size of this buffer object after alignment adjusting */
 	size_t size;
 	/** @flags: flags for this buffer object */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a430d1568890..93f78aba2c8e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -273,15 +273,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	if (bo->size == bo->requested_size) {
-		pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
-		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
-	}
-
-	if (ggtt->invalidate) {
-		xe_ggtt_invalidate(ggtt->gt);
-		ggtt->invalidate = false;
-	}
+	xe_ggtt_invalidate(ggtt->gt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -302,19 +294,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	/*
-	 * We add an extra page when mapping a BO in the GGTT so we can coalesce
-	 * GGTT invalidations. Without this extra page GGTT prefetches can leave
-	 * entries in the TLB pointing to an invalidation GGTT entry when in
-	 * fact we have programmed this GGTT entry to a valid entry. BO aligned
-	 * to 64k already have padding so no need to add an extra page.
-	 */
-	if (bo->size == bo->requested_size) {
-		size += SZ_4K;
-		if (end != U64_MAX)
-			end += SZ_4K;
-	}
-
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, size,
 					  alignment, 0, start, end, 0);
@@ -344,8 +323,6 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	drm_mm_remove_node(node);
 	node->size = 0;
 
-	ggtt->invalidate = true;
-
 	mutex_unlock(&ggtt->lock);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 8198aa784654..ea70aaef4b31 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -26,8 +26,6 @@ struct xe_ggtt {
 	u64 __iomem *gsm;
 
 	struct drm_mm mm;
-
-	bool invalidate;
 };
 
 #endif
-- 
2.34.1

