Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EC0C55164
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C292710EFBC;
	Thu, 30 Jul 2026 15:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBG12hjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35C10EFBC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425620; x=1816961620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7CNupzgQygt4GRalBmVOn/L3h53tcaQvH5mlxrYwH4=;
 b=RBG12hjKwQLDw5laUX13eRVE+AcclEZS9WID3hDGyH3VK2fktwXLu3H6
 fVQTzhKHzYhoFJh05SlWRCFHwZ/ITu3HnLBEk4nE19zaTl4npljCUJPRA
 puyQTFL2pzpnqLxWLwmUhGnCQ9tmR0DnE4mL8GExtlvBTWff6cFNjE443
 /vn2UskTjyn4MyR0E7qoW/sIljkVzt/Rjj+C258TwsvxTaI+1JGw4d7DZ
 3CRSOeyWDrG4MLC86SHjBYunya74fds4ts7oz/fkfLSBEuLmwVPpkaIOF
 0qgNtMKzrNPljOCB6eihF4ujN+mM/vmtz7vHWL4U0r8c1hwgjDWGhg/e2 w==;
X-CSE-ConnectionGUID: jLKPLE+lRJKt1lwzgbZhLA==
X-CSE-MsgGUID: kKCQxC7iS6KEJpktDjtdxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583147"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583147"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:39 -0700
X-CSE-ConnectionGUID: AOHYNv2cSfSikDeS2jLgsA==
X-CSE-MsgGUID: j9pxUBvbRPapthpxnaxDQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387666"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 22/23] drm/xe/gt: Report 'pagefault' errors using SIGID
Date: Thu, 30 Jul 2026 17:21:18 +0200
Message-ID: <20260730152121.576-23-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

Report 'Queue full/Unsuccessful response' pagefault errors using
xe_log() helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..e78c855759e1 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -14,6 +14,7 @@
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
 #include "xe_hw_engine.h"
+#include "xe_log.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_svm.h"
@@ -309,8 +310,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
 			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
 				xe_pagefault_print(&pf);
-				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
-					   ERR_PTR(err));
+				xe_log_err(pf.gt, PAGEFAULT, err, "Fault response: Unsuccessful\n");
 			} else {
 				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
 				xe_gt_dbg(pf.gt, "Prefetch Fault response: Unsuccessful %pe\n",
@@ -487,9 +487,9 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 			pf_queue->size;
 		queue_work(xe->usm.pf_wq, &pf_queue->worker);
 	} else {
-		drm_warn(&xe->drm,
-			 "PageFault Queue (%d) full, shouldn't be possible\n",
-			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+		xe_log_err(xe, PAGEFAULT, -ENOSPC,
+			   "Queue (%d) full, shouldn't be possible\n",
+			   pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
-- 
2.47.1

