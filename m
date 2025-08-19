Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3399ACA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28410E536;
	Tue, 19 Aug 2025 06:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjdRxmoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC3E10E536
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585561; x=1787121561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLW3PZZthgBKcOBiUw/jd3eVRb6Tuly1nJVzhAKn0AA=;
 b=GjdRxmoE6aFuT/bkKwlOMbp1g7toviZIYgNND7k7d8N7IEYIk44hCW6d
 39KeYTdqSPm3EAMJIuIodg6L/dnpIRGUgQf9YQQH0Szyv7UZj+zGhVmZO
 O5klM7NOcIZvn5Uv4osJv/I2qPJ++tko2yJHyyICWkq3qxfPMOMfDOo8R
 cEjXcpJ8Fs0awvZG6IulBg+b5vCKlQmzqxKimJNJc++mRLiD/BbEjw12z
 oNlyhjnzY9OlfXqU2Y5Guuit8uYhtuy+gMbbq8HSrwVodFgT+pPQuhT+6
 Q38HMmCVziif7Vud6JsdRpyVEdLT02ptz3yEoPWZmP01mMwQqkGb9PHXD Q==;
X-CSE-ConnectionGUID: QjwRWyYdRyq6bS0u+rgYog==
X-CSE-MsgGUID: yd4vGdvHSsy5ZhYIzP5Bng==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966967"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966967"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:21 -0700
X-CSE-ConnectionGUID: 91Xg7ta5QAy+boSVBnY+Fw==
X-CSE-MsgGUID: Q0poE3/HSsiBwtXf3stLuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009467"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:21 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 2/8] drm/xe: Add module parameter for GPU frequency monitoring
Date: Tue, 19 Aug 2025 12:04:11 +0530
Message-Id: <20250819063417.918666-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Add gpufreq_monitoring_interval_ms module parameter to configure
the interval for GPU frequency monitoring. The parameter is only
available when CONFIG_DRM_XE_GPUFREQTRACER is enabled.

Default value is 5000ms (5 seconds) with valid range of 100-10000ms.
The parameter can be modified at runtime via sysfs.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_module.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..f5d4f8bca61f 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -31,6 +31,7 @@
 #define DEFAULT_MAX_VFS_STR		"unlimited"
 #define DEFAULT_WEDGED_MODE		1
 #define DEFAULT_SVM_NOTIFIER_SIZE	512
+#define DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS	5000
 
 struct xe_modparam xe_modparam = {
 	.probe_display =	DEFAULT_PROBE_DISPLAY,
@@ -41,6 +42,9 @@ struct xe_modparam xe_modparam = {
 #endif
 	.wedged_mode =		DEFAULT_WEDGED_MODE,
 	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
+#ifdef CONFIG_DRM_XE_GPUFREQTRACER
+	.gpufreq_monitoring_interval_ms = DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS,
+#endif
 	/* the rest are 0 by default */
 };
 
@@ -93,6 +97,14 @@ MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
 		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
 
+#ifdef CONFIG_DRM_XE_GPUFREQTRACER
+module_param_named(gpufreq_monitoring_interval_ms,
+		   xe_modparam.gpufreq_monitoring_interval_ms, uint, 0644);
+MODULE_PARM_DESC(gpufreq_monitoring_interval_ms,
+		 "GPU frequency monitoring interval in milliseconds (100-10000, default: "
+		 __stringify(DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS) ")");
+#endif
+
 static int xe_check_nomodeset(void)
 {
 	if (drm_firmware_drivers_only())
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..fd60de38d24d 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -23,6 +23,9 @@ struct xe_modparam {
 #endif
 	int wedged_mode;
 	u32 svm_notifier_size;
+#ifdef CONFIG_DRM_XE_GPUFREQTRACER
+	u32 gpufreq_monitoring_interval_ms;
+#endif
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.34.1

