Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A455C44506
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 02:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CF510E531;
	Mon, 13 Jul 2026 02:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWap6FMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370EF10E52D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 02:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783909668; x=1815445668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3tX0IaQ3moVnKdcYD0ZQvp9vCOWlJA4cSEoGl4xh8Oc=;
 b=KWap6FMGgFl1zhsvjWXhpw8l8U2uMa4dLVjYftskd8dQfTjhn4E8vbGH
 zW1SpqDGNokluI8/EcxHe6G2tKWaHzxFRPWUeYFmM1+zXFneBK/rdjOev
 zi9bd0xzN8OdQ3jckOE7Df5f7ppzQJifq7qvHJMS0cZ9DPFb4XZ9TBuwh
 RhARNi8U+ri1e1tuMM3ysFZbe11T+4yRTj4uCiIPYYKCwq3K3LO9DG0ww
 ej6KrtQ4pBCM5cEcd+8+ouZo4VM6e6JarvWegknGjtlFsXDfFXhd3MNpD
 m7n1Rq2OFvwBykev/Zhsdj1iJqk39urVW8MxkaUBO9xHGqqpG44iBzCcF w==;
X-CSE-ConnectionGUID: thEdX0OKRUCSAph5KRe8WA==
X-CSE-MsgGUID: czHwUjT4RDqdWOGXklZ6ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88197456"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88197456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 19:27:48 -0700
X-CSE-ConnectionGUID: nAheq04TRXu4ARHy3kOFQQ==
X-CSE-MsgGUID: Xu71Vy2cTQGwo2fx/VvCKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253680069"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 19:27:47 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v4 7/8] drm/xe/pt: allow selecting the bind leaf PTE level
Date: Mon, 13 Jul 2026 07:55:40 +0530
Message-ID: <20260713022541.2581814-8-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
References: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
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
keeping level 0 for normal mappings. The existing huge-page heuristic is
preserved for the default level-0 path.

This allows the bind path to emit 2M and 1G leaf entries when requested
by the VMA, while still validating alignment and size requirements.

v2
- avoid using max_level to control walk depth
- use target_leaf_level to preserve the normal walk behavior
- keep the default huge-page heuristic only for the level-0 path
- refine commit message

v3
- reword commit message

- v4
- allow fallback to smaller huge-page levels for non-zero target_leaf_level
- avoid constraining clear_pt walks by target_leaf_level

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e466f714bf86..506757defa20 100644
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
@@ -514,6 +521,17 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 	return xe_walk->found_64K;
 }
 
+static bool xe_pt_huge_leaf_allowed(u64 addr, u64 next, unsigned int level,
+				    struct xe_pt_stage_bind_walk *xe_walk)
+{
+	if (xe_walk->clear_pt)
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	return (xe_walk->target_leaf_level == 0 ||
+		level <= xe_walk->target_leaf_level) &&
+		xe_pt_hugepte_possible(addr, next, level, xe_walk);
+}
+
 static int
 xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		       unsigned int level, u64 addr, u64 next,
@@ -531,8 +549,14 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	int ret = 0;
 	u64 pte;
 
-	/* Is this a leaf entry ?*/
-	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
+	/*
+	 * Is this a leaf entry?
+	 * Always create a 4K leaf at level 0. For huge pages (level > 0),
+	 * validate alignment and size with xe_pt_hugepte_possible().
+	 * When target_leaf_level is set, allow fallback to smaller huge pages
+	 * (e.g., 1G -> 2M -> 64K -> 4K) by accepting any level <= target.
+	 */
+	if (level == 0 || xe_pt_huge_leaf_allowed(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
 		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
 		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
@@ -774,6 +798,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_svm_notifier_unlock(vm);
 	}
 
+	xe_walk.target_leaf_level = vma->target_leaf_level;
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
 	if (clear_pt)
 		goto walk_pt;
-- 
2.43.0

