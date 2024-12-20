Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2917E77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 01:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800C910EE26;
	Fri, 20 Dec 2024 01:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZNKt4yD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA010EE22
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734657744; x=1766193744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KkoZOzhIyckoUZi9ew5yRgV8y4RC8drDMf/fy8OzAFo=;
 b=OZNKt4yDd5IMTQ/Zs51pNHHhKi2YiiHVZ8UHzg2IJmD/QhbHRXURkDqU
 BD8WE5QhKC5qrIscQm1If+DeTzdba1x7ln8njheZr1BDal3rw4wfO69kT
 9iz2EzPJNYzNuCsujt8zm1nBYyu4ntgnMB75K3tWn7FQ4utXHyKa2+BH/
 FO8dkEuNO+V2fziZQHbEzjT55Mv1fjI2vLD649lkSh/Rx/rwdQmfrxCSu
 2nIFs/FqazYjm1bJy458ZyiY2Qd/Yr4nRYRSqwirH9r2HFGnjphGPwxo8
 d9p4QEmHcIr1LzRDPpu7AT6cHuqnjfOJebt4zIrYk+2NaEEh4kTKPsMLg Q==;
X-CSE-ConnectionGUID: tkHdhOHCTHuw0oIgTUSCsw==
X-CSE-MsgGUID: jAEDNGrFSkWNqnBrQfsW/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45693303"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="45693303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 17:22:24 -0800
X-CSE-ConnectionGUID: NzellKXxSI63c+EYiY20Eg==
X-CSE-MsgGUID: BB56bNvCQh+wgJblFPHokw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135695011"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa001.jf.intel.com with ESMTP; 19 Dec 2024 17:22:23 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v10 2/4] drm/xe: Add locks in gtidle code
Date: Thu, 19 Dec 2024 17:19:08 -0800
Message-Id: <20241220011910.103280-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
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

Another entry point is added so PMU code can call into the gtidle
method for residency. Add locking so that parallel calls to this
method from sysfs and PMU don't give inconsistent gtidle states
for c6 residency.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c       | 23 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_idle.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |  3 +++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index fd80afeef56a..1f32ac964abe 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -69,6 +69,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 {
 	u64 delta, overflow_residency, prev_residency;
 
+	lockdep_assert_held(&gtidle->lock);
+
 	overflow_residency = BIT_ULL(32);
 
 	/*
@@ -273,8 +275,21 @@ static ssize_t idle_status_show(struct device *dev,
 
 	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
 }
-static DEVICE_ATTR_RO(idle_status);
 
+u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
+{
+	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
+	u64 residency;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&gtidle->lock, flags);
+	residency = get_residency_ms(gtidle, gtidle->idle_residency(pc));
+	raw_spin_unlock_irqrestore(&gtidle->lock, flags);
+
+	return residency;
+}
+
+static DEVICE_ATTR_RO(idle_status);
 static ssize_t idle_residency_ms_show(struct device *dev,
 				      struct device_attribute *attr, char *buff)
 {
@@ -283,10 +298,10 @@ static ssize_t idle_residency_ms_show(struct device *dev,
 	u64 residency;
 
 	xe_pm_runtime_get(pc_to_xe(pc));
-	residency = gtidle->idle_residency(pc);
+	residency = xe_gt_idle_residency_msec(gtidle);
 	xe_pm_runtime_put(pc_to_xe(pc));
 
-	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
+	return sysfs_emit(buff, "%llu\n", residency);
 }
 static DEVICE_ATTR_RO(idle_residency_ms);
 
@@ -329,6 +344,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
 	if (!kobj)
 		return -ENOMEM;
 
+	raw_spin_lock_init(&gtidle->lock);
+
 	if (xe_gt_is_media_type(gt)) {
 		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_mc6_residency;
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 4455a6501cb0..591a01e181bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
 void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
 int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
+u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
 
 #endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
index b8b297a3f884..a3667c567f8a 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
 #define _XE_GT_IDLE_SYSFS_TYPES_H_
 
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 struct xe_guc_pc;
@@ -31,6 +32,8 @@ struct xe_gt_idle {
 	u64 cur_residency;
 	/** @prev_residency: previous residency counter */
 	u64 prev_residency;
+	/** @lock: Lock protecting idle residency counters */
+	raw_spinlock_t lock;
 	/** @idle_status: get the current idle state */
 	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
 	/** @idle_residency: get idle residency counter */
-- 
2.38.1

