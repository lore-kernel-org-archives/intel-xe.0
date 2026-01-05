Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65921C2A07D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F5310E372;
	Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXxJIeVU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A4210E27C
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585766; x=1799121766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OTpE/Sqr2sKuAzgOlD68HLM/v8cAr0F8Ug97FfpnmMs=;
 b=nXxJIeVUlBHjaMC1VuFS8ZgRq+kCrO/aZpr3E6sLe+ZOFpA3aC1KFA8G
 unV5RkyIWz1Ue5YOFo5Gp6Qml7D0sWwpTnINp5WTjAYNhJEtBuctC25Ny
 bxW6NdHSInd28+GETynU7dbOpOBvL26l4tJ4Kv80/yTjC9IxzNXMSN1Xx
 O8znxGnvvImn8q53tNcDkQP62re/o/doFn6jGKCqovILbSPLs/fvOrevV
 siRDCEbVfxEbNd9N6BaCNncYqcOKwMkm7NUz+oXinuQJDtiBsfMmzz4Em
 ew2r/kxvhpdmdYOjiBR4tP9SJ2LPCySZ3H4PNtYcrelCWbqZ6bLuO51fW A==;
X-CSE-ConnectionGUID: 1MYyWbu2Q6+tgTuwgSF34A==
X-CSE-MsgGUID: Bzfd8tToTeu5KSYVtHbVbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856268"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:45 -0800
X-CSE-ConnectionGUID: P7ZuM/KIQqOq2B4WmALGwg==
X-CSE-MsgGUID: FgVKBlDJThW79h421yXXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060680"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 15/22] drm/xe: Add deadline Kconfig options
Date: Sun,  4 Jan 2026 20:02:30 -0800
Message-Id: <20260105040237.1307873-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Add Kconfig options to tune the deadline manager behavior.

CONFIG_DRM_XE_DEADLINE_WINDOW_US configures the deadline window. If a
fence is not signaled within this window prior to the programmed
deadline, deadline boosting is activated. The default is 3000 us,
allowing OEMs to tune deadline sensitivity.

CONFIG_DRM_XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT configures the
percentage of the deadline window during which priority boosting is
applied in addition to frequency boosting.

CONFIG_DRM_XE_DEADLINE_EXIT_DELAY_MS configures the delay from the last
deadline signaling until the boost mode is exited.

v2:
 - s/CONFIG_DRM_XE_DEADLINE_WINDOW/CONFIG_DRM_XE_DEADLINE_WINDOW_US
 - Add priority boost percent Kconfig

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_deadline_mgr.c | 17 ++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 594acedf7b56..e01e7cc11c53 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -60,3 +60,25 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	  to apply to applicable user. For elevated user, all above MIN
 	  and MAX values will apply when this configuration is enable to
 	  apply limitation. By default limitation is applied.
+
+config DRM_XE_DEADLINE_WINDOW_US
+	int "Default deadline window (us)"
+	default 3000
+	help
+	  Specifies the deadline window in microseconds. If a fence has not
+	  been signaled when the current time is within this window of its
+	  programmed deadline, deadline boosting is enabled.
+
+config DRM_XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT
+	int "Percent of deadline window with priority boost"
+	default 60
+	range 0 100
+	help
+	  Specifies the percentage of the deadline window during which
+	  priority boosting is applied in addition to frequency boosting.
+
+config DRM_XE_DEADLINE_EXIT_DELAY_MS
+	int "Default deadline exit delay (ms)"
+	default 100
+	help
+	  Specifies the deadline exit delay in milliseconds.
diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.c b/drivers/gpu/drm/xe/xe_deadline_mgr.c
index 061664ed24e3..8ebecf92aa8c 100644
--- a/drivers/gpu/drm/xe/xe_deadline_mgr.c
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.c
@@ -11,9 +11,24 @@
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
 
+#ifdef CONFIG_DRM_XE_DEADLINE_WINDOW_US
+#define XE_DEADLINE_WINDOW_US	CONFIG_DRM_XE_DEADLINE_WINDOW_US
+#else
 #define XE_DEADLINE_WINDOW_US			3000
-#define XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT	60
+#endif
+
+#ifdef CONFIG_DRM_XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT
+#define XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT	\
+	CONFIG_DRM_XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT
+#else
+#define XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT   60
+#endif
+
+#ifdef CONFIG_DRM_XE_DEADLINE_EXIT_DELAY_MS
+#define XE_DEADLINE_EXIT_DELAY_MS	CONFIG_DRM_XE_DEADLINE_EXIT_DELAY_MS
+#else
 #define XE_DEADLINE_EXIT_DELAY_MS		100
+#endif
 
 static ktime_t __xe_deadline_mgr_freq_boost_window(void)
 {
-- 
2.34.1

