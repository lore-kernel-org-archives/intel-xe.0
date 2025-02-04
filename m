Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FF8C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343CF10E6DE;
	Tue,  4 Feb 2025 18:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbXcRMCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D7910E37B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692767; x=1770228767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+m+GNTUM5wqmqRpQM7NjrIc20Z6pM84atSz30SN1kOo=;
 b=jbXcRMCDxQUrC9zmpJ/pwytYTPyF89+YQ18D7EopG4GKtz+DUo/lGIo+
 7Qfh7oZUFQ9ib3sKSIKxNPNMAvA0QVeZ84YLYBcrXRxpCOxGaQV0qtEGS
 79q1jD71YTA4thhg52KQVILINGGjC/k6rJ5jB71yhJT/KaUrMp7ZNRypn
 jVTniNgFgiqOI3ygkVlZeKrvdLL2nVfBP8skgVRcCUwSkFT4O6u3ymdcj
 F44oM2iuajKFc6ChUQaqQHh3uXp28yGTI0nJH+Rv4Tm9SpNnB8SD5+ZR7
 P2F2W1l+gYuAl6HUPE6EcVW92a4+YP440r22QGu1tqFzJmPyYUlacCC9C g==;
X-CSE-ConnectionGUID: mIhw9xd+R6+6kQAIBSSEfA==
X-CSE-MsgGUID: D39IizuTQA2vaTGAsz/Vqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39374704"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39374704"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:12:47 -0800
X-CSE-ConnectionGUID: 4XfTvvn9SNuocExE5a0g/w==
X-CSE-MsgGUID: owjaqw1bRO65EwCm06Fn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110656166"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa006.jf.intel.com with ESMTP; 04 Feb 2025 10:12:47 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v2 1/2] drm/xe/pmu: Add event tracking
Date: Tue,  4 Feb 2025 10:09:04 -0800
Message-Id: <20250204180905.1347210-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
References: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
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

Keep track of which events are enabled and number of instances
as preparation for the PMU frequency events. Also add locks where
we update these structures.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 44 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h | 14 ++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 3910a82328ee..10603e7c3eff 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -8,6 +8,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_idle.h"
+#include "xe_macros.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
 
@@ -38,6 +39,11 @@
 #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
 #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
 
+static struct xe_pmu *event_to_pmu(struct perf_event *event)
+{
+	return container_of(event->pmu, struct xe_pmu, base);
+}
+
 static unsigned int config_to_event_id(u64 config)
 {
 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
@@ -156,6 +162,21 @@ static void xe_pmu_event_read(struct perf_event *event)
 
 static void xe_pmu_enable(struct perf_event *event)
 {
+	struct xe_pmu *pmu = event_to_pmu(event);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	const unsigned int event_bit = config_to_event_id(event->attr.config);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+
+	XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
+	XE_WARN_ON(pmu->enable_count[event_bit] == ~0);
+
+	/* Save the event config */
+	pmu->enable |= event->attr.config;
+	pmu->enable_count[event_bit]++;
+
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -176,15 +197,34 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
 	event->hw.state = 0;
 }
 
+static void xe_pmu_disable(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned long flags;
+	unsigned int event_bit = config_to_event_id(event->attr.config);
+
+	XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+
+	if (--pmu->enable_count[event_bit] == 0)
+		pmu->enable &=  ~event->attr.config;
+
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 static void xe_pmu_event_stop(struct perf_event *event, int flags)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	struct xe_pmu *pmu = &xe->pmu;
 
-	if (pmu->registered)
+	if (pmu->registered) {
 		if (flags & PERF_EF_UPDATE)
 			xe_pmu_event_update(event);
 
+		xe_pmu_disable(event);
+	}
+
 	event->hw.state = PERF_HES_STOPPED;
 }
 
@@ -334,6 +374,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
+	raw_spin_lock_init(&pmu->lock);
+
 	name = kasprintf(GFP_KERNEL, "xe_%s",
 			 dev_name(xe->drm.dev));
 	if (!name)
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f5ba4d56622c..b15858d4d4a9 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -10,6 +10,8 @@
 #include <linux/spinlock_types.h>
 
 #define XE_PMU_MAX_GT 2
+/* Event config is defined as 0:11 */
+#define XE_PMU_MAX_EVENT_TYPES 12
 
 /**
  * struct xe_pmu - PMU related data per Xe device
@@ -34,6 +36,18 @@ struct xe_pmu {
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
 	u64 supported_events;
+	/**
+	 * @lock: Lock protecting enable mask and sampling
+	 */
+	raw_spinlock_t lock;
+	/**
+	 * @enable: Store requested PMU event config.
+	 */
+	u64 enable;
+	/**
+	 * @enable_count: Reference counts for the enabled events.
+	 */
+	unsigned int enable_count[XE_PMU_MAX_EVENT_TYPES];
 };
 
 #endif
-- 
2.38.1

