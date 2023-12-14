Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F7DC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6491F10E926;
	Thu, 14 Dec 2023 11:24:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA50510E904
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553078; x=1734089078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=va66dyWC+3wHe0wFO95YJCNXQnNBMq4fHJ5n5tMz+fA=;
 b=O+RabJ10F4+FxEHmRcHTK6XxN0nj1VXydKP94YFyRRx8y/Zqt8daCIWz
 iml9fOPoGhnxQtwfOobq8YOILLWpn1LU+uckAcDPct3p3YhaOMmbrphmt
 d1SUmC7EA6WSUUQV4o7AcsvNunG0MAM53WA+n8un60tHK5h4jIU24GuSb
 0AGwImjN8chfREnCfoh96nP1u9h3cIvKMH3chcBvSBA2R5+gVYAv2ogxH
 ZhLHWf1TIqufNYuYbzpl9P8gcXEVffiYJXQw3jOqLYHGZ4rDmOmpb4WPG
 ABWvhkAQ18djUPPOZzv0bIINE7J0tro1uqR4ONfdBO+PIKz1uXdD74itU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940172"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714173"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:36 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 05/10] RFC drm/xe/uapi: Add configs for Engine busyness
Date: Thu, 14 Dec 2023 17:01:39 +0530
Message-Id: <20231214113144.251726-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231214113144.251726-1-riana.tauro@intel.com>
References: <20231214113144.251726-1-riana.tauro@intel.com>
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

GuC provides engine busyness ticks as a 64 bit counter which count
as clock ticks.

Add configs to the uapi to expose Engine busyness via PMU.

v2: add "__" prefix for internal helpers
    add a simple helper for application usage (Aravind)

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 include/uapi/drm/xe_drm.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5ba412007270..58ab3e414c87 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1080,6 +1080,40 @@ struct drm_xe_wait_user_fence {
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
+
+/**
+ * DOC: XE PMU event config IDs
+ *
+ * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
+ * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
+ * particular event.
+ *
+ */
+enum drm_xe_pmu_engine_sample {
+	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
+};
+
+/*
+ * Top bits of every counter are GT id.
+ */
+#define __DRM_XE_PMU_GT_SHIFT (56)
+
+#define __DRM_XE_PMU_SAMPLE_BITS (4)
+#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
+#define __DRM_XE_PMU_CLASS_SHIFT \
+	(__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
+
+#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
+	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
+	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
+	(sample)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
+
+#define __DRM_XE_PMU_OTHER(gt, x) \
+	((__u64)__DRM_XE_PMU_ENGINE(gt, 0xff, 0xff, 0xf) + 1 + (x))
+
+#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
+	__DRM_XE_PMU_ENGINE(gt, class, instance, DRM_XE_PMU_SAMPLE_BUSY_TICKS)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.40.0

