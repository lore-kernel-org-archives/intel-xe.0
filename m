Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581F4CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 18:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F8610EB30;
	Fri, 24 Oct 2025 18:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihpxjDiK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1028710E21F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761329060; x=1792865060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nVRaWFWtHPYH3gfQAfY3Pyv01/EVQ6bBXby3TOaIcXU=;
 b=ihpxjDiKuAn6kUX1pWLNAY9LJcVrU7X7nkrYS33JVma0mXpbMCRsF/3K
 Er2Y1k4uiwrwSY8VVDuHh/eOaJXtCtZaax2wtfnxiJIX72qWLEQANAz9o
 iwte80zHLq33v3ijopWo22dtqgL8EKBft5VpzhkbBzrKeRxtjq8isaKir
 OAcGa3/3wPl2MGBaFyJ0TK86ZEPHu9yOK5hyI7DwXkMl0UAuIvEM9zNog
 aFMitiUfop2C+QkP9r/nmfvV7xt/N8vDoBXQVYfp8A1iMucaxPmD+3efZ
 RvItyrbKUo+LI4uGFMpLSfzAX+wgmucUiVmGis3wKKvgFJdjlDw3LntUk w==;
X-CSE-ConnectionGUID: 5Pc1yRCWRbqEHWojjtdaWg==
X-CSE-MsgGUID: w+A8LENqSvK+fkB2YK442w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67349332"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67349332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
X-CSE-ConnectionGUID: ho1scn35RB+L6+nROAm/WQ==
X-CSE-MsgGUID: Ygqp/ITeS6iUQR9Nm01sDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="183709644"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v2 4/7] drm/xe: Implement xe_pagefault_handler
Date: Fri, 24 Oct 2025 11:04:11 -0700
Message-Id: <20251024180414.1379284-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024180414.1379284-1-matthew.brost@intel.com>
References: <20251024180414.1379284-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_pagefault.c | 32 +++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index e3d37e4ee205..babdee95b185 100644
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

