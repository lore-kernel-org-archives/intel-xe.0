Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A88EC282D3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 09:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0BE10E54B;
	Tue,  4 Mar 2025 09:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fusoe/4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB80610E546
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 09:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741081003; x=1772617003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=56RCwGIUMVKvhj7dZTwbzHZR30K1gzz+2TaRFjgn/xQ=;
 b=fusoe/4dESCHflArLLokpItxjdB7C919cGzVTawf6TLNlTf6pcYSfqVP
 JDaVxXy602s/4o+6gjq/vZDhn5sT0Z+YgtGDeEXkKJqHpxa4AEVu0lYNo
 p7R3PV07YpyqbgCwVOd1V1qA/yXh6wuZwlQPA4DT43kLGLscI68Q6xRjR
 +27L/PeFfhuHqqtmgE/9CEBqWLVAu8j1P4Jexas/+BfkyRrECO1oHdPEN
 pDSwq10/YdGBAuUzdyo/+0Mkex2oPR0GKqCUrzth8nj9lBdp0bKu3Z54L
 7FV4Z4lskWnOj/ih7yJ+uhS/KGbNhZZFiOxekLA88vzA5bYEW51xyTJIb g==;
X-CSE-ConnectionGUID: gGKSxej0RN2J49DrDXdsGw==
X-CSE-MsgGUID: MmAi8zjTR1GrleTCC9GzQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45764793"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="45764793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:36:43 -0800
X-CSE-ConnectionGUID: IoiROslNTWeFU7bJUiVXZA==
X-CSE-MsgGUID: jQgB52feTrSwY90dK0ZOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118837726"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:36:40 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH 2/3] drm/xe/xe_pmu: Add PMU support for per-function engine
 activity stats
Date: Tue,  4 Mar 2025 15:27:42 +0530
Message-ID: <20250304095743.3274062-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250304095743.3274062-1-riana.tauro@intel.com>
References: <20250304095743.3274062-1-riana.tauro@intel.com>
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

Add PMU support for per-function engine activity stats.

per-function engine activity is enabled when VF's are enabled.
If 2 VF's are enabled, then the applicable function values are

0 - PF engine activity
1 - VF1 engine activity
2 - VF2 engine activity

This can be read from perf tool as shown below

./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
			 engine_instance=0,function=1/ -I 1000

v2: fix documentation (Umesh)
    remove global for functions (Lucas, Michal)

v3: fix commit message
    move function_id checks to same place (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 40 +++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index f8f6ebb7c9c6..8922f53ebf93 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -13,6 +13,7 @@
 #include "xe_hw_engine.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
+#include "xe_sriov_pf_helpers.h"
 
 /**
  * DOC: Xe PMU (Performance Monitoring Unit)
@@ -32,9 +33,10 @@
  *	gt[60:63]		Selects gt for the event
  *	engine_class[20:27]	Selects engine-class for event
  *	engine_instance[12:19]	Selects the engine-instance for the event
+ *	function[44:59]		Selects the function of the event (SRIOV enabled)
  *
  * For engine specific events (engine-*), gt, engine_class and engine_instance parameters must be
- * set as populated by DRM_XE_DEVICE_QUERY_ENGINES.
+ * set as populated by DRM_XE_DEVICE_QUERY_ENGINES and function if SRIOV is enabled.
  *
  * For gt specific events (gt-*) gt parameter must be passed. All other parameters will be 0.
  *
@@ -49,6 +51,7 @@
  */
 
 #define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
+#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
 #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
 #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
 #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
@@ -58,6 +61,11 @@ static unsigned int config_to_event_id(u64 config)
 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
 }
 
+static unsigned int config_to_function_id(u64 config)
+{
+	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
+}
+
 static unsigned int config_to_engine_class(u64 config)
 {
 	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
@@ -151,7 +159,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 static bool event_param_valid(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
-	unsigned int engine_class, engine_instance;
+	unsigned int engine_class, engine_instance, function_id;
 	u64 config = event->attr.config;
 	struct xe_gt *gt;
 
@@ -161,16 +169,27 @@ static bool event_param_valid(struct perf_event *event)
 
 	engine_class = config_to_engine_class(config);
 	engine_instance = config_to_engine_instance(config);
+	function_id = config_to_function_id(config);
 
 	switch (config_to_event_id(config)) {
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
-		if (engine_class || engine_instance)
+		if (engine_class || engine_instance || function_id)
 			return false;
 		break;
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
 		if (!event_to_hwe(event))
 			return false;
+		/*
+		 * PF(0) and total vfs when SRIOV is enabled
+		 */
+		if (IS_SRIOV_PF(xe)) {
+			if (function_id > xe_sriov_pf_get_totalvfs(xe))
+				return false;
+		} else if (function_id) {
+			return false;
+		}
+
 		break;
 	}
 
@@ -242,14 +261,17 @@ static int xe_pmu_event_init(struct perf_event *event)
 static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
 {
 	struct xe_hw_engine *hwe;
-	u64 val = 0;
+	unsigned int function_id;
+	u64 config, val = 0;
 
-	hwe = event_to_hwe(event);
+	config = event->attr.config;
+	function_id = config_to_function_id(config);
 
-	if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
-		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 0);
+	hwe = event_to_hwe(event);
+	if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
+		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, function_id);
 	else
-		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 0);
+		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, function_id);
 
 	return val;
 }
@@ -352,6 +374,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
 }
 
 PMU_FORMAT_ATTR(gt,			"config:60-63");
+PMU_FORMAT_ATTR(function,		"config:44-59");
 PMU_FORMAT_ATTR(engine_class,		"config:20-27");
 PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
 PMU_FORMAT_ATTR(event,			"config:0-11");
@@ -360,6 +383,7 @@ static struct attribute *pmu_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_engine_class.attr,
 	&format_attr_engine_instance.attr,
+	&format_attr_function.attr,
 	&format_attr_gt.attr,
 	NULL,
 };
-- 
2.47.1

