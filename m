Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB5FC47DD9
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 23:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D994310EAB3;
	Thu, 22 Feb 2024 23:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfZjQX3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3527D10EAB5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708643971; x=1740179971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AbmWntHeafB1xASMDSf0HVNASlg4YDG9XmzNqydcPBM=;
 b=PfZjQX3hYyfxL5oQUwenxNvUqH9sRWGRxFeG18D8vrCoIREig12sn9cS
 btqMMCejM3NRXmyh0KXS/a6i/sL8WA6UHgJSsymNEaI4/xlYg83zblfF0
 Fl/eLED0sTpUTXXh+iRZFc3ZOTYyr0eVHP5J3/YvEciA+CQSJlCuzG24L
 mYkR8ugfTH2wX/SpEPf1rEB7chsP4VaRQlvW6Lo7nkjSxRJ9d6wJRbUwD
 BW9JVIz17azYLQw8tcXul7Qq3OdinpauoBfp3C8ONzIZQB+/DOnbb0Qu6
 HGE7hM3oXenvKnFvDrDPqXw7Ik9dTKVgQIobRnH6MstKQ1JZgPnLzAP2X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3067684"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3067684"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827621152"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="827621152"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 3/3] drm/xe: Don't support execlists in
 xe_gt_tlb_invalidation layer
Date: Thu, 22 Feb 2024 15:20:21 -0800
Message-Id: <20240222232021.3911545-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222232021.3911545-1-matthew.brost@intel.com>
References: <20240222232021.3911545-1-matthew.brost@intel.com>
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

The xe_gt_tlb_invalidation layer implements TLB invalidations for a GuC
backend. Simply return if in execlists mode. A follow up may properly
implement the xe_gt_tlb_invalidation layer for both GuC and execlists.

Fixes: a9351846d945 ("drm/xe: Break of TLB invalidation into its own file")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 48bf5fdb0fbe..71ab03956670 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -286,6 +286,14 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 
 	xe_gt_assert(gt, vma);
 
+	/* Execlists not supported */
+	if (gt_to_xe(gt)->info.force_execlist) {
+		if (fence)
+			__invalidation_fence_signal(fence);
+
+		return 0;
+	}
+
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
 	if (!xe->info.has_range_tlb_invalidation) {
@@ -354,6 +362,10 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	struct xe_guc *guc = &gt->uc.guc;
 	int ret;
 
+	/* Execlists not supported */
+	if (gt_to_xe(gt)->info.force_execlist)
+		return 0;
+
 	/*
 	 * XXX: See above, this algorithm only works if seqno are always in
 	 * order
-- 
2.34.1

