Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29134C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A155C10E3A8;
	Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRhivIFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED58B10E2FE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ACmOsKrA/HBBf26niteNxvqjM30tUHpJ3NfhhZyIttU=;
 b=IRhivIFREV29/CQHffBPHnI+r6V9cc5nPX/noDlDm2qfgy9fJAxTZhLj
 zgmPT6Y+G868F5eZkeMnZhTRnfG4sXuf0r0AkkGhkxU3A7bTmsTcMiF5g
 doccx2gjk3wN8ROGpb6qyFzIZfRFb2d4lPu9NFAbxK2KoRuJ1q+ZzItd0
 xTNY4BU6iDBUpNuqalR3Uh9dJS/Q3qHlybce74CClHYY2WpmnfW4OB705
 0sGfrOvUU1ZwFm1Htov0V9y9W4ZbLKYF11Z7K8J/uizw+HbS4Vg61TvAk
 VGJFsYaW7rT/jaxMuLwtWTzkw7OfJyZph35iXTt47s9b32GlFyWz1x4lF g==;
X-CSE-ConnectionGUID: aMX1DSVKQlKDjRou/nSpJw==
X-CSE-MsgGUID: xLhsT5EoSp2OVx+5oITSDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316933"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: rflvvesWS/up14sq0lgrUw==
X-CSE-MsgGUID: Hwhi2rPqSO6nBdo0z0OWag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868945"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 04/11] drm/xe: Implement xe_pagefault_handler
Date: Tue,  5 Aug 2025 23:22:35 -0700
Message-Id: <20250806062242.1090416-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
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
index aef389e51612..98be3203a9df 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/circ_buf.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
@@ -156,6 +158,14 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
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
@@ -168,6 +178,24 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
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

