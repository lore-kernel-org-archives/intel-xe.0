Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC7C7EE2F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF45D10E628;
	Fri, 19 May 2023 23:19:08 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359A110E4A5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538330; x=1716074330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/QziqWM1TTEg/fKXVK4aP8xEntWRUPPFzsCeoQ0KZKs=;
 b=fLmgxa8HtQR7VtYbyWvse8aZMkcoZotzOgcQgDGglNtz/IPl1+pZLB3x
 YWhpF5KszVQbNt+clp6UUOSK0Jl3vtDyK8H/+MFwGX9d58DqIHOfdgK7V
 kUa/oXCIi1NBK5/10fxOjO20xE2DZmSscXnVF1ufkaLRbohubs2t1vETm
 RYpCMlR1KZGUyVuHDBpp07VqQL+yAVOM5RfKSctccUwhyTwArLsQufC/q
 N45m5kqAfmaGjR819x07sv0Dv4iGSsfyVUxo2AC7JDZgjfEZ/UXy5RE9M
 VGtREZ4bXcrpIbqZoLcnc3DxczPkmHtFMs4K08yplJSe8AgNixaOqL2wF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526383"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526383"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888759"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888759"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:22 -0700
Message-Id: <20230519231827.3572452-26-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 25/30] drm/xe: Invalidate TLB on all affected
 GTs during GGTT updates
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GGTT is part of the tile and is shared by the primary and media GTs
on platforms with a standalone media architecture.  However each of
these GTs has its own TLBs caching the page table lookups, and each
needs to be invalidated separately.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7c87623ef5c5..31f958613c2f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -188,13 +188,10 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 #define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
 #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
 
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
+static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 {
-	/*
-	 * TODO: Loop over each GT in tile once media GT support is
-	 * re-added
-	 */
-	struct xe_gt *gt = ggtt->tile->primary_gt;
+	if (!gt)
+		return;
 
 	/* TODO: vfunc for GuC vs. non-GuC */
 
@@ -219,6 +216,13 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	}
 }
 
+void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
+{
+	/* Each GT in a tile has its own TLB to cache GGTT lookups */
+	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
+	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
+}
+
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 {
 	u64 addr, scratch_pte;
-- 
2.40.0

