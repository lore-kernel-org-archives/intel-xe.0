Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F84CCF9EF
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354A10E55D;
	Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAvNJfud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0A910E55D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601377; x=1793137377;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VFmyW2gZuASAJUQuDj6wV8gsZ84JsWN9qzlLXrWTrTE=;
 b=kAvNJfud9MMYjEbwrgeMvFqA8bcMnCCk7BriKsPcWEewZAGK4nCbone/
 6YWw1alyG2TwbRs1aKHBMRe8Vg5MGvwAXkZoiU/BxjrDpggFf1rYAkPpo
 ivdF9xPO/LmI9irVnlKYNMdzPUCWIwayFkddn3AGWchnEDqh6TY/tSDXx
 iOBMcJxjLqODZsl9VKah1CBiY3eIYka4AqW9ekC9/AD7gDx7AiksibOcS
 T9slbFWW3je4bh1irO6Jdx0SDn7ZPSc8obie4Bid8vljzOlXKqEqhqy0Q
 lhfX/IEO/okH7qdzzSQpy1nfx4LBXtT0bJst2IdrNP1XHqjuBVXGzaEoA g==;
X-CSE-ConnectionGUID: tCxBo8j/S5qwy4rVyxmaTw==
X-CSE-MsgGUID: jye6LLbaSzWkZmoziMBnmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368849"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368849"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:57 -0700
X-CSE-ConnectionGUID: Jr7xplF/S8St2ivf4u3xZg==
X-CSE-MsgGUID: NBn9GXGBTJWyX5vbxpE2bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782349"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 7/8] dma-buf: Fix dma-fence-array signaling ordering
Date: Mon, 27 Oct 2025 14:42:51 -0700
Message-Id: <20251027214252.2455093-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027214252.2455093-1-matthew.brost@intel.com>
References: <20251027214252.2455093-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 6 +++---
 include/linux/dma-fence-array.h   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..ca78da5f0244 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -42,7 +42,7 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
 	cmpxchg(&array->base.error, PENDING_ERROR, 0);
 }
 
-static void irq_dma_fence_array_work(struct irq_work *wrk)
+static void dma_fence_array_work(struct work_struct *wrk)
 {
 	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
 
@@ -62,7 +62,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 	dma_fence_array_set_pending_error(array, f->error);
 
 	if (atomic_dec_and_test(&array->num_pending))
-		irq_work_queue(&array->work);
+		queue_work(system_ordered_wq, &array->work);
 	else
 		dma_fence_put(&array->base);
 }
@@ -207,7 +207,7 @@ void dma_fence_array_init(struct dma_fence_array *array,
 	spin_lock_init(&array->lock);
 	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
 		       context, seqno);
-	init_irq_work(&array->work, irq_dma_fence_array_work);
+	INIT_WORK(&array->work, dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
 	array->fences = fences;
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 079b3dec0a16..a20b754cec72 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -13,7 +13,7 @@
 #define __LINUX_DMA_FENCE_ARRAY_H
 
 #include <linux/dma-fence.h>
-#include <linux/irq_work.h>
+#include <linux/workqueue.h>
 
 /**
  * struct dma_fence_array_cb - callback helper for fence array
@@ -32,7 +32,7 @@ struct dma_fence_array_cb {
  * @num_fences: number of fences in the array
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
- * @work: internal irq_work function
+ * @work: internal work_struct
  * @callbacks: array of callback helpers
  */
 struct dma_fence_array {
@@ -43,7 +43,7 @@ struct dma_fence_array {
 	atomic_t num_pending;
 	struct dma_fence **fences;
 
-	struct irq_work work;
+	struct work_struct work;
 
 	struct dma_fence_array_cb callbacks[] __counted_by(num_fences);
 };
-- 
2.34.1

