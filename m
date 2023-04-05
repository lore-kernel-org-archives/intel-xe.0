Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A731C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E14210E9FD;
	Wed,  5 Apr 2023 15:40:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3F510E9FF
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709204; x=1712245204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4xPUmnlNMvMRFvNQ9/y9jotWST2mJPpeySql1Bmqsec=;
 b=Cc7EUBPKti6Kb+7g95QRlMPdUq3XTsNkgCJ4kwySvqylXLOXWndur5vJ
 k3GtT2FqQPpgADJAUp8f5iKiNAR+rrNucB6v0PR6kcdYCxzc5a8thR/0K
 YtFYF8FhayeALim/QfXPLkf5SGl9Imh4+MRoso2FILFkZxVRifOfqCysm
 Xecm0MdQzTQozd8T/KMekS3ooioQyPFzYaCLN18qZa29y6ARiS0qL2yYJ
 BBADbWP4LKHWzB4T5O0ohJYaRWWexafsiSfUY8PK/8BbRPFQwZ/gSbBmz
 HglPDQxD0dsAKtcuTqJ+u94cKfA5tgfD3iY3V2A4azRJkPPYreSMbYmry Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865086"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865086"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680327058"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="680327058"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:06 +0300
Message-Id: <20230405153920.926583-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/21] fixup! drm/xe/display: Implement display
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Replace ips stubs in i915_drv.h

With hsw_ips.h conditional build, this is no longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 92dfbb8b3ca4..923b2212f422 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -92,6 +92,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define HAS_PSR2_SEL_FETCH(xe) (xe || 1)
 #define HAS_PSR_HW_TRACKING(xe) ((xe)->info.display.has_psr_hw_tracking)
 #define HAS_IPC(xe) ((xe)->info.display.has_ipc)
+#define HAS_IPS(xe) (xe && false)
 #define HAS_SAGV(xe) (xe || 1)
 #define HAS_DP_MST(xe) ((xe)->info.display.has_dp_mst)
 #define HAS_DMC(xe) ((xe)->info.display.has_dmc)
@@ -174,9 +175,6 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 /* Should not be called (vlv specific) */
 #define assert_dsi_pll_enabled(xe) BUG_ON(1)
 
-#define hsw_ips_disable(crtc_state) (crtc_state && 0)
-#define hsw_ips_pre_update(glob, crtc) (glob && crtc && 0)
-#define hsw_ips_post_update(glob, crtc) do { (void)glob; (void)crtc; } while (0)
 #define intel_has_gpu_reset(a) (a && 0)
 #define intel_overlay_switch_off(a) (a && 0)
 #define intel_overlay_cleanup(a) do { (void)a; } while (0)
-- 
2.39.2

