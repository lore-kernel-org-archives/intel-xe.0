Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03BBCCFA0D
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B0910E312;
	Sat,  1 Nov 2025 01:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HunBs2wI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED9410E110
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958954; x=1793494954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RMZ6BBZY4kugTuSd9BKcYSYPSf+CjrVZlkIpNjggXco=;
 b=HunBs2wIV0/Ii0+Ao0PNHyJgF0N9LERriOhO1guOvxi7JGVhNbvmUOeB
 4oHSTdiss/Zp2RCHh5Y63zFp1QUsfDT+Bbrq+eTHm6Yc1QRwliXMtZ9J2
 YryEPOKIiW9AcDYqTkf4y44+DT1+VPj8oSdJwRZgfOVClHHFZ77jaDtIg
 AWnsDFBQDlzF76Usa499RhQbSRwOU0mT984+VNIX2nfFoV2gdrkiWOEdj
 5TwSJn2Sj2tseek9qI8getxfrLqCwNSH0+FoBKsnH7Zxu4iOcHML6pFVM
 AeEhgSm+cN0S5eBxirqWcar1UG3K88d1jCIEUUh8QgX4zCAuQPNsW1Z0u Q==;
X-CSE-ConnectionGUID: 8K0aPD+gTmaaWOUnZJzT0g==
X-CSE-MsgGUID: 4A8ZLf7OT8yeabWahnCP1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575695"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575695"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: dbYcwc3NTyyiCL8ExaKf/A==
X-CSE-MsgGUID: 9v0crP16SHqPJXagP4B2GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020187"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 07/12] drm/xe: Rename send_tlb_inval_ppgtt to
 send_tlb_inval_asid_ppgtt
Date: Fri, 31 Oct 2025 18:02:20 -0700
Message-Id: <20251101010225.3095457-8-matthew.brost@intel.com>
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

Context-based TLB invalidations have their own set of GuC TLB
invalidation operations. Rename the current PPGTT invalidation function,
which operates on ASIDs, to a more descriptive name that reflects its
purpose.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 995789f0d31f..42e9fbd062ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -131,8 +131,8 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
  */
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
-static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				u64 start, u64 end, u32 asid)
+static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				     u64 start, u64 end, u32 asid)
 {
 #define MAX_TLB_INVALIDATION_LEN	7
 	struct xe_guc *guc = tlb_inval->private;
@@ -195,7 +195,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
-	.ppgtt = send_tlb_inval_ppgtt,
+	.ppgtt = send_tlb_inval_asid_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
 	.timeout_delay = tlb_inval_timeout_delay,
-- 
2.34.1

