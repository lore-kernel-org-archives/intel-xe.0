Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF30ECD98D5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9886210EFED;
	Thu, 11 Jun 2026 16:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvTCR6d+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53C10EFEE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781194674; x=1812730674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xe3kvHXYW2594a6t7pGramKeqilcmfLUcx7HMiu9ElE=;
 b=hvTCR6d+p8Ag5gJhb32L6aIEqQKc3dLXfB3FgAP/7U1FudnOcSEvTUHO
 RqXz5q2zrH9cKz24bUVtXnL8W6f8Fs07wx4CAS965yh3cOEsBLODF74jw
 LE1uzhYIfTC2W+eOPtBP2kEl8K1skXOPKs7B/RJyEiECevAgdvYv9WQPp
 +LiM4xjPoOJldg6532saPTIOjw2KdN0a0KlqNxxLwTi3eP43F/GqKXELK
 yzO2DfL0hupVoPoDxIL6xVMR0QMfPAe/aT1Xe0d6aDkgjl9/IFeiIDIgb
 FeqpJLTaI2Vy+aSXb1yDWMviKumVhl7mafvkCUU7XcqmEIMtQowEO+h8k A==;
X-CSE-ConnectionGUID: bDKB6IIAQBGVpnn1Z2+vJg==
X-CSE-MsgGUID: k8uKst94RzOlpHLDCzNnLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93402999"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93402999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:54 -0700
X-CSE-ConnectionGUID: RD5jQUOlRY2idjaJczrGTA==
X-CSE-MsgGUID: Yjvh8kaaQ3O9viqIWFx+ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251617060"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.170])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 07/10] drm/xe/guc: handle submit mask with paging engine
Date: Thu, 11 Jun 2026 17:16:42 +0100
Message-ID: <20260611161634.506476-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611161634.506476-12-matthew.auld@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
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

We need to re-map the submit mask so that we correctly account for the
logical mask of paging engines, if the GUC_PAGING_CLASS is in play. We
could also have multiple instances (possible on VF), so we need to
handle that also.

v2 (Daniele):
  - Move the implementation to guc_submit.c

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 66ae0b140e8a..13447d21973c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -972,6 +972,27 @@ static void __register_exec_queue(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
+static u32 xe_hwe_guc_logical_to_submit_mask(struct xe_hw_engine *hwe, u32 logical_mask)
+{
+	struct xe_gt *gt = hwe->gt;
+
+	if (xe_gt_is_usm_hwe(gt, hwe)) {
+		int shift = gt->usm.paging_hwe0->logical_instance;
+		u32 paging_logical_mask = gt->usm.paging_logical_mask;
+
+		xe_gt_assert(gt, (logical_mask & paging_logical_mask) == logical_mask);
+
+		/*
+		 * Remap to GUC_PAGING_CLASS logical instance mask, if
+		 * applicable.
+		 */
+		if (xe_guc_has_paging_engine(&hwe->gt->uc.guc))
+			return logical_mask >> shift;
+	}
+
+	return logical_mask;
+}
+
 static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -985,7 +1006,8 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
 	info.engine_class = xe_hwe_to_guc_class(q->hwe);
-	info.engine_submit_mask = q->logical_mask;
+	info.engine_submit_mask =
+		xe_hwe_guc_logical_to_submit_mask(q->hwe, q->logical_mask);
 	info.hwlrca_lo = lower_32_bits(xe_lrc_descriptor(lrc));
 	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
-- 
2.54.0

