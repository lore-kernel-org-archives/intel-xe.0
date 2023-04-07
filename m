Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E37C76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 03:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB7F10E36C;
	Fri,  7 Apr 2023 03:27:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08810E1D1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 03:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680838077; x=1712374077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fucG7sevqAln43QQ/QHy8cP09rkH2otCAOInPFspLCs=;
 b=ei3sSryHTyQhrpLjkp0S83t+DOAGxxrPvZ2FlkVzRZk/P+D8x7CFvsrB
 TfF6ihT9Ov/OlOKKAY2ayVjpY7vtLUFrdGVgZ6roQghJJikFBubqweSe9
 d4AaE10FgYNIigWamFYQz396FpD4JIsM+ntuRXPXSVebT4ebFLw7NpObM
 1nxk0XdotEmQcc1/ofvAz5q4/0DaJYRj0RIcey6kNQ/0bjmIXLrLKPMO1
 kFnnjfSi9Czxj1kp+lPq9Es+dHXVS0r0mDMmWrVNGXuiPTBwA5DGak5Vj
 yt/DFrW1HX/uZS45XylRsFOh2ghOEiKTxDy5K68MGcxHFy4nOO7bL+uev A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323289237"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="323289237"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664752543"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="664752543"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:27:55 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 20:27:50 -0700
Message-Id: <20230407032751.31632-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230407032751.31632-1-niranjana.vishwanathapura@intel.com>
References: <20230407032751.31632-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] Revert "drm/xe: Pad GGTT mapping with an
 extra page pointing to scratch"
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 70e94be2729e5c725c53b1aa2d10c073566bb1ca.

Resolve minor conflict by retaining XE_BO_CREATE_VRAM_MASK flag.

Coalescing GGTT invalidations is causing a bunch of hangs during
driver load and in user space. Benefit is rather small too, so
revert it to stabilize the stack.

Tested-by: Matt Roper <matthew.d.roper@intel.com>  # ADL-P
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  1 -
 drivers/gpu/drm/xe/xe_bo.h       |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h |  4 +---
 drivers/gpu/drm/xe/xe_ggtt.c     | 30 +++++++++---------------------
 4 files changed, 11 insertions(+), 25 deletions(-)

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
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8f5a7ad10d09..dd58edcb9398 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -213,6 +213,7 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
+	XE_BUG_ON(bo->ggtt_node.size > bo->size);
 	XE_BUG_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
 	return bo->ggtt_node.start;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index db217500a970..06de3330211d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -23,9 +23,7 @@ struct xe_vm;
 struct xe_bo {
 	/** @ttm: TTM base buffer object */
 	struct ttm_buffer_object ttm;
-	/** @requested_size: Requested size of this buffer object */
-	size_t requested_size;
-	/** @size: Size of this buffer object after alignment adjusting */
+	/** @size: Size of this buffer object */
 	size_t size;
 	/** @flags: flags for this buffer object */
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a430d1568890..2e31b1ce3e4c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -263,6 +263,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
+	struct xe_device *xe = gt_to_xe(ggtt->gt);
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
@@ -273,12 +274,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	if (bo->size == bo->requested_size) {
-		pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
-		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
-	}
-
-	if (ggtt->invalidate) {
+	/* XXX: Without doing this everytime on integrated driver load fails */
+	if (ggtt->invalidate || !IS_DGFX(xe)) {
 		xe_ggtt_invalidate(ggtt->gt);
 		ggtt->invalidate = false;
 	}
@@ -287,7 +284,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
-	u64 size = bo->size;
 	int err;
 	u64 alignment = GEN8_PAGE_SIZE;
 
@@ -295,6 +291,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		alignment = SZ_64K;
 
 	if (XE_WARN_ON(bo->ggtt_node.size)) {
+		/* Someone's already inserted this BO in the GGTT */
+		XE_BUG_ON(bo->ggtt_node.size != bo->size);
 		return 0;
 	}
 
@@ -302,21 +300,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -354,6 +339,9 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	if (XE_WARN_ON(!bo->ggtt_node.size))
 		return;
 
+	/* This BO is not currently in the GGTT */
+	XE_BUG_ON(bo->ggtt_node.size != bo->size);
+
 	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27

