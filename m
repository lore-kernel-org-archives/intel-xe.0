Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76338C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3682610F1FC;
	Thu, 23 Jul 2026 20:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+bwGSgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1C910F1FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839120; x=1816375120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7CNupzgQygt4GRalBmVOn/L3h53tcaQvH5mlxrYwH4=;
 b=F+bwGSgvbny3a8dWnAqoFEYeCWhlOOCFuzG+2ZiH/+xaSTfrOB5Cy8Uk
 LQno37nHVE9dU+tN/yKyFSR1zRoIZbedpTNTl84PlQIOuhMax6ipmpesE
 Q+vg0GFgyBVWDT9tmthRvuh6tg0b4rpRtmc4Fnw5ewL1jUQaOBug/0H3Y
 jwTKFiheq53RpxhjzwkLq2cM8GJMk6BpoIzgfzGOIy7aH151RO8bK2Bok
 oyWBM+aNtA6wihJsKCHIh3PToran5J+GeOw6Xlvatj4/XpkvQQ5EQh+kv
 42l0dsJ1E1qUy+e1D8kMC174NkKYUry5XvmVQRtT4Z9a8RBUqUe7aiAH8 A==;
X-CSE-ConnectionGUID: b00CqAebRQOHp9QF8iqJpQ==
X-CSE-MsgGUID: 8v/Cm4aDSaGQpeCszmMDOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484324"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:40 -0700
X-CSE-ConnectionGUID: 6/dzMLCuSbCb/0HUNaeBzQ==
X-CSE-MsgGUID: t43FMZyPQ8CeGx8/n9cXZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578638"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 18/19] drm/xe/gt: Report 'pagefault' errors using SIGID
Date: Thu, 23 Jul 2026 22:37:51 +0200
Message-ID: <20260723203754.3782-19-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

