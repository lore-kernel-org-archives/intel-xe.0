Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A535AE7071E
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784B510E5CA;
	Thu, 21 Sep 2023 11:15:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A44A10E5C9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695294900; x=1726830900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ffhjDlUqCV7ZB/I3eYjKolWZtrjeCLLBCS1vhlO1hA8=;
 b=dI9otPaQyH/kpMmQMhIZnkrdbCAGMGXdhb11p0uHSz+Wd4AsXjs3hEMt
 w+YzOY5XaBD4rld/Z2CtljbZZHBi7zn7Eho3LBMot52H9jMdD3MkaxDMT
 g+jXleafAUC3wCmV+fyQgXMxj6tfX1ugNBvRKJSwyjr+LPWZZXaGbSeFo
 9tT6MrefoUDkSBw/W+ZTzqxcSuAF1/H6HeB0BBwTmms20i9SIjHHQFzUg
 C/tam2nxF8PUzA46tDhkBUKD4D0BMsNn+UOt+fR/qEwT7s0stFoWijX9l
 ZTb3G6Bj2s/3zOMa2BTaeUTtemNEdzPly6cMgq3DwpWVla+JVt4a7vtAr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359872823"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="359872823"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="994040733"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="994040733"
Received: from jhogande-mobl1.fi.intel.com ([10.237.72.74])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:14:59 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 14:14:34 +0300
Message-Id: <20230921111434.3051325-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921111434.3051325-1-jouni.hogander@intel.com>
References: <20230921111434.3051325-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] fixup! drm/xe/display: Implement display
 support
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add xe_runtime_pm struct pointer to xe_device for runtime related macros.

v2: Add xe_runtime_pm struct pointer to xe_device

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h | 2 ++
 drivers/gpu/drm/xe/xe_device_types.h                      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
index ce2b9bf3918d..89da3cc62f39 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
@@ -5,6 +5,8 @@
 
 #include "intel_wakeref.h"
 
+#define intel_runtime_pm xe_runtime_pm
+
 static inline void disable_rpm_wakeref_asserts(void *rpm)
 {
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c0d5ca62df7b..a82f28c6a3a0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -401,6 +401,9 @@ struct xe_device {
 	 */
 	u32 edram_size_mb;
 
+	/* To shut up runtime pm macros.. */
+	struct xe_runtime_pm {} runtime_pm;
+
 	/* For pcode */
 	struct mutex sb_lock;
 
-- 
2.34.1

