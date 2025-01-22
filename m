Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D7C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 06:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949D510E670;
	Wed, 22 Jan 2025 06:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DI6OZUh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDB910E27F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 06:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737527053; x=1769063053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRZMCoaw+UNdqv2H50kCYYFvtiLmwedcYFLCS1H6GbY=;
 b=DI6OZUh/3QMdLWLbtubbYj+sRXkTkOwr5rac5n3L/RaSseW134um3bna
 XBfmTmTKaTnP8V8KhgzUgyPVU6eJuuauIMFMVFzWt/Vo/xcVL9ts8wyBZ
 puRS07v057/alI7oklgP5A60m8MlDH/Yox6uBUsAYC0ymaX+Q+x+6Yl7F
 xanClmpf3r/BncqrM9A5bDi+r8gfOFYMv1TUlO8jZz5cEUWeViRNJ2RBr
 GZ2yyO3KjtCcXITAh7KpPPylqhFrK9MJjZooETGxOgRIZHTMS2mJuiVj0
 9XbtUCKpKXrV6p44k40bfzCiqDUvwZPtg8fPQX5HA7++7uZCCR/ioGokh A==;
X-CSE-ConnectionGUID: pucoy7b+QcOW6pzuai1WlQ==
X-CSE-MsgGUID: CMo5BEm8TjmJl4yhQR7Mbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41643302"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="41643302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:12 -0800
X-CSE-ConnectionGUID: LrmqPodXSDijaO/zogvppQ==
X-CSE-MsgGUID: XScVznsnTYSSBF5bXUQt+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112015670"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v14 5/7] drm/xe/pmu: Add attribute skeleton
Date: Tue, 21 Jan 2025 22:23:39 -0800
Message-ID: <20250122062341.1100173-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250122062341.1100173-1-lucas.demarchi@intel.com>
References: <20250122062341.1100173-1-lucas.demarchi@intel.com>
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
index 5a93634f17a2b..68ebec1746a53 100644
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
@@ -218,16 +221,53 @@ static const struct attribute_group pmu_format_attr_group = {
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
  * xe_pmu_unregister() - Remove/cleanup PMU registration
  * @arg: Ptr to pmu
@@ -290,6 +330,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	pmu->base.stop		= xe_pmu_event_stop;
 	pmu->base.read		= xe_pmu_event_read;
 
+	set_supported_events(pmu);
+
 	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
 	if (ret)
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index e0cf7169f4fda..64a1ca881c233 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -38,6 +38,10 @@ struct xe_pmu {
 	 * @lock: Lock protecting enable mask and ref count handling.
 	 */
 	raw_spinlock_t lock;
+	/**
+	 * @supported_events: Bitmap of supported events, indexed by event id
+	 */
+	u64 supported_events;
 };
 
 #endif
-- 
2.48.0

