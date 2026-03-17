Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8542BFEDA0D
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 19:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C07210E40C;
	Tue, 17 Mar 2026 19:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eX98cTBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1112910E40C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 19:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773777040; x=1805313040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WThuOA3CpZ6nKLQ7l2jxWrQC+iPF+xc1b3IO+MAZRq8=;
 b=eX98cTBtFK4PUahz8f92U0FHzwgmC5p9lVnAdXRt49EYxjRqhhFZyhNw
 ClE4cbeX/mZE8qNxtTeyI2PTeITwDyHRpZ35R4yHoThWNWNqkLbuIxYyE
 8mu0QQdm3ixz4Fnj5obt8tsJNIk801YTXrcb/nbv6EONZ/DX3egSd5Oqc
 JjfdAbzz/e/amHS99+5+sdmiSXO0diCp/1UNKmqKNvftDGxRY7HX0G+E9
 3OyGRZaDjK1SLx6xiMyavcbZFpOMPR+AAfvCqTPE7Ie7Ygv03C/uxlDd/
 SEXl4kBYTH3VYshAA5vTplZ/hvB8flsKOil+pz9dcoD1w4LLfwf1117r3 A==;
X-CSE-ConnectionGUID: zmESon8FQwKrf8E6HjHbjA==
X-CSE-MsgGUID: 1tO2ks2NSM6WjHeuEU1fEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85452526"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="85452526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 12:50:40 -0700
X-CSE-ConnectionGUID: 0eWwhKqqRuOnjSBMsK2BQQ==
X-CSE-MsgGUID: Rub9q758TpaBJJE4UZo0+A==
X-ExtLoop1: 1
Received: from dut4407arlh.fm.intel.com ([10.105.10.118])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 12:50:39 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Date: Tue, 17 Mar 2026 19:50:35 +0000
Message-ID: <20260317195037.97302-1-stuart.summers@intel.com>
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
invalidations. These are then issued with no H2G or G2H
messages and therefore should be quicker than splitting
the invalidations from the KMD in max size chunks and sending
separately.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h  |  4 ++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_pci.c           |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h     |  2 ++
 4 files changed, 16 insertions(+), 6 deletions(-)

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
index ced58f46f846..256759b826bc 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -117,12 +117,12 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 
 static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u64 orig_start = *start;
 	u64 length = *end - *start;
 	u64 align;
 
-	if (length < SZ_4K)
-		length = SZ_4K;
+	length = max_t(u64, xe->info.min_tlb_inval_size, length);
 
 	align = roundup_pow_of_two(length);
 	*start = ALIGN_DOWN(*start, align);
@@ -162,9 +162,12 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
 	u32 action[MAX_TLB_INVALIDATION_LEN];
-	u64 length = end - start;
+	u64 normalize_len, length = end - start;
 	int len = 0, err;
 
+	normalize_len = normalize_invalidation_range(gt, &start,
+						     &end);
+
 	xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
 			  !xe->info.has_ctx_tlb_inval) ||
 		     (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
@@ -173,11 +176,10 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
 	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
-	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
+	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH ||
+	    normalize_len > xe->info.max_tlb_inval_size) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 normalize_len = normalize_invalidation_range(gt, &start,
-								 &end);
 		bool need_flush = !prl_sa &&
 			seqno != TLB_INVALIDATION_SEQNO_INVALID;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 189e2a1c29f9..12569367034b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -742,6 +742,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
 	xe->info.vram_flags = desc->vram_flags;
+	xe->info.min_tlb_inval_size = desc->min_tlb_inval_size;
+	xe->info.max_tlb_inval_size = desc->max_tlb_inval_size;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
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

