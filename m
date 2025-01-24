Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E6BC0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 05:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A3510E8CE;
	Fri, 24 Jan 2025 05:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAtFGan+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6BB10E8CE
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 05:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737695082; x=1769231082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NM4sQWgo2TLMpCPkZhN06Bbuj0xmSmi597OCZdw4vaw=;
 b=QAtFGan+NknjuPmlZSAhTdQsMtygo1K+b5vLNXmqPKUKguoeS6Nifz/e
 9qpiIJlkOZbkHFHfvq1F5An7WSByd5/rqekRp/LIfVMbVfPZJLGcygeCm
 B5A5IIWio9heKV+2m3pvrQVFHdmHddSEkZG+ufGsY80ZwPGbo/VHrPBTc
 adx8QOhgT3K0xHVL8Wabd4LDAq8ywfDaiAiBOMJ/hfeSKxuDUFJcLDZKJ
 nmw1WdUHWmo9hMYzhqql8A5MhezDcGAsvCnTUXON8jjetBrhE2KUpt6Gr
 zB4iuZ0G4tn/RbJiMkX0jJeuegpqiGepDbfGbtXRE42KCvIFXDoQ0UCUh w==;
X-CSE-ConnectionGUID: iVm66862QnqH9ItEOx7NBw==
X-CSE-MsgGUID: 0Tb3jZucQFeo5fLWUylZQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38253081"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="38253081"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:41 -0800
X-CSE-ConnectionGUID: cNDFOLm+RouduPvf5LUT0A==
X-CSE-MsgGUID: SWAo8+CQSW+nfhv0KOVnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112304773"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI 5/6] drm/xe/pmu: Add attribute skeleton
Date: Thu, 23 Jan 2025 21:04:10 -0800
Message-ID: <20250124050411.2189060-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
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

Add the generic support for defining new attributes. This only adds
the macros and common infra for the event counters, but no counters
yet. This is going to be added as follow up changes.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 69 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h |  4 ++
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 6678340d6195b..6e19e08dd6176 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -61,7 +61,8 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 	if (gt >= XE_MAX_GT_PER_TILE)
 		return false;
 
-	return false;
+	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
+		pmu->supported_events & BIT_ULL(id);
 }
 
 static void xe_pmu_event_destroy(struct perf_event *event)
@@ -213,16 +214,73 @@ static const struct attribute_group pmu_format_attr_group = {
 	.attrs = pmu_format_attrs,
 };
 
-static struct attribute *pmu_event_attrs[] = {
-	/* No events yet */
+__maybe_unused static ssize_t event_attr_show(struct device *dev,
+					      struct device_attribute *attr, char *buf)
+{
+	struct perf_pmu_events_attr *pmu_attr =
+		container_of(attr, struct perf_pmu_events_attr, attr);
+
+	return sprintf(buf, "event=%#04llx\n", pmu_attr->id);
+}
+
+#define XE_EVENT_ATTR(name_, v_, id_)					\
+	PMU_EVENT_ATTR(name_, pmu_event_ ## v_, id_, event_attr_show)
+
+#define XE_EVENT_ATTR_UNIT(name_, v_, unit_)				\
+	PMU_EVENT_ATTR_STRING(name_.unit, pmu_event_unit_ ## v_, unit_)
+
+#define XE_EVENT_ATTR_GROUP(v_, id_, ...)				\
+	static struct attribute *pmu_attr_ ##v_[] = {			\
+		__VA_ARGS__,						\
+		NULL							\
+	};								\
+	static umode_t is_visible_##v_(struct kobject *kobj,		\
+				       struct attribute *attr, int idx) \
+	{								\
+		struct perf_pmu_events_attr *pmu_attr;			\
+		struct xe_pmu *pmu;					\
+									\
+		pmu_attr = container_of(attr, typeof(*pmu_attr), attr.attr); \
+		pmu = container_of(dev_get_drvdata(kobj_to_dev(kobj)),	\
+				   typeof(*pmu), base);			\
+									\
+		return event_supported(pmu, 0, id_) ? attr->mode : 0;	\
+	}								\
+	static const struct attribute_group pmu_group_ ##v_ = {		\
+		.name = "events",					\
+		.attrs = pmu_attr_ ## v_,				\
+		.is_visible = is_visible_ ## v_,			\
+	}
+
+#define XE_EVENT_ATTR_SIMPLE(name_, v_, id_, unit_)			\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_UNIT(name_, v_, unit_)				\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr,	\
+			    &pmu_event_unit_ ##v_.attr.attr)
+
+#define XE_EVENT_ATTR_NOUNIT(name_, v_, id_)				\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
+
+static struct attribute *pmu_empty_event_attrs[] = {
+	/* Empty - all events are added as groups with .attr_update() */
 	NULL,
 };
 
 static const struct attribute_group pmu_events_attr_group = {
 	.name = "events",
-	.attrs = pmu_event_attrs,
+	.attrs = pmu_empty_event_attrs,
 };
 
+static const struct attribute_group *pmu_events_attr_update[] = {
+	/* No events yet */
+	NULL,
+};
+
+static void set_supported_events(struct xe_pmu *pmu)
+{
+}
+
 /**
  * xe_pmu_unregister() - Remove/cleanup PMU registration
  * @arg: Ptr to pmu
@@ -273,6 +331,7 @@ int xe_pmu_register(struct xe_pmu *pmu)
 
 	pmu->name		= name;
 	pmu->base.attr_groups	= attr_groups;
+	pmu->base.attr_update	= pmu_events_attr_update;
 	pmu->base.scope		= PERF_PMU_SCOPE_SYS_WIDE;
 	pmu->base.module	= THIS_MODULE;
 	pmu->base.task_ctx_nr	= perf_invalid_context;
@@ -283,6 +342,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	pmu->base.stop		= xe_pmu_event_stop;
 	pmu->base.read		= xe_pmu_event_read;
 
+	set_supported_events(pmu);
+
 	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
 	if (ret)
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 0e8faae6bc1b3..f5ba4d56622cb 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -30,6 +30,10 @@ struct xe_pmu {
 	 * @name: Name as registered with perf core.
 	 */
 	const char *name;
+	/**
+	 * @supported_events: Bitmap of supported events, indexed by event id
+	 */
+	u64 supported_events;
 };
 
 #endif
-- 
2.48.0

