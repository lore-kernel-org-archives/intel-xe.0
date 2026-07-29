Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943D1C54F51
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 12:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E90A10EBE8;
	Wed, 29 Jul 2026 12:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrOFmG/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB6010EBE8
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327539; x=1816863539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mddnKw0g3vNTn+TxeHQfOEWzz1h/cO0M6V2THlMmLXM=;
 b=KrOFmG/HLW98/rA6wJ0yp8Fi3jRqKCZ2ZG3KY5IJzLiCSYd57CaztMyV
 cwkP3dHZi34GgbtMq02JR5vdgliW/BpVnaPH6gd13nBj7cOuyTd23A/5e
 BAsTwXMcDbhoeoQNzNNSAJ4SG7m00u23rFI4t4rSPrZZAwF0FwCnvqEHl
 tNvoSHkjIxp53dcORbzYxLvHmCd4Yo2rogkhbG6QMAUSBCjvLLH1ZLnI6
 yJZEXvyq0O9QWQiNIlMnY9Hgxpt7z2SZD/GJ8bBOWmLmCuKmrkMAHmrtZ
 UbnGRMgr6yBm5K2aTyhU72hgYysPPgUbNOp2vlyj5VtBcZRNlMvGfF/Pz g==;
X-CSE-ConnectionGUID: A83mkPqPT7mv4csMXM9msQ==
X-CSE-MsgGUID: bZXFCa8rS0C0y3AgiIVqGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85969013"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85969013"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:18:58 -0700
X-CSE-ConnectionGUID: Tlru+1BgSXSiwqQs8pA5/w==
X-CSE-MsgGUID: mz5WGbYbSaqG/IBvH4Zn5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="260055958"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 29 Jul 2026 05:18:58 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v10 5/6] drm/xe/pt: allow selecting the bind leaf PTE level
Date: Wed, 29 Jul 2026 17:48:42 +0530
Message-ID: <20260729121843.1255891-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729121843.1255891-1-naresh.kumar.g@intel.com>
References: <20260729121843.1255891-1-naresh.kumar.g@intel.com>
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

Add a target_leaf_level field to the page-table bind walk and use it to
    control the level at which leaf entries are emitted.

    By default, the bind walk emits level-0 leaf PTEs and relies on
    xe_pt_hugepte_possible() to select huge mappings when possible. Add an
    explicit target leaf level so the walk can stop earlier when the VMA
    requests a larger mapping size.

    Use level 1 for 2M PDE mappings and level 2 for 1G PDP mappings, while
    keeping level 0 for normal mappings. The existing huge-page heuristic
    is preserved for the default level-0 path.

    This allows the bind path to emit 2M and 1G leaf entries when requested
    by the VMA, while still validating alignment and size requirements.

    v2
    - avoid using max_level to control walk depth
    - use target_leaf_level to preserve the normal walk behavior
    - keep the default huge-page heuristic only for the level-0 path
    - refine commit message

    v3
    - reword commit message

    v4
    - allow fallback to smaller huge-page levels for non-zero
      target_leaf_level
    - avoid constraining clear_pt walks by target_leaf_level

    v5(Himal)
    - Restrict only intended level in debug page size policy mode
    - Allow the normal path to proceed smoothly when
      no debug page-size mode is selected.
    v8 (Himal)
    - Drop
      https://patchwork.freedesktop.org/patch/740059/?series=168905&rev=5
      patch and populate target_leaf_level from bo flags
    - populate target_leaf_level if it is in debug page size mode
      otherwise fill with 0 which is having no effect on the normal
      flow
    v10 (Himal)
    - use xe_bo_is_vram() instead of raw VRAM flag checks
      so huge-page selection is based on BO VRAM placement.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 76 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0e9d669620b9..8cd89c4f49d0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -302,6 +302,14 @@ struct xe_pt_stage_bind_walk {
 	bool needs_64K;
 	/** @clear_pt: clear page table entries during the bind walk */
 	bool clear_pt;
+	/**
+	 * @target_leaf_level: Page-table level at which to emit leaf PTEs
+	 * 0 for normal 4K/64K mappings, 1 for 2M huge pages, and 2 for 1G huge
+	 * pages. The walk still traverses from the root down; this field tells
+	 * xe_pt_stage_bind_entry() to treat the selected level as a leaf instead
+	 * of descending further.
+	 */
+	u32 target_leaf_level;
 	/**
 	 * @vma: VMA being mapped
 	 */
@@ -514,6 +522,39 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 	return xe_walk->found_64K;
 }
 
+static bool xe_pt_huge_leaf_allowed(u64 addr, u64 next, unsigned int level,
+				    struct xe_pt_stage_bind_walk *xe_walk)
+{
+	if (xe_walk->clear_pt)
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	if (!xe_debug_page_size_supported(xe_walk->vm->xe))
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	if (!xe_walk->target_leaf_level)
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	if (level == xe_walk->target_leaf_level)
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	return false;
+}
+
+static bool xe_pt_exact_leaf_required_but_invalid(u64 addr, u64 next,
+						  unsigned int level,
+						  struct xe_pt_stage_bind_walk *xe_walk)
+{
+	struct xe_device *xe = xe_walk->vm->xe;
+
+	if (!xe_debug_page_size_mode_not_none(xe))
+		return false;
+
+	return !xe_walk->clear_pt &&
+		xe_walk->target_leaf_level &&
+		level == xe_walk->target_leaf_level &&
+		!xe_pt_hugepte_possible(addr, next, level, xe_walk);
+}
+
 static int
 xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		       unsigned int level, u64 addr, u64 next,
@@ -531,8 +572,18 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	int ret = 0;
 	u64 pte;
 
-	/* Is this a leaf entry ?*/
-	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
+	if (xe_pt_exact_leaf_required_but_invalid(addr, next, level, xe_walk))
+		return -EINVAL;
+
+	/*
+	 * Is this a leaf entry?
+	 * Always create a 4K leaf at level 0. For huge pages (level > 0),
+	 * validate alignment and size with xe_pt_hugepte_possible().
+	 * When target_leaf_level is non-zero, only that huge-page level is
+	 * accepted for normal bind walks. Clear walks remain unconstrained so
+	 * existing huge leaves can be cleared without descending further.
+	 */
+	if (level == 0 || xe_pt_huge_leaf_allowed(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
 		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
 		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
@@ -682,6 +733,26 @@ static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
 				 (bo && xe_bo_has_single_placement(bo))));
 }
 
+static u32 xe_pt_target_leaf_level_from_bo(struct xe_device *xe,
+					   struct xe_vma *vma)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+
+	if (!xe_debug_page_size_mode_not_none(xe))
+		return 0;
+
+	if (!bo || !xe_bo_is_vram(bo) || !(bo->flags & XE_BO_FLAG_USER))
+		return 0;
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_1G)
+		return 2;
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_2M)
+		return 1;
+
+	return 0;
+}
+
 /**
  * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
  * range.
@@ -774,6 +845,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_svm_notifier_unlock(vm);
 	}
 
+	xe_walk.target_leaf_level = xe_pt_target_leaf_level_from_bo(xe, vma);
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
 	if (clear_pt) {
 		xe_assert(xe, !range);
-- 
2.43.0

