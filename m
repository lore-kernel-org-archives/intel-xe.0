Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A919C3065C
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 04:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1E910E174;
	Thu,  4 Jul 2024 04:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JM9IOV7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D786810E21D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 04:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720065947; x=1751601947;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QGsyvplPO0wusHyH5BDICj+tXji5OEXdD4H1XAV3g9E=;
 b=JM9IOV7FzC3b1jpITIXldJg7wmdh4iJlemhdUxfvPi2I74ZCa3GYfqdV
 4kLN2q+UFgqYwtLhyw5d7gJIXrq8HIZSJyOJhAnFQlpz5+nh+cDy/J0Gw
 hvYup2a4OMSstScxDLe3xhdvahj6yLxGyxYQ60UePVnyHyrDpr/5R3MKU
 gRm2/3NoG1aDXdXw9n16E2l93AOSAA+mcantHndUTw9HcVjilBBpzM+PG
 SpuIu8Q10XDsKFOeAYoDQTL93wX9sORVylbSKUSTs/nf7R9MamTVzIL+3
 ja9/36lE+7lJY62FXTfOcSpoZxp/G79Ys3XRB9u++vL/BXQjPsazJaGuj Q==;
X-CSE-ConnectionGUID: B4L2gKEcTzGz3Yg18iXCKA==
X-CSE-MsgGUID: MWEaxDLVSrmALUTtR0BPjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20227729"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="20227729"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:05:46 -0700
X-CSE-ConnectionGUID: xbHx8pL6TKCtM5syJnCTBA==
X-CSE-MsgGUID: NUFbvwUJQ4KukyA7PFASyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46477980"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:05:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 3/7] drm/xe: Add xe_exec_queue_last_fence_test_dep
Date: Wed,  3 Jul 2024 21:06:19 -0700
Message-Id: <20240704040623.267526-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704040623.267526-1-matthew.brost@intel.com>
References: <20240704040623.267526-1-matthew.brost@intel.com>
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

Helpful to determine if a bind can immediately use CPU or needs to be
deferred a drm scheduler job.

v7:
 - Better wording in kernel doc (Matthew Auld)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..3336a01a1006 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -906,3 +906,26 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
 	xe_exec_queue_last_fence_put(q, vm);
 	q->last_fence = dma_fence_get(fence);
 }
+
+/**
+ * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Returns:
+ * -ETIME if there exists an unsignalled last fence dependency, zero otherwise.
+ */
+int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
+{
+	struct dma_fence *fence;
+	int err = 0;
+
+	fence = xe_exec_queue_last_fence_get(q, vm);
+	if (fence) {
+		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
+			0 : -ETIME;
+		dma_fence_put(fence);
+	}
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 289a3a51d2a2..ded77b0f3b90 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -75,6 +75,8 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
+int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
+				      struct xe_vm *vm);
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 #endif
-- 
2.34.1

