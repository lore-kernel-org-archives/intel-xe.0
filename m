Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADB1C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 13:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20FE10F80A;
	Fri,  3 Jul 2026 13:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rm/eZtr2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72D110F806
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783085120; x=1814621120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=73o+6Zy0MppDBu4qYAJ/BBouIs+JHxy2tEEsGMpodZc=;
 b=Rm/eZtr2Jwl5hwlDY6Ob9UsZzC/0Lk1YVCjUTJT01Sw2SfuCzIumRXIz
 wsx/fVR1E+YYSkevjmgxOoda5k29kpqhRno7qOwXluCUEe4GjED0DceiB
 JRgyJ5eqz48pQw0J1oihHde0UzAe+Lha9PAKTxb5VV77N6P75Rw4C9wkO
 OuQUkRTq3xKIEAXt6qgA9LMtfiudra0qySCGJ+RVkqTJmSWa/a2Yll3CU
 vM/vL7rSYmFR67b3PeuQxGrBOhwer73FoMvah/UHaVENW+gBBj6OTuqUg
 SRRToAPQodRdZCseuRvrAAT5kQmYjKetlYWOpei6fPECdvKrDQlLQcQkS w==;
X-CSE-ConnectionGUID: mwtEFrBfTvCqy2/JcWpq5w==
X-CSE-MsgGUID: fcB+AH+fRSSx40xoB62xJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83931913"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83931913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:25:19 -0700
X-CSE-ConnectionGUID: vh7bEvq8SpWP8/uVZYCGCg==
X-CSE-MsgGUID: F9xJ6VcAR/yeCk/saG+2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="249757983"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:25:17 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v5] drm/xe/migrate: Revamp PAT index selection for migrate PTEs
Date: Fri,  3 Jul 2026 18:52:35 +0530
Message-ID: <20260703132234.402273-2-sanjay.kumar.yadav@intel.com>
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

Assisted-by: GitHub Copilot:claude-sonnet-5
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9428dd5e7760..63f79673e4cc 100644
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
@@ -631,18 +652,13 @@ static void emit_pte(struct xe_migrate *m,
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 	struct xe_vm *vm = m->q->vm;
-	u16 pat_index;
+	struct xe_bo *bo = ttm_to_xe_bo(res->bo);
+	enum ttm_caching caching = bo->ttm.ttm ? bo->ttm.ttm->caching : ttm_cached;
+	u16 pat_index = xe_migrate_pat_index(xe, caching, is_comp_pte);
 	u32 ptes;
 	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
-	/* Indirect access needs compression enabled uncached PAT index */
-	if (GRAPHICS_VERx100(xe) >= 2000)
-		pat_index = is_comp_pte ? xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION) :
-					  xe_cache_pat_idx(xe, XE_CACHE_WB);
-	else
-		pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
-
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
 	while (ptes) {
-- 
2.52.0

