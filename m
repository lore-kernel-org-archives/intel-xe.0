Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D388DC98305
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC2910E1FD;
	Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaIV5Fnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED9410E264
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601866; x=1800137866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ycc/JeJtM+zihO6sWnOTU2zKURQxgPaJ1NpC94SRZkM=;
 b=AaIV5FnjFt/EbrWfvvGwvw0plH0kGTEcLV5nfYtmtdiU1kgU1b51RSSn
 SmOI4Vivt0BGfh8A59bE3c2ELrc5SIS0N77c5E0cds6BZ00JBMDp46W2L
 IxcZsr7gFUqrEGporJbVrYSHhsIwdSOOcRi4l+m3frBoip7JWdevFLVfG
 R85ZDneUaHQDDW9U3IfWGuPR9FqHeosA7RemhRndLiTlP0M9JbRehWF1n
 4bIVa5kFQjc4TYaU8LbnfH1O3mowLM9QXxwBCmlh1dIsSiMojoV5lKlkf
 29lLsCbmndUJ3jr6oYIhWSaCtmoV40mZ04S87aTkmJL7h+NbhzDPsQbjU Q==;
X-CSE-ConnectionGUID: C1MWM3mPSS6elKQYQbmb4Q==
X-CSE-MsgGUID: Jhd/1iEGSmSXKWytkpNclA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123345"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123345"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: cDc3l2wHS7yQysJJhqArhw==
X-CSE-MsgGUID: yNWEWivjQUuRTMRS4nd+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962693"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 01/11] drm/xe: Add normalize_invalidation_range
Date: Fri, 16 Jan 2026 14:17:21 -0800
Message-Id: <20260116221731.868657-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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
Tested-by: Stuart Summers <stuart.summers@intel.com>
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

