Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7122C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893B710E721;
	Tue, 18 Jun 2024 17:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0bPMkka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358B410E760
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718730876; x=1750266876;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vsJMEkiHacP31VvOFZIK58kjOHuoT5yB30yEbh+0Jyk=;
 b=b0bPMkkaeTubLQ+dEhCE4JrUmYNBBPyn4E+pbQXWwR4gHziJA7xB8i16
 weAGHxVNI4Oat4JTgonEEOXzScr5rwKFqJWUNpmo9j9gIUnNXenBqVjE0
 9Tmt3dq7RrlJXKeH/JTarFpOPxx5JsZZbclPPsAmMsArwiZF+3Hj1WtCG
 7FaCRaR1kC2DFor36L551ThjndlBj43VuP96r1JpAVLNYszmD8GNOzHva
 UiicwS1p0XeH9R5kpKup/rpbBnuaAb5yn8hr6xz9JyHGfJ9AzhvcSdhW2
 Td+OmT+5n4bxfyRPNpMoHdbRN8hKVAW9UTxx7xfjuLncZW9oIbO3hpF6j g==;
X-CSE-ConnectionGUID: Nek60OjBREekFEFCHXK/9g==
X-CSE-MsgGUID: cVcbQmBtShan5BURX96Ogg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26754432"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26754432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
X-CSE-ConnectionGUID: 7sm8F5QTSO6lNKBxSm3Cag==
X-CSE-MsgGUID: XLCv2vBFTkOhzloodKFE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46583654"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 3/7] drm/xe: Add xe_exec_queue_last_fence_test_dep
Date: Tue, 18 Jun 2024 10:15:05 -0700
Message-Id: <20240618171509.3336601-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618171509.3336601-1-matthew.brost@intel.com>
References: <20240618171509.3336601-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..65b4d1da6c93 100644
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
+ * 0 on success on dependency, -ETIME on dependency
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

