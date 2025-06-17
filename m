Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BE9C761AE
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 15:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8648410E76E;
	Tue, 17 Jun 2025 15:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu2HrRVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8BE10E36D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750174580; x=1781710580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4Q4J0YSjwsTo6NzWGwhH9TdW+GkuHH67ZAjc+k+6Sw=;
 b=iu2HrRVtIvbhh8Zt4NEfwflcKBIpmwEKORCJxXeHjfeWKpf/8qUmFN5t
 tzPEMC0PKBvtoCVbsmQUk3+UOf8Puz/GGJPYue9mPDV5lYG10KWIwIOg2
 yG0sWnKmwcW2dhOxQVZnvWYvYO3plMUg7Yw+vSMK1c1MFPngoYeKezJtp
 b+LccBQTdIiHKmuyTvN38gN3frrtAY7QfVhckVFzY00VufIiQ9z/UdgVc
 4DxUNivi38e7tiyE1KFI5Kt+6yOf/Ig1x3tdi+Q3Nb2HG3Ejb+h4nx3DK
 a4kiWFkLvMqAIpi4gxU2mv6EdlP8/1ddr7vXJm+whVmkxfACSWN/ApPEP w==;
X-CSE-ConnectionGUID: 3hEUolecQxiF0+VODmj9jw==
X-CSE-MsgGUID: cVAUK/WmRGGDlccu+JRC1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52230866"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52230866"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:36:13 -0700
X-CSE-ConnectionGUID: sz54FJSpRNiPU/I9py56AA==
X-CSE-MsgGUID: vm/rgHHISlCM98v2s0UEqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148667728"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:35:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 3/6] drm/xe: Add dependency scheduler for GT TLB invalidations
 to bind queues
Date: Tue, 17 Jun 2025 08:37:27 -0700
Message-Id: <20250617153730.2136174-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617153730.2136174-1-matthew.brost@intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a generic dependency scheduler for GT TLB invalidations, used to
schedule jobs that issue GT TLB invalidations to bind queues.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 13 +++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..53ef120c0281 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <uapi/drm/xe_drm.h>
 
+#include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
@@ -39,6 +40,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	int i;
+
+	for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
+		if (q->tlb_inval[i].dep_scheduler)
+			xe_dep_scheduler_fini(q->tlb_inval[i].dep_scheduler);
+
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 	if (q->vm)
@@ -94,6 +101,23 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	else
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
+	if (q->flags & (EXEC_QUEUE_FLAG_MIGRATE | EXEC_QUEUE_FLAG_VM)) {
+		int i;
+
+		for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i) {
+			struct xe_dep_scheduler *dep_scheduler;
+
+			dep_scheduler = xe_dep_scheduler_create(xe, NULL,
+								q->name, 16);
+			if (IS_ERR(dep_scheduler)) {
+				__xe_exec_queue_free(q);
+				return ERR_CAST(dep_scheduler);
+			}
+
+			q->tlb_inval[i].dep_scheduler = dep_scheduler;
+		}
+	}
+
 	if (vm)
 		q->vm = xe_vm_get(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index abdf4a57e6e2..ba443a497b38 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -134,6 +134,19 @@ struct xe_exec_queue {
 		struct list_head link;
 	} lr;
 
+#define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT	0
+#define XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT	1
+#define XE_EXEC_QUEUE_TLB_INVAL_COUNT		(XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT  + 1)
+
+	/** @tlb_inval: TLB invalidations exec queue state */
+	struct {
+		/**
+		 * @tlb_inval.dep_scheduler: The TLB invalidation
+		 * dependency scheduler
+		 */
+		struct xe_dep_scheduler *dep_scheduler;
+	} tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
+
 	/** @pxp: PXP info tracking */
 	struct {
 		/** @pxp.type: PXP session type used by this queue */
-- 
2.34.1

