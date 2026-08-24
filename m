Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011D8C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF25D10E579;
	Mon, 24 Aug 2026 16:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dC3PiPur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8120C10E579
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589390; x=1819125390;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YstJlJ+N2vd8fhQlwGDj9sJAMYH3GAVUPK8jXbj2mRE=;
 b=dC3PiPurS0c/mtjIhgBJ/zJB2Np64fqq29xcRneLBO0Y3dHQRSbb7cI6
 bSSJASriM3tvbw2UtXjD9Hcmisiq9rXLVEJuXkyDicNZdK5drcmivadQj
 RckTf87/owlkn75SmPlY2gTV+GU18vu2z+4KBC1wiMCuxMiuccfbgIxKW
 USeFnrNBaYTG7O8b5D04j3xnEbcyWamjrhoYgZGSoVqhTJTEfe58IWENQ
 zoAwp23kYvC0qjBbRUsWUbnRZ/KkovtEKIkGlxik0EKKOode/qSrrGyFP
 nbe0GP2NMcTBskp7psyFta9uDrT2XT31hKIoLEN0dcOP56OFwVnI0NvRN g==;
X-CSE-ConnectionGUID: 5FD7PbnCTh2dHB/lDRbMpw==
X-CSE-MsgGUID: tKATuFgrRDKCUN3xU1u2Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99209649"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="99209649"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:36:29 -0700
X-CSE-ConnectionGUID: eZjHclP6TIKUJDHGB0Sr6A==
X-CSE-MsgGUID: /EwGxqYIRji33Jz6IuYO9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263321843"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 09:36:28 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue
 GTs
Date: Mon, 24 Aug 2026 22:04:58 +0530
Message-ID: <20260824163458.3129935-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Engines cache GGTT translations in their own TLBs, which the
xe_tlb_inval_ggtt() does not touch.
After a GGTT unmap the engines can still hit the stale translation and
read the old page.

Issue an INVAL_FULL (intra vf) invalidation on GGTT unmap, gated on the
GT having any multi-queue engine class.

v2: Use xe_gt_has_multi_queue() helper and other knits. - Niranjana

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 4cddd69f0e99..0f8946fddbaa 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -464,6 +464,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
 
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 {
@@ -502,8 +503,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 			      xe_ggtt_node_size(node), use_scratch);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
-	if (bound && node->invalidate_on_remove)
+	if (bound && node->invalidate_on_remove) {
 		xe_ggtt_invalidate(ggtt);
+		/* Drain engine TLBs so a recycled range can't hit a stale entry. */
+		xe_ggtt_invalidate_engine(ggtt);
+	}
 	mutex_unlock(&ggtt->lock);
 
 	ggtt_node_fini(node);
@@ -612,6 +616,23 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
+/*
+ * Drain engine-side GGTT TLBs on teardown so a recycled range's next
+ * occupant can't hit a predecessor's cached translation.
+ */
+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
+{
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+	int err;
+
+	if (!xe_gt_has_multi_queue(gt))
+		return;
+
+	err = xe_tlb_inval_ggtt_full(&gt->tlb_inval);
+	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
+		   ERR_PTR(err));
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
-- 
2.46.0

