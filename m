Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FD1CCF9F1
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 03:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04DA10E2E2;
	Tue, 28 Oct 2025 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tn5DYAg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C7310E1DC
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 03:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761623928; x=1793159928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQbrqx07beyySIYCq8XAS2aus1qVFzPZXU657526vSQ=;
 b=Tn5DYAg/A3BLL9ZXk2Gggog+NWa6gyeUyJ5USbEaU5bmse8AeQbcJESh
 rxvL8V+7HXJNJVHea+eGOHqW/ZigikOheLqXyxJ0MLUIa0uWh100ATkLS
 OwhJfST+18Bd7PxoBsLI/Beyz6Fn58QgGdHyVjja7JVoc98JSqeRywOYY
 YThweskaF7Kcz78WAMQaBva3E62PK9I6UhfKSm3bjduMHMO+0PDlpRIQP
 ud/9b3B34QmoctosuOFsaTCmk5QguTQ2T32T0E955KRoL+nGOtPAjon/4
 38bZ3Ldr361j1a5uCfGK9JV3ECsQoBP6KLhv+jO86HGHGNcC2sXNeocy/ w==;
X-CSE-ConnectionGUID: dKMg+jjWSoKsgf6cLvVZXw==
X-CSE-MsgGUID: nmDCt+5JQR+IV0hNXHtZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67550953"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67550953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:47 -0700
X-CSE-ConnectionGUID: ZBq7yO8sRaaD0+jB/0MBAA==
X-CSE-MsgGUID: K7W0lQ2ZSmupIWuMy2v6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184461070"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v3 3/7] drm/xe: Implement xe_pagefault_reset
Date: Mon, 27 Oct 2025 20:58:39 -0700
Message-Id: <20251028035843.2488613-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028035843.2488613-1-matthew.brost@intel.com>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
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
index 43b26e7d090a..f86c1eff0f4d 100644
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

