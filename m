Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6ACC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0849A10F676;
	Thu,  3 Sep 2026 15:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="limcHPxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E8E10F684
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447699; x=1819983699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eg/SrsoTjDotLfrVsRGshHMjaPTP3kNn7R2HmF1EXBs=;
 b=limcHPxSGAWGwFEkyFuYzADvUTULiBNAvi+z1W//a59J3kqcwMjhMzQu
 XYn76aovdFOlas+Po8sPcaupFFdbfWF3IYrjYo+YOthq2vs0gKhqBfQex
 bZImNowcoCJvtkQ+jR3l1h0OPRXd9oceNMGKx4AvCTpN4/WqLpvZWwbXQ
 inGLex/YatcrZssgeMvtqh1K1i+J55Zv1/hv8ujOoX49D6yPghT1wdUQc
 fFs0gHx+2Q/+4nveBYXf1yTPTjquxumPBokTOQG5Ku5H1EbFyH87m6I+7
 TSRvNHPSgBUYUdTCevTiro20NOiRbQm1LbWm09RPcfg+OQzjXparrQl9z g==;
X-CSE-ConnectionGUID: nO9xUz45TYm5Gu/+w758Ow==
X-CSE-MsgGUID: QpKoJL9YQS+XwN6wen6GMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486875"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:38 -0700
X-CSE-ConnectionGUID: IXNFvUMdSP2sprmq3VUCPw==
X-CSE-MsgGUID: cDa4o96BQJilRlM4yVfIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441317"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:33 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 20/27] drm/xe/pagefault: export pagefault queue properties
Date: Thu,  3 Sep 2026 17:59:44 +0300
Message-ID: <20260903145952.848051-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

From: Maciej Patelczyk <maciej.patelczyk@intel.com>

Export pagefault queue related properties for eudebug.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c       | 44 -------------------------
 drivers/gpu/drm/xe/xe_pagefault.h       | 10 ++++++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 34 +++++++++++++++++++
 3 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 2e415995f067..27c3a90e4e73 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -70,49 +70,6 @@
  * free state once they are complete.
  */
 
-/**
- * enum xe_pagefault_alloc_state - lifetime state for a page fault queue entry
- * @XE_PAGEFAULT_ALLOC_STATE_FREE:
- *	Entry is unused and may be overwritten by the producer, consumer retry
- *	or requeue..
- * @XE_PAGEFAULT_ALLOC_STATE_QUEUED:
- *	Entry has been enqueued and may be dequeued by a worker.
- * @XE_PAGEFAULT_ALLOC_STATE_ACTIVE:
- *	Entry has been dequeued and is the worker's currently serviced fault.
- *	The worker may attach additional faults to it via consumer.next.
- * @XE_PAGEFAULT_ALLOC_STATE_CHAINED:
- *	Entry is not independently serviced; it has been chained onto an
- *	ACTIVE entry via consumer.next and will be acknowledged when the
- *	leading fault completes.
- * @XE_PAGEFAULT_ALLOC_STATE_COUNT:
- *	Count of allocation states.
- *
- * The page fault queue provides stable storage for outstanding faults so the
- * IRQ handler can chain new cache hits directly onto a worker's active fault.
- * Because entries may remain referenced outside the consumer dequeue window,
- * the producer must only write into entries in the FREE state.
- *
- * State transitions are protected by the page fault queue lock. Workers return
- * entries to FREE after acknowledging the fault (either as ACTIVE or CHAINED).
- */
-enum xe_pagefault_alloc_state {
-	XE_PAGEFAULT_ALLOC_STATE_FREE		= 0,
-	XE_PAGEFAULT_ALLOC_STATE_QUEUED		= 1,
-	XE_PAGEFAULT_ALLOC_STATE_CHAINED	= 2,
-	XE_PAGEFAULT_ALLOC_STATE_ACTIVE		= 3,
-	XE_PAGEFAULT_ALLOC_STATE_COUNT		= 4,
-};
-
-static int xe_pagefault_entry_size(void)
-{
-	/*
-	 * Power of two alignment is not a hardware requirement, rather a
-	 * software restriction which makes the math for page fault queue
-	 * management simplier.
-	 */
-	return roundup_pow_of_two(sizeof(struct xe_pagefault));
-}
-
 static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
 			      struct xe_vram_region *vram, bool need_vram_move)
 {
@@ -295,7 +252,6 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	return err;
 }
 
-#define XE_PAGEFAULT_CACHE_START_INVALID	U64_MAX
 #define xe_pagefault_cache_start_invalidate(val)	\
 	(val = XE_PAGEFAULT_CACHE_START_INVALID)
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
index e9c5d1f03760..83b68a19cc7c 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_pagefault.h
@@ -90,4 +90,14 @@ static inline u64 xe_pagefault_start_addr(struct xe_pagefault *pf)
 	return pf->consumer.page_addr;
 }
 
+static inline int xe_pagefault_entry_size(void)
+{
+	/*
+	 * Power of two alignment is not a hardware requirement, rather a
+	 * software restriction which makes the math for page fault queue
+	 * management simplier.
+	 */
+	return roundup_pow_of_two(sizeof(struct xe_pagefault));
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index efeba5c3a58b..f99b4e22441c 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -149,6 +149,39 @@ struct xe_pagefault {
 	} producer;
 };
 
+/**
+ * enum xe_pagefault_alloc_state - lifetime state for a page fault queue entry
+ * @XE_PAGEFAULT_ALLOC_STATE_FREE:
+ *	Entry is unused and may be overwritten by the producer, consumer retry
+ *	or requeue..
+ * @XE_PAGEFAULT_ALLOC_STATE_QUEUED:
+ *	Entry has been enqueued and may be dequeued by a worker.
+ * @XE_PAGEFAULT_ALLOC_STATE_ACTIVE:
+ *	Entry has been dequeued and is the worker's currently serviced fault.
+ *	The worker may attach additional faults to it via consumer.next.
+ * @XE_PAGEFAULT_ALLOC_STATE_CHAINED:
+ *	Entry is not independently serviced; it has been chained onto an
+ *	ACTIVE entry via consumer.next and will be acknowledged when the
+ *	leading fault completes.
+ * @XE_PAGEFAULT_ALLOC_STATE_COUNT:
+ *	Maximum enum value.
+ *
+ * The page fault queue provides stable storage for outstanding faults so the
+ * IRQ handler can chain new cache hits directly onto a worker's active fault.
+ * Because entries may remain referenced outside the consumer dequeue window,
+ * the producer must only write into entries in the FREE state.
+ *
+ * State transitions are protected by the page fault queue lock. Workers return
+ * entries to FREE after acknowledging the fault (either as ACTIVE or CHAINED).
+ */
+enum xe_pagefault_alloc_state {
+	XE_PAGEFAULT_ALLOC_STATE_FREE		= 0,
+	XE_PAGEFAULT_ALLOC_STATE_QUEUED		= 1,
+	XE_PAGEFAULT_ALLOC_STATE_CHAINED	= 2,
+	XE_PAGEFAULT_ALLOC_STATE_ACTIVE		= 3,
+	XE_PAGEFAULT_ALLOC_STATE_COUNT		= 4,
+};
+
 /**
  * struct xe_pagefault_queue - Xe pagefault queue (consumer)
  *
@@ -188,6 +221,7 @@ struct xe_pagefault_work {
 	 * Protected by the page fault queue lock.
 	 */
 	struct {
+#define XE_PAGEFAULT_CACHE_START_INVALID	U64_MAX
 		/** @cache.start: Start address of the current page fault */
 		u64 start;
 		/** @cache.end: End address of the current page fault */
-- 
2.53.0

