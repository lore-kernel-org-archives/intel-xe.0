Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C71FCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEF510E6A7;
	Wed, 18 Mar 2026 07:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgP0tYSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623FD10E698
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817816; x=1805353816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SqmJpInX7elwx3/CidY4s7NmRkQuwY2iGKEM3pEjJN8=;
 b=FgP0tYSA0tJrZaDhwdY6WwkVAnRJUQnejejBK2vuPWGMAv3lkHy5aUjP
 qW7ECV/txNjMR5zEt59RFCmmXJ7uZkD8Hynzzf0vwJX68wBuxoi2XWHeG
 ZDaPLKNQr002qimgvuaaX4g0V1PWnZOzpW4ngsLDwIzgCzqG6yE5RQ1Vw
 Ln/y4crsCNSeFEN6xThdMOTVpU/+tZqsgF36gkjj6Qvqy4kMbSNZ378LS
 K27bUqvULHvp75eJRbC7IaQOR1MuNZcPAmHoA6d4JIl1njyjY4cuMT+yn
 HT2lN8Kw+sk+PXJUmfPMcxBwFCuvKlvgKl1XJXyRhDD7bERm+FoOjWhCl g==;
X-CSE-ConnectionGUID: k9WUTSoTQuWDY7LRpwmxCA==
X-CSE-MsgGUID: RFTdDkGZRXOxr41CpbSB4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764255"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764255"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:16 -0700
X-CSE-ConnectionGUID: hRfSxN1uQ52JylFi3a+gwA==
X-CSE-MsgGUID: Gk0KKngXQKW36FnDgCSNng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424001"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 04/15] drm/xe: Implement xe_access_counter_init
Date: Wed, 18 Mar 2026 13:14:45 +0530
Message-Id: <20260318074456.2839499-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 45 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.c         |  5 +++
 drivers/gpu/drm/xe/xe_device_types.h   |  4 +++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index f3a8a93b5135..cafcc42897f8 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -11,6 +11,7 @@
 #include "xe_access_counter.h"
 #include "xe_access_counter_types.h"
 #include "xe_device.h"
+#include "xe_usm_queue.h"
 
 /**
  * DOC: Xe access counters
@@ -27,6 +28,38 @@
  * xe_access_counter.c implements the consumer layer.
  */
 
+static int xe_access_counter_entry_size(void)
+{
+	return roundup_pow_of_two(sizeof(struct xe_access_counter));
+}
+
+static void xe_access_counter_queue_work_func(struct work_struct *w)
+{
+	/* TODO: Implement */
+}
+
+static int xe_access_counter_queue_init(struct xe_device *xe,
+					struct xe_usm_queue *ac_queue)
+{
+	/*
+	 * Allocate a fixed-size queue for access counter notifications.
+	 * Size is determined based on hardware capabilities.
+	 */
+#define XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES	128
+	ac_queue->size = XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES *
+			 xe_access_counter_entry_size();
+#undef XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES
+
+	ac_queue->data = devm_kzalloc(xe->drm.dev, ac_queue->size, GFP_KERNEL);
+	if (!ac_queue->data)
+		return -ENOMEM;
+
+	spin_lock_init(&ac_queue->lock);
+	INIT_WORK(&ac_queue->worker, xe_access_counter_queue_work_func);
+
+	return 0;
+}
+
 /**
  * xe_access_counter_init - Initialize access counter consumer layer
  * @xe: xe device
@@ -35,7 +68,17 @@
  */
 int xe_access_counter_init(struct xe_device *xe)
 {
-	/* Stub implementation - to be filled in */
+	int err, i;
+
+	if (!xe->info.has_usm)
+		return 0;
+
+	for (i = 0; i < XE_ACCESS_COUNTER_QUEUE_COUNT; ++i) {
+		err = xe_access_counter_queue_init(xe, xe->usm.ac_queue + i);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e77a3a3db73d..8773c2d2f69a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -23,6 +23,7 @@
 #include "instructions/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_access_counter.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_debugfs.h"
@@ -933,6 +934,10 @@ int xe_device_probe(struct xe_device *xe)
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
index b9231544e500..526cfd09d0b9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_access_counter_types.h"
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
@@ -311,6 +312,9 @@ struct xe_device {
 #define XE_PAGEFAULT_QUEUE_COUNT	4
 		/** @usm.pf_queue: Page fault queues */
 		struct xe_usm_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
+#define XE_ACCESS_COUNTER_QUEUE_COUNT	4
+		/** @usm.ac_queue: Access counter queues */
+		struct xe_usm_queue ac_queue[XE_ACCESS_COUNTER_QUEUE_COUNT];
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
 		struct drm_pagemap_shrinker *dpagemap_shrinker;
-- 
2.34.1

