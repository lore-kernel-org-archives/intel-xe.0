Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAD7C44506
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B778910E43E;
	Sun, 12 Jul 2026 11:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9Hw/3in";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756B410E439
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854899; x=1815390899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fOdHYT5L24cYBwRnF12qC0byBvWxK/PlEN/IJAfrQUU=;
 b=f9Hw/3inAJc2rJLlTgY1AG0Ea3UaeN0jyfMeHwISMNiW+H6912gyMzp2
 VltE9U2wLqgt9jFDzJbdU/0l8HE6vGtTb9QvjtC52xjBplx3QU6JwlTYZ
 Kh9zYjPK11z2qOtEyKPnUWZ75GGUQJVu9vas7LCuNO7zfe2/w80JEHh/T
 4m6qjSpXL3wGN96Lu79gnjkJNV/EESPN2rM2sb86lUKJ+h0kq9+LhUNsu
 oeWsEkXVMr+X4fC0IP7Z3m+QB/XIeXc7Qhj6H9fc6JvxQZfwb8QKUcF8E
 epiVKCo9RlhgX54wEbzdDTqPRVljC0GBmdsMAh1o8DFPfff3MMmtrInkn A==;
X-CSE-ConnectionGUID: zRDyUAW4RaK06Zzwmxei1Q==
X-CSE-MsgGUID: 9E+c+o24S9+du1W9YAk9bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457641"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:59 -0700
X-CSE-ConnectionGUID: D/GDoi0CT/eSCXmeRLpgUw==
X-CSE-MsgGUID: 4MS59dgrRbW1WOs4KZwBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367742"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:59 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 7/8] drm/xe/pt: allow selecting the bind leaf PTE level
Date: Sun, 12 Jul 2026 16:45:16 +0530
Message-ID: <20260712111517.1956177-8-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e466f714bf86..c613558c3cc5 100644
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
@@ -531,8 +538,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	int ret = 0;
 	u64 pte;
 
-	/* Is this a leaf entry ?*/
-	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
+	/*
+	 * Is this a leaf entry?
+	 * Always create a 4K leaf at level 0. For huge pages (level > 0),
+	 * validate alignment and size with xe_pt_hugepte_possible() so
+	 * inherited VMA page-size flags do not produce invalid PTEs.
+	 */
+	if (level == 0 || ((level == xe_walk->target_leaf_level ||
+			    xe_walk->target_leaf_level == 0) &&
+			    xe_pt_hugepte_possible(addr, next,
+						   level, xe_walk))) {
 		struct xe_res_cursor *curs = xe_walk->curs;
 		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
 		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
@@ -774,6 +789,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_svm_notifier_unlock(vm);
 	}
 
+	xe_walk.target_leaf_level = 0;
+	if (vma->gpuva.flags & XE_VMA_PTE_1G)
+		xe_walk.target_leaf_level = 2;
+	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
+		xe_walk.target_leaf_level = 1;
+
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
 	if (clear_pt)
 		goto walk_pt;
-- 
2.43.0

