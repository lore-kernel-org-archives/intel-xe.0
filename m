Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1D1C79FBE
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504D10F102;
	Wed,  9 Sep 2026 12:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqwmT9Vs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D7310F0FE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957715; x=1820493715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aWVPWagAWNR+flZoOJKLGWpBz3D6knslqHOnyB5zjuc=;
 b=XqwmT9Vs+fHBuCpoGrDHzu8Qxd+DH2Osjm3/en7L/IEoBZP+HZuZDG4J
 A9lM9UF2Ni6W+jKGUmqm6TryS33gmRRRsnrcngzuXusFx7kfOh8mnE2V7
 YN1wdbGmnFbU4ynCSDZzzbWeNKUhbAo1CQ+t5SCunBslin9AODDqSlf32
 d4RzLJmJE+Yyk8yXYvnxVvdqqCMl+AKlZPMBjZVwa8FNyUH7hwPwokfC8
 d5f/zTQdjXjSyhWjaSap3flialkN5Q9HBYpuPA7GycWwI1T8Kq2QkGA3u
 H9dFpcjjpT7WjnSeqd+LYGYj8qqEentIbNmMEpTd6OKm6AyDqf/w3voY8 A==;
X-CSE-ConnectionGUID: neyCV4r4SziLJOx8YZDLSw==
X-CSE-MsgGUID: QObJpiE1R0Ky4/bazWWjFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715478"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:41:55 -0700
X-CSE-ConnectionGUID: g1xwgjrNSV629ptwSMyFlg==
X-CSE-MsgGUID: SrmeZ2r8RBK926JCzKPk8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246524"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:53 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 03/21] drm/xe: Implement xe_access_counter_init
Date: Wed,  9 Sep 2026 18:14:57 +0530
Message-ID: <20260909124457.1610890-26-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Implement initialization for access counter queues and per-queue
workers. Reuse the existing page fault workqueue (pf_wq) as both
subsystems are part of the same USM domain.

v2
- Add ac_workers_indx to determine current work item
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 44 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.c         |  5 +++
 drivers/gpu/drm/xe/xe_device_types.h   | 12 +++++++
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index f3a8a93b5135..ae939576b72d 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -11,6 +11,7 @@
 #include "xe_access_counter.h"
 #include "xe_access_counter_types.h"
 #include "xe_device.h"
+#include "xe_usm_queue.h"
 
 /**
  * DOC: Xe access counters
@@ -27,6 +28,22 @@
  * xe_access_counter.c implements the consumer layer.
  */
 
+static void xe_access_counter_queue_work_func(struct work_struct *w)
+{
+	/* TODO: Implement */
+}
+
+static void xe_access_counter_queue_init(struct xe_device *xe,
+					 struct xe_usm_queue *ac_queue)
+{
+	int i;
+
+	for (i = 0; i < XE_ACCESS_COUNTER_WORKER_COUNT; i++) {
+		xe->usm.ac_workers[i].xe = xe;
+		INIT_WORK(&xe->usm.ac_workers[i].work, xe_access_counter_queue_work_func);
+	}
+}
+
 /**
  * xe_access_counter_init - Initialize access counter consumer layer
  * @xe: xe device
@@ -35,7 +52,29 @@
  */
 int xe_access_counter_init(struct xe_device *xe)
 {
-	/* Stub implementation - to be filled in */
+	struct xe_usm_queue *ac_queue = &xe->usm.ac_queue;
+
+	if (!xe->info.has_usm)
+		return 0;
+
+	ac_queue->data_size = sizeof(struct xe_access_counter);
+	ac_queue->entry_size = roundup_pow_of_two(ac_queue->data_size);
+#define XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES	128
+	ac_queue->size = XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES *
+			 ac_queue->entry_size;
+#undef XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES
+
+	/*
+	 * drmm-managed so it outlives destroy_workqueue(pagefault_wq), which
+	 * drains the shared AC workers during xe_pagefault_fini.
+	 */
+	ac_queue->data = drmm_kzalloc(&xe->drm, ac_queue->size, GFP_KERNEL);
+	if (!ac_queue->data)
+		return -ENOMEM;
+
+	spin_lock_init(&ac_queue->lock);
+	xe_access_counter_queue_init(xe, ac_queue);
+
 	return 0;
 }
 
@@ -44,7 +83,8 @@ int xe_access_counter_init(struct xe_device *xe)
  * @xe: xe device
  * @ac: access counter notification
  *
- * Process an access counter notification from the producer layer.
+ * Sink the access counter notification to a queue and queue a worker
+ * to service it.
  *
  * Return: 0 on success, negative error code on error
  */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..adc1b6369512 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -23,6 +23,7 @@
 #include "instructions/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_access_counter.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_configfs.h"
@@ -1079,6 +1080,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_access_counter_init(xe);
+	if (err)
+		return err;
+
 	if (xe->tiles->media_gt &&
 	    XE_GT_WA(xe->tiles->media_gt, 15015404425_disable))
 		XE_DEVICE_WA_DISABLE(xe, 15015404425);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..25b1a43efddc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_access_counter_types.h"
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
@@ -29,6 +30,7 @@
 #include "xe_survivability_mode_types.h"
 #include "xe_sysctrl_types.h"
 #include "xe_tile_types.h"
+#include "xe_usm_queue.h"
 #include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -335,6 +337,16 @@ struct xe_device {
 		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_MAX];
 		/** @usm.pf_queue: Page fault queue */
 		struct xe_pagefault_queue pf_queue;
+		/**
+		 * @usm.ac_workers_indx: Round-robin index selecting the
+		 * next access-counter worker to wake.
+		 */
+		u32 ac_workers_indx;
+#define XE_ACCESS_COUNTER_WORKER_COUNT	4
+		/** @usm.ac_workers: Access counter workers */
+		struct xe_ac_worker ac_workers[XE_ACCESS_COUNTER_WORKER_COUNT];
+		/** @usm.ac_queue: Access counter queue */
+		struct xe_usm_queue ac_queue;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 		/** @usm.dpagemap_shrinker: Shrinker for unused pagemaps */
 		struct drm_pagemap_shrinker *dpagemap_shrinker;
-- 
2.43.0

