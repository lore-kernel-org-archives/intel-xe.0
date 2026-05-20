Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C458ECD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC9A10E428;
	Wed, 20 May 2026 23:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaCA3VXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5A310E428
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779320988; x=1810856988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P77qAkUz0cnFyO5pvDzEyE+dz36m4uDSf+IpfF0k2WI=;
 b=AaCA3VXLcY5uZasJfbqs3DGG5PnneVA5RrjqA5nc3JxijZzPPEySRRCX
 r6CvVFXfVSMaT5X2Mgf6+i5Otzbe0xIMJR8cjP/lsXitGfhbErTdNX7vh
 Adl3CQU4B6UsdetuIb7Viz7rY08k4Y+k4/axpYgBsz5jbdw9+XCbZ6Osz
 F15DgwxWdCbCBRubEx2qp/nxfvLGKgbDyNRAnupSc2dvv3yIwYIKIvuk2
 KDXoSKOiKscYaegcTatclgZRPEHdmltOzV9rceo9CPMbGlvo/SwoA1MNY
 Xi701svW9uKhhFSc7pzkAOKdFedw2SKHzKcLcEH2b6G8pVckpHFuxMjrA Q==;
X-CSE-ConnectionGUID: PrAMf+zkRk2RJYvjTGZhYA==
X-CSE-MsgGUID: 3LcJtGPaSGS8DbqIAvfsIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80213987"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80213987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 16:49:47 -0700
X-CSE-ConnectionGUID: lgabgfkOSJ+BVfslUqjJRQ==
X-CSE-MsgGUID: OEBmMMFxSISWP3yIWyilsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="242165617"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.179])
 by fmviesa004.fm.intel.com with ESMTP; 20 May 2026 16:49:47 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>, stable@vger.kernel.org,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] drm/xe: Use PDE mask for 2M page reclaim entries
Date: Wed, 20 May 2026 23:49:47 +0000
Message-ID: <20260520234946.1055572-2-brian3.nguyen@intel.com>
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

2M pages use PDE encoding where the physical address occupies bits [51:21],
but generate_reclaim_entry() uses XE_PTE_ADDR_MASK (bits [51:12]) for all
leaf entries. Add XE_PDE_ADDR_MASK and select the correct mask based on
whether the entry is a 2M PDE.

Fixes: 83b914f972bb ("drm/xe: Fix page reclaim entry handling for large pages")
Cc: stable@vger.kernel.org
Suggested-by: Zongyao Bai <zongyao.bai@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h | 1 +
 drivers/gpu/drm/xe/xe_pt.c            | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 4d83461e538b..22a6c197ed96 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -10,6 +10,7 @@
 #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
 
 #define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
+#define XE_PDE_ADDR_MASK	GENMASK_ULL(51, 21)
 #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
 
 #define GUC_GGTT_TOP		0xFEE00000
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2669ff5ee747..ae5ed0370d72 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1615,7 +1615,11 @@ static int generate_reclaim_entry(struct xe_tile *tile,
 {
 	struct xe_gt *gt = tile->primary_gt;
 	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
-	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
+	bool is_2m = xe_child->level == 1 && (pte & XE_PDE_PS_2M);
+	/* 2M pages are encoded as PDEs, other reclaimable pages use PTE encoding */
+	u64 addr_mask = is_2m ? XE_PDE_ADDR_MASK : XE_PTE_ADDR_MASK;
+	u64 phys_addr = pte & addr_mask;
+	/* Page address is relative to 4K page regardless of entry level */
 	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
 	int num_entries = prl->num_entries;
 	u32 reclamation_size;
@@ -1641,7 +1645,7 @@ static int generate_reclaim_entry(struct xe_tile *tile,
 		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT, 1);
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
 		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
-	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
+	} else if (is_2m) {
 		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT, 1);
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
 		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
-- 
2.43.0

