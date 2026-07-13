Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551A1C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 18:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F4E10E64E;
	Mon, 13 Jul 2026 18:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9MuddF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1E10E64E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783966550; x=1815502550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dKtgq8+589b3Y4aeOKR2BIfnWWqCUAW08KsjWpHxCek=;
 b=Y9MuddF9FOcMnMkx0TiVxvxmvW1KvIFjNRYvxeLExPi/wfuj9M7FCeIG
 RNRn7fsu+Lh3WXOoNzROZ/WQ5qWKzSlUBjzvPAfZw2JbQXXZNz0LCoBzW
 S22Z34ppBjUN+Sf5DTQ7/6JVvXtxL2aRR9TOhufGkGQaKrRF0r72sSBCs
 w5JtBuUcx3M3BozEJ6Kwl2zysmjeLEb5t3vsn/mqzd3kG/I7G4DoGa0Ue
 Ig/UzfRKRFKokvg7Yc24A3xQ+U9feIDUbGaNU7UpQomSSElRh+MVatf7Q
 SygzmMV5pc0JVtePjdPTURTGY6ygsvS6hWErWPVCM1G2XAFnmI8BhJqbY w==;
X-CSE-ConnectionGUID: mj8YR7uiQ0eTheaNi7VWRQ==
X-CSE-MsgGUID: 6aZ7fxNCQ+a6Ufj7U4KqbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84460884"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84460884"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 11:15:50 -0700
X-CSE-ConnectionGUID: 7K0cmUYbR3a2KrxWDkEeng==
X-CSE-MsgGUID: C5k8eapxSxeObp1nURIN9g==
X-ExtLoop1: 1
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jul 2026 11:15:48 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v5 6/7]  drm/xe/pt: allow selecting the bind leaf PTE level
Date: Mon, 13 Jul 2026 23:46:04 +0530
Message-ID: <20260713181605.3127204-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713181605.3127204-1-naresh.kumar.g@intel.com>
References: <20260713181605.3127204-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 53 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e466f714bf86..a476e9a3860f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -302,6 +302,13 @@ struct xe_pt_stage_bind_walk {
 	bool needs_64K;
 	/** @clear_pt: clear page table entries during the bind walk */
 	bool clear_pt;
+	/** @target_leaf_level: Page-table level at which to emit leaf PTEs
+	 * 0 for normal 4K/64K mappings, 1 for 2M huge pages, and 2 for 1G huge
+	 * pages. The walk still traverses from the root down; this field tells
+	 * xe_pt_stage_bind_entry() to treat the selected level as a leaf instead
+	 * of descending further.
+	 */
+	u32 target_leaf_level;
 	/**
 	 * @vma: VMA being mapped
 	 */
@@ -514,6 +521,37 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
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
+	return !xe_walk->clear_pt &&
+		xe_debug_exact_page_size_mode(xe) &&
+		xe_walk->target_leaf_level &&
+		level == xe_walk->target_leaf_level &&
+		!xe_pt_hugepte_possible(addr, next, level, xe_walk);
+}
+
 static int
 xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		       unsigned int level, u64 addr, u64 next,
@@ -531,8 +569,18 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
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
@@ -774,6 +822,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_svm_notifier_unlock(vm);
 	}
 
+	xe_walk.target_leaf_level = vma->target_leaf_level;
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
 	if (clear_pt)
 		goto walk_pt;
-- 
2.43.0

