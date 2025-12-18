Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D672D711C4
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6AC10EBC0;
	Thu, 18 Dec 2025 22:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghJmF2tM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A18010EBC0
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766097471; x=1797633471;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=09FmDF4iiI4eLex8z+IBpI+jq8crntQLOMNmIqcmIZ0=;
 b=ghJmF2tM0YUHY2iU0Zjbx3/+a+FO4fc9f6d6mbWkVVLHN+m1VJYjjrWY
 VhacGUHj0lBr8JFTx3cx+EWiqyEjdvS/e5/PjZQ59yskr9VHHCHiQmTRd
 3otRmxbqnM3JISW2+cLhHImlyWipXz9d6SA2awI8EJAFzwKz6LUvFOwaI
 RdDMuvEbcJDUP9EbvzvVUrG+7hr2C90i8f56BwPeyJV18IKmKQguITGjU
 ZIDY0aSBHasNasGrUtcYBazGu2DwVU/HyLV57QhmLSHza0LzT68asZ17b
 LryC9Q+gt3bCMuUgSljbk+0N+XlZL5weAGOv9mfmtvZT5EkI80BPScUDc g==;
X-CSE-ConnectionGUID: bDS0pEcpSD+AzLmlnEWABg==
X-CSE-MsgGUID: g1n8IBf0Twalh52KfQzYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67812146"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67812146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:37:50 -0800
X-CSE-ConnectionGUID: GWt5Is/0TtyT16pOGtvJsA==
X-CSE-MsgGUID: ed1IHwMGSb+9Nyy5r9621g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199176509"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:37:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Increase log level for unhandled page faults
Date: Thu, 18 Dec 2025 14:37:45 -0800
Message-Id: <20251218223745.4045207-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Set the kernel log level for unhandled page faults to match the log
level (info) for engine resets. Currently, dmesg output can be confusing
because it shows an engine reset without indicating the page fault that
caused it. Without this change, the GuC log must be examined to
determine the source of the engine reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++-----
 drivers/gpu/drm/xe/xe_pagefault.c  | 36 +++++++++++++++---------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 43fd2069f9b2..259c4e1dcae7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3159,13 +3159,13 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	 * See bspec 54047 and 72187 for details.
 	 */
 	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
-		xe_gt_dbg(gt,
-			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
-			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+		xe_gt_info(gt,
+			   "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
+			   type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 	else
-		xe_gt_dbg(gt,
-			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
-			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+		xe_gt_info(gt,
+			   "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
+			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	trace_xe_exec_queue_memory_cat_error(q);
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index afb06598b6e1..6bee53d6ffc3 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -223,22 +223,22 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 
 static void xe_pagefault_print(struct xe_pagefault *pf)
 {
-	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
-		  "\tFaulted Address: 0x%08x%08x\n"
-		  "\tFaultType: %d\n"
-		  "\tAccessType: %d\n"
-		  "\tFaultLevel: %d\n"
-		  "\tEngineClass: %d %s\n"
-		  "\tEngineInstance: %d\n",
-		  pf->consumer.asid,
-		  upper_32_bits(pf->consumer.page_addr),
-		  lower_32_bits(pf->consumer.page_addr),
-		  pf->consumer.fault_type,
-		  pf->consumer.access_type,
-		  pf->consumer.fault_level,
-		  pf->consumer.engine_class,
-		  xe_hw_engine_class_to_str(pf->consumer.engine_class),
-		  pf->consumer.engine_instance);
+	xe_gt_info(pf->gt, "\n\tASID: %d\n"
+		   "\tFaulted Address: 0x%08x%08x\n"
+		   "\tFaultType: %d\n"
+		   "\tAccessType: %d\n"
+		   "\tFaultLevel: %d\n"
+		   "\tEngineClass: %d %s\n"
+		   "\tEngineInstance: %d\n",
+		   pf->consumer.asid,
+		   upper_32_bits(pf->consumer.page_addr),
+		   lower_32_bits(pf->consumer.page_addr),
+		   pf->consumer.fault_type,
+		   pf->consumer.access_type,
+		   pf->consumer.fault_level,
+		   pf->consumer.engine_class,
+		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
+		   pf->consumer.engine_instance);
 }
 
 static void xe_pagefault_queue_work(struct work_struct *w)
@@ -260,8 +260,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		err = xe_pagefault_service(&pf);
 		if (err) {
 			xe_pagefault_print(&pf);
-			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
-				  ERR_PTR(err));
+			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
+				   ERR_PTR(err));
 		}
 
 		pf.producer.ops->ack_fault(&pf, err);
-- 
2.34.1

