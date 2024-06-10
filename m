Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC89AC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 20:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2FF10E473;
	Mon, 10 Jun 2024 20:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZf574Tn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEA910E528
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718051597; x=1749587597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CagnJpEP+nWx/c0Gj2GWA6muVIjM0prozEEEUqw5Su0=;
 b=fZf574TnQv2cU4WRBjFxDmw8BxrHyoA33og627JZNeaYkSmApza8cwgB
 bGowLlk9G4uh6jF5u3L4Dw+ICB6KjW3aJyNo3MKCLoDFPToNh8vjzmV7x
 fBhs2Rtf5Jmzq7zRyzuKTtfINC/ZEgy1S8FeRRhWnHGZHH7u6/IxxgGxS
 Dob80LoPnFSLIRAzhyuos+eWvKlQ1iBmeXj31wD8ezmlF/Xu1mDXFpqz/
 zxNa3wM075gn/heXfYT9C/IB4EQkLvuSFdOJm2hZf7rFXvj5E2+kr3o74
 7XgD1F6AtEObAx4u42Co42InJimOsFVyFohBw7+dTZz+G+yMNnwQsi0bJ Q==;
X-CSE-ConnectionGUID: YJvliewdTS6MEGgM7K1eZQ==
X-CSE-MsgGUID: HZkrhnvgRbCxbeM0xNMTYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14611180"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14611180"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 13:33:16 -0700
X-CSE-ConnectionGUID: 2VZ3/LMOTqKTJcZXLmtiVw==
X-CSE-MsgGUID: BBaeuwfNR6KdiWWnUFjxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39022141"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT152ICLU.fm.intel.com) ([10.105.23.81])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 13:33:16 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: brian.welty@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/2] drm/xe: Use topology to determine page fault queue size
Date: Mon, 10 Jun 2024 20:33:00 +0000
Message-Id: <20240610203300.182615-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610203300.182615-1-stuart.summers@intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
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

Currently the page fault queue size is hard coded. However
the hardware supports faulting for each EU and each CS.
For some applications running on hardware with a large
number of EUs and CSs, this can result in an overflow of
the page fault queue.

Add a small calculation to determine the page fault queue
size based on the number of EUs and CSs in the platform as
detmined by fuses.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 49 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_types.h     |  4 +--
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3858c8e0b707..5565732e79e9 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 			PFD_VIRTUAL_ADDR_LO_SHIFT;
 
 		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
-			PF_QUEUE_NUM_DW;
+			pf_queue->pf_queue_num_dw;
 		ret = true;
 	}
 	spin_unlock_irq(&pf_queue->lock);
@@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
 {
 	lockdep_assert_held(&pf_queue->lock);
 
-	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
+	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
+			  pf_queue->pf_queue_num_dw) <=
 		PF_MSG_LEN_DW;
 }
 
@@ -312,11 +313,6 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 asid;
 	bool full;
 
-	/*
-	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
-	 */
-	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
-
 	if (unlikely(len != PF_MSG_LEN_DW))
 		return -EPROTO;
 
@@ -327,7 +323,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	full = pf_queue_full(pf_queue);
 	if (!full) {
 		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
-		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
+		pf_queue->head = (pf_queue->head + len) %
+			pf_queue->pf_queue_num_dw;
 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
 	} else {
 		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
@@ -382,18 +379,42 @@ static void pf_queue_work_func(struct work_struct *w)
 
 static void acc_queue_work_func(struct work_struct *w);
 
+static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
+{
+	xe_dss_mask_t all_dss;
+	int num_dss, num_eus;
+
+	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+
+	num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
+	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
+				XE_MAX_EU_FUSE_BITS) * num_dss;
+
+	/* user can issue separate page faults per EU and per CS */
+	pf_queue->pf_queue_num_dw =
+		ALIGN(num_eus + XE_NUM_HW_ENGINES, PF_MSG_LEN_DW);
+
+	pf_queue->gt = gt;
+	pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw, GFP_KERNEL);
+	spin_lock_init(&pf_queue->lock);
+	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
+
+	return 0;
+}
+
 int xe_gt_pagefault_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i;
+	int i, ret = 0;
 
 	if (!xe->info.has_usm)
 		return 0;
 
 	for (i = 0; i < NUM_PF_QUEUE; ++i) {
-		gt->usm.pf_queue[i].gt = gt;
-		spin_lock_init(&gt->usm.pf_queue[i].lock);
-		INIT_WORK(&gt->usm.pf_queue[i].worker, pf_queue_work_func);
+		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
+		if (ret)
+			return ret;
 	}
 	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
 		gt->usm.acc_queue[i].gt = gt;
@@ -418,12 +439,16 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 void xe_gt_pagefault_fini(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	int i;
 
 	if (!xe->info.has_usm)
 		return;
 
 	destroy_workqueue(gt->usm.acc_wq);
 	destroy_workqueue(gt->usm.pf_wq);
+
+	for (i = 0; i < NUM_PF_QUEUE; ++i)
+		kfree(gt->usm.pf_queue[i].data);
 }
 
 void xe_gt_pagefault_reset(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 10a9a9529377..c40b9c1b5fec 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -232,9 +232,9 @@ struct xe_gt {
 		struct pf_queue {
 			/** @usm.pf_queue.gt: back pointer to GT */
 			struct xe_gt *gt;
-#define PF_QUEUE_NUM_DW	128
 			/** @usm.pf_queue.data: data in the page fault queue */
-			u32 data[PF_QUEUE_NUM_DW];
+			u32 *data;
+			u32 pf_queue_num_dw;
 			/**
 			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
 			 * moved by worker which processes faults (consumer).
-- 
2.34.1

