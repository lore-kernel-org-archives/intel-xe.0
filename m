Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0DAC2A062
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FDB10E394;
	Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5ZCBQFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3963C10E27C
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lYjMzrvAE0LDzev5LpJ4X/V2TX2YbBQ/upW3ce3VUsc=;
 b=C5ZCBQFr0m/zgoDsJAx9XqU2UgwKFy+YSUD1eMXpKcnnqmVHB2t1cz8j
 GI2devw1f/qZQC9ZKawvtyWqwO7P3GM1c3a3aQf4rHvy/mnjGO4dm3G2j
 xjV3ErViTyJuaJ9IJxLIIPhRkGv5P8O04yn7N0jyDrIhpz/rfbiPC5S5k
 NiK62+jinLtPAn5BBZjyh0z2vNquaWwq0SUxXDrv/ZmAc2+bFalY/dHdA
 uM1jJ77T+/zDjKaYvEeMcK51Frrmn+ULcP3CDcGYQWiqSHq2acqQUh0Zu
 jwZzv/61iURVEF00IZWROaecqo3obQRzzopiKpxmzkmWYXpjx465+QhnD A==;
X-CSE-ConnectionGUID: bb2pQ7KrQlGzrww2ZexE7w==
X-CSE-MsgGUID: 2tpiDnlxTEmu2/LFJd8Yfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856266"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856266"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:45 -0800
X-CSE-ConnectionGUID: eKK5pf/8Qu21yxAxb4IwIQ==
X-CSE-MsgGUID: u4YWuazCSwmrjnUO9VWgmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060675"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 13/22] drm/xe: Enable deadlines on hardware fences
Date: Sun,  4 Jan 2026 20:02:28 -0800
Message-Id: <20260105040237.1307873-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Implement the set_deadline vfunc on hardware fences, which, with GuC
submission, allows priority and frequency boosts for queues that have
fences at risk of missing a deadline.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 37ba1d9612ba..f6f7ceb5cfc5 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -66,6 +66,7 @@ static void hw_fence_irq_run_cb(struct irq_work *work)
 			if (dma_fence_is_signaled_locked(dma_fence)) {
 				trace_xe_hw_fence_signal(fence);
 				list_del_init(&fence->irq_link);
+				fence->q = NULL;
 				dma_fence_put(dma_fence);
 			}
 		}
@@ -93,6 +94,7 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 		spin_lock_irqsave(&irq->lock, flags);
 		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
 			list_del_init(&fence->irq_link);
+			fence->q = NULL;
 			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
 			dma_fence_put(&fence->dma);
 		}
@@ -197,12 +199,23 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
 	call_rcu(&dma_fence->rcu, fence_free);
 }
 
+static void xe_hw_fence_set_deadline(struct dma_fence *dma_fence,
+				     ktime_t deadline)
+{
+	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
+
+	guard(spinlock_irqsave)(dma_fence->lock);
+	if (fence->q)
+		fence->q->ops->set_deadline(fence->q, dma_fence, deadline);
+}
+
 static const struct dma_fence_ops xe_hw_fence_ops = {
 	.get_driver_name = xe_hw_fence_get_driver_name,
 	.get_timeline_name = xe_hw_fence_get_timeline_name,
 	.enable_signaling = xe_hw_fence_enable_signaling,
 	.signaled = xe_hw_fence_signaled,
 	.release = xe_hw_fence_release,
+	.set_deadline = xe_hw_fence_set_deadline,
 };
 
 /**
-- 
2.34.1

