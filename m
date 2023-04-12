Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565A6C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7B510E83A;
	Wed, 12 Apr 2023 14:24:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CE910E83A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309464; x=1712845464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A5GBkh5/G2AXPiBABWw8UDyYMIOlnN7ufHIjEazPEXU=;
 b=GVIvX9i3qGjD3CrvzqRkLdyIFoHMHcKva6W2uRQchnIxh2rLgOT8F1mv
 5NhyMDzwqfAe6JdKsDGBIBRsyf5sNM+kE21h85i8aRrqNV5FXAJp7G8kt
 fRJEm2DN7FfYr97N1F5HA4qmzzCOob88QCBzZ2lnbkR1nuDs445XogUAs
 8hw17sXOHLuuaCtyDWw2LrAjB4nm3ywFOjeyn7IP8bsoqpFQTCWF6NURQ
 qmzyxwxZ48MRFLSRFQcvQrlo4wff5ZVYS0UXPbVMuEUD53Yzrd772ju7n
 RDAmUOqVnf0AGAlCVbEH3AQFdoG6klBtDIzNNOa7i75hKNL5b/o/Ru/ud Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343915951"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343915951"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688955993"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688955993"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:24:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:45 +0300
Message-Id: <20230412142006.877109-21-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 20/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

Remove unnecessary ifdefs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c       | 2 --
 drivers/gpu/drm/i915/display/intel_display_core.h  | 4 ----
 drivers/gpu/drm/i915/display/intel_display_types.h | 7 +------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c6605649a92f..92042e7fcfb4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3888,7 +3888,6 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 					 struct intel_crtc_state *pipe_config,
 					 struct intel_display_power_domain_set *power_domain_set)
 {
-#ifdef I915
 	struct drm_device *dev = crtc->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder cpu_transcoder;
@@ -3927,7 +3926,6 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 		pipe_config->cpu_transcoder = cpu_transcoder;
 		break;
 	}
-#endif
 
 	return transcoder_is_dsi(pipe_config->cpu_transcoder);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index cc058eb303ee..e4da8902c878 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -249,13 +249,11 @@ struct intel_wm {
 	u16 skl_latency[8];
 
 	/* current hardware state */
-#ifdef I915
 	union {
 		struct ilk_wm_values hw;
 		struct vlv_wm_values vlv;
 		struct g4x_wm_values g4x;
 	};
-#endif
 
 	u8 num_levels;
 
@@ -301,12 +299,10 @@ struct intel_display {
 	} funcs;
 
 	/* Grouping using anonymous structs. Keep sorted. */
-#ifdef I915
 	struct intel_atomic_helper {
 		struct llist_head free_list;
 		struct work_struct free_work;
 	} atomic_helper;
-#endif
 
 	struct {
 		/* backlight registers and fields in struct intel_panel */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d22cc99966c5..fc798734f8d6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -867,7 +867,6 @@ struct skl_pipe_wm {
 	bool use_sagv_wm;
 };
 
-#ifdef I915
 enum vlv_wm_level {
 	VLV_WM_LEVEL_PM2,
 	VLV_WM_LEVEL_PM5,
@@ -901,7 +900,6 @@ struct g4x_wm_state {
 	bool hpll_en;
 	bool fbc_en;
 };
-#endif
 
 struct intel_crtc_wm_state {
 	union {
@@ -945,7 +943,7 @@ struct intel_crtc_wm_state {
 			/* pre-icl: for planar Y */
 			struct skl_ddb_entry plane_ddb_y[I915_MAX_PLANES];
 		} skl;
-#ifdef I915
+
 		struct {
 			struct g4x_pipe_wm raw[NUM_VLV_WM_LEVELS]; /* not inverted */
 			struct vlv_wm_state intermediate; /* inverted */
@@ -958,7 +956,6 @@ struct intel_crtc_wm_state {
 			struct g4x_wm_state intermediate;
 			struct g4x_wm_state optimal;
 		} g4x;
-#endif
 	};
 
 	/*
@@ -1411,7 +1408,6 @@ struct intel_crtc {
 	bool pch_fifo_underrun_disabled;
 
 	/* per-pipe watermark state */
-#ifdef I915
 	struct {
 		/* watermarks currently being used  */
 		union {
@@ -1420,7 +1416,6 @@ struct intel_crtc {
 			struct g4x_wm_state g4x;
 		} active;
 	} wm;
-#endif
 
 	struct {
 		struct mutex mutex;
-- 
2.39.2

