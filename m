Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ED8CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 20:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9DB10EAE7;
	Fri, 26 Sep 2025 20:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juIswg5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E528710E133
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758917361; x=1790453361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qe1ypSzLFVvGs/L+bzlohjpdcldKIXMU5zdjc6RHiUE=;
 b=juIswg5iHfGpGGGAb/eQAvhtDIUOCGuE1Nm86tpf2LtAjTZEs6gfWwnL
 IvIiRbBWGYHkDjqIrKk6MbA1R8zCzE8Pa4e4H+BLkYYsmhH4tlsvZ4pXd
 9hdQTfyWYQCxQrPNzgbk5/lgC6d7PyP4CNEmKG8klZfKoTr5m6RsBvvdM
 Y6xvnWsJjRLqCCBa/ncP8uM8GCpxNoFdMHquyxBrN3siwRH6df9tGcgfO
 q7hf7l737xErhoKrr43B+CwlI27ussTBMm832GxgNeqhzk4P+cp9H9XP8
 Mad26Fbc8VNfBWZ/mgSgYgej05DZ2ZoYO0xmTfODFyAP8CYCfWHYKS1Aq w==;
X-CSE-ConnectionGUID: P/tZoiZERaO8FislgUFc9A==
X-CSE-MsgGUID: x/RWjNxbRL2PKDeqKLv93A==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72352464"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72352464"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:20 -0700
X-CSE-ConnectionGUID: bjyq1oO2QsaYygIaLIY8kg==
X-CSE-MsgGUID: jqkxFRcaQpKHP4DMmNZ/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177634936"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
Date: Fri, 26 Sep 2025 20:09:20 +0000
Message-ID: <20250926200917.164618-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926200917.164618-7-jonathan.cavitt@intel.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Add guards against this in xe_pmu.c:
- Use xe_root_mmio_gt instead of xe_device_get_gt for the gt id 0 case.
- Modify event_supported and event_gt_forcewake to take a
  struct xe_gt gt pointer.
- Only perform xe_force_wake_put in xe_pmu_event_destroy if gt exists.

v2:
- Pass xe_gt to event_gt_forcewake (Michal)
  - Above necessitated passing xe_gt to event_supported (jcavitt)
- Only perform xe_force_wake_put in xe_pmu_event_destroy if gt exists.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..d54981510a43 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -130,18 +130,15 @@ static bool is_gt_frequency_event(struct perf_event *event)
 	       id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY;
 }
 
-static bool event_gt_forcewake(struct perf_event *event)
+static bool event_gt_forcewake(struct perf_event *event, struct xe_gt *gt)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	u64 config = event->attr.config;
-	struct xe_gt *gt;
 	unsigned int *fw_ref;
 
 	if (!is_engine_event(config) && !is_gt_frequency_event(event))
 		return true;
 
-	gt = xe_device_get_gt(xe, config_to_gt_id(config));
-
 	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
 	if (!fw_ref)
 		return false;
@@ -157,11 +154,10 @@ static bool event_gt_forcewake(struct perf_event *event)
 	return true;
 }
 
-static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
+static bool event_supported(struct xe_pmu *pmu, struct xe_gt *gt,
 			    unsigned int id)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
-	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
 
 	if (!gt)
 		return false;
@@ -219,7 +215,10 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 
 	if (fw_ref) {
 		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
-		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
+
+		if (gt)
+			xe_force_wake_put(gt_to_fw(gt), *fw_ref);
+
 		kfree(fw_ref);
 		event->pmu_private = NULL;
 	}
@@ -233,7 +232,8 @@ static int xe_pmu_event_init(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	struct xe_pmu *pmu = &xe->pmu;
-	unsigned int id, gt;
+	unsigned int id, gt_id;
+	struct xe_gt *gt;
 
 	if (!pmu->registered)
 		return -ENODEV;
@@ -248,8 +248,9 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (event->cpu < 0)
 		return -EINVAL;
 
-	gt = config_to_gt_id(event->attr.config);
+	gt_id = config_to_gt_id(event->attr.config);
 	id = config_to_event_id(event->attr.config);
+	gt = xe_device_get_gt(xe, gt_id);
 	if (!event_supported(pmu, gt, id))
 		return -ENOENT;
 
@@ -262,7 +263,7 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
 		xe_pm_runtime_get(xe);
-		if (!event_gt_forcewake(event)) {
+		if (!event_gt_forcewake(event, gt)) {
 			xe_pm_runtime_put(xe);
 			drm_dev_put(&xe->drm);
 			return -EINVAL;
@@ -443,13 +444,18 @@ static ssize_t event_attr_show(struct device *dev,
 				       struct attribute *attr, int idx) \
 	{								\
 		struct perf_pmu_events_attr *pmu_attr;			\
+		struct xe_device *xe;					\
 		struct xe_pmu *pmu;					\
+		struct xe_gt *gt;					\
 									\
 		pmu_attr = container_of(attr, typeof(*pmu_attr), attr.attr); \
 		pmu = container_of(dev_get_drvdata(kobj_to_dev(kobj)),	\
 				   typeof(*pmu), base);			\
 									\
-		return event_supported(pmu, 0, id_) ? attr->mode : 0;	\
+		xe = container_of(pmu, typeof(*xe), pmu);		\
+		gt = xe_root_mmio_gt(xe);				\
+									\
+		return event_supported(pmu, gt, id_) ? attr->mode : 0;	\
 	}								\
 	static const struct attribute_group pmu_group_ ##v_ = {		\
 		.name = "events",					\
@@ -497,7 +503,7 @@ static const struct attribute_group *pmu_events_attr_update[] = {
 static void set_supported_events(struct xe_pmu *pmu)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
 	if (!xe->info.skip_guc_pc) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
-- 
2.43.0

