Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA8DCCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 18:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131FC10E21F;
	Fri, 24 Oct 2025 18:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1XycS+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39EF10EB2C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761329060; x=1792865060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yn4vOfG5o5vYueW8u5AM5bKxY6ocw/14GoH81GfCVCw=;
 b=H1XycS+LyBJ997Im7+nJTdkQKnHr28nSgyvsmhn39YWHwrSVUI7VndSD
 9O/GkYQDzXbl82OC4C+ewXNhAO+8SL+HAcycR4uegP36C0Zro/FWYOOph
 MoyxDsLUhe0m6sBaX1co5Nl+hbHG9YCoXG836yPUCRmzNHM7ZSAC09gDN
 PT0j6mq90SrzEZLo2oAbHtXgG7K6/ZQyTwfcM0jN1aj0riQ7BZUoONB80
 dkOYillQDBLvwjRH5/foENfZhR/wxXqSSeKf5/hHDHSljDHrTdRh+wc6g
 u88k8PLCPf1KizPyeqOJQ2BhBqTYAUXQJf26cxV5Bj5TyxUMNttVc83Q8 Q==;
X-CSE-ConnectionGUID: oHzJRI8yQM216zD+r8G4iw==
X-CSE-MsgGUID: LXQ17/3GSM2DPk5mP+A4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67349331"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67349331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
X-CSE-ConnectionGUID: OLZ5y6X6QxSz85TwgqLKfw==
X-CSE-MsgGUID: vLY5MGaDSZyou1ByqmNIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="183709641"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v2 3/7] drm/xe: Implement xe_pagefault_reset
Date: Fri, 24 Oct 2025 11:04:10 -0700
Message-Id: <20251024180414.1379284-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024180414.1379284-1-matthew.brost@intel.com>
References: <20251024180414.1379284-1-matthew.brost@intel.com>
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

Squash any pending faults on the GT being reset by setting the GT field
in struct xe_pagefault to NULL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8..e4852c4c90cd 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -49,6 +49,7 @@
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
+#include "xe_pagefault.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_mocs.h"
@@ -849,6 +850,7 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
+	xe_pagefault_reset(gt_to_xe(gt), gt);
 	xe_gt_pagefault_reset(gt);
 
 	xe_uc_stop(&gt->uc);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index ea3813704242..e3d37e4ee205 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -124,6 +124,24 @@ int xe_pagefault_init(struct xe_device *xe)
 	return err;
 }
 
+static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
+				     struct xe_pagefault_queue *pf_queue)
+{
+	u32 i;
+
+	/* Squash all pending faults on the GT */
+
+	spin_lock_irq(&pf_queue->lock);
+	for (i = pf_queue->tail; i != pf_queue->head;
+	     i = (i + xe_pagefault_entry_size()) % pf_queue->size) {
+		struct xe_pagefault *pf = pf_queue->data + i;
+
+		if (pf->gt == gt)
+			pf->gt = NULL;
+	}
+	spin_unlock_irq(&pf_queue->lock);
+}
+
 /**
  * xe_pagefault_reset() - Page fault reset for a GT
  * @xe: xe device instance
@@ -134,7 +152,10 @@ int xe_pagefault_init(struct xe_device *xe)
  */
 void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
 {
-	/* TODO - implement */
+	int i;
+
+	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
+		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
 }
 
 /**
-- 
2.34.1

