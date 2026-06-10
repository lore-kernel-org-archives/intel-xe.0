Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E89FCD98D0
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC16F10EC03;
	Wed, 10 Jun 2026 21:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/4y0s1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB30D10EBF9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126920; x=1812662920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+RwXEC/ZXAzCyRDg2frPYCSvrXywgjobJ7XGUOTsGs=;
 b=G/4y0s1B0BNaG+IjuhG7iGjOW7boYoitWLOiFZfGx7QR69n2fsEn92Rj
 /GCq6ov1WgQ8G+va+iQKiR58rvttbFq2MEVzQFd/H6RtPx4OCM9d9krrd
 qfE3i4lKBzcRiVl1q8hPh1nfO5ihCeue8ltUtF95+ucT+AVbq3eme5BXs
 LgKvdn6+YZUXB4bP1DS3sn6HV6onxZ/zRU9l+ctzAchMw4kwOnp//GDR6
 UUzdHAHVcb1Oc0YrFSeMPaRu03yNtTAFBZxeQBx2XTWtWflLRrLOrDjTF
 AIfFdbu6Gswx7meU7X8zCiyQwohX9+6FFQLd3xHu2icRfk+0rRXjAIO/g A==;
X-CSE-ConnectionGUID: ES1hTa3qSCqCNnN7HDF5iA==
X-CSE-MsgGUID: Q9+/RBKPT1GJ/+uZbf31Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934687"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934687"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:39 -0700
X-CSE-ConnectionGUID: R7vlPhDCTf6QAcgqQdXorQ==
X-CSE-MsgGUID: CSs5u4HST1yDrQpGZ4SUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292070"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:38 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 08/11] drm/xe: Track all exec queues in a device-level ufence
 list
Date: Wed, 10 Jun 2026 21:28:40 +0000
Message-ID: <20260610212833.153366-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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

Add ufence_link to struct xe_exec_queue and maintain a device-level
ufence_list (protected by ufence_list_lock) so the default MSI-X vector
handler can reach every queue's per-queue wait queue.

As mentioned in a prior patch that adds the per queue wait queue,
we can't guarantee userspace will pass something appropriate in
the wait user fence ioctl. And in fact I have found cases in IGT
where it does not - basically it issues a VM bind without a bind
exec queue and then adds a non-bind queue to the wait user fence
call. Of course I'd argue this is a test bug, but also we want
to avoid any large regressions from the UAPI perspective, so
this ufence list is used to walk through all potential per exec queue
wait queues users might have pending to make sure we wake all of
them up if we get an MSI-X interrupt in without a corresponding
exec queue.

Note that actually hooking up the wait user fence piece of this
is deferred to a later patch.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_device.c           |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h     |  6 ++++++
 drivers/gpu/drm/xe/xe_exec_queue.c       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 +++
 4 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..a0fabeabc9d7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -549,6 +549,8 @@ int xe_device_init_early(struct xe_device *xe)
 	xe_validation_device_init(&xe->val);
 
 	init_waitqueue_head(&xe->ufence_wq);
+	spin_lock_init(&xe->ufence_list_lock);
+	INIT_LIST_HEAD(&xe->ufence_list);
 
 	init_rwsem(&xe->usm.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ff15de34fd17..bf421d8cd0b1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -351,6 +351,12 @@ struct xe_device {
 	/** @ufence_wq: user fence wait queue */
 	wait_queue_head_t ufence_wq;
 
+	/** @ufence_list_lock: protects @ufence_list */
+	spinlock_t ufence_list_lock;
+
+	/** @ufence_list: list of all exec queues for default-vector ufence wake */
+	struct list_head ufence_list;
+
 	/** @preempt_fence_wq: used to serialize preempt fences */
 	struct workqueue_struct *preempt_fence_wq;
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index aa49400b67ba..585eb1100a01 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -169,8 +169,16 @@ static void exec_queue_msix_fini(struct xe_exec_queue *q)
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	struct xe_device *xe = gt_to_xe(q->gt);
+	unsigned long irq_flags;
 	int i;
 
+	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
+		spin_lock_irqsave(&xe->ufence_list_lock, irq_flags);
+		list_del_init(&q->ufence_link);
+		spin_unlock_irqrestore(&xe->ufence_list_lock, irq_flags);
+	}
+
 	for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
 		if (q->tlb_inval[i].dep_scheduler)
 			xe_dep_scheduler_fini(q->tlb_inval[i].dep_scheduler);
@@ -236,6 +244,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 {
 	struct xe_exec_queue *q;
 	struct xe_gt *gt = hwe->gt;
+	unsigned long irq_flags;
 	int err;
 
 	/* only kernel queues can be permanent */
@@ -260,7 +269,14 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
+	INIT_LIST_HEAD(&q->ufence_link);
 	init_waitqueue_head(&q->ufence_wq);
+
+	if (!(flags & EXEC_QUEUE_FLAG_KERNEL)) {
+		spin_lock_irqsave(&xe->ufence_list_lock, irq_flags);
+		list_add(&q->ufence_link, &xe->ufence_list);
+		spin_unlock_irqrestore(&xe->ufence_list_lock, irq_flags);
+	}
 	spin_lock_init(&q->multi_queue.lock);
 	spin_lock_init(&q->lrc_lookup_lock);
 	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index fdc7baaa952e..150237f173c2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -234,6 +234,9 @@ struct xe_exec_queue {
 	/** @ufence_wq: per-queue user fence wait queue */
 	wait_queue_head_t ufence_wq;
 
+	/** @ufence_link: link into xe_device.ufence_list for default-vector wake */
+	struct list_head ufence_link;
+
 	/** @ufence_syncobj: User fence syncobj */
 	struct drm_syncobj *ufence_syncobj;
 
-- 
2.43.0

