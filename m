Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCD8C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 14:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E55A10EE16;
	Wed, 22 Jul 2026 14:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxe5Ihl/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1072E10EE1A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731079; x=1816267079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i4zmJvYm1nklfaQFEagR7Zi0wbREt44s/imJ9rqPVDU=;
 b=nxe5Ihl/LJOu8EfDgvPHvAR331HdAR8zEzKFeJPKVkOTB+qRy2t01Rfw
 LaZpJx1RvuAkFNPyuD5tYI1VlhL3OzW3QA3tgbYQl/JSPJBNuNL3N4pGX
 MUiUU0k9gVntZnGkbTQ6pF+CBoYuWAJ1ClkhCAkMT5443OZqhOKJIs7EL
 Y1sdNKFYJDb36ATEsuT1kx9F1yQVlO08Rq3OLUIKfPCvn0OdQMybecZXN
 F83+kKAuGaLceXNG+2nykzwipMHBxrw1RZqPPl5S/ylWXZxeU630n285g
 YQ2JQEneSlCMAK5SslIhSZzunsgt+ft6dshRif36EoaitD8xeAAfbe/4m A==;
X-CSE-ConnectionGUID: ilD4n6IES8u1kVNCKoUWhg==
X-CSE-MsgGUID: nQOIl0QpQUy+IQsV8aF0qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102777860"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="102777860"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:37:59 -0700
X-CSE-ConnectionGUID: mQ1UuE7vSze1QLCN1IkppQ==
X-CSE-MsgGUID: MM38bXaJRXeqsN422/C9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261653214"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 07:37:58 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v8 5/6] drm/xe/pt: allow selecting the bind leaf PTE level
Date: Wed, 22 Jul 2026 20:07:58 +0530
Message-ID: <20260722143759.1718600-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 77 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 598c6b2571e7..b360ef4e2a7e 100644
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
@@ -682,6 +733,27 @@ static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
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
+	if (!bo || !(bo->flags & XE_BO_FLAG_VRAM_MASK) ||
+	    !(bo->flags & XE_BO_FLAG_USER))
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
@@ -774,6 +846,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_svm_notifier_unlock(vm);
 	}
 
+	xe_walk.target_leaf_level = xe_pt_target_leaf_level_from_bo(xe, vma);
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
 	if (clear_pt)
 		goto walk_pt;
-- 
2.43.0

