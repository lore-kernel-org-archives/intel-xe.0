Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA27C3DA40
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 04:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9E910E959;
	Thu,  4 Jul 2024 04:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STLMO5qj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D4910E552
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 04:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720066574; x=1751602574;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QGsyvplPO0wusHyH5BDICj+tXji5OEXdD4H1XAV3g9E=;
 b=STLMO5qjdp2oaaEEUxDXeqKeMEBxuroGx5LgJiCyNhfGgvaIaIeCOzKh
 f60Xkwv8r6J+s0F/kFni8b1yy8JjEv5AeJjwjdtPqfjE1F/JNGUYggCLi
 Isn13CIbav2Hqs9jaPKgcZABBYynzoNpBRWC79BNTEkv6ztkalVr1r/7+
 RHKXGmrEfMK++hBQxDuxGjCSFeFvsw9oA1MLZti2jiWsAqf8fLQj7TboE
 83evbsPdQAFLlhbRH4O1btWpoSoGlndMqdQLZ1hApKpTtG6MhLBYWRl73
 KO0eQOgKRYH3ce91zFie3OGNE1RfASZ+x2HRLUfgtLDZE87yt5pVHxfZb A==;
X-CSE-ConnectionGUID: 3cwMCPJXTbmqfqfD4rm5LA==
X-CSE-MsgGUID: c/bjsuerReis3+/lfCkXhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20228410"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="20228410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:16:13 -0700
X-CSE-ConnectionGUID: rMrO5ccRQJWm20/vRmBPTw==
X-CSE-MsgGUID: JWjthCApTQyvV6iTBi2hXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="47217274"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:16:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 3/7] drm/xe: Add xe_exec_queue_last_fence_test_dep
Date: Wed,  3 Jul 2024 21:16:48 -0700
Message-Id: <20240704041652.272920-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704041652.272920-1-matthew.brost@intel.com>
References: <20240704041652.272920-1-matthew.brost@intel.com>
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

