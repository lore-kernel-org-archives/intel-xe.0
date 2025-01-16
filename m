Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA46C02187
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6601810EA24;
	Thu, 16 Jan 2025 23:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToQK9VIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9489110E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068862; x=1768604862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dX/kS4BeuLvzXqaVlkAQ0mppR2yP87BOx+0aR6fy03Y=;
 b=ToQK9VILJSPKzbxL0uKnDaIa0DcFZst4pKmDoPbOfgemb+POgD8WABRA
 iEfHz0lrVwNtppZd0OICxdf2s5zmD/WoNwY9FEtM5DWCeaVo9lgpKYRwO
 uNCWM7oRafbP4kIN2ZQP7MwZJGhHMq6rzKgCGjwULthWdlW1XJOna28ye
 YGhin3/vS7W5YtyPv49OJnKx5EQUDMjvR90yIMdB7Qegc4UhCzPMpqhs6
 7igE8qd6oTG099eBIetU5SCsPMXI+tPM2+ce6oLYOCyF17FJoFCMLDI0E
 VjPIqSt6ZuMHDbHd5zH7pJHBudbGPPqK3fK771cAM4Rd1HsOXPnQY0Jb3 w==;
X-CSE-ConnectionGUID: L84y01T7TsmnHX9iDw5yNQ==
X-CSE-MsgGUID: CqIYnUNiSZ6B90m9k0wJYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37364124"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37364124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
X-CSE-ConnectionGUID: 4ksBi1A+Q8KNXjGDasrWtg==
X-CSE-MsgGUID: mE4WqDz4Rri2GZFGU0Zs4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136474360"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 6/7] drm/xe/pmu: Add attribute skeleton
Date: Thu, 16 Jan 2025 15:07:17 -0800
Message-ID: <20250116230718.82460-7-lucas.demarchi@intel.com>
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

Add the generic support for defining new attributes. This uses
gt-c6-residency as first attribute to bootstrap it, but its
implementation will be added by a follow up commit: until proper support
is added, it will always be invisible in sysfs since the corresponding
bit is not set in the supported_events bitmap.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 46 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index f8154bcad891a..c2af82ec3f793 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -54,6 +54,8 @@ static unsigned int config_to_gt_id(u64 config)
 	return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
 }
 
+#define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
+
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
@@ -68,7 +70,8 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 	if (gt >= XE_MAX_GT_PER_TILE)
 		return false;
 
-	return false;
+	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
+		pmu->supported_events & BIT_ULL(id);
 }
 
 static void xe_pmu_event_destroy(struct perf_event *event)
@@ -219,16 +222,53 @@ static const struct attribute_group pmu_format_attr_group = {
 	.attrs = pmu_format_attrs,
 };
 
+static ssize_t event_attr_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct perf_pmu_events_attr *pmu_attr =
+		container_of(attr, struct perf_pmu_events_attr, attr);
+
+	return sprintf(buf, "event=%#04llx\n", pmu_attr->id);
+}
+
+static umode_t event_attr_is_visible(struct kobject *kobj,
+				     struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct perf_pmu_events_attr *pmu_attr =
+		container_of(attr, typeof(*pmu_attr), attr.attr);
+	struct xe_pmu *pmu =
+	       container_of(dev_get_drvdata(dev), typeof(*pmu), base);
+
+	if (event_supported(pmu, 0, pmu_attr->id))
+		return attr->mode;
+
+	return 0;
+}
+
+#define XE_EVENT_ATTR(name_, v_, id_, unit_)					\
+	PMU_EVENT_ATTR(name_, pmu_event_ ## v_, id_, event_attr_show)		\
+	PMU_EVENT_ATTR_ID_STRING(name_.unit, pmu_event_unit_ ## v_, id_, unit_)
+
+XE_EVENT_ATTR(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms")
+
 static struct attribute *pmu_event_attrs[] = {
-	/* No events yet */
+	&pmu_event_gt_c6_residency.attr.attr,
+	&pmu_event_unit_gt_c6_residency.attr.attr,
+
 	NULL,
 };
 
 static const struct attribute_group pmu_events_attr_group = {
 	.name = "events",
 	.attrs = pmu_event_attrs,
+	.is_visible = event_attr_is_visible,
 };
 
+static void set_supported_events(struct xe_pmu *pmu)
+{
+}
+
 /**
  * xe_pmu_suspend() - Save necessary state before suspending
  * @gt: GT structure
@@ -309,6 +349,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	pmu->base.stop		= xe_pmu_event_stop;
 	pmu->base.read		= xe_pmu_event_read;
 
+	set_supported_events(pmu);
+
 	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
 	if (ret)
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 883e462852377..341398a9e60dc 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -42,6 +42,10 @@ struct xe_pmu {
 	 * @suspend_timestamp: Last time GT suspended
 	 */
 	ktime_t suspend_timestamp[XE_PMU_MAX_GT];
+	/**
+	 * @supported_events: Bitmap of supported events, indexed by event id
+	 */
+	u64 supported_events;
 };
 
 #endif
-- 
2.48.0

