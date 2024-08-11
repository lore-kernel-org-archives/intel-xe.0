Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5F6C3DA4A
	for <intel-xe@archiver.kernel.org>; Sun, 11 Aug 2024 09:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532C410E180;
	Sun, 11 Aug 2024 09:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="w1nJHBAl";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115C810E180
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Aug 2024 09:41:09 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1723369261; bh=HuUpMMF8ZQJn0xqXnIo8zaQK36NSwiQO6newOkVBeG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w1nJHBAl2Ud0QNMYmeuAUl30HuvomiCjt2l6tNnr/G9UkV38jRfLDog1FKRzlmWil
 2Kzb/e1hQLBo3/jNy4BjBBBvMTCyR+Jr0LXSgvO1/OOvHVRTLoj/41iHivmm5qap4E
 mq+rdHRXhlvgaNdYTgy2gkpGP9gryf/JhvIL7JLYhNlQyCmJCUtSXwKoqQSTeIgnFD
 PCn7CZnl1JTLwpTPz/3LnvY54BN5h2iKE27qFQQ7qAob+Ywf3EywZ/iakEJUv1XGEc
 5dgqoOM5toooNQ8rE9iwbQmSeSVRC4hd3CpsO+Qc+u1l7WCYm1pwSzXLdo6STMBpnx
 k/clVvsvmfbkg==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 47B9evin2063220; Sun, 11 Aug 2024 12:40:57 +0300
Date: Sun, 11 Aug 2024 12:40:57 +0300
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Stuart Summers <stuart.summers@intel.com>
Cc: matthew.brost@intel.com, John.C.Harrison@intel.com, brian.welty@intel.com, 
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org
Subject: Re: [CI 2/3] drm/xe: Use topology to determine page fault queue size
Message-ID: <pw7gmewl75vjcapsk7as4lkymiq5vkt4j2iedwp4b5kfezbn6s@4wpuwrh2qgfj>
References: <cover.1722269793.git.stuart.summers@intel.com>
 <1fbe39c6503b5fa15aeb49d803f0e0edb6525a95.1722269793.git.stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <1fbe39c6503b5fa15aeb49d803f0e0edb6525a95.1722269793.git.stuart.summers@intel.com>
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

On 29.07.2024 16:19, Stuart Summers wrote:
>Currently the page fault queue size is hard coded. However
>the hardware supports faulting for each EU and each CS.
>For some applications running on hardware with a large
>number of EUs and CSs, this can result in an overflow of
>the page fault queue.
>
>Add a small calculation to determine the page fault queue
>size based on the number of EUs and CSs in the platform as
>detmined by fuses.
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 54 +++++++++++++++++++++-------
> drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++--
> 2 files changed, 49 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index b2a7fa55bd18..6bfc60c0274a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> 			PFD_VIRTUAL_ADDR_LO_SHIFT;
>
> 		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
>-			PF_QUEUE_NUM_DW;
>+			pf_queue->pf_queue_num_dw;
> 		ret = true;
> 	}
> 	spin_unlock_irq(&pf_queue->lock);
>@@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
> {
> 	lockdep_assert_held(&pf_queue->lock);
>
>-	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
>+	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
>+			  pf_queue->pf_queue_num_dw) <=
> 		PF_MSG_LEN_DW;
> }
>
>@@ -312,22 +313,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	u32 asid;
> 	bool full;
>
>-	/*
>-	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
>-	 */
>-	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
>-
> 	if (unlikely(len != PF_MSG_LEN_DW))
> 		return -EPROTO;
>
> 	asid = FIELD_GET(PFD_ASID, msg[1]);
> 	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
>
>+	/*
>+	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
>+	 */
>+	xe_gt_assert(gt, !(pf_queue->pf_queue_num_dw % PF_MSG_LEN_DW));

hi,
I think this check should be done once at initialization and not every time the handler is called.

>+
> 	spin_lock_irqsave(&pf_queue->lock, flags);
> 	full = pf_queue_full(pf_queue);
> 	if (!full) {
> 		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
>-		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
>+		pf_queue->head = (pf_queue->head + len) %
>+			pf_queue->pf_queue_num_dw;
> 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
> 	} else {
> 		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
>@@ -386,26 +388,54 @@ static void pagefault_fini(void *arg)
> {
> 	struct xe_gt *gt = arg;
> 	struct xe_device *xe = gt_to_xe(gt);
>+	int i;
>
> 	if (!xe->info.has_usm)
> 		return;
>
> 	destroy_workqueue(gt->usm.acc_wq);
> 	destroy_workqueue(gt->usm.pf_wq);
>+
>+	for (i = 0; i < NUM_PF_QUEUE; ++i)
>+		kfree(gt->usm.pf_queue[i].data);
>+}
>+
>+static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>+{
>+	xe_dss_mask_t all_dss;
>+	int num_dss, num_eus;
>+
>+	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
>+		  XE_MAX_DSS_FUSE_BITS);
>+
>+	num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
>+	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
>+				XE_MAX_EU_FUSE_BITS) * num_dss;
>+
>+	/* user can issue separate page faults per EU and per CS */
>+	pf_queue->pf_queue_num_dw =
>+		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>+
>+	pf_queue->gt = gt;
>+	pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw, GFP_KERNEL);

you should check that data != NULL

>+	spin_lock_init(&pf_queue->lock);
>+	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
>+
>+	return 0;
> }
>
> int xe_gt_pagefault_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>-	int i;
>+	int i, ret = 0;
>
> 	if (!xe->info.has_usm)
> 		return 0;
>
> 	for (i = 0; i < NUM_PF_QUEUE; ++i) {
>-		gt->usm.pf_queue[i].gt = gt;
>-		spin_lock_init(&gt->usm.pf_queue[i].lock);
>-		INIT_WORK(&gt->usm.pf_queue[i].worker, pf_queue_work_func);
>+		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
>+		if (ret)

and here you should free previous allocations
thanks,
Dafna

>+			return ret;


> 	}
> 	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
> 		gt->usm.acc_queue[i].gt = gt;
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 631928258d71..331d783a0a2d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -238,9 +238,14 @@ struct xe_gt {
> 		struct pf_queue {
> 			/** @usm.pf_queue.gt: back pointer to GT */
> 			struct xe_gt *gt;
>-#define PF_QUEUE_NUM_DW	128
> 			/** @usm.pf_queue.data: data in the page fault queue */
>-			u32 data[PF_QUEUE_NUM_DW];
>+			u32 *data;
>+			/**
>+			 * @usm.pf_queue_num_dw: number of DWORDS in the page
>+			 * fault queue. Dynamically calculated based on the number
>+			 * of compute resources available.
>+			 */
>+			u32 pf_queue_num_dw;
> 			/**
> 			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
> 			 * moved by worker which processes faults (consumer).
>-- 
>2.34.1
>
