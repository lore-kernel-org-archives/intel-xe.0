Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1679ACCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140310EBF5;
	Fri, 31 Oct 2025 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdVEcAL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03B410EBCD
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761929702; x=1793465702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dIvQAsNCiGLag6IkY+6DmHwC0XRp+ZJqGH5J94jo6t4=;
 b=VdVEcAL2l080S1PsHblboq0lS3INKYGVzMdIRgVfbpeCT3fWT0RPabmF
 Br0TyrfqTM6gTWc/aZ4f0hK3AzdzbRUQPNmp9cpxr7ljzRQhT5R98FsW7
 ktLqxBUBjweuF2Fj2j0LBsozJnIgLD+aPGy8OUXCfnEj11PA8YClQ59wA
 +4UdukV95DxhMnU8jCjS9zkm/9SZNCikSOgK6OCoazTzPeJh06GkU9MRz
 /hiqcXsDokX1Qx/C1Rql0iYFXI9E6F/c56PrnWMl44wdOsqRheTgFKXt8
 ek1Aqknt83HxH8GQa5m10triqmbbWGlGdee9XX0FQdOW5htLTLJTt77IL Q==;
X-CSE-ConnectionGUID: opwY6Ei9S+eD/MhM1M4QXQ==
X-CSE-MsgGUID: 0cS7xNOySwm/BYWAxYHDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63298930"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63298930"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:02 -0700
X-CSE-ConnectionGUID: gvDuGrfaSdir4MjYZaCi3w==
X-CSE-MsgGUID: rV1ulFioQXuIr0gcUo2ePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186734409"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v4 4/7] drm/xe: Implement xe_pagefault_handler
Date: Fri, 31 Oct 2025 09:54:13 -0700
Message-Id: <20251031165416.2871503-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031165416.2871503-1-matthew.brost@intel.com>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
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
index eedd31120175..194e647a8af6 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/circ_buf.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
@@ -162,6 +164,14 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
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
@@ -174,6 +184,24 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
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

