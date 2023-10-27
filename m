Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB9C25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E0310E951;
	Fri, 27 Oct 2023 08:00:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878210E950
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393625; x=1729929625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N8OxoK05R94LLR7WqGTWJX1JrL41j5cfxYnUYUhh8wc=;
 b=VpuOoUgiW+qmCMxgc9kZMQARPm2/zylsQhfB9urHIGaL14KGWLwVYUue
 +98NgfQ4ERAFKGNCXeU4tQWli0pKL4lEFWfaOsh4STowR0lq2f6ivwGGP
 GM62clYLksuK0oEj7xJ3gty2KYLMCN4tx370h9uycFLusLJARQxygvr+w
 2xIJOoSO1S+TUMNwa9e4jVeJMyE+Hd4R2F1YhoImPjpiQ1H88lQl4Xnd8
 VQXOSKoYDL4GSamMEQnU0ArN52C2OyniId4G2ohwoeYB2p2uJaiNl/GGI
 S1+5Mr7k/N0rrzD+XWal5AbhIo7p0sWcKKMP26tGaEAVn2J77AX4UfCbm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603887"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510412"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510412"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:23 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:14 +0300
Message-Id: <20231027075918.2206862-28-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 27/31] drm/i915/display: Move enable_dp_mst under
 display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231024124109.384973-24-jouni.hogander@intel.com
(cherry picked from commit 8d3265a76fcf9f5c5064ecef563ec672d60902d4)
---
 drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
 drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c             | 6 +++---
 drivers/gpu/drm/i915/i915_params.c                  | 3 ---
 drivers/gpu/drm/i915/i915_params.h                  | 1 -
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index f82f5bed69bc..11e03cfb774d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -93,6 +93,9 @@ intel_display_param_named(verbose_state_checks, bool, 0400,
 intel_display_param_named_unsafe(nuclear_pageflip, bool, 0400,
 	"Force enable atomic functionality on platforms that don't have full support yet.");
 
+intel_display_param_named_unsafe(enable_dp_mst, bool, 0400,
+	"Enable multi-stream transport (MST) for new DisplayPort sinks. (default: true)");
+
 intel_display_param_named_unsafe(enable_fbc, int, 0400,
 	"Enable frame buffer compression for power savings "
 	"(default: -1 (use per-chip default))");
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 40aed14d18be..6206cc51df04 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -41,6 +41,7 @@ struct drm_i915_private;
 	param(bool, disable_display, false, 0400) \
 	param(bool, verbose_state_checks, true, 0400) \
 	param(bool, nuclear_pageflip, false, 0400) \
+	param(bool, enable_dp_mst, true, 0600) \
 	param(int, enable_fbc, -1, 0600) \
 	param(int, enable_psr, -1, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f0f43aeabd21..cba2e57d10fa 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3749,7 +3749,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
-	return i915->params.enable_dp_mst &&
+	return i915->display.params.enable_dp_mst &&
 		intel_dp_mst_source_support(intel_dp) &&
 		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
 }
@@ -3767,13 +3767,13 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
 		    encoder->base.base.id, encoder->base.name,
 		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
 		    str_yes_no(sink_can_mst),
-		    str_yes_no(i915->params.enable_dp_mst));
+		    str_yes_no(i915->display.params.enable_dp_mst));
 
 	if (!intel_dp_mst_source_support(intel_dp))
 		return;
 
 	intel_dp->is_mst = sink_can_mst &&
-		i915->params.enable_dp_mst;
+		i915->display.params.enable_dp_mst;
 
 	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
 					intel_dp->is_mst);
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 18424873442d..de43048543e8 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -114,9 +114,6 @@ i915_param_named_unsafe(dmc_firmware_path, charp, 0400,
 i915_param_named_unsafe(gsc_firmware_path, charp, 0400,
 	"GSC firmware path to use instead of the default one");
 
-i915_param_named_unsafe(enable_dp_mst, bool, 0400,
-	"Enable multi-stream transport (MST) for new DisplayPort sinks. (default: true)");
-
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 i915_param_named_unsafe(inject_probe_failure, uint, 0400,
 	"Force an error after a number of failure check points (0:disabled (default), N:force failure at the Nth failure check point)");
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index c7fff571db2c..1315d7fac850 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -64,7 +64,6 @@ struct drm_printer;
 	/* leave bools at the end to not create holes */ \
 	param(bool, enable_hangcheck, true, 0600) \
 	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
-	param(bool, enable_dp_mst, true, 0600) \
 	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
 
 #define MEMBER(T, member, ...) T member;
-- 
2.34.1

