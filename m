Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379DDC02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282E10E801;
	Thu,  6 Feb 2025 10:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQeyJpLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C798B10E80F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738837541; x=1770373541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgMpVMX2DBtCO/SDRpGLSfHT892vofy0umaL73RjXwA=;
 b=XQeyJpLUEBy4De+RMbHkUDCnZfKLB/dN3zz5t8ZHl3R8l1Rf4tV0T1S/
 Uu7pqIAONPSI2fn4U0YPircrPwYpqgz+Fo6VJjBSMosNi3A1MKei72FQh
 sLBLI43azTbZ0l6quP1wBGcr+k3gQrptmGw5ddsdKv/gZX1y4staPoaZT
 XXhqDWHWBB17IlBQhsCuRtN7Eb1YEsfZsmG8y6G8exueLovLOed7jUVd0
 h4ICaZpwyk4eL4OLbOVOWTUPjtki+vknvF6Qs03R8NckxVYlOdBJ2vdEh
 1hdMSeClI3qToNE604GmsRBTUfzthu03YAiNDVepNNwiKCP67GnlUZKkm w==;
X-CSE-ConnectionGUID: csXWJ3HWSc6qePh50NY92g==
X-CSE-MsgGUID: uQN4WpF2S6y2sM7L3toxmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64786996"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="64786996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:25:41 -0800
X-CSE-ConnectionGUID: Cdi/v0MNQ7eG2SZFU6cWVQ==
X-CSE-MsgGUID: pyklH78ES6KiUlrvjaCWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="110998025"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:25:38 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
Date: Thu,  6 Feb 2025 16:13:54 +0530
Message-ID: <20250206104358.3436519-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206104358.3436519-1-riana.tauro@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
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

When the engine events are created, acquire GT forcewake to read gpm
timestamp required for the events and release on event destroy. This
cannot be done during read due to the raw spinlock held my pmu.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 47 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 06a1c72a3838..5b5fe4424aba 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_hw_engine.h"
@@ -102,6 +103,36 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
 	return hwe;
 }
 
+static bool is_engine_event(u64 config)
+{
+	unsigned int event_id = config_to_event_id(config);
+
+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
+}
+
+static void event_gt_forcewake(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	u64 config = event->attr.config;
+	struct xe_pmu *pmu = &xe->pmu;
+	struct xe_gt *gt;
+	unsigned int fw_ref;
+
+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
+	if (!gt || !is_engine_event(config))
+		return;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return;
+
+	if (!pmu->fw_ref)
+		pmu->fw_ref = fw_ref;
+
+	pmu->fw_count++;
+}
+
 static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 			    unsigned int id)
 {
@@ -144,6 +175,13 @@ static bool event_param_valid(struct perf_event *event)
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	struct xe_gt *gt;
+
+	if (pmu->fw_count--) {
+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
+		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
+	}
 
 	drm_WARN_ON(&xe->drm, event->parent);
 	xe_pm_runtime_put(xe);
@@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
 		xe_pm_runtime_get(xe);
+		event_gt_forcewake(event);
 		event->destroy = xe_pmu_event_destroy;
 	}
 
 	return 0;
 }
 
-static u64 read_engine_events(struct perf_event *event)
+static u64 read_engine_events(struct perf_event *event, u64 prev)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
 	struct xe_hw_engine *hwe;
 	u64 val = 0;
 
+	if (!pmu->fw_count)
+		return prev;
+
 	hwe = event_to_hwe(event);
 	if (!hwe)
 		drm_warn(&xe->drm, "unknown pmu engine\n");
@@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
 		return xe_gt_idle_residency_msec(&gt->gtidle);
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
-		return read_engine_events(event);
+		return read_engine_events(event, prev);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f5ba4d56622c..134b3400b19c 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -30,6 +30,14 @@ struct xe_pmu {
 	 * @name: Name as registered with perf core.
 	 */
 	const char *name;
+	/**
+	 * @fw_ref: force_wake ref
+	 */
+	unsigned int fw_ref;
+	/**
+	 * @fw_count: force_wake count
+	 */
+	unsigned int fw_count;
 	/**
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
-- 
2.47.1

