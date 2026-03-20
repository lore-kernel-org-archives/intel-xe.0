Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A85F1099B30
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 20:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D428610EB05;
	Fri, 20 Mar 2026 20:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhZJn6TE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAE810EB05
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 20:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774039599; x=1805575599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+4/FGhi/+6n1nsbzoKSQrDd0zl2CWXeDgTCqT67LrSA=;
 b=KhZJn6TEr7khl6+1YKuv+G0GkSHgOFXjonqgd7Uxbe1OTbec7YRVnmBN
 uZzBvzdbVM4TmCe2IRHXqanZZ4z1menTRwhfqzXCY3AirqPhNRZL8UrtI
 FesIMZPK1mgkeOeUL4SC8N6XbUJpSQPD5QxmbGTgvg6ok+fAdjkx3cUaq
 Gs68h4aPqk0dqRp+j3mNLsMW+1hAIsc+yQJ88OcH61fnSGv7vzE/zQMRQ
 wA5uREe20XXMWiAgjP+c757+fsLCrKuL7wq2qVAxtWVTlbYaEXE7kIhdS
 2Y0jS5IBycrzez1Fji4JMXCdX3hUz4RP7X0o0ShL1fFcsMNFt6tAKu/t4 Q==;
X-CSE-ConnectionGUID: fxALoMk1TRWUbEjUNCjXxQ==
X-CSE-MsgGUID: wHdaF++JTAye/QN8LPPX3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="92516360"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92516360"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 13:46:39 -0700
X-CSE-ConnectionGUID: 6G2RFV34RrOQY+O6B+DClg==
X-CSE-MsgGUID: rIyqI8QwQYW70/pd+MmF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223380498"
Received: from dut4407arlh.fm.intel.com ([10.105.10.118])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 13:46:38 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, jonathan.cavitt@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Date: Fri, 20 Mar 2026 20:46:30 +0000
Message-ID: <20260320204635.94924-1-stuart.summers@intel.com>
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

Allow platform-defined TLB invalidation min and max lengths.

This gives finer granular control to which invalidations we
decide to send to GuC. The min size is essentially a round
up. The max allows us to switch to a full invalidation.

The expectation here is that GuC will translate the full
invalidation in this instance into a series of per context
invalidaitons. These are then issued with no H2G or G2H
messages and therefore should be quicker than splitting
the invalidations from the KMD in max size chunks and sending
separately.

v2: Add proper defaults for min/max if not set in the device
    structures
v3: Add coverage for pow-of-2 out of bounds cases

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h  |  4 +++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 39 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pci.c           |  3 +++
 drivers/gpu/drm/xe/xe_pci_types.h     |  2 ++
 4 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 615218d775b1..0c4168fe2ffb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -137,6 +137,10 @@ struct xe_device {
 		u8 vm_max_level;
 		/** @info.va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
+		/** @info.min_tlb_inval_size: Minimum size of context based TLB invalidations */
+		u64 min_tlb_inval_size;
+		/** @info.max_tlb_inval_size: Maximum size of context based TLB invalidations */
+		u64 max_tlb_inval_size;
 
 		/*
 		 * Keep all flags below alphabetically sorted
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..e9e0be94ceef 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -115,14 +115,23 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
 }
 
+/*
+ * Ensure that roundup_pow_of_two(length) doesn't overflow.
+ * Note that roundup_pow_of_two() operates on unsigned long,
+ * not on u64.
+ */
+#define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
+
 static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u64 orig_start = *start;
 	u64 length = *end - *start;
 	u64 align;
 
-	if (length < SZ_4K)
-		length = SZ_4K;
+	xe_gt_assert(gt, length <= MAX_RANGE_TLB_INVALIDATION_LENGTH);
+
+	length = max_t(u64, xe->info.min_tlb_inval_size, length);
 
 	align = roundup_pow_of_two(length);
 	*start = ALIGN_DOWN(*start, align);
@@ -147,13 +156,6 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
 	return length;
 }
 
-/*
- * Ensure that roundup_pow_of_two(length) doesn't overflow.
- * Note that roundup_pow_of_two() operates on unsigned long,
- * not on u64.
- */
-#define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
-
 static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 				u64 end, u32 id, u32 type,
 				struct drm_suballoc *prl_sa)
@@ -162,8 +164,20 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
 	u32 action[MAX_TLB_INVALIDATION_LEN];
-	u64 length = end - start;
+	u64 normalize_len, length = end - start;
 	int len = 0, err;
+	bool do_full_inval = false;
+
+	if (!xe->info.has_range_tlb_inval ||
+	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
+		do_full_inval = true;
+	} else {
+		normalize_len = normalize_invalidation_range(gt, &start,
+							     &end);
+
+		if (normalize_len > xe->info.max_tlb_inval_size)
+			do_full_inval = true;
+	}
 
 	xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
 			  !xe->info.has_ctx_tlb_inval) ||
@@ -172,12 +186,9 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
-	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
-	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
+	if (do_full_inval) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 normalize_len = normalize_invalidation_range(gt, &start,
-								 &end);
 		bool need_flush = !prl_sa &&
 			seqno != TLB_INVALIDATION_SEQNO_INVALID;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 189e2a1c29f9..5e02f9ab625b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -743,6 +743,9 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.vm_max_level = desc->vm_max_level;
 	xe->info.vram_flags = desc->vram_flags;
 
+	xe->info.min_tlb_inval_size = desc->min_tlb_inval_size ?: SZ_4K;
+	xe->info.max_tlb_inval_size = desc->max_tlb_inval_size ?: SZ_1G;
+
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
 	xe->info.has_fan_control = desc->has_fan_control;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 8eee4fb1c57c..cd9d3ad96fe0 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -34,6 +34,8 @@ struct xe_device_desc {
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
+	u64 min_tlb_inval_size;
+	u64 max_tlb_inval_size;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
-- 
2.43.0

