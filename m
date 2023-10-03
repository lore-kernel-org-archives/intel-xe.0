Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627FAE7AD57
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303CE10E2AB;
	Tue,  3 Oct 2023 14:35:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D7910E2A9
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343721; x=1727879721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JpRoYmjDEiPhvXJ2nodWmnN8X65tGLmsE+tyW1nCVMY=;
 b=EXNPrGp3vt9WFoGQVI+j/BZHVNm75jYCjpvl++4hQmCo/U5EfEavw3xX
 fIwj5hBiCajgRPmGTI1jIvrBlncX+Rj740DQIcsVfjg2xyrqWW8j2p5Ab
 ztul7hoA0z/TBTv2wq7E1tl5GGgy6DzJfd36bZ8su0R6bBAyQyncPyYCg
 f7mA3EGGnfgPXQa+zOMGQu0Rp0RsXW2VoFZ8kuNd0WqjuM/6tf03ukVxs
 ESKgBwoqgyBKwcKX6HA6nY5ZP00fVLjnUNgLwd0ynUH5u0egoGi6Mnl77
 zeddmiuHNWro+R1Qbr6yAmvnjxYOOXGIX2mbmZApg1FoMrULf/KwS+MGo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413799574"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="413799574"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082041598"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="1082041598"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:50 +0300
Message-Id: <7a98810ab931ec5245705b41f2038c53abb63fae.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/10] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The display device and runtime info have been moved as part of struct
intel_display, and the ones in struct xe_device are stale.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 5 +++--
 drivers/gpu/drm/xe/xe_device_types.h              | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index f739858d17e2..e7c9b4ea2153 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -206,9 +206,10 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
 
 #define intel_step_name xe_step_name
 #define pdev_to_i915 pdev_to_xe_device
-#define DISPLAY_INFO(xe)		((xe)->info.display)
 #define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
-#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->info.display_runtime)
+
+#define DISPLAY_INFO(xe)		((xe)->display.info.__device_info)
+#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->display.info.__runtime_info)
 
 #define FORCEWAKE_ALL XE_FORCEWAKE_ALL
 #define HPD_STORM_DEFAULT_THRESHOLD 50
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0717839ae964..62e1a875980b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -240,8 +240,6 @@ struct xe_device {
 		u8 enable_display:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-		const struct intel_display_device_info *display;
-		struct intel_display_runtime_info display_runtime;
 		struct {
 			u32 rawclk_freq;
 		} i915_runtime;
-- 
2.39.2

