Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1571DC52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 11:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB94610E3AB;
	Wed, 14 Aug 2024 11:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwcU+jCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EA810E3AB
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723633320; x=1755169320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TP1DZ1zukA7q4XjMjAkYc64V6VZkX8Wt/Uo/0ndVLZ8=;
 b=WwcU+jCQ6lnhTLKfaf/Ph2i7X/A1gMN1x82oql1z/kvQTIsKDgmwSTvE
 IjzqEXlAWkvUbhxYKouQCAAsv81K6glBSqK5FmcwMEIVmdiHJhx1GpuaO
 2SwR4L+qlcDHhbHa1DD+qNhPAmAn+5nALU62JIyIJsLbhoSGcORu/x5jz
 KYYQawSKUV1nrXd1IwyCKIfFj7an/PuHpuvLL2JJcTtFGbLAVy9YG8Nh+
 IeMEjDZ5YL7Qgm1kZNw+m0IFYObU3WGz4zi1Ufi07HXh1Ac+x3+/8HD/W
 YWjQYC1ZxHq2XnUej/E0Z4WdjxzMxTUSqUHpVm2joUFWVD+Oh8lVOzREC Q==;
X-CSE-ConnectionGUID: diJqllFlREyjhKcF/dX3Nw==
X-CSE-MsgGUID: RUCWNxCMQKyfwpwaFzuGlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32983808"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="32983808"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:01:58 -0700
X-CSE-ConnectionGUID: PKIm5cQKTtadckkqnDzsjQ==
X-CSE-MsgGUID: fU9+CYZVRliTuWXhI7Tpag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="58939824"
Received: from olympicsflex3.amr.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:01:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: prevent UAF around preempt fence
Date: Wed, 14 Aug 2024 12:01:30 +0100
Message-ID: <20240814110129.825847-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

The fence lock is part of the queue, therefore in the current design
anything locking the fence should then also hold a ref to the queue to
prevent the queue from being freed.

However, currently it looks like we signal the fence and then drop the
queue ref, but if something is waiting on the fence, the waiter is
kicked to wake up at some later point, where upon waking up it first
grabs the lock before checking the fence state. But if we have already
dropped the queue ref, then the lock might already be freed as part of
the queue, leading to uaf.

To prevent this, move the fence lock into the fence itself so we don't
run into lifetime issues. Alternative might be to have device level
lock, or only release the queue in the fence release callback, however
that might require pushing to another worker to avoid locking issues.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2454
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2342
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2020
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_exec_queue.c          | 1 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h    | 2 --
 drivers/gpu/drm/xe/xe_preempt_fence.c       | 3 ++-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h | 2 ++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 971e1234b8ea..0f610d273fb6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -614,7 +614,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		if (xe_vm_in_preempt_fence_mode(vm)) {
 			q->lr.context = dma_fence_context_alloc(1);
-			spin_lock_init(&q->lr.lock);
 
 			err = xe_vm_add_compute_exec_queue(vm, q);
 			if (XE_IOCTL_DBG(xe, err))
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1408b02eea53..fc2a1a20b7e4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -126,8 +126,6 @@ struct xe_exec_queue {
 		u32 seqno;
 		/** @lr.link: link into VM's list of exec queues */
 		struct list_head link;
-		/** @lr.lock: preemption fences lock */
-		spinlock_t lock;
 	} lr;
 
 	/** @ops: submission backend exec queue operations */
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 56e709d2fb30..83fbeea5aa20 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -134,8 +134,9 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
 {
 	list_del_init(&pfence->link);
 	pfence->q = xe_exec_queue_get(q);
+	spin_lock_init(&pfence->lock);
 	dma_fence_init(&pfence->base, &preempt_fence_ops,
-		      &q->lr.lock, context, seqno);
+		      &pfence->lock, context, seqno);
 
 	return &pfence->base;
 }
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence_types.h b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
index b54b5c29b533..312c3372a49f 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
@@ -25,6 +25,8 @@ struct xe_preempt_fence {
 	struct xe_exec_queue *q;
 	/** @preempt_work: work struct which issues preemption */
 	struct work_struct preempt_work;
+	/** @lock: dma-fence fence lock */
+	spinlock_t lock;
 	/** @error: preempt fence is in error state */
 	int error;
 };
-- 
2.46.0

