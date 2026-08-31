Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5525CC61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D4910E767;
	Mon, 31 Aug 2026 08:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KF0CAL1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267E10E766
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165387; x=1819701387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sE0NIMQ6X/sgPkLlDIxqg2qNK3yFifJ37K5WGeF9Pjo=;
 b=KF0CAL1Y5Ft6gpanEJmpNBZjEAfzxKSbRnNdWjAusT4kyHDiRDdIdj27
 X8mL1d2s3UbQI9ufhOJh7YbAqw50nOdpHNYOp6DgJMRSab6y6xIijvjw7
 rnYbhMnGSRxga2FWrmc6tRjLHXrjLJNnXxZJsH07awQHaGfXr8hF0T/xq
 aWZKWB1H2So87e2Uoq1+UAbWXAUhoThgWfl9vCRCP+u7vAlWYlFpk+1P1
 o3DaI6oKwrH10xA5HTqGxMlv/YjsoqWBrCPGjM+LJNysvqpGGatnl6l6N
 kU3XHIgtUKMZepnwWiBwSraOMlAzcX1ykgBLMi3f20wMT0eMns8sf1g2F Q==;
X-CSE-ConnectionGUID: GJzTn9MnS9ii1vJeiAxZ9g==
X-CSE-MsgGUID: U0J3pSnFSQK4Yj+TVHJI1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106089719"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106089719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:36:27 -0700
X-CSE-ConnectionGUID: a1wkkGXiROWg41cKQcRNyA==
X-CSE-MsgGUID: NNiPypfISa2uNfsgO9ZlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293546358"
Received: from unknown (HELO ksatya-dev.iind.intel.com) ([10.190.229.72])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 01:36:25 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 07/10] drm/xe/vf: Add bounds checking for queried GGTT base
 and size
Date: Mon, 31 Aug 2026 14:06:09 +0530
Message-ID: <20260831083605.2115328-19-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
References: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for GGTT base and size which can detect
and reject invalid configuration data from a misconfigured or
malfunctioning PF, preventing protocol violations and protecting VF
initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V6 -> V7:
- Added new helper to get ggtt alignment.
- Rearranged the base and sizes checks (Sashiko, Michal W).

V5 -> V6:
- Updated error codes for unaligned GGTT base and size (Michal W).
- Fixed review comments (Michal W).

V4 -> V5:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 30 ++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 81d68fe5ad7c..bad8f1da1213 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -15,6 +15,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_gtt_defs.h"
 #include "regs/xe_guc_regs.h"
 
 #include "xe_assert.h"
@@ -486,11 +487,17 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	return value;
 }
 
+static u64 vf_get_ggtt_alignment(struct xe_gt *gt)
+{
+	return xe_vram_alignment(gt_to_xe(gt));
+}
+
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
+	u64 alignment = vf_get_ggtt_alignment(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_guc *guc = &gt->uc.guc;
-	u64 start, size, ggtt_size;
+	u64 start, size, ggtt_size, end;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -506,6 +513,27 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	if (!size)
 		return -ENODATA;
 
+	if (!IS_ALIGNED(start, alignment)) {
+		xe_gt_sriov_err(gt, "Unaligned GGTT base: %#llx, expected %#llx\n",
+				start, ALIGN(start, alignment));
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(size, alignment)) {
+		xe_gt_sriov_err(gt, "Unaligned GGTT size: %#llx, expected %#llx\n",
+				size, ALIGN(size, alignment));
+		return -EINVAL;
+	}
+
+	if (start < xe_wopcm_size(gt_to_xe(gt)) ||
+	    check_add_overflow(start, size, &end) ||
+	    end > GUC_GGTT_TOP) {
+		xe_gt_sriov_err(gt,
+				"Out of bounds GGTT configuration: base %#llx, size %#llx\n",
+				start, size);
+		return -ERANGE;
+	}
+
 	xe_tile_sriov_vf_ggtt_base_store(tile, start);
 	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
 	if (!ggtt_size) {
-- 
2.53.0

