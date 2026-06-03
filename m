Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80089CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43596112122;
	Wed,  3 Jun 2026 16:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibcEjfT4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96342112122
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780505493; x=1812041493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6JMtuZwLJzjZ39WgPq1XHDMasDMvagtoXHa30dnN7Q=;
 b=ibcEjfT4FAPIJCs/E0TBfunoc+SbywgX8pyYO+Kk3uwnSsbp+JGdHMNt
 a/l2ZF87Ha1Z9ZaM3PNpTir3gwg4L+uGU3EkuINJgmfePrEx7xELlkiZ5
 Y5zi0QxbdfkFUSS8pceaU1fRkqmjRCYwlHJWhUneOG7hIRVXjgEfdWPZT
 X/jhQJh9+/GuzD0NqbguSTee8TtKGatX6GGrrPFPtMlvKfI7PJ1H6hcDX
 wc4uSHW30buyBs7+nhM1SngnODIGT/RIP9GBUouMcdPakZhqsVNwvw/lW
 auq3qtSNg81BR4LvesdoXseQewasJSNFSZ2v1mYNsqlLkJmjlvItTDQdb Q==;
X-CSE-ConnectionGUID: wQLmrbGZSZWCbeXimLRq6w==
X-CSE-MsgGUID: QJddg9ZOSAi8oY9OmMuXuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81449072"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81449072"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:32 -0700
X-CSE-ConnectionGUID: 0RDotUJkRFeKgrrRPBU2AQ==
X-CSE-MsgGUID: 3UwZYZ72T5arQHjdB/OxCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="239817897"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.195])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v5 07/10] drm/xe/guc: handle submit mask with paging engine
Date: Wed,  3 Jun 2026 17:51:00 +0100
Message-ID: <20260603165052.183465-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603165052.183465-12-matthew.auld@intel.com>
References: <20260603165052.183465-12-matthew.auld@intel.com>
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
index 7dc10cfe98bb..8c03e56844c6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -983,6 +983,27 @@ static void __register_exec_queue(struct xe_guc *guc,
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
@@ -996,7 +1017,8 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
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

