Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE15FE99049
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 07:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E8210E8C7;
	Fri, 10 Apr 2026 07:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8rI9lTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39C710E8C7;
 Fri, 10 Apr 2026 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775806513; x=1807342513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d0SfA/K6hFEA+8X9hT4SQ2UToVtrE354xEFSj80On4A=;
 b=Q8rI9lTmEEyM43mkMQNrFUjfku3y3SAFSmbMCgchkYOzfcfsaxySzz+O
 dGIjWlmGH76pEXOezveP+GO3rOk6qgY6dH3YZGBWIyazAkHWQ3SjsmrBQ
 jRO2Q9kBNIdFrZ73MMydkRzpVQPpn8kCkc63nSVd1iue+5TjQ7VtFv3iL
 mU9AuC7nSFdsdjHIFpFBr+AsQ1QAu63g8A5/raDeog6I+A74n6Z9oZ2ZF
 749ARn6ZD8vOFnZnJu1uW3s2U0tIoSYAo5CFV5ztuc5SkhHoiwcgaHvag
 MFJZ0qyOa5tEPRsS/f7oXiNEXpB9SFTKRiDbpjQ3ZpxgvhA4jH92MT0Dz g==;
X-CSE-ConnectionGUID: AF83wKIMTmqI9VwR4Ahw5A==
X-CSE-MsgGUID: 6MB/jBrKQNqW3/QoADM+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80709887"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="80709887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 00:35:13 -0700
X-CSE-ConnectionGUID: pnX6+77UQkyHgeUUrloWbA==
X-CSE-MsgGUID: U8a9HbZPRQm0imP9Ym2w1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="225854259"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 00:35:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/4] drm/i915/reset: Reorganize display reset code
Date: Fri, 10 Apr 2026 10:34:57 +0300
Message-ID: <20260410073500.32308-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410073500.32308-1-ville.syrjala@linux.intel.com>
References: <20260410073500.32308-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop returning the "is there a display?" status from
intel_display_reset_prepare(). I plan to move the pending_fb_pin
into the i915 code, so I need to make that determination already
before intel_display_reset_prepare() is called. Add a new
intel_display_reset_supported() function for that.

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_reset.c    | 23 ++++++++-----------
 .../drm/i915/display/intel_display_reset.h    |  3 ++-
 drivers/gpu/drm/i915/gt/intel_reset.c         | 13 +++++++----
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index d00ef5bdcbda..137a2a33c8b0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -16,22 +16,24 @@
 #include "intel_hotplug.h"
 #include "intel_pps.h"
 
+bool intel_display_reset_supported(struct intel_display *display)
+{
+	return HAS_DISPLAY(display);
+}
+
 bool intel_display_reset_test(struct intel_display *display)
 {
-	return display->params.force_reset_modeset_test;
+	return HAS_DISPLAY(display) &&
+		display->params.force_reset_modeset_test;
 }
 
-/* returns true if intel_display_reset_finish() needs to be called */
-bool intel_display_reset_prepare(struct intel_display *display,
+void intel_display_reset_prepare(struct intel_display *display,
 				 modeset_stuck_fn modeset_stuck, void *context)
 {
 	struct drm_modeset_acquire_ctx *ctx = &display->restore.reset_ctx;
 	struct drm_atomic_state *state;
 	int ret;
 
-	if (!HAS_DISPLAY(display))
-		return false;
-
 	if (atomic_read(&display->restore.pending_fb_pin)) {
 		drm_dbg_kms(display->drm,
 			    "Modeset potentially stuck, unbreaking through wedging\n");
@@ -60,7 +62,7 @@ bool intel_display_reset_prepare(struct intel_display *display,
 		ret = PTR_ERR(state);
 		drm_err(display->drm, "Duplicating state failed with %i\n",
 			ret);
-		return true;
+		return;
 	}
 
 	ret = drm_atomic_helper_disable_all(display->drm, ctx);
@@ -68,13 +70,11 @@ bool intel_display_reset_prepare(struct intel_display *display,
 		drm_err(display->drm, "Suspending crtc's failed with %i\n",
 			ret);
 		drm_atomic_state_put(state);
-		return true;
+		return;
 	}
 
 	display->restore.modeset_state = state;
 	state->acquire_ctx = ctx;
-
-	return true;
 }
 
 void intel_display_reset_finish(struct intel_display *display, bool test_only)
@@ -83,9 +83,6 @@ void intel_display_reset_finish(struct intel_display *display, bool test_only)
 	struct drm_atomic_state *state;
 	int ret;
 
-	if (!HAS_DISPLAY(display))
-		return;
-
 	state = fetch_and_zero(&display->restore.modeset_state);
 	if (!state)
 		goto unlock;
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.h b/drivers/gpu/drm/i915/display/intel_display_reset.h
index 8b3bda134454..e0f15e757728 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.h
@@ -12,8 +12,9 @@ struct intel_display;
 
 typedef void modeset_stuck_fn(void *context);
 
+bool intel_display_reset_supported(struct intel_display *display);
 bool intel_display_reset_test(struct intel_display *display);
-bool intel_display_reset_prepare(struct intel_display *display,
+void intel_display_reset_prepare(struct intel_display *display,
 				 modeset_stuck_fn modeset_stuck, void *context);
 void intel_display_reset_finish(struct intel_display *display, bool test_only);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 37272871b0f2..ffd11767874f 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1425,16 +1425,19 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 		bool need_display_reset;
 		bool reset_display;
 
-		need_display_reset = intel_gt_gpu_reset_clobbers_display(gt) &&
+		need_display_reset =
+			intel_display_reset_supported(display) &&
+			intel_gt_gpu_reset_clobbers_display(gt) &&
 			intel_has_gpu_reset(gt);
 
-		reset_display = intel_display_reset_test(display) ||
+		reset_display =
+			intel_display_reset_test(display) ||
 			need_display_reset;
 
 		if (reset_display)
-			reset_display = intel_display_reset_prepare(display,
-								    display_reset_modeset_stuck,
-								    gt);
+			intel_display_reset_prepare(display,
+						    display_reset_modeset_stuck,
+						    gt);
 
 		intel_gt_reset(gt, engine_mask, reason);
 
-- 
2.52.0

