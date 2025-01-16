Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CE6C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F340B10EA25;
	Thu, 16 Jan 2025 23:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTjI5DKH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF4710EA22
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068862; x=1768604862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fwZ/deY7X4yLGI7Zlym4Uskr5sN5lEy0B+7dtV6lv3M=;
 b=eTjI5DKHpZuzTWDVZdZsOA8TmbIsq5rn2MA3DAwLiUECE1OOXeahABeM
 vqdcv6Oy6dThqNenYrGttwNeou/HM0XTN+7Sejscmumuk6SM/427ODqyl
 lz3snKyr4y3zGh2H7HEowZMPxo8wW77SliX7SUCAwYXOPBpBSVxycNHVd
 RKI+mpLlFia+/jjHU6Z7mzgDCCkZVIwpPZgOuaNfXsNUKC+LLPbyQx3yH
 EwzhklEDrwAK/jwQGDC0PwaYAI0RCezk2IhYgWOJy41wgKaXeM3GLrhDT
 tQop42F3/yYE/RKOJaZ+4A/H+qf7Fh9jtrMcUNUmtm3dYNmograHuirdo A==;
X-CSE-ConnectionGUID: Q70q+ba2T/OLj0CEMOubvw==
X-CSE-MsgGUID: Hmt11wmxRbeZc80FRbwx0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37364132"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37364132"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:42 -0800
X-CSE-ConnectionGUID: iEoCX+GDRCqCENgOmox29g==
X-CSE-MsgGUID: RyH7YQD2S/WhfIqULBxeNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136474354"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 4/7] drm/xe/pmu: Hook up gt suspend notification
Date: Thu, 16 Jan 2025 15:07:15 -0800
Message-ID: <20250116230718.82460-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116230718.82460-1-lucas.demarchi@intel.com>
References: <20250116230718.82460-1-lucas.demarchi@intel.com>
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

When the device is runtime suspended it's not desired to wake it up to
read the idle residency - that would make the measurement interfere on
the outcome. Hook up the pmu to the gt suspend flow so it's possible to
estimate the idle residency while device is suspended.

v2: Extract suspend notification as a preparatory step (Lucas)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |  3 +++
 drivers/gpu/drm/xe/xe_pmu.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h       |  2 ++
 drivers/gpu/drm/xe/xe_pmu_types.h |  4 ++++
 4 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 26e64530ada27..d3b9df6438d6c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -47,6 +47,7 @@
 #include "xe_mmio.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
+#include "xe_pmu.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
@@ -877,6 +878,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_disable_host_l2_vram(gt);
 
+	xe_pmu_suspend(gt);
+
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "suspended\n");
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 2312c73a3ee16..ce53cfb846470 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -223,6 +223,24 @@ static const struct attribute_group pmu_events_attr_group = {
 	.attrs = pmu_event_attrs,
 };
 
+/**
+ * xe_pmu_suspend() - Save necessary state before suspending
+ * @gt: GT structure
+ */
+void xe_pmu_suspend(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned long flags;
+
+	if (!pmu->registered)
+		return;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+	pmu->suspend_timestamp[gt->info.id] = ktime_get();
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 /**
  * xe_pmu_unregister() - Remove/cleanup PMU registration
  * @arg: Ptr to pmu
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
index f9dfe77d00cb6..c53c6a4a2ae55 100644
--- a/drivers/gpu/drm/xe/xe_pmu.h
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -12,8 +12,10 @@ struct xe_gt;
 
 #if IS_ENABLED(CONFIG_PERF_EVENTS)
 int xe_pmu_register(struct xe_pmu *pmu);
+void xe_pmu_suspend(struct xe_gt *gt);
 #else
 static inline void xe_pmu_register(struct xe_pmu *pmu) {}
+static inline void xe_pmu_suspend(struct xe_gt *gt) {}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index e0cf7169f4fda..883e462852377 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -38,6 +38,10 @@ struct xe_pmu {
 	 * @lock: Lock protecting enable mask and ref count handling.
 	 */
 	raw_spinlock_t lock;
+	/**
+	 * @suspend_timestamp: Last time GT suspended
+	 */
+	ktime_t suspend_timestamp[XE_PMU_MAX_GT];
 };
 
 #endif
-- 
2.48.0

