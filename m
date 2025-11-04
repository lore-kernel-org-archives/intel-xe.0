Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357ACCCFA0C
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EA410E671;
	Tue,  4 Nov 2025 19:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0KK1dMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AA910E665
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286182; x=1793822182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fansc7IgrIO/32id4sLHq8S/+ebnsPA3cpGE5t4Gkh8=;
 b=h0KK1dMGCW8uU21Pyx24bF+kGY5sBrWHhS7oay9XJQ98Emz7KNpqjyaN
 8BfSesf9RkDIhOEQpcPQYpA0TkgY0dQJx2+HSU+K/LDVaTvEKPrQYx6KL
 YyDol3RCnqOdJTB+2kThFyr5ISkfU0h1AK7kTDlv8eDG+IEfsPSScysJk
 QMHbW82mDvBw2+qabROtzj84Qia+tUI4HvucZxzERH4TCyF0N5tv8cQ+Z
 fKhOz3Tke2cEAfhLFX0XE6vJKqSk81nX2XObfAI3Spqk6BeKRIM3oxHc/
 7Rhkk0Xfn52gIqJ9ICV5EagEaV0QmHWskRTarZY86eFEZY4EvJQVQa8Bs Q==;
X-CSE-ConnectionGUID: 3e91ituWQMePmCjROYHzHA==
X-CSE-MsgGUID: VksmDiksSDSO1EQe/YQVDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74686105"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74686105"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:21 -0800
X-CSE-ConnectionGUID: QjZWn1CITkyneW8qWkaxbw==
X-CSE-MsgGUID: DkLD/u/0SbCWN4Oe7iblhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="218051125"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v2 01/12] drm/xe: Add normalize_invalidation_range
Date: Tue,  4 Nov 2025 11:56:05 -0800
Message-Id: <20251104195616.3339137-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104195616.3339137-1-matthew.brost@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 71 +++++++++++++--------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index a80175c7c478..61bfa0d485f6 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -92,6 +92,38 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	return -ECANCELED;
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
@@ -118,47 +150,14 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
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
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
 		action[len++] = asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
-		action[len++] = ilog2(length) - ilog2(SZ_4K);
+		action[len++] = ilog2(normalize_len) - ilog2(SZ_4K);
 	}
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
-- 
2.34.1

