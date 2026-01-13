Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD04DCF45D4
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A68510E450;
	Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ2E2Bda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD0110E2FC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272758; x=1799808758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tLhmoJQ33sOyA8mjvpXqe/gnuITYDs+NzClmWltC7+g=;
 b=mJ2E2BdaG6k3Ov+UhFbyPaCP2THnanB3FdJ9UvXQfVxMzTdD6tiphzBZ
 pbqykPpLt38D4SCs0+SQUFqkAkwx+hCu5p+7gN/kFKp59PCgV+16cqEhM
 aATz78OBX0VPzRHPWenjWv6netD6/o9pk+mkYy0o9KXTu/yt7wQnxHxYD
 bHRGw/Gyjt/qmU5juKPacvP4ci3WX8TnBbY75mDMzHI6vyxZ21jYjmxRZ
 v84pYkDRBBfhjt3Y8B7pg3zIa08TIpLU1nfBhyxCJ5ncRwlf2SUW42qXe
 LIYAqKUU3ubnCERt5tHKZ573GJw1nKnJY/H9F3UU8/GLiaIdReR02ov0f A==;
X-CSE-ConnectionGUID: DQQ1fuciTR+rZkYrYmRhtA==
X-CSE-MsgGUID: DRcl7O56SUmXGDj/HCE91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714524"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:37 -0800
X-CSE-ConnectionGUID: MoLJkwF1TMO+K/0tDRssfg==
X-CSE-MsgGUID: ghuBJLxmTB6a8Jrq9mNuRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070308"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 01/12] drm/xe: Add normalize_invalidation_range
Date: Mon, 12 Jan 2026 18:52:21 -0800
Message-Id: <20260113025232.3504648-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Extract the code that determines the alignment of TLB invalidation into
a helper function — normalize_invalidation_range. This will be useful
when adding context-based invalidations to the GuC TLB invalidation
backend.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 71 +++++++++++++--------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 774467befbb9..43f6dbcb2bc2 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -111,6 +111,38 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
 }
 
+static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
+{
+	u64 orig_start = *start;
+	u64 length = *end - *start;
+	u64 align;
+
+	if (length < SZ_4K)
+		length = SZ_4K;
+
+	align = roundup_pow_of_two(length);
+	*start = ALIGN_DOWN(*start, align);
+	*end = ALIGN(*end, align);
+	length = align;
+	while (*start + length < *end) {
+		length <<= 1;
+		*start = ALIGN_DOWN(orig_start, length);
+	}
+
+	if (length >= SZ_2M) {
+		length = max_t(u64, SZ_16M, length);
+		*start = ALIGN_DOWN(orig_start, length);
+	}
+
+	xe_gt_assert(gt, length >= SZ_4K);
+	xe_gt_assert(gt, is_power_of_2(length));
+	xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
+					    ilog2(SZ_2M) + 1)));
+	xe_gt_assert(gt, IS_ALIGNED(*start, length));
+
+	return length;
+}
+
 /*
  * Ensure that roundup_pow_of_two(length) doesn't overflow.
  * Note that roundup_pow_of_two() operates on unsigned long,
@@ -138,48 +170,15 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 orig_start = start;
-		u64 align;
-
-		if (length < SZ_4K)
-			length = SZ_4K;
-
-		/*
-		 * We need to invalidate a higher granularity if start address
-		 * is not aligned to length. When start is not aligned with
-		 * length we need to find the length large enough to create an
-		 * address mask covering the required range.
-		 */
-		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(start, align);
-		end = ALIGN(end, align);
-		length = align;
-		while (start + length < end) {
-			length <<= 1;
-			start = ALIGN_DOWN(orig_start, length);
-		}
-
-		/*
-		 * Minimum invalidation size for a 2MB page that the hardware
-		 * expects is 16MB
-		 */
-		if (length >= SZ_2M) {
-			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(orig_start, length);
-		}
-
-		xe_gt_assert(gt, length >= SZ_4K);
-		xe_gt_assert(gt, is_power_of_2(length));
-		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
-						    ilog2(SZ_2M) + 1)));
-		xe_gt_assert(gt, IS_ALIGNED(start, length));
+		u64 normalize_len = normalize_invalidation_range(gt, &start,
+								 &end);
 
 		/* Flush on NULL case, Media is not required to modify flush due to no PPC so NOP */
 		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, !prl_sa);
 		action[len++] = asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
-		action[len++] = ilog2(length) - ilog2(SZ_4K);
+		action[len++] = ilog2(normalize_len) - ilog2(SZ_4K);
 	}
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
-- 
2.34.1

