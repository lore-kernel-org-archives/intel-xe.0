Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FEEC02192
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 09:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7510E787;
	Wed, 29 Jan 2025 09:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K82RVmHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE6510E77C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738144616; x=1769680616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sy30lrgiT7xN6V/sGxazGAxywOWOZb1CrzAIUjrA0sk=;
 b=K82RVmHSRH+RJPMicZ19Cv4FRUdbAQs2aSGcEd+WnczEsjalKULfDmOK
 I9Vilux561qDFnMk8grU1anhEqOJzcfg0DiWWupS5ZKCqoX1q6wqeHTzK
 Tki/ZgZGJkQGaa0Bn5mkSnyZI+mprwodCO3TWaZagoNGKGEBSxuk2dMTl
 jRAMg+/+4OFE/Cm98UmTqlIIhEzgbZBZUljngUqLMAXlBPk0bnYObC20l
 c8lWux5ZCNWquDIgeJ5KgVZj4uD7ZbxzjWQj0t04+HSE/6n94u5qmsQ8y
 vNBZ41F6qWzFeQwHVm8EoIUxm/RVD0MAb9bvfueaB7wPlL9H2MG+lEqnX g==;
X-CSE-ConnectionGUID: 0KKSKfBNQ1u8yTaj9yVGYQ==
X-CSE-MsgGUID: 5yhanhp9QOWhOO9NRw3wGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42579526"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="42579526"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:46 -0800
X-CSE-ConnectionGUID: Ppn6tjV/S5ib5asXC6wlUA==
X-CSE-MsgGUID: U2haYhpYTwGK3EvjrREPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="108958269"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:44 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 7/8] drm/xe/xe_pmu: Add pmu support for per-function engine
 activity stats
Date: Wed, 29 Jan 2025 15:46:50 +0530
Message-ID: <20250129101653.1976699-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
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

Add pmu support for per-function per-engine-class engine activity
stats.

per-function per-engine-class activity is enabled when num_vfs
are set. If num_vfs is set to 2, then the applicable function ids
are

0 - Global per-engine-class activity
1 - PF per-engine-class activity
2,3 - per-VF per-engine-class activity from PF

This can be read from perf tool as shown below

./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
			 engine_instance=0,function=1/ -I 1000

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 45 ++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 15e9a57aa429..2968fc9a358c 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -12,6 +12,7 @@
 #include "xe_hw_engine.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
+#include "xe_sriov_pf_helpers.h"
 
 /**
  * DOC: Xe PMU (Performance Monitoring Unit)
@@ -29,15 +30,21 @@
  *
  *        60        56        52        48        44        40        36        32
  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
- *   [ gt ]
+ *   [ gt ]    [             function              ]
  *
  *        28        24        20        16        12         8         4         0
  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
  *            [   engine_class  ] [ engine_instance ] [         event             ]
  *
- * engine_class and engine_instance bits will be applicable for
+ * function, engine_class and engine_instance bits will be applicable for
  * per-engine-class activity events (engine-active-ticks, engine-total-ticks)
  *
+ * Function id applicable for per-engine-class activity
+ *
+ * 0 - global per-engine-class activity
+ * 1 - PF per-engine-class activity
+ * 2 .. (num_vfs + 1) - per-VF per-engine-class activity from PF
+ *
  * The standard perf tool can be used to grep for a certain event as well.
  * Example:
  *
@@ -49,6 +56,7 @@
  */
 
 #define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
+#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
 #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
 #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
 #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
@@ -58,6 +66,11 @@ static unsigned int config_to_event_id(u64 config)
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
@@ -116,7 +129,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 static bool event_param_valid(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
-	unsigned int engine_class, engine_instance;
+	unsigned int engine_class, engine_instance, function_id;
 	u64 config = event->attr.config;
 	struct xe_gt *gt;
 
@@ -124,18 +137,28 @@ static bool event_param_valid(struct perf_event *event)
 	if (!gt)
 		return false;
 
+	function_id = config_to_function_id(config);
+	if (function_id && !IS_SRIOV_PF(xe))
+		return false;
+
 	engine_class = config_to_engine_class(config);
 	engine_instance = config_to_engine_instance(config);
 
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
+		 * Two additional functions are required for global(0)
+		 * and PF(1) when SRIOV is enabled
+		 */
+		if (function_id > xe_sriov_pf_get_totalvfs(xe) + 1)
+			return false;
 		break;
 	}
 
@@ -194,15 +217,19 @@ static u64 read_engine_events(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	struct xe_hw_engine *hwe;
-	u64 val = 0;
+	unsigned int function_id;
+	u64 val = 0, config;
+
+	config = event->attr.config;
+	function_id = config_to_function_id(config);
 
 	hwe = event_to_hwe(event);
 	if (!hwe)
 		drm_warn(&xe->drm, "unknown pmu engine\n");
-	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
-		val = xe_guc_engine_activity_active_ticks(hwe, 0);
+	else if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
+		val = xe_guc_engine_activity_active_ticks(hwe, function_id);
 	else
-		val = xe_guc_engine_activity_total_ticks(hwe, 0);
+		val = xe_guc_engine_activity_total_ticks(hwe, function_id);
 
 	return val;
 }
@@ -305,6 +332,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
 }
 
 PMU_FORMAT_ATTR(gt,			"config:60-63");
+PMU_FORMAT_ATTR(function,		"config:44-59");
 PMU_FORMAT_ATTR(engine_class,		"config:20-27");
 PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
 PMU_FORMAT_ATTR(event,			"config:0-11");
@@ -313,6 +341,7 @@ static struct attribute *pmu_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_engine_class.attr,
 	&format_attr_engine_instance.attr,
+	&format_attr_function.attr,
 	&format_attr_gt.attr,
 	NULL,
 };
-- 
2.47.1

