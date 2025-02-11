Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A46C021A1
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 09:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4832210E11C;
	Tue, 11 Feb 2025 09:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJq/Y/9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB33E10E11C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739267388; x=1770803388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kr5XZol76w+0QLfw43deBoQHBjI2mZEZsaEAHEHeSJ4=;
 b=PJq/Y/9rTtYIKPRb95vY5d5RWTTYuLw5eNPd5AlLUo1ncuhcwK7uc0yW
 wnIs/Gb3/1jrL0PJOTD/5oLAU54uWM6VKvWjaeqQO2oRjuF3Hz52AseQy
 bVY3y43mExjNQuHywGp2cnpCFSluJEbwzrd5eEPmNE9hDxe/tauGP2dmr
 b9a4YqvwidWGXEY0H8Bes+HRp0Jv5ZaqcatJMoo1UyqabjeRAaoNodZ8s
 DQt4D49s7m4RDJ4FIK2twuCP7ds+XMI8EP/w1o7VPH73y58QQ1gm/S0zz
 pJDjcE75fOz+awdx51GvI41dnoXtZFKAR4cKGg07w+aq6agAUL75NZfky g==;
X-CSE-ConnectionGUID: 4nL92QCzSrylvexSOiB2Mg==
X-CSE-MsgGUID: PMTzVX8URVu9pu307FF8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50104763"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="50104763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:49:48 -0800
X-CSE-ConnectionGUID: uLtlwdOdTLe88SduoneaeQ==
X-CSE-MsgGUID: /8NT4f1VT9m0JeDAJYYmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="112974471"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:49:44 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 5/8] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
Date: Tue, 11 Feb 2025 15:39:47 +0530
Message-ID: <20250211100952.322303-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250211100952.322303-1-riana.tauro@intel.com>
References: <20250211100952.322303-1-riana.tauro@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index dc89fa6d0ec5..0539dd61ddc3 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_hw_engine.h"
@@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
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
+	struct xe_pmu *pmu = &xe->pmu;
+	struct xe_gt *gt;
+	unsigned int fw_ref;
+
+	if (!is_engine_event(config))
+		return true;
+
+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return false;
+
+	if (!pmu->fw_ref)
+		pmu->fw_ref = fw_ref;
+
+	return true;
+}
+
 static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 			    unsigned int id)
 {
@@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event *event)
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	struct xe_gt *gt;
+
+	if (pmu->fw_ref) {
+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
+		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
+	}
 
 	drm_WARN_ON(&xe->drm, event->parent);
 	xe_pm_runtime_put(xe);
@@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event *event)
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
 
 	return 0;
 }
 
-static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
+static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event,  u64 prev)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
 	struct xe_hw_engine *hwe;
 	u64 val = 0;
 
+	if (!pmu->fw_ref)
+		return prev;
+
 	hwe = event_to_hwe(event);
 	if (!hwe)
 		drm_warn(&xe->drm, "unknown engine\n");
@@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
 		return xe_gt_idle_residency_msec(&gt->gtidle);
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
-		return read_engine_events(gt, event);
+		return read_engine_events(gt, event, prev);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f5ba4d56622c..07c4e592106e 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -30,6 +30,10 @@ struct xe_pmu {
 	 * @name: Name as registered with perf core.
 	 */
 	const char *name;
+	/**
+	 * @fw_ref: force_wake ref
+	 */
+	unsigned int fw_ref;
 	/**
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
-- 
2.47.1

