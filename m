Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27E5C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB2810E283;
	Fri, 21 Feb 2025 10:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0sTlyt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2523F10E283
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740134303; x=1771670303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fCfDGF7eMIHq3pzc04zLUqy318YFDfHRvISwgovao/o=;
 b=P0sTlyt8+/1MdWDZ/Xx/6eaiGwHbxngt2dwyQMQKBXhHhFoTICebxE4T
 vSE83D+CoSaWLeafTlVEuGQTXntlCls1aXrCQ49LEtWgLAyyZTzNnRTzW
 WQyah6vyED5WrGo5Vun9/kXqyE1Wh5tiQYVTu99Lqpll58w+gTEdRr64y
 JwgTjdbwoajsUhvj+9XgiUXgCbHn5qe0NaSRc6LdVqDkrqDopBSKmWecw
 e2KBP3RyVNlgZ7qYavLpIkkoNq0yx2MuQHf1Dcb8P8237rc+oFHdztUmx
 k6mkBbhfxY25gTue6YV9+gVbw7IsRSB6L32+fQFv2yKX9J/Vw7795XTnw w==;
X-CSE-ConnectionGUID: cqHmIkC1RZO/yygFrsWq/Q==
X-CSE-MsgGUID: LnGFcph0QWa3n5CF8HOxfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40178220"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40178220"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:38:23 -0800
X-CSE-ConnectionGUID: UFVi1LChRZevcyNiI/sspg==
X-CSE-MsgGUID: rpgV6RVhRCS3z8GaDC/JtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="120442397"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:38:21 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v8 5/5] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
Date: Fri, 21 Feb 2025 16:29:07 +0530
Message-ID: <20250221105908.1966738-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250221105908.1966738-1-riana.tauro@intel.com>
References: <20250221105908.1966738-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index d2c035c1924e..0c8563830195 100644
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
+		kfree(event->pmu_private);
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

