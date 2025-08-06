Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1189C87FCA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6DE10E2FE;
	Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDUlMPAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86810E2FE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qmoLSRvXkspkQdRBNeKGkqTsK/lNDNytuvwlTDTu6M=;
 b=HDUlMPAxHSWLapWgZmm17zTtrxxKbFY+m89OWOkd/oQpihOXeYyP2GQz
 XP5JyHtGvt0KQMCozYwxnALTvyGlEgKAYSeF2ZF9VT3QeDdm32xRUKZQ9
 SZLHOMQTyw3XFGtBtoHEblAKcQSATwDsDDG7oy8VODbMdhOWNVwZW2n2u
 0JpTE4P7pzjuEcAtglVjpVkneP0a1Eu4mAaL6wvGpcDITw3Eyn1P7CDC5
 /fZE7hZxBzB13kaTCVAYXmnyKLbUvOTHCg2jwb+VmuRlucZ/CDzcfTJbM
 iV1ttxMkZHXMKQ4IBCpwMF2ibLRItMHSBzLkIgB9cMmxUIWQw7WiMrxtZ g==;
X-CSE-ConnectionGUID: ni2pmczbRt2m6P8RVmniTQ==
X-CSE-MsgGUID: hc3W4Vi9RFquws2ClKB1/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316931"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: LbEOsCcpSKqiVH6Lxlfv9g==
X-CSE-MsgGUID: mmgT/jEASUuIDVVFMQ1J2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868939"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Date: Tue,  5 Aug 2025 23:22:33 -0700
Message-Id: <20250806062242.1090416-3-matthew.brost@intel.com>
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

Create pagefault queues and initialize them.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++
 drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 57edbc63da6f..c7c8aee03841 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -50,6 +50,7 @@
 #include "xe_nvm.h"
 #include "xe_oa.h"
 #include "xe_observation.h"
+#include "xe_pagefault.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -890,6 +891,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pagefault_init(xe);
+	if (err)
+		return err;
+
 	xe_nvm_init(xe);
 
 	err = xe_heci_gsc_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 01e8fa0d2f9f..6aa119026ce9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -17,6 +17,7 @@
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
+#include "xe_pagefault_types.h"
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
 #include "xe_pt_types.h"
@@ -394,6 +395,11 @@ struct xe_device {
 		u32 next_asid;
 		/** @usm.lock: protects UM state */
 		struct rw_semaphore lock;
+		/** @usm.pf_wq: page fault work queue, unbound, high priority */
+		struct workqueue_struct *pf_wq;
+#define XE_PAGEFAULT_QUEUE_COUNT	4
+		/** @pf_queue: Page fault queues */
+		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
 	} usm;
 
 	/** @pinned: pinned BO state */
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 3ce0e8d74b9d..14304c41eb23 100644
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
 
@@ -19,6 +23,71 @@
  * with a single shared consumer.
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
@@ -29,8 +98,28 @@
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

