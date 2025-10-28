Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6831DCCF9F0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 03:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F72510E2AA;
	Tue, 28 Oct 2025 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iyy5NJh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A6110E1DC
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 03:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761623929; x=1793159929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QqojZ4n6xX8CpZ0+MmKc5l1R3y3V3Zl8OwHoKrdP6rI=;
 b=Iyy5NJh2ivVIT1n9HUUDlpWzEa9U22NGzHjQus24p0zXxmEi80r7HBdb
 0ReXSyrQLndYLk57oKqZ1s9DggwJku7RxcZ7/10XFg2N89ciQIHEoO8Rd
 ywZxiEPRtlocjf/aShLP2ltk5NS5d5MzLDZomRxepQ+p7R66hKxgSiXWd
 MWkvqm4bsxYNNaMLdLavhNXygqeAwgHTMizYg7lw/4lF/2S8XP9S7KOZ8
 YF1LO+kp69zWmoUiyMrI9lOm8XX/dr3+8kYsMrWVX/hOfcHvtjcPrlaPx
 165T6kdoevdYqdok20taW9ORKTaR2s3JB9Kh5xSmJGPuWhQGyQMc+GuxH w==;
X-CSE-ConnectionGUID: 72/1O8a+QamZIhJ+mDZLYg==
X-CSE-MsgGUID: 6QmymiNuTaWM85spvutj3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67550954"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67550954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:47 -0700
X-CSE-ConnectionGUID: ftGRyPsgQJeDQM/ELAzWZg==
X-CSE-MsgGUID: QEslF+wPQ6WkjBNcNZJBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184461073"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v3 4/7] drm/xe: Implement xe_pagefault_handler
Date: Mon, 27 Oct 2025 20:58:40 -0700
Message-Id: <20251028035843.2488613-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028035843.2488613-1-matthew.brost@intel.com>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Enqueue (copy) the input struct xe_pagefault into a queue (i.e., into a
memory buffer) and schedule a worker to service it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 32 +++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index f86c1eff0f4d..6a4f34328d3c 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/circ_buf.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
@@ -158,6 +160,14 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
 		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
 }
 
+static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
+{
+	lockdep_assert_held(&pf_queue->lock);
+
+	return CIRC_SPACE(pf_queue->head, pf_queue->tail, pf_queue->size) <=
+		xe_pagefault_entry_size();
+}
+
 /**
  * xe_pagefault_handler() - Page fault handler
  * @xe: xe device instance
@@ -170,6 +180,24 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
  */
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
-	/* TODO - implement */
-	return 0;
+	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
+		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+	unsigned long flags;
+	bool full;
+
+	spin_lock_irqsave(&pf_queue->lock, flags);
+	full = xe_pagefault_queue_full(pf_queue);
+	if (!full) {
+		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
+		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
+			pf_queue->size;
+		queue_work(xe->usm.pf_wq, &pf_queue->worker);
+	} else {
+		drm_warn(&xe->drm,
+			 "PageFault Queue (%d) full, shouldn't be possible\n",
+			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+	}
+	spin_unlock_irqrestore(&pf_queue->lock, flags);
+
+	return full ? -ENOSPC : 0;
 }
-- 
2.34.1

