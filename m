Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F01CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 18:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4503410EB2C;
	Fri, 24 Oct 2025 18:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/PgJtA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD09610E21F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761329060; x=1792865060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OGCyjWuaSqAMCwy+C+n7KZ7pxpRixZAOkh6HfSh4Y7M=;
 b=l/PgJtA+5zMVHw6AE/UcJ2JFLbx3pppCPLRKBejJCf9UTrJOEMLWxF9G
 OY8FZ3mENo0O9Y3XOY6EMg2PiGu0hWSQcjXU7J/nVD1Ky7qJnWsT3M1he
 KgTFzxkIDsPrCQrz3TIY/AblPRaPhGdbNG6139seyfi+OMKgl8S6TMNAt
 eb6FVfFSvHM3YX6l+JUH3SwOVOfww7DnVeEGTklrlVhgHr2rsXNnQlTGD
 6Vff+Zh2XnA/C/OjWtXsfKjcJgIUPd1UzctNkcFQvOf4UswJ62rbVWgBU
 3kiePt0wi9ElcqpoJ5ANdegMlJu5N3jFaOVZPGJQKoRXdq96T546oxzF8 w==;
X-CSE-ConnectionGUID: /gaVoWOMSZe0FgAJgRl/eQ==
X-CSE-MsgGUID: RzJBbJh7TxmXSoGOED40aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67349330"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67349330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
X-CSE-ConnectionGUID: J+h3zM/TQtSx+DR0e6lSIw==
X-CSE-MsgGUID: GAq/zFsIQPaqskTN2Eo1cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="183709639"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v2 2/7] drm/xe: Implement xe_pagefault_init
Date: Fri, 24 Oct 2025 11:04:09 -0700
Message-Id: <20251024180414.1379284-3-matthew.brost@intel.com>
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

Create pagefault queues and initialize them.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v2:
 - Fix kernel doc + add comment for number PF queue (Francois)
---
 drivers/gpu/drm/xe/xe_device.c       |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h | 11 ++++
 drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
 3 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5f6a412b571c..f4261a461ddb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -52,6 +52,7 @@
 #include "xe_nvm.h"
 #include "xe_oa.h"
 #include "xe_observation.h"
+#include "xe_pagefault.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -904,6 +905,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pagefault_init(xe);
+	if (err)
+		return err;
+
 	xe_nvm_init(xe);
 
 	err = xe_heci_gsc_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6a62b520f5b5..a578781cc28b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,6 +18,7 @@
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
+#include "xe_pagefault_types.h"
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
 #include "xe_pt_types.h"
@@ -418,6 +419,16 @@ struct xe_device {
 		u32 next_asid;
 		/** @usm.lock: protects UM state */
 		struct rw_semaphore lock;
+		/** @usm.pf_wq: page fault work queue, unbound, high priority */
+		struct workqueue_struct *pf_wq;
+		/*
+		 * We pick 4 here because, in the current implementation, it
+		 * yields the best bandwidth utilization of the kernel paging
+		 * engine.
+		 */
+#define XE_PAGEFAULT_QUEUE_COUNT	4
+		/** @usm.pf_queue: Page fault queues */
+		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
 	} usm;
 
 	/** @pinned: pinned BO state */
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index d509a80cb1f3..ea3813704242 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -3,6 +3,10 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt_types.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 
@@ -21,6 +25,71 @@
  * xe_pagefault.c implements the consumer layer.
  */
 
+static int xe_pagefault_entry_size(void)
+{
+	return roundup_pow_of_two(sizeof(struct xe_pagefault));
+}
+
+static void xe_pagefault_queue_work(struct work_struct *w)
+{
+	/* TODO: Implement */
+}
+
+static int xe_pagefault_queue_init(struct xe_device *xe,
+				   struct xe_pagefault_queue *pf_queue)
+{
+	struct xe_gt *gt;
+	int total_num_eus = 0;
+	u8 id;
+
+	for_each_gt(gt, xe, id) {
+		xe_dss_mask_t all_dss;
+		int num_dss, num_eus;
+
+		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
+			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
+
+		num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
+		num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
+					XE_MAX_EU_FUSE_BITS) * num_dss;
+
+		total_num_eus += num_eus;
+	}
+
+	xe_assert(xe, total_num_eus);
+
+	/*
+	 * user can issue separate page faults per EU and per CS
+	 *
+	 * XXX: Multiplier required as compute UMD are getting PF queue errors
+	 * without it. Follow on why this multiplier is required.
+	 */
+#define PF_MULTIPLIER	8
+	pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
+		xe_pagefault_entry_size() * PF_MULTIPLIER;
+	pf_queue->size = roundup_pow_of_two(pf_queue->size);
+#undef PF_MULTIPLIER
+
+	drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d, total_num_eus=%d, pf_queue->size=%u",
+		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
+
+	pf_queue->data = devm_kzalloc(xe->drm.dev, pf_queue->size, GFP_KERNEL);
+	if (!pf_queue->data)
+		return -ENOMEM;
+
+	spin_lock_init(&pf_queue->lock);
+	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
+
+	return 0;
+}
+
+static void xe_pagefault_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	destroy_workqueue(xe->usm.pf_wq);
+}
+
 /**
  * xe_pagefault_init() - Page fault init
  * @xe: xe device instance
@@ -31,8 +100,28 @@
  */
 int xe_pagefault_init(struct xe_device *xe)
 {
-	/* TODO - implement */
-	return 0;
+	int err, i;
+
+	if (!xe->info.has_usm)
+		return 0;
+
+	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
+					WQ_UNBOUND | WQ_HIGHPRI,
+					XE_PAGEFAULT_QUEUE_COUNT);
+	if (!xe->usm.pf_wq)
+		return -ENOMEM;
+
+	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
+		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
+		if (err)
+			goto err_out;
+	}
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
+
+err_out:
+	destroy_workqueue(xe->usm.pf_wq);
+	return err;
 }
 
 /**
-- 
2.34.1

