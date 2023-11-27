Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAD0C07E98
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C16410E2B6;
	Mon, 27 Nov 2023 14:04:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5224E10E2A1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701093872; x=1732629872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MttdoCr1smNO+O5RK8dbRF0Hvqu03iszMWUDnYhaklE=;
 b=Eruhw29skA/biA7XDfTrjjFp0rDdZbEdSAlMR7tQBSWgWKO/peayOGn7
 44PbUMQ/GCykshVEsY0m6qlv+fBImwQsJX8YEzljc2vejpGElRjw+P5Rn
 CpLxCs+UbdlJMywfrVPg5puT8GfXl4XZBG4elUFgUnr9pXPpeXB7UyXnn
 n+alSnEQMgZk204Lk7fM+Pu53tBRTiTTe7tXK3ZNEf61cVweChFb1X1YT
 6BTC1RuEgx+nZEPkpWHUprFhs52s8YiZdmq9Tr7etw1HRptBTi7kIYQ5M
 l/OkN92O+dc8JFiAVGBfRXIZRywwhqJghK1xOPgWOJuXcI7CNTolsHI/g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="457039842"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="457039842"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="761604490"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761604490"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:23 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 19:41:22 +0530
Message-Id: <20231127141125.2913415-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231127141125.2913415-1-riana.tauro@intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/8] RFC drm/xe/uapi: Add configs for Engine
 busyness
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

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 include/uapi/drm/xe_drm.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6f38f836b705..be75e6ed317f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1004,6 +1004,10 @@ struct drm_xe_wait_user_fence {
  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
 
+enum drm_xe_pmu_engine_sample {
+	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
+};
+
 /*
  * Top bits of every counter are GT id.
  */
@@ -1012,6 +1016,22 @@ struct drm_xe_wait_user_fence {
 #define ___DRM_XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
 
+#define DRM_XE_PMU_SAMPLE_BITS (4)
+#define DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
+#define DRM_XE_PMU_CLASS_SHIFT \
+	(DRM_XE_PMU_SAMPLE_BITS + DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
+
+/*
+ * Engine configs offset - 0x1000
+ */
+#define DRM_XE_PMU_ENGINE_OFFSET(gt) \
+	(___DRM_XE_PMU_OTHER(gt, 0xfff) + 1)
+
+#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
+	(((class) << DRM_XE_PMU_CLASS_SHIFT | \
+	(instance) << DRM_XE_PMU_SAMPLE_BITS | \
+	(sample)) + DRM_XE_PMU_ENGINE_OFFSET(gt))
+
 #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
 #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
 #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
-- 
2.40.0

