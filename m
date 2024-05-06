Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87733C4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 03:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1893510ED7E;
	Mon,  6 May 2024 03:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRn0xDym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE22F10ED7E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 03:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714967245; x=1746503245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RK6yj4lD621S+Hs9R7/1VKnPvMeDk8oiL+OZurPhxpU=;
 b=RRn0xDymU+4xUjwG8b1d7scY4Mh9VATAmfx6OgWclSAP40IxJnjZRK1T
 O5bH4nLEJEskqq2674wE6vsHEGXX7vp89WOW0Rvu38XUEUC/h55ZY/nq7
 /A5NRBsLjuUuS7qnpvsCAaKLOWqSLHQ9oHdPweK6Z4xV6TKdf1xTc5HaL
 dCPFSG1ZlAm+u/lS0Z4wkxd6LKU7vJ+SEfJ5Qa6kusteZu6gwgez61eax
 rZvGeo+te6AqmcepBMhYPfFGWksv9bKBlllJfXVAXS98Y4G3L9baQbVb7
 1+HD9ixbvgJtUtIEpTPZhNh1XDkVwDg+NA85X4FN8Rx2vqBdQo0yxJ95I A==;
X-CSE-ConnectionGUID: hgt/QAvBRwmFEDGRQoAUcg==
X-CSE-MsgGUID: hItPNSyjTkKYCekfcjk1Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10851834"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="10851834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2024 20:47:24 -0700
X-CSE-ConnectionGUID: IlFaKTaCTLGBGtJSQ/CQ0A==
X-CSE-MsgGUID: yHkKxu4TRDGk84s4435b/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28144728"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2024 20:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: Use ordered WQ for G2H handler
Date: Sun,  5 May 2024 20:47:58 -0700
Message-Id: <20240506034758.3697397-1-matthew.brost@intel.com>
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

System work queues are shared, use a dedicated work queue for G2H
processing to avoid G2H processing getting block behind system tasks.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 5 +++++
 drivers/gpu/drm/xe/xe_guc_ct.h       | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8ac819a7061e..cc60c3333ce3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -121,6 +121,7 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
+	destroy_workqueue(ct->g2h_wq);
 	xa_destroy(&ct->fence_lookup);
 }
 
@@ -146,6 +147,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
 
+	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
+	if(!ct->g2h_wq)
+		return -ENOMEM;
+
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5083e099064f..105bb8e99a8d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -34,7 +34,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 		return;
 
 	wake_up_all(&ct->wq);
-	queue_work(system_unbound_wq, &ct->g2h_worker);
+	queue_work(ct->g2h_wq, &ct->g2h_worker);
 	xe_guc_ct_fast_path(ct);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index d29144c9f20b..fede4c6e93cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -120,6 +120,8 @@ struct xe_guc_ct {
 	wait_queue_head_t wq;
 	/** @g2h_fence_wq: wait queue used for G2H fencing */
 	wait_queue_head_t g2h_fence_wq;
+	/** @g2h_wq: used to process G2H */
+	struct workqueue_struct *g2h_wq;
 	/** @msg: Message buffer */
 	u32 msg[GUC_CTB_MSG_MAX_LEN];
 	/** @fast_msg: Message buffer */
-- 
2.34.1

