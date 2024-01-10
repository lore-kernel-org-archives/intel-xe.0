Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60D9C4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 15:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747C910E035;
	Wed, 10 Jan 2024 15:20:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C8410E035
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704900009; x=1736436009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mxnplmyxmzizqEEAvZevzVDctVP+P5kX+4B7IzWnEco=;
 b=Uug0cAsFkI1gTyJNlE5Z8XCDdpBw9GLVb/yoKE60Xbdjam1xN4VtaaD4
 M4ev+Nkj3ZHIp2O/3j9xBj18sRJo836HiMbqvLQ9ZqleTm1DwCRGBxWuF
 phWNbRic/K4IkOH2onMJ1e18Z3x7wFoNT0Lxxem9jZQVC2ZPBRsI13Fft
 d46rYWVLKS9DMM/nwPIz8XYTnpK7nJofZhrsN3yCZdoo4bbzMUXH0yERF
 X6LAjrPhOWtoiemJVo7PgszrNF/HfYIqV66+FZaP/Sf3rdoKPsaWrXKGd
 uOxlAeZv+MqHs8KkqW2M6FBKlveQDQWejB5KkknlfAQsCx9Q8I2KWAz5O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5632715"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5632715"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="955404675"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955404675"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:20:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	rodrigo.vivi@intel.com
Subject: [RFC PATCH] drm/xe: PM snippet
Date: Wed, 10 Jan 2024 07:20:33 -0800
Message-Id: <20240110152033.1414372-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Code snippet for [1] as guide as to where to add PM refs.

[1] https://patchwork.freedesktop.org/series/128044/
---
 drivers/gpu/drm/xe/xe_gt.c         |  3 +++
 drivers/gpu/drm/xe/xe_guc_ct.c     | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
 drivers/gpu/drm/xe/xe_pt.c         | 10 ++++++++++
 4 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..f829a1f59d42 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -604,6 +604,7 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_fail;
 	}
 
+	/* PM get */
 	xe_gt_sanitize(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
@@ -630,6 +631,7 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	/* PM put */
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
@@ -641,6 +643,7 @@ static int gt_reset(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
+	/* PM put */
 	xe_device_mem_access_put(gt_to_xe(gt));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c29f095aa1b9..fdc25b076758 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -307,6 +307,14 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	mutex_lock(&ct->lock);
 	spin_lock_irq(&ct->fast_lock);
+	/*
+	 *  Drop ct->g2h_outstanding PM refs here, it is expected that we will
+	 *  not transition to zero here. Note this changing with [1] but the
+	 *  idea anytime this is set zero, drop the number of PM refs by the
+	 *  initial value and transitioning to zero is not expected.
+	 *
+	 * [1] https://patchwork.freedesktop.org/series/128062/
+	 */
 	ct->g2h_outstanding = 0;
 	ct->enabled = true;
 	spin_unlock_irq(&ct->fast_lock);
@@ -388,7 +396,13 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 
 		ct->ctbs.g2h.info.space -= g2h_len;
 		ct->g2h_outstanding += num_g2h;
+		/*
+		 * If it is safe, ct->lock & ct->fast_lock are held, dma fencing
+		 * path, take num_g2h PM refs here. It should be expected that
+		 * we have at least 1.
+		 */
 	}
+
 }
 
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
@@ -399,6 +413,12 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 
 	ct->ctbs.g2h.info.space += g2h_len;
 	--ct->g2h_outstanding;
+
+	/*
+	 * If it is safe, ct->fast_lock is held, possible IRQ context, dma
+	 * fencing path, drop 1 PM ref here. The PM ref can transition to zero
+	 * here.
+	 */
 }
 
 static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 54ffcfcdd41f..a64768257d51 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1168,6 +1168,8 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
+	/* PM get, ref can be zero, dma-fencing path */
+
 	trace_xe_sched_msg_recv(msg);
 
 	switch (msg->opcode) {
@@ -1186,6 +1188,8 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
+
+	/* PM put, ref can go to zero, dma-fencing path */
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..d2ef0a5b514e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1104,8 +1104,18 @@ static void invalidation_fence_work_func(struct work_struct *w)
 	struct invalidation_fence *ifence =
 		container_of(w, struct invalidation_fence, work);
 
+	/*
+	 * PM get, ref can be zero.
+	 *
+	 * Ideally make this so we have at least 1 ref, maybe if we take a
+	 * reference to the job this is attached and drop the ref after calling
+	 * xe_gt_tlb_invalidation_vma we can ensure the device is awake?
+	 */
+
 	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
 	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
+
+	/* PM put, ref can go to zero */
 }
 
 static int invalidation_fence_init(struct xe_gt *gt,
-- 
2.34.1

