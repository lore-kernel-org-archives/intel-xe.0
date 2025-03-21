Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07967C35FFF
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 11:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDC010E798;
	Fri, 21 Mar 2025 11:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kg+urkj2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6287110E798
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742556613; x=1774092613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a49N05U0+2hRyyd7aN9MSlG3BAhH3H+GaZPnplFVqbQ=;
 b=Kg+urkj2/HCCSyBW1yjrt5IiE1LA7L12f4B8ahmOQMM2V9vrgZ+1pQS5
 SinU6KvPtmT9jqMwG6u/DB98qHwiTDLkwmz3+JTUQAbc9i1xu1pCH75Rz
 66Ii2B9UOv7zp8mGuwFbqdABjO7LK/7vf7EQjRGlb77X/cc/xPVrsitMB
 1o1S2x1ZHb8v4goAFodPorucQ/7MDUbCh08z72i0fuy3gj3wJn1ZIuavL
 Te53Fe2kBch70Y8pwhAd5jqjKHAOUSHPLhD1lDw9XiWf3+jQAuDspa/wU
 gn5rPEqxvcE42GbpmpfcQfKr2SXDTbJv4T58oh7fV+ji72/oDsHXkKGoS A==;
X-CSE-ConnectionGUID: 7pC4uz00SquI2BbiTJ21iQ==
X-CSE-MsgGUID: aSgtOm41QZqh8tT6q3ozkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47594999"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="47594999"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:30:13 -0700
X-CSE-ConnectionGUID: CTEnMXxFS5q+jxUv2VRWGQ==
X-CSE-MsgGUID: 2ipCbG5EQfSYP2VuzmGrBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="127525845"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:30:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Simplify pinned bo iteration
Date: Fri, 21 Mar 2025 12:29:59 +0100
Message-ID: <20250321112959.13037-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Introduce and use a helper to iterate over the various pinned bo lists.
There are a couple of slight functional changes:

1) GGTT maps are now performed with the bo locked.
2) If the per-bo callback fails, keep the bo on the original list.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  10 +-
 drivers/gpu/drm/xe/xe_bo_evict.c | 209 ++++++++++++-------------------
 2 files changed, 86 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 64f9c936eea0..070dafdad66b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2102,12 +2102,10 @@ int xe_bo_pin_external(struct xe_bo *bo)
 		if (err)
 			return err;
 
-		if (xe_bo_is_vram(bo)) {
-			spin_lock(&xe->pinned.lock);
-			list_add_tail(&bo->pinned_link,
-				      &xe->pinned.external_vram);
-			spin_unlock(&xe->pinned.lock);
-		}
+		spin_lock(&xe->pinned.lock);
+		list_add_tail(&bo->pinned_link,
+			      &xe->pinned.external_vram);
+		spin_unlock(&xe->pinned.lock);
 	}
 
 	ttm_bo_pin(&bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 6a40eedd9db1..1eeb3910450b 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -10,6 +10,44 @@
 #include "xe_ggtt.h"
 #include "xe_tile.h"
 
+typedef int (*xe_pinned_fn)(struct xe_bo *bo);
+
+static int xe_bo_apply_to_pinned(struct xe_device *xe,
+				 struct list_head *pinned_list,
+				 struct list_head *new_list,
+				 const xe_pinned_fn pinned_fn)
+{
+	LIST_HEAD(still_in_list);
+	struct xe_bo *bo;
+	int ret = 0;
+
+	spin_lock(&xe->pinned.lock);
+	while (!ret) {
+		bo = list_first_entry_or_null(pinned_list, typeof(*bo),
+					      pinned_link);
+		if (!bo)
+			break;
+		xe_bo_get(bo);
+		list_move_tail(&bo->pinned_link, &still_in_list);
+		spin_unlock(&xe->pinned.lock);
+
+		xe_bo_lock(bo, false);
+		ret = pinned_fn(bo);
+		if (ret && pinned_list != new_list) {
+			spin_lock(&xe->pinned.lock);
+			list_move(&bo->pinned_link, pinned_list);
+			spin_unlock(&xe->pinned.lock);
+		}
+		xe_bo_unlock(bo);
+		xe_bo_put(bo);
+		spin_lock(&xe->pinned.lock);
+	}
+	list_splice_tail(&still_in_list, new_list);
+	spin_unlock(&xe->pinned.lock);
+
+	return ret;
+}
+
 /**
  * xe_bo_evict_all - evict all BOs from VRAM
  *
@@ -27,9 +65,7 @@
 int xe_bo_evict_all(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
-	struct xe_bo *bo;
 	struct xe_tile *tile;
-	struct list_head still_in_list;
 	u32 mem_type;
 	u8 id;
 	int ret;
@@ -57,34 +93,9 @@ int xe_bo_evict_all(struct xe_device *xe)
 		}
 	}
 
-	/* Pinned user memory in VRAM */
-	INIT_LIST_HEAD(&still_in_list);
-	spin_lock(&xe->pinned.lock);
-	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.external_vram,
-					      typeof(*bo), pinned_link);
-		if (!bo)
-			break;
-		xe_bo_get(bo);
-		list_move_tail(&bo->pinned_link, &still_in_list);
-		spin_unlock(&xe->pinned.lock);
-
-		xe_bo_lock(bo, false);
-		ret = xe_bo_evict_pinned(bo);
-		xe_bo_unlock(bo);
-		xe_bo_put(bo);
-		if (ret) {
-			spin_lock(&xe->pinned.lock);
-			list_splice_tail(&still_in_list,
-					 &xe->pinned.external_vram);
-			spin_unlock(&xe->pinned.lock);
-			return ret;
-		}
-
-		spin_lock(&xe->pinned.lock);
-	}
-	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
-	spin_unlock(&xe->pinned.lock);
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
+				    &xe->pinned.external_vram,
+				    xe_bo_evict_pinned);
 
 	/*
 	 * Wait for all user BO to be evicted as those evictions depend on the
@@ -93,26 +104,42 @@ int xe_bo_evict_all(struct xe_device *xe)
 	for_each_tile(tile, xe, id)
 		xe_tile_migrate_wait(tile);
 
-	spin_lock(&xe->pinned.lock);
-	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.kernel_bo_present,
-					      typeof(*bo), pinned_link);
-		if (!bo)
-			break;
-		xe_bo_get(bo);
-		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
-		spin_unlock(&xe->pinned.lock);
+	if (ret)
+		return ret;
 
-		xe_bo_lock(bo, false);
-		ret = xe_bo_evict_pinned(bo);
-		xe_bo_unlock(bo);
-		xe_bo_put(bo);
-		if (ret)
-			return ret;
+	return xe_bo_apply_to_pinned(xe, &xe->pinned.kernel_bo_present,
+				     &xe->pinned.evicted,
+				     xe_bo_evict_pinned);
+}
 
-		spin_lock(&xe->pinned.lock);
+static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	int ret;
+
+	ret = xe_bo_restore_pinned(bo);
+	if (ret)
+		return ret;
+
+	if (bo->flags & XE_BO_FLAG_GGTT) {
+		struct xe_tile *tile;
+		u8 id;
+
+		for_each_tile(tile, xe_bo_device(bo), id) {
+			if (tile != bo->tile && !(bo->flags & XE_BO_FLAG_GGTTx(tile)))
+				continue;
+
+			mutex_lock(&tile->mem.ggtt->lock);
+			xe_ggtt_map_bo(tile->mem.ggtt, bo);
+			mutex_unlock(&tile->mem.ggtt->lock);
+		}
 	}
-	spin_unlock(&xe->pinned.lock);
+
+	/*
+	 * We expect validate to trigger a move VRAM and our move code
+	 * should setup the iosys map.
+	 */
+	xe_assert(xe, !iosys_map_is_null(&bo->vmap));
 
 	return 0;
 }
@@ -130,54 +157,9 @@ int xe_bo_evict_all(struct xe_device *xe)
  */
 int xe_bo_restore_kernel(struct xe_device *xe)
 {
-	struct xe_bo *bo;
-	int ret;
-
-	spin_lock(&xe->pinned.lock);
-	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.evicted,
-					      typeof(*bo), pinned_link);
-		if (!bo)
-			break;
-		xe_bo_get(bo);
-		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
-		spin_unlock(&xe->pinned.lock);
-
-		xe_bo_lock(bo, false);
-		ret = xe_bo_restore_pinned(bo);
-		xe_bo_unlock(bo);
-		if (ret) {
-			xe_bo_put(bo);
-			return ret;
-		}
-
-		if (bo->flags & XE_BO_FLAG_GGTT) {
-			struct xe_tile *tile;
-			u8 id;
-
-			for_each_tile(tile, xe, id) {
-				if (tile != bo->tile && !(bo->flags & XE_BO_FLAG_GGTTx(tile)))
-					continue;
-
-				mutex_lock(&tile->mem.ggtt->lock);
-				xe_ggtt_map_bo(tile->mem.ggtt, bo);
-				mutex_unlock(&tile->mem.ggtt->lock);
-			}
-		}
-
-		/*
-		 * We expect validate to trigger a move VRAM and our move code
-		 * should setup the iosys map.
-		 */
-		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
-
-		xe_bo_put(bo);
-
-		spin_lock(&xe->pinned.lock);
-	}
-	spin_unlock(&xe->pinned.lock);
-
-	return 0;
+	return xe_bo_apply_to_pinned(xe, &xe->pinned.evicted,
+				     &xe->pinned.kernel_bo_present,
+				     xe_bo_restore_and_map_ggtt);
 }
 
 /**
@@ -192,47 +174,20 @@ int xe_bo_restore_kernel(struct xe_device *xe)
  */
 int xe_bo_restore_user(struct xe_device *xe)
 {
-	struct xe_bo *bo;
 	struct xe_tile *tile;
-	struct list_head still_in_list;
-	u8 id;
-	int ret;
+	int ret, id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
 	/* Pinned user memory in VRAM should be validated on resume */
-	INIT_LIST_HEAD(&still_in_list);
-	spin_lock(&xe->pinned.lock);
-	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.external_vram,
-					      typeof(*bo), pinned_link);
-		if (!bo)
-			break;
-		list_move_tail(&bo->pinned_link, &still_in_list);
-		xe_bo_get(bo);
-		spin_unlock(&xe->pinned.lock);
-
-		xe_bo_lock(bo, false);
-		ret = xe_bo_restore_pinned(bo);
-		xe_bo_unlock(bo);
-		xe_bo_put(bo);
-		if (ret) {
-			spin_lock(&xe->pinned.lock);
-			list_splice_tail(&still_in_list,
-					 &xe->pinned.external_vram);
-			spin_unlock(&xe->pinned.lock);
-			return ret;
-		}
-
-		spin_lock(&xe->pinned.lock);
-	}
-	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
-	spin_unlock(&xe->pinned.lock);
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
+				    &xe->pinned.external_vram,
+				    xe_bo_restore_pinned);
 
 	/* Wait for restore to complete */
 	for_each_tile(tile, xe, id)
 		xe_tile_migrate_wait(tile);
 
-	return 0;
+	return ret;
 }
-- 
2.48.1

