Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCB9C021B3
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 05:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5454B10E135;
	Mon, 24 Feb 2025 05:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzP47DB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE9310E134
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 05:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740374296; x=1771910296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGisMpQmoUT3rM/YGq+T8/PRmBpyMyaSTdZ7Y1+Sqs8=;
 b=bzP47DB23cDVswNGmUlmwB/lY8olmtnbrsz261szlY7iNmvIzlHKFX4q
 aKxjX0j7EDFIRC7JmANzfhrT6wkGfAkuGYLk3qPV1ODs1eP/ldBPjv91s
 KObXgxxywvMavtge3PUVYc43t/FwV2mPArw/FWeaYobos8jVp9coLZ7MC
 6cB6VoBkbCj4mtvAs9og/E2wjPWPvgFnkbqhkdsaxzZ/v+ZZzM5jTi6md
 DGXFAOHGIMHYMd9k3xXSNdq5b+cdyj7oB9DQUWFH4wlDi31pSFWW4MSd6
 vxyAltoZx9qq5aUOaKw69xxPpIe/GdVX47ddR7m2GgorWQUPqbrfR78dN Q==;
X-CSE-ConnectionGUID: 0Xv9pc2pSGeHB0MJvICRHg==
X-CSE-MsgGUID: gGyKesOeTSqKtW40cwzhnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41380343"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41380343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:18:16 -0800
X-CSE-ConnectionGUID: Dycgni6/TAmuXLeX4xIjOg==
X-CSE-MsgGUID: +BDgVOtUQmOBlIxK7F2onw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153150723"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:18:13 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v9 5/5] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
Date: Mon, 24 Feb 2025 11:09:02 +0530
Message-ID: <20250224053903.2253539-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250224053903.2253539-1-riana.tauro@intel.com>
References: <20250224053903.2253539-1-riana.tauro@intel.com>
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

v2: remove forcewake counting (Umesh)
v3: remove extra space (Umesh)
v4: use event pmu private data (Lucas)
    free local copy (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index d2c035c1924e..4f62a6e515d6 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_hw_engine.h"
@@ -102,6 +103,41 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
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
+static bool event_gt_forcewake(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	u64 config = event->attr.config;
+	struct xe_gt *gt;
+	unsigned int *fw_ref;
+
+	if (!is_engine_event(config))
+		return true;
+
+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
+
+	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
+	if (!fw_ref)
+		return false;
+
+	*fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!*fw_ref) {
+		kfree(fw_ref);
+		return false;
+	}
+
+	event->pmu_private = fw_ref;
+
+	return true;
+}
+
 static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 			    unsigned int id)
 {
@@ -144,6 +180,15 @@ static bool event_param_valid(struct perf_event *event)
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_gt *gt;
+	unsigned int *fw_ref = event->pmu_private;
+
+	if (fw_ref) {
+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
+		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
+		kfree(fw_ref);
+		event->pmu_private = NULL;
+	}
 
 	drm_WARN_ON(&xe->drm, event->parent);
 	xe_pm_runtime_put(xe);
@@ -183,6 +228,11 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
 		xe_pm_runtime_get(xe);
+		if (!event_gt_forcewake(event)) {
+			xe_pm_runtime_put(xe);
+			drm_dev_put(&xe->drm);
+			return -EINVAL;
+		}
 		event->destroy = xe_pmu_event_destroy;
 	}
 
-- 
2.47.1

