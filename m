Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C86C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 07:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3310E757;
	Fri, 22 Dec 2023 07:38:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2046410E757
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 07:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703230728; x=1734766728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AV55bNHGD4AvBm5dHT943Goh3vSUsljWnfG7PQxzHRI=;
 b=Qfal7s0/GSQCKAnSG9HuXMEEHz0croIY8qoYeFJmPYemQ8UEwqThUkbH
 ELMrliYINZYbOJJRo+v6e/4sb4TDaYdesE++JH8oQEJmwOr/+kMkhO2A1
 VK7KZkYqzCcbP1CZuAUSEc8pccwZgrYa2QFmkg08ZSHllDOn/s2F0keGI
 4UaqDq/T+skT/OqECyp5yKca/nEA1xoqKdsUisLj06nm+q5AZclji4Ahy
 viw1UADCXta2blW12bnBEew74hCSxTgszqz8K4d7YzLuBeYVDNsRcr4BM
 PIy/9jHu13ITQLd1v/SM9Mq+rQ74t65EE+jm8HdS2LPAA9Xq9QEK9Y/9t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9481031"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9481031"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920582591"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920582591"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:45 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 3/8] drm/xe/uapi: Add configs for Engine busyness
Date: Fri, 22 Dec 2023 13:15:57 +0530
Message-Id: <20231222074602.817518-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231222074602.817518-1-riana.tauro@intel.com>
References: <20231222074602.817518-1-riana.tauro@intel.com>
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

v3: rebase
    change internal uapi pmu config helpers (Umesh)

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9fa3ae324731..f8456cda5cda 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1340,6 +1340,47 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: XE PMU event config IDs
+ *
+ * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
+ * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
+ * particular event.
+ *
+ */
+
+/**
+ * enum drm_xe_pmu_engine_sample - Supported PMU engine samples
+ */
+enum drm_xe_pmu_engine_sample {
+	/** @DRM_XE_PMU_SAMPLE_BUSY_TICKS: Engine busy ticks */
+	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
+};
+
+/*
+ * Top bits of every counter are GT id.
+ */
+#define __DRM_XE_PMU_GT_SHIFT (56)
+#define __DRM_XE_PMU_SAMPLE_BITS (4)
+#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
+#define __DRM_XE_PMU_CLASS_SHIFT \
+	(__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
+
+#define __DRM_XE_PMU_GT_EVENT(gt, x) \
+	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
+
+#define __DRM_XE_PMU_ENGINE(class, instance, sample) \
+	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
+	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
+	(sample)))
+
+#define __DRM_XE_PMU_OTHER(gt, x) \
+	(__DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + (x))
+
+#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
+	__DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
+						      DRM_XE_PMU_SAMPLE_BUSY_TICKS))
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.40.0

