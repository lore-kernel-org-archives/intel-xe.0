Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F2C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880D310F067;
	Wed,  1 Jul 2026 16:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSM4DBQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD110F067
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923605; x=1814459605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x4KJG5YcbNni7nwvfP9MymrmzwSliJ5IWMjLbe6vI4s=;
 b=YSM4DBQYYiAWMWDPceziLhn0PYSCuaaznQLLy4pPixfRXHVtYsI42cTu
 uqZgSW6dc0xjdn6Ewu0sTwN8vwH+hfHwOaUjBWcbt08ujZRmawPLzHvXk
 j50jN13Iv3srx4DUjHaWUyZLqEGK59O5ikQY3guRgTAXxGmVsDGw2LscL
 zErPk1gYcJCe6NSR/pVmN+Qx6bW+Hmbbca/U8JtQL9ld72Fv9/is8CXPp
 XNWbwaIYqM0SbGTRFVK41D1QGKmk4tT8UyNKQNkwk/E1zwBDca56BbGg+
 If87m/JY6aCah/fMTEi9HsyBvKT3PuYwDvqhUuAm0U38IZm2Yu0FBanUj g==;
X-CSE-ConnectionGUID: 3Rp4BSP/Tx+nfRQphPIBCQ==
X-CSE-MsgGUID: vSFOg90tSnOsF4SO+pdrqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779261"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779261"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:25 -0700
X-CSE-ConnectionGUID: Kh1eOFL7TbqGV7c/JwQOYQ==
X-CSE-MsgGUID: SGjAytxoSNOMnzKJs/bsNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196461"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:24 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 8/8] drm/xe/pt: allow selecting the bind leaf PTE level
Date: Wed,  1 Jul 2026 22:03:48 +0530
Message-ID: <20260701163348.3432358-9-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
References: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

Add a target_leaf_level field to the page-table bind walk and use it
to control the level where leaf entries are emitted.

The default bind walk emits leaf PTEs at level 0, while huge mappings
are otherwise chosen through xe_pt_hugepte_possible(). Add an explicit
target leaf level so the walk can stop earlier when the VMA requests a
larger mapping size.

Use level 1 for 2M PDE mappings and level 2 for 1G PDP mappings, while
keeping level 0 for normal 4K/64K mappings. Keep the existing huge-page
selection logic for the default level-0 case.

This allows the bind path to emit 2M and 1G leaf entries when
requested by the VMA.

v2:
-Avoid using max_level field to control walk depth
-use target_leaf_level field to preserve normal walk
 environment
-keep default huge-page heuristic only for the level0
 default path
-refine commit meessage

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0959e0e88a14..245dadc7ab9d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -302,6 +302,13 @@ struct xe_pt_stage_bind_walk {
 	bool needs_64K;
 	/** @clear_pt: clear page table entries during the bind walk */
 	bool clear_pt;
+	/** @target_leaf_level: The page-table level at which to emit leaf PTEs.
+	 * 0 for normal 4K/64K mappings, whereas 1 for 2M huge pages and 2 for
+	 * 1G huge pages. The walk still traverses from the root down; this field
+	 * instructs xe_pt_stage_bind_entry() to treat the given level as leaf
+	 * instead going further down.
+	 */
+	u32 target_leaf_level;
 	/**
 	 * @vma: VMA being mapped
 	 */
@@ -530,7 +537,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	u64 pte;
 
 	/* Is this a leaf entry ?*/
-	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
+	if (level == xe_walk->target_leaf_level || level == 0 ||
+	    (xe_walk->target_leaf_level == 0 &&
+	     xe_pt_hugepte_possible(addr, next, level, xe_walk))) {
 		struct xe_res_cursor *curs = xe_walk->curs;
 		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
 		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
@@ -773,6 +782,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	}
 
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
+	if (vma->gpuva.flags & XE_VMA_PTE_2M)
+		xe_walk.target_leaf_level = 1;
+	else if (vma->gpuva.flags & XE_VMA_PTE_1G)
+		xe_walk.target_leaf_level = 2;
+
 	if (clear_pt)
 		goto walk_pt;
 
-- 
2.43.0

