Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38989CCFA00
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCE510EBCD;
	Fri, 31 Oct 2025 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFIWA8Cv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8210EBF9
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761929703; x=1793465703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2j5KqISxw/eBLx1hhqe2LnErT/4JfimRwCgT7P16GhA=;
 b=nFIWA8CvOIhyuRkyNTJtayX7rpFVniv5sTJPgmdNGX94Dv3LHb7mLxLP
 ++zQvvnahnhzK5UoEmfuxydSl7K7omuZaiMRjqLL0Vh3EqEAIc+W4AHym
 5/TSguRiRCFbeyShbaOOnetHjjC6W5B29eVAPT2QY4PRJEw1P5BWfJnCh
 mWnxcGcIqR5pplvjAU5DOBe/K1nXwFCVcxE/5cuLGTS13rhS03P+raSN6
 UeH7gt2jxmKbGcnSkiIkGSL3TIxtJxrwuHOvM5zfWu2b11ziQVXAJsaNK
 dHCbKLCZGlakdECpjx1qQfFrAwW7X7P30zE9XezqeuUjaewYqf+1mFVxw g==;
X-CSE-ConnectionGUID: ZCgOipY8SN6PrfLWeQWH/g==
X-CSE-MsgGUID: 4Lf83On0T2m5j2CE5uKjXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63298929"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63298929"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:02 -0700
X-CSE-ConnectionGUID: tSbOyN1vS8uQrtDYeWpKGA==
X-CSE-MsgGUID: vNrqObmzTGuReP8QYuGnIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186734406"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v4 3/7] drm/xe: Implement xe_pagefault_reset
Date: Fri, 31 Oct 2025 09:54:12 -0700
Message-Id: <20251031165416.2871503-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031165416.2871503-1-matthew.brost@intel.com>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
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

v4:
 - Only do reset it page faults queues initialized (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

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
index 43b26e7d090a..eedd31120175 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -124,6 +124,28 @@ int xe_pagefault_init(struct xe_device *xe)
 	return err;
 }
 
+static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
+				     struct xe_pagefault_queue *pf_queue)
+{
+	u32 i;
+
+	/* Driver load failure guard / USM not enabled guard */
+	if (!pf_queue->data)
+		return;
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
@@ -134,7 +156,10 @@ int xe_pagefault_init(struct xe_device *xe)
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

