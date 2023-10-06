Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A19E92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557DF10E06B;
	Fri,  6 Oct 2023 10:38:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE8F10E06B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588706; x=1728124706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dF7AlkhHF73ozby1D4uxB1/CV7mYvZmkL9oglQ/aXpQ=;
 b=hzOAC67mmfhmiaGPgyzD0x7jfq/QlO92+zizn6kdsGce14p3mk7o+c9u
 iB49BilxZ8Zi3lbC3DMaI6yU+fYMn/qXl6U1Zra1L75imv00FM3rW0lkV
 H3NkhXozUxBCmrPUoD1bObHA5iD3TBMuPEeYWV6GeM79bdKn2hDcdq15C
 FZ1z6U0HTtjx3ko7KDSt4qECMVzT8bRrewdOiUAANwcEUECeYmP3Im3aU
 L3nEZwdy9qSitMP1LNhtHZHdLbqmqKZf/kdu52Y/HYvr/JYldgg2wvjHn
 pQtFaNH3ow+NrzpzmHISvs0lFqi8SaIR6m+r2Utc/GCQPiNcUDiXJd/Z7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2329030"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2329030"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755812919"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755812919"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:37:59 +0300
Message-Id: <ab6832ae95de2559ab62ea1b17f44b3f99cb3f55.1696588392.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696588392.git.jani.nikula@intel.com>
References: <cover.1696588392.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/6] fixup! drm/xe/display: Implement display
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
index 7abfab0261a8..2803fb00dcc2 100644
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

