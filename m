Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F44C25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 07:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D5B10E958;
	Fri, 27 Oct 2023 07:59:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558D210E955
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393587; x=1729929587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mGXq3AkH8eBAbCAy2QUVN6w/7jb7BN6981UJu+YazfI=;
 b=H0iQbKvMI1mnIafVfNnlgETlMWVP0m7A7oNwN3fNzARQRDmlpbeJWzcE
 gdM8fcjVtwVMl6moTgQQAiJ0bNyhxBY+LdDEcVsnHIlHPzHboaSvtNhYw
 svH5Vzx1V0JTeTHKnDhr/RH7jpi+fcn9FV9JA1Mopie7LEbqXHUw1V3rL
 9x/V8HfOT262bmEU8Sv+yCPzHfUbzXKeu9h0soQqgVIBCEgBBfxA4HIuF
 wTg1mWvadUCBKSWhwp3RWFNouJyLOoNmV8s0NAC8n1iLi1ewrIZBqx0zO
 E95/1eLI5nibJwsOtcdCqykpCYUMPiNDOFGYtOA5OZGQKQQydNiSeH22M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603733"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603733"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510158"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510158"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:45 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:58:54 +0300
Message-Id: <20231027075918.2206862-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/31] drm/i915/display: Move enable_fbc module
 parameter under display
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
Link: https://patchwork.freedesktop.org/patch/msgid/20231024124109.384973-4-jouni.hogander@intel.com
(cherry picked from commit 6f4f8aef7e4220a3369b40a94f694ecc014adf13)
---
 drivers/gpu/drm/i915/display/i9xx_wm.c              |  2 +-
 drivers/gpu/drm/i915/display/intel_display_params.c |  4 ++++
 drivers/gpu/drm/i915/display/intel_display_params.h |  3 ++-
 drivers/gpu/drm/i915/display/intel_fbc.c            | 10 +++++-----
 drivers/gpu/drm/i915/i915_params.c                  |  4 ----
 drivers/gpu/drm/i915/i915_params.h                  |  1 -
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index af0c79a4c9a4..b37c0d02d500 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -2993,7 +2993,7 @@ static void ilk_wm_merge(struct drm_i915_private *dev_priv,
 
 	/* ILK: LP2+ must be disabled when FBC WM is disabled but FBC enabled */
 	if (DISPLAY_VER(dev_priv) == 5 && HAS_FBC(dev_priv) &&
-	    dev_priv->params.enable_fbc && !merged->fbc_wm_enabled) {
+	    dev_priv->display.params.enable_fbc && !merged->fbc_wm_enabled) {
 		for (level = 2; level < num_levels; level++) {
 			struct intel_wm_level *wm = &merged->wm[level];
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 11ee73a98b5b..330613cd64db 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -27,6 +27,10 @@ static struct intel_display_params intel_display_modparams __read_mostly = {
  * debugfs mode to 0.
  */
 
+intel_display_param_named_unsafe(enable_fbc, int, 0400,
+	"Enable frame buffer compression for power savings "
+	"(default: -1 (use per-chip default))");
+
 __maybe_unused
 static void _param_print_bool(struct drm_printer *p, const char *driver_name,
 			      const char *name, bool val)
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index eac66042da4d..198b03da8055 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -21,7 +21,8 @@ struct drm_i915_private;
  * mode: debugfs file permissions, one of {0400, 0600, 0}, use 0 to not create
  *       debugfs file
  */
-#define INTEL_DISPLAY_PARAMS_FOR_EACH(param) /* empty define to avoid build failure */
+#define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
+	param(int, enable_fbc, -1, 0600) \
 
 #define MEMBER(T, member, ...) T member;
 struct intel_display_params {
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index cd316e0caaa4..1152bd4cb8f8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1071,7 +1071,7 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 		return 0;
 	}
 
-	if (!i915->params.enable_fbc) {
+	if (!i915->display.params.enable_fbc) {
 		plane_state->no_fbc_reason = "disabled per module param or by default";
 		return 0;
 	}
@@ -1647,8 +1647,8 @@ void intel_fbc_handle_fifo_underrun_irq(struct drm_i915_private *i915)
  */
 static int intel_sanitize_fbc_option(struct drm_i915_private *i915)
 {
-	if (i915->params.enable_fbc >= 0)
-		return !!i915->params.enable_fbc;
+	if (i915->display.params.enable_fbc >= 0)
+		return !!i915->display.params.enable_fbc;
 
 	if (!HAS_FBC(i915))
 		return 0;
@@ -1720,9 +1720,9 @@ void intel_fbc_init(struct drm_i915_private *i915)
 	if (need_fbc_vtd_wa(i915))
 		DISPLAY_RUNTIME_INFO(i915)->fbc_mask = 0;
 
-	i915->params.enable_fbc = intel_sanitize_fbc_option(i915);
+	i915->display.params.enable_fbc = intel_sanitize_fbc_option(i915);
 	drm_dbg_kms(&i915->drm, "Sanitized enable_fbc value: %d\n",
-		    i915->params.enable_fbc);
+		    i915->display.params.enable_fbc);
 
 	for_each_fbc_id(i915, fbc_id)
 		i915->display.fbc[fbc_id] = intel_fbc_create(i915, fbc_id);
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 036c4c3ed6ed..42700b854b79 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -72,10 +72,6 @@ i915_param_named_unsafe(enable_dc, int, 0400,
 	"(-1=auto [default]; 0=disable; 1=up to DC5; 2=up to DC6; "
 	"3=up to DC5 with DC3CO; 4=up to DC6 with DC3CO)");
 
-i915_param_named_unsafe(enable_fbc, int, 0400,
-	"Enable frame buffer compression for power savings "
-	"(default: -1 (use per-chip default))");
-
 i915_param_named_unsafe(lvds_channel_mode, int, 0400,
 	 "Specify LVDS channel mode "
 	 "(0=probe BIOS [default], 1=single-channel, 2=dual-channel)");
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index d5194b039aab..e674de29f92c 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -52,7 +52,6 @@ struct drm_printer;
 	param(int, panel_use_ssc, -1, 0600) \
 	param(int, vbt_sdvo_panel_type, -1, 0400) \
 	param(int, enable_dc, -1, 0400) \
-	param(int, enable_fbc, -1, 0600) \
 	param(int, enable_psr, -1, 0600) \
 	param(bool, enable_dpt, true, 0400) \
 	param(bool, psr_safest_params, false, 0400) \
-- 
2.34.1

