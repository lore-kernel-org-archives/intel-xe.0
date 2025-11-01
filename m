Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6687FCCFA07
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2ED10E18F;
	Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrndJ8Nz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64010E058
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958953; x=1793494953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vB5eP1xPdDYqr0wzrqqlVFcezUuj8/PlZv5o/+ERQpI=;
 b=LrndJ8NzsRYHb6F1/1dOF49c5XPr+n/m+1UkYFT1z3UhlRvuw3tZYeKi
 b8YrsqmE+Ee5oBDZi9x7j62VqMg2kRhCl30JBXauAx+1vj9xcn41WM1FF
 WDFK20V2T6AwNQtTId6ysqXS2iwaSOBnVYSrQh6mt/7ic0UxUMsF+U73F
 NKbw3eEmixHemTphpZ/q1TW14UJ1BFjLuNrkpBdNMd/b0paE1R4IshD/+
 KirMxoNGVPY7mUguZ6LOltPVdJpd2iHYD1ohK/AsUXe+msNtdh+YIrNGv
 XbY6fl5appyuJKzFJMWYEzQMrKuPNNakvmcS0eb1cotlBcR0P6Z9bkC9I w==;
X-CSE-ConnectionGUID: nIpAgis5T7y5HDD+9rZ/dQ==
X-CSE-MsgGUID: UJN+083GQLesZ0h6kgz8kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575691"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575691"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: 5qQsk/iTT72hauNoCt2xkQ==
X-CSE-MsgGUID: kg7L6lg2TmajgdlGUQvTEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020190"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 08/12] drm/xe: Add send_tlb_inval_ppgtt helper
Date: Fri, 31 Oct 2025 18:02:21 -0700
Message-Id: <20251101010225.3095457-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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

Extract the common code that issues a TLB invalidation H2G for PPGTTs
into a helper function. This helper can be reused for both ASID-based
and context-based TLB invalidations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 42e9fbd062ba..6978ee8edf2e 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -131,19 +131,15 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
  */
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
-static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				     u64 start, u64 end, u32 asid)
+static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
+				u64 end, u32 id, u32 type)
 {
 #define MAX_TLB_INVALIDATION_LEN	7
-	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
 	int len = 0;
 
-	if (guc_to_xe(guc)->info.force_execlist)
-		return -ECANCELED;
-
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = seqno;
 	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
@@ -153,18 +149,33 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 		u64 normalize_len = normalize_invalidation_range(gt, &start,
 								 &end);
 
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
-		action[len++] = asid;
+		action[len++] = MAKE_INVAL_OP(type);
+		action[len++] = id;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
 		action[len++] = ilog2(normalize_len) - ilog2(SZ_4K);
 	}
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
+#undef MAX_TLB_INVALIDATION_LEN
 
 	return send_tlb_inval(guc, action, len);
 }
 
+static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				     u64 start, u64 end, u32 asid)
+{
+	struct xe_guc *guc = tlb_inval->private;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	if (guc_to_xe(guc)->info.force_execlist)
+		return -ECANCELED;
+
+	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
+				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
+}
+
 static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
 {
 	struct xe_guc *guc = tlb_inval->private;
-- 
2.34.1

