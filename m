Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07581C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 00:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE61910EB61;
	Sat,  9 Dec 2023 00:02:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AC810EB61
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 00:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702080159; x=1733616159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61cc6yT3bYla2qBgek+3BZS3LLwpAAaAuQhOJ8B8b04=;
 b=Eh+Y5k5ZRMk0Svs2ndSQ4oarQuGnDT3NIGzPcCQGaNm640PO+wSE7AVk
 Zl52iPS01ZhhdOnyTXFT8jjdLw1V9KPhayjY96TmzDq+Ty1nHS/j0xZVy
 CV9ZznPxC68Y2HE/knhHQbFnAcQEmlsZVfIMh2nBAO2WAiV7jbStOzXFg
 gDA2u8hCpXULsG5/LggPam/lmsgOwiOf9Nd1KMivFbvBO/tXOrHIjA0p7
 asGXgyUtiDuYUSweKPFDWNbqlVdxgvrtueKRB1e23mFtd6mAGXsCwD2C4
 N3vt6BP0lNoB4AQyabBUTIE/TU5fKEboqfkNAHv1aHPuj9c5qTm7lQ2j7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1605704"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1605704"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 16:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="838289808"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; d="scan'208";a="838289808"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 16:02:38 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/pmu/uapi: Remove PMU group busyness events from uapi
Date: Fri,  8 Dec 2023 16:02:33 -0800
Message-ID: <20231209000233.2577418-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, francois.dugast@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PMU group busyness uapi is likely to change in the future. Till the uapi is
decided remove the uapi from xe_drm.h. To not break the build retain the
events internally in xe_pmu.c for now.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 39 +++++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h   | 39 -------------------------------------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 9d0b7887cfc45..d6fa7cdca9ede 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -12,6 +12,45 @@
 #include "xe_gt_clock.h"
 #include "xe_mmio.h"
 
+/**
+ * DOC: XE PMU event config IDs
+ *
+ * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
+ * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
+ * particular event.
+ *
+ * For example to open the DRMXE_PMU_RENDER_GROUP_BUSY(0):
+ *
+ * .. code-block:: C
+ *
+ *	struct perf_event_attr attr;
+ *	long long count;
+ *	int cpu = 0;
+ *	int fd;
+ *
+ *	memset(&attr, 0, sizeof(struct perf_event_attr));
+ *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
+ *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
+ *	attr.use_clockid = 1;
+ *	attr.clockid = CLOCK_MONOTONIC;
+ *	attr.config = DRM_XE_PMU_RENDER_GROUP_BUSY(0);
+ *
+ *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
+ */
+
+/*
+ * Top bits of every counter are GT id.
+ */
+#define __DRM_XE_PMU_GT_SHIFT (56)
+
+#define ___DRM_XE_PMU_OTHER(gt, x) \
+	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
+
+#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
+#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
+#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
+#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
+
 static cpumask_t xe_pmu_cpumask;
 static unsigned int xe_pmu_target_cpu = -1;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a9815..64498c762d8b9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1081,45 +1081,6 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
-/**
- * DOC: XE PMU event config IDs
- *
- * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
- * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
- * particular event.
- *
- * For example to open the DRMXE_PMU_RENDER_GROUP_BUSY(0):
- *
- * .. code-block:: C
- *
- *	struct perf_event_attr attr;
- *	long long count;
- *	int cpu = 0;
- *	int fd;
- *
- *	memset(&attr, 0, sizeof(struct perf_event_attr));
- *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
- *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
- *	attr.use_clockid = 1;
- *	attr.clockid = CLOCK_MONOTONIC;
- *	attr.config = DRM_XE_PMU_RENDER_GROUP_BUSY(0);
- *
- *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
- */
-
-/*
- * Top bits of every counter are GT id.
- */
-#define __DRM_XE_PMU_GT_SHIFT (56)
-
-#define ___DRM_XE_PMU_OTHER(gt, x) \
-	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
-
-#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
-#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
-#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
-#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

