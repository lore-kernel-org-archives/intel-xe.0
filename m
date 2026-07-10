Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A39C44501
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 08:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87C110E13F;
	Fri, 10 Jul 2026 08:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSEqYJkX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F7910E158
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783672399; x=1815208399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ppweDX9F29szfHvfSzWjJXQ0a2xWb7JcS5iMbGONdKc=;
 b=jSEqYJkXa7s/MjjAV14JH/IsLiHGSTC6ZbY8RD3k4PWF5cNL6WtjQbx2
 Aj+7S2vEr26sHwjDb24gYY786LQLRsWgxvze1X0mVlLz72FsPvam72Ni8
 ooS1W+nQorIxqelBt1YQ2VoPfHVyeb2VaFlgIme9X2vfJk9XM+X++Q/Kn
 OWtB+OFHf1LFUqinIej/ypjMCRJp6GCD13EcXuKevT1prVxEh9RYRxVIA
 ZUmhBRqvpTVljYerSGtUHWGhOWVEqn+PclqMlzoDfFgtSfJ39w2+EWpj9
 Mdgh0eWcMEsDdB11I990yRsDxDF68d8N90q4Q5g7DB/X8Pq1ufyEMGaVB A==;
X-CSE-ConnectionGUID: 7nUEpeBxQBiblztNA4KW+g==
X-CSE-MsgGUID: ZWyfacCQT1+rDLg2VdaBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107167312"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107167312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 01:33:19 -0700
X-CSE-ConnectionGUID: oGZTdjU0QOu2r3BzVo9XiA==
X-CSE-MsgGUID: HN+o+RgwS/OQIrmeyvnB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255482724"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 01:33:18 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6] drm/xe/migrate: Revamp PAT index selection for migrate PTEs
Date: Fri, 10 Jul 2026 14:00:05 +0530
Message-ID: <20260710083004.1546599-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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
PAT index based on the actual TTM caching mode of the buffer object
being mapped. For iGPUs with WC host mappings, we now prefer
XE_CACHE_NONE to skip coherency snoops. For compressed PTEs on newer
platforms, we select XE_CACHE_NONE_COMPRESSION.

This avoids unnecessary cache traffic for uncached host mappings.

v6: (sashiko)
- Only apply the BO's host-side caching for system-memory PTEs.

v5: (Matt A)
- Simplify emit_pte() to derive caching from res->bo directly, removing
  the separate bo parameter
- Leave changes in __xe_migrate_update_pgtables() and
  build_pt_update_batch_sram()
- Fix comment about page-walker coherency in xe_migrate_pat_index()

v4:
- Keep xe_migrate_prepare_vm() on XE_CACHE_WB since page tables require
  page-walker coherency.
- Pass BO into emit_pte() and select PAT attributes from the BO's TTM
  caching mode.

Assisted-by: GitHub Copilot:claude-opus-4.8
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9428dd5e7760..cad8f0e443af 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -117,6 +117,27 @@ static void xe_migrate_fini(void *arg)
 	xe_exec_queue_put(m->q);
 }
 
+static inline u16 xe_migrate_pat_index(struct xe_device *xe,
+				       enum ttm_caching caching,
+				       bool is_comp_pte)
+{
+	enum xe_cache_level cache_level;
+
+	/*
+	 * Select the appropriate PAT index for buffer object PTEs programmed
+	 * by emit_pte(). We choose not to mess with xe_migrate_prepare_vm()
+	 * yet, for simplicity.
+	 */
+	if (is_comp_pte && GRAPHICS_VERx100(xe) >= 2000)
+		cache_level = XE_CACHE_NONE_COMPRESSION;
+	else if (caching == ttm_cached)
+		cache_level = XE_CACHE_WB;
+	else
+		cache_level = XE_CACHE_NONE;
+
+	return xe_cache_pat_idx(xe, cache_level);
+}
+
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 {
 	XE_WARN_ON(slot >= NUM_PT_SLOTS);
@@ -631,17 +652,17 @@ static void emit_pte(struct xe_migrate *m,
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 	struct xe_vm *vm = m->q->vm;
+	struct xe_bo *bo = ttm_to_xe_bo(res->bo);
+	enum ttm_caching caching = ttm_cached;
 	u16 pat_index;
 	u32 ptes;
 	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
-	/* Indirect access needs compression enabled uncached PAT index */
-	if (GRAPHICS_VERx100(xe) >= 2000)
-		pat_index = is_comp_pte ? xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION) :
-					  xe_cache_pat_idx(xe, XE_CACHE_WB);
-	else
-		pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
+	if (!is_vram && bo->ttm.ttm)
+		caching = bo->ttm.ttm->caching;
+
+	pat_index = xe_migrate_pat_index(xe, caching, is_comp_pte);
 
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
-- 
2.52.0

