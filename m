Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2678AE7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E846F10EB98;
	Wed, 18 Dec 2024 12:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZRXrUZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFBB10EB93
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734524354; x=1766060354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rVQ2gGmU41ywm7P3tVxA21Iqd/SGlIg3G+YMw28WQzo=;
 b=fZRXrUZ3mf/kx6bMNlbjvGqJVGJZ4rCE/oaVKsryhHjMZeIJTb6FdxlU
 hsroNzeltemsUhFAQIepFkLoSw+qJyr7/NSHOffJNKNtg8sabM6ZOEXTs
 EcgM4Cmmp8r33P5ehLk/9eC7W3C5sDdvNC/SrDlPb2QKBIC97IYkGiSbk
 qlN6TF0p1gotEEfOzHE1BKRFvQZMEcY2u4gqeZmLdKiPCP0HU7/BmXjP0
 VcL2w0QR6lwKhqtCV0KvZNrZmMn7iIDIK582b/v51mW3dQRelx95uhAZJ
 RvrAV0jI3lAVPtTV/5GAidbuIpDS1r8h4aVqVFNfXCl6v7hPP4R0BMfaS w==;
X-CSE-ConnectionGUID: p7HYXCZ+QeK9VhDIF573cQ==
X-CSE-MsgGUID: n7LugKnbQM2HuC9owoMA7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35028090"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35028090"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:13 -0800
X-CSE-ConnectionGUID: tiorlylHSKevA/p9xCaIyg==
X-CSE-MsgGUID: OUKdUv40TyW/NXwRAjcgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97633589"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:13 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/7] drm/xe: add XE_BO_FLAG_PINNED_EARLY_RESTORE
Date: Wed, 18 Dec 2024 12:18:42 +0000
Message-ID: <20241218121837.226393-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
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

With the idea of having more pinned objects using the blitter engine
where possible, during suspend/resume, mark the pinned objects which
must be done during the early phase before submission/migration has been
setup, and therefore must use memcpy. The remainder can then be done in
the later phase using the blitter engine.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c        |  4 ++--
 drivers/gpu/drm/xe/xe_bo.h        |  9 +++++----
 drivers/gpu/drm/xe/xe_bo_evict.c  |  4 ++--
 drivers/gpu/drm/xe/xe_ggtt.c      |  2 +-
 drivers/gpu/drm/xe/xe_gsc.c       |  3 ++-
 drivers/gpu/drm/xe/xe_guc_ads.c   |  3 ++-
 drivers/gpu/drm/xe/xe_hw_engine.c |  3 ++-
 drivers/gpu/drm/xe/xe_lrc.c       | 10 +++++++---
 drivers/gpu/drm/xe/xe_memirq.c    |  3 ++-
 drivers/gpu/drm/xe/xe_migrate.c   |  3 ++-
 drivers/gpu/drm/xe/xe_pt.c        | 13 ++++++++-----
 drivers/gpu/drm/xe/xe_uc_fw.c     |  3 ++-
 12 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 73a023af0bc8..83a49c887e0c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -880,7 +880,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		goto out_unlock_bo;
 	}
 
-	if (!xe_bo_is_user(bo)) {
+	if (bo->flags & XE_BO_FLAG_PINNED_EARLY_RESTORE) {
 		ret = xe_bo_vmap(backup);
 		if (ret)
 			goto out_backup;
@@ -964,7 +964,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		goto out_backup;
 	}
 
-	if (!xe_bo_is_user(bo)) {
+	if (bo->flags & XE_BO_FLAG_PINNED_EARLY_RESTORE) {
 		ret = xe_bo_vmap(backup);
 		if (ret)
 			goto out_unlock_bo;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d75740b6e0a5..27b4f9897e17 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -40,10 +40,11 @@
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
 #define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
-#define XE_BO_FLAG_GGTT0                BIT(19)
-#define XE_BO_FLAG_GGTT1                BIT(20)
-#define XE_BO_FLAG_GGTT2                BIT(21)
-#define XE_BO_FLAG_GGTT3                BIT(22)
+#define XE_BO_FLAG_PINNED_EARLY_RESTORE BIT(19)
+#define XE_BO_FLAG_GGTT0                BIT(20)
+#define XE_BO_FLAG_GGTT1                BIT(21)
+#define XE_BO_FLAG_GGTT2                BIT(22)
+#define XE_BO_FLAG_GGTT3                BIT(23)
 #define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
 					 XE_BO_FLAG_GGTT1 | \
 					 XE_BO_FLAG_GGTT2 | \
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 119b8301bd7f..6d9ec966b10b 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -24,7 +24,7 @@ static int xe_evict_pinned(struct xe_device *xe, bool memcpy_only)
 		if (!bo)
 			break;
 
-		if (!memcpy_only && !xe_bo_is_user(bo)) {
+		if (!memcpy_only && (bo->flags & XE_BO_FLAG_PINNED_EARLY_RESTORE)) {
 			list_move_tail(&bo->pinned_link, &skipped);
 			continue;
 		}
@@ -132,7 +132,7 @@ static int xe_restore_pinned(struct xe_device *xe, bool memcpy_only)
 		if (!bo)
 			break;
 
-		if (memcpy_only && xe_bo_is_user(bo)) {
+		if (memcpy_only && !(bo->flags & XE_BO_FLAG_PINNED_EARLY_RESTORE)) {
 			list_move_tail(&bo->pinned_link, &skipped);
 			continue;
 		}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 05154f9de1a6..94ccbfdcd11f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -365,7 +365,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	 * scratch entires, rather keep the scratch page in system memory on
 	 * platforms where 64K pages are needed for VRAM.
 	 */
-	flags = XE_BO_FLAG_PINNED;
+	flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_PINNED_EARLY_RESTORE;
 	if (ggtt->flags & XE_GGTT_FLAGS_64K)
 		flags |= XE_BO_FLAG_SYSTEM;
 	else
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 1eb791ddc375..a3dddbd0ce12 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -475,7 +475,8 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, SZ_4M,
 					  XE_BO_FLAG_STOLEN |
-					  XE_BO_FLAG_GGTT);
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_PINNED_EARLY_RESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 887181c5395c..b87b3209fefa 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -990,7 +990,8 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 
 	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
 					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-					    XE_BO_FLAG_GGTT);
+					    XE_BO_FLAG_GGTT |
+					    XE_BO_FLAG_PINNED_EARLY_RESTORE);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4294aa600192..773850ccdb83 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -581,7 +581,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
 						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						 XE_BO_FLAG_GGTT |
-						 XE_BO_FLAG_GGTT_INVALIDATE);
+						 XE_BO_FLAG_GGTT_INVALIDATE |
+						 XE_BO_FLAG_PINNED_EARLY_RESTORE);
 	if (IS_ERR(hwe->hwsp)) {
 		err = PTR_ERR(hwe->hwsp);
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index bbb9ffbf6367..11f48d02e3cd 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -892,6 +892,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	void *init_data = NULL;
 	u32 arb_enable;
 	u32 lrc_size;
+	u32 bo_flags;
 	int err;
 
 	kref_init(&lrc->refcount);
@@ -900,15 +901,18 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
+	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
+		   XE_BO_FLAG_GGTT_INVALIDATE;
+	if (!vm || !vm->xef)
+		bo_flags |= XE_BO_FLAG_PINNED_EARLY_RESTORE;
+
 	/*
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
 	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
 				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE);
+				       bo_flags);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 404fa2a456d5..2e00e3cdfe60 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -182,7 +182,8 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE |
 					  XE_BO_FLAG_NEEDS_UC |
-					  XE_BO_FLAG_NEEDS_CPU_ACCESS);
+					  XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					  XE_BO_FLAG_PINNED_EARLY_RESTORE);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1b97d90aadda..0a448b390b86 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -210,7 +210,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_PINNED |
-				  XE_BO_FLAG_PAGETABLE);
+				  XE_BO_FLAG_PAGETABLE |
+				  XE_BO_FLAG_PINNED_EARLY_RESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 65c3c1688710..0fa90bdd361e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -99,6 +99,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 {
 	struct xe_pt *pt;
 	struct xe_bo *bo;
+	u32 bo_flags;
 	int err;
 
 	if (level) {
@@ -111,14 +112,16 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
 
+	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE | XE_BO_FLAG_PINNED |
+		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
+	if (!vm->xef) /* kmd */
+		bo_flags |= XE_BO_FLAG_PINNED_EARLY_RESTORE;
+
 	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
-				  XE_BO_FLAG_PINNED |
-				  XE_BO_FLAG_NO_RESV_EVICT |
-				  XE_BO_FLAG_PAGETABLE);
+				  bo_flags);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9c14b0adad0c..6cc613109622 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -794,7 +794,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
 			 XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT |
-			 XE_BO_FLAG_GGTT_INVALIDATE);
+			 XE_BO_FLAG_GGTT_INVALIDATE |
+			 XE_BO_FLAG_PINNED_EARLY_RESTORE);
 
 	uc_fw_release(fw);
 
-- 
2.47.1

