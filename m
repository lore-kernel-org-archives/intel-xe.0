Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EFFE784AC
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05913113F74;
	Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7pHJdHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70315112ACD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625463; x=1798161463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzDPdQPdb7WSlJhg5sR0nzBJDTwZ82bQEQIR6h/j0pA=;
 b=a7pHJdHkSv3xmKTnc/SOwAMkCHKmg3/kt4ZTLpZbX5ZOzy4OGZmH++0F
 K7x2h1QUepslcqyqx//cRtg58fNy3SIQEMe/fB5iBT3AkZzh51DZgw8Zd
 GRX5gci7oe4j9Hi+H4CfQ4OJz2tqbwwJYNME3us3KQLtKzCxk8zLPN454
 r3vaD+QGna8upUSc63b+xEdduOf9Cx/MY+yj7xNkwZBSE7g++c+Ijf3ca
 3c3YF8OzjdhXVCZnAJzH8BRudgEarXA7wsOdqNVDsku8RlgTA/F9+LGjJ
 3769XylaBpmSl9CXor4sXIufRmyD3/QSlHU8Xx5rlGbj+w287NC043rUw w==;
X-CSE-ConnectionGUID: zvTRDwMZTo+y++W0ZsEJUA==
X-CSE-MsgGUID: b3SX2L8jRMOSwPUAvB0vgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866365"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:42 -0800
X-CSE-ConnectionGUID: pApwy2dITsOhyaTtZecX0A==
X-CSE-MsgGUID: oUjfqlu4SyaxmBPxww2h6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629149"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 11/13] drm/xe: Enable deadlines on hardware fences
Date: Wed, 24 Dec 2025 17:17:32 -0800
Message-Id: <20251225011734.341683-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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
index 8b884691718f..9452ea2be62f 100644
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
@@ -191,12 +193,23 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
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

