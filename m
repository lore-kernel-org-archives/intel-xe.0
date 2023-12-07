Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A170C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFE110E8A3;
	Thu,  7 Dec 2023 12:50:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837A810E8A3
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953454; x=1733489454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1U7jxY7iipViNt1ucQouvxJgkqWa5utGkZI1gD0xoYc=;
 b=UbGzTc/Dr6TsGgkMM9TZQ1SpEqwJ1E+jRW7YkyQr8yBjE1jKuV+L0hkW
 h5JIOzi3rM3KYXCk4N9TDbwvPHyTD3cOflFGQqkpmRUsn+Gu98T52h6L6
 4W2iEX8jblxdvG++Hcr+Y5AwvwE8LUvgSJpdr9VH9Z8SCATc2OUjUTLXg
 EsZk0rsSf0aR/TaDrJhQH5HtJI9vG8d5Z29A9szTb+saY7NcPDBM+fB7W
 hpNDWNqDpA9fDjo15zwRhIzf7Av7MjPEMnSxW3ealIGPi4DDz8ho3uW2l
 4TFwHofcHnbWjb47qnuC1LH0aOiBBj4PE+/8l43GdHJHPVwc5/1KcWk0k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1051383"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1051383"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19692709"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:51 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/8] RFC drm/xe/uapi: Add configs for Engine busyness
Date: Thu,  7 Dec 2023 18:27:59 +0530
Message-Id: <20231207125802.3730165-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231207125802.3730165-1-riana.tauro@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
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
 include/uapi/drm/xe_drm.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b5e7a4f673fa..074d63cb79df 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1107,6 +1107,10 @@ struct drm_xe_wait_user_fence {
  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
 
+enum drm_xe_pmu_engine_sample {
+	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
+};
+
 /*
  * Top bits of every counter are GT id.
  */
@@ -1115,6 +1119,25 @@ struct drm_xe_wait_user_fence {
 #define ___DRM_XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
 
+#define __DRM_XE_PMU_SAMPLE_BITS (4)
+#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
+#define __DRM_XE_PMU_CLASS_SHIFT \
+	(__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
+
+/*
+ * Engine configs offset - 0x1000
+ */
+#define __DRM_XE_PMU_ENGINE_OFFSET(gt) \
+	(___DRM_XE_PMU_OTHER(gt, 0xfff) + 1)
+
+#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
+	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
+	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
+	(sample)) + __DRM_XE_PMU_ENGINE_OFFSET(gt))
+
+#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
+	__DRM_XE_PMU_ENGINE(gt, class, instance, DRM_XE_PMU_SAMPLE_BUSY_TICKS)
+
 #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
 #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
 #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
-- 
2.40.0

