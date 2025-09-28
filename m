Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CF2CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 15:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1010E394;
	Sun, 28 Sep 2025 15:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/rTGkQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FE710E394
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759071727; x=1790607727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vbRWkilJSbo5Jj3RMGmSWcp4biJftaTYrXoQbl6JZRo=;
 b=H/rTGkQwQ7mCRO0oY/Tbf2bBEZCeyDgW7sqz5I88BYEmIjC37POZa89n
 X25CdcwqnpZXdOK41KX5XZGPhOAUlBBADiD+7m/I8gIkcStHSqPY7aeSJ
 52seNT96jc6kgxllmktmwyP3dciiwBCWz/UxA83zItWC/vu41m9e6j8KL
 xpFVZ+0TmB+4tqM/Iz+qQpUH8njBH+rJdb/2fDxXf5DG0u/ww2GFfWslO
 BVLwF9qsMSqqiBYi+wvZunDhNVRq3KYjN55/4ew9oHh4vgLVNc+m+M9t6
 YRByGd2AOfCDKqgriu28mqKjBkwQ+olxICxKlQvEJXfy/sFaDjLBDIeDU w==;
X-CSE-ConnectionGUID: aBHRAmUPR/ChalF87iICCQ==
X-CSE-MsgGUID: Fh936V+TRMibp+W3ATPSSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61249813"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="61249813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 08:02:07 -0700
X-CSE-ConnectionGUID: 5dTCq3ITTdi+mWKjVfMnxA==
X-CSE-MsgGUID: ojntX9zGTn++DDbpYmzvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="208750540"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 08:02:05 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v3] drm/xe/migrate: Revamp PAT index selection for migrate PTEs
Date: Sun, 28 Sep 2025 20:28:55 +0530
Message-ID: <20250928145854.2288259-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Improve PAT index selection logic in xe_migrate.c to avoid unnecessary
coherency overhead when host-side memory is uncached. Previously,
we defaulted to XE_CACHE_WB, which enforces 2-way coherency and may
trigger cacheline pulls from CPU even when host-side memory is never
dirty.

This change introduces xe_migrate_pat_index() to choose the appropriate
PAT index. For iGPUs with WC host mappings, we now prefer XE_CACHE_NONE
to skip coherency snoops. For compressed PTEs on newer platforms, we
select XE_CACHE_NONE_COMPRESSION.

This avoids unnecessary cache traffic for uncached host mappings.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 36 +++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6fad5d469629..647b21727795 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -104,6 +104,21 @@ static void xe_migrate_fini(void *arg)
 	xe_exec_queue_put(m->q);
 }
 
+static inline u16 xe_migrate_pat_index(struct xe_device *xe,
+				       enum ttm_caching caching,
+				       bool is_comp_pte)
+{
+	enum xe_cache_level cache_level;
+
+	if (is_comp_pte)
+		cache_level = XE_CACHE_NONE_COMPRESSION;
+	else if (caching == ttm_cached)
+		cache_level = XE_CACHE_WB;
+	else
+		cache_level = XE_CACHE_NONE;
+	return xe->pat.idx[cache_level];
+}
+
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 {
 	XE_WARN_ON(slot >= NUM_PT_SLOTS);
@@ -177,9 +192,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				 struct xe_vm *vm, struct drm_exec *exec)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+	u16 pat_index;
 	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
+	enum ttm_caching caching = ttm_cached;
 #define VRAM_IDENTITY_MAP_COUNT	2
 	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
 #undef VRAM_IDENTITY_MAP_COUNT
@@ -205,6 +221,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	if (bo && bo->ttm.ttm)
+		caching = bo->ttm.ttm->caching;
+
+	pat_index = xe_migrate_pat_index(xe, caching, false);
+
 	/* PT30 & PT31 reserved for 2M identity map */
 	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
@@ -580,16 +601,13 @@ static void emit_pte(struct xe_migrate *m,
 	struct xe_device *xe = tile_to_xe(m->tile);
 	struct xe_vm *vm = m->q->vm;
 	u16 pat_index;
+	enum ttm_caching caching = ttm_cached;
 	u32 ptes;
 	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
 	/* Indirect access needs compression enabled uncached PAT index */
-	if (GRAPHICS_VERx100(xe) >= 2000)
-		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
-					  xe->pat.idx[XE_CACHE_WB];
-	else
-		pat_index = xe->pat.idx[XE_CACHE_WB];
+	pat_index = xe_migrate_pat_index(xe, caching, is_comp_pte);
 
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
@@ -1509,6 +1527,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	int err = 0;
 	bool is_migrate = pt_update_ops->q == m->q;
 	bool usm = is_migrate && xe->info.has_usm;
+	enum ttm_caching caching = ttm_cached;
 
 	for (i = 0; i < pt_update_ops->num_ops; ++i) {
 		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
@@ -1537,7 +1556,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	/* For sysmem PTE's, need to map them in our hole.. */
 	if (!IS_DGFX(xe)) {
-		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+		u16 pat_index = xe_migrate_pat_index(xe, caching, false);
 		u32 ptes, ofs;
 
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
@@ -1759,7 +1778,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct drm_pagemap_addr *sram_addr,
 				       u32 size)
 {
-	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	enum ttm_caching caching = ttm_cached;
+	u16 pat_index = xe_migrate_pat_index(tile_to_xe(m->tile), caching, false);
 	u32 ptes;
 	int i = 0;
 
-- 
2.43.0

