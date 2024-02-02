Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D5BC4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B8810F13B;
	Fri,  2 Feb 2024 22:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/+2CKxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C0310F140
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914303; x=1738450303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bpRbIYuhJSeuIvjU9W7xNq2cchY+BEcDFDxIUXt4XWk=;
 b=Q/+2CKxxH4Qv6AS516kT5JVOaAT7jcM2/G3qTfj/tuRyEc5+TpV7RF54
 nNO3A9j4N0gZSnQdxBKCvsPTxTXc54W6QecrvxNJ9FmySihdoojaj6lf4
 I3s4nDq1fWNs0iSE9NVFNqbXa7fhWEn7R9J9mvCYSPf/9ljZbN8e9mgVf
 PTcv86ClEZtfOxoVsuDdNq9CZmFmrLoXbuKfkADas+ziiUDA5OQzLjtTh
 zdLvn0FrOQAe8EcGjFZ/p//2Vw7wKsUzuSJVdR3wFJM15Fs2rGIqL4Hbm
 HQacdOxkRH0BUbnuHKZvpLPkRbfKFwbKlx/Hpf9BSr7KPQdWk1dzmaIFx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153812"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153812"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332071"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332071"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:34 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 14/16] drm/i915: Tweak BIOS fb reuse check
Date: Sat,  3 Feb 2024 00:43:38 +0200
Message-ID: <20240202224340.30647-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently we assume that we bind the BIOS fb exactly into the same
ggtt address where the BIOS left it. That is about to change, and
in order to keep intel_reuse_initial_plane_obj() working as intended
we need to compare the original ggtt offset (called 'base' here)
as opposed to the actual vma ggtt offset we selected. Otherwise
the first plane could change the ggtt offset, and then subsequent
planes would no longer notice that they are in fact using the same
ggtt offset that the first plane was already using. Thus the reuse
check will fail and we proceed to turn off these subsequent planes.

TODO: would probably make more sense to do the pure readout first
for all the planes, then check for fb reuse, and only then proceed
to pin the object into the final location in the ggtt...

v2: "fix" xe

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_plane_initial.c    | 32 +++++++++++--------
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 31 ++++++++++--------
 2 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index b7e12b60d68b..8203c6dd6f73 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -13,20 +13,21 @@
 #include "intel_plane_initial.h"
 
 static bool
-intel_reuse_initial_plane_obj(struct drm_i915_private *i915,
-			      const struct intel_initial_plane_config *plane_config,
+intel_reuse_initial_plane_obj(struct intel_crtc *this,
+			      const struct intel_initial_plane_config plane_configs[],
 			      struct drm_framebuffer **fb,
 			      struct i915_vma **vma)
 {
+	struct drm_i915_private *i915 = to_i915(this->base.dev);
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&i915->drm, crtc) {
-		struct intel_crtc_state *crtc_state =
-			to_intel_crtc_state(crtc->base.state);
 		struct intel_plane *plane =
 			to_intel_plane(crtc->base.primary);
-		struct intel_plane_state *plane_state =
+		const struct intel_plane_state *plane_state =
 			to_intel_plane_state(plane->base.state);
+		const struct intel_crtc_state *crtc_state =
+			to_intel_crtc_state(crtc->base.state);
 
 		if (!crtc_state->uapi.active)
 			continue;
@@ -34,7 +35,7 @@ intel_reuse_initial_plane_obj(struct drm_i915_private *i915,
 		if (!plane_state->ggtt_vma)
 			continue;
 
-		if (intel_plane_ggtt_offset(plane_state) == plane_config->base) {
+		if (plane_configs[this->pipe].base == plane_configs[crtc->pipe].base) {
 			*fb = plane_state->hw.fb;
 			*vma = plane_state->ggtt_vma;
 			return true;
@@ -265,10 +266,11 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 
 static void
 intel_find_initial_plane_obj(struct intel_crtc *crtc,
-			     struct intel_initial_plane_config *plane_config)
+			     struct intel_initial_plane_config plane_configs[])
 {
-	struct drm_device *dev = crtc->base.dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct intel_initial_plane_config *plane_config =
+		&plane_configs[crtc->pipe];
 	struct intel_plane *plane =
 		to_intel_plane(crtc->base.primary);
 	struct intel_plane_state *plane_state =
@@ -294,7 +296,7 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	 * Failed to alloc the obj, check to see if we should share
 	 * an fb with another CRTC instead
 	 */
-	if (intel_reuse_initial_plane_obj(dev_priv, plane_config, &fb, &vma))
+	if (intel_reuse_initial_plane_obj(crtc, plane_configs, &fb, &vma))
 		goto valid_fb;
 
 	/*
@@ -359,10 +361,12 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 
 void intel_initial_plane_config(struct drm_i915_private *i915)
 {
+	struct intel_initial_plane_config plane_configs[I915_MAX_PIPES] = {};
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&i915->drm, crtc) {
-		struct intel_initial_plane_config plane_config = {};
+		struct intel_initial_plane_config *plane_config =
+			&plane_configs[crtc->pipe];
 
 		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
 			continue;
@@ -374,14 +378,14 @@ void intel_initial_plane_config(struct drm_i915_private *i915)
 		 * can even allow for smooth boot transitions if the BIOS
 		 * fb is large enough for the active pipe configuration.
 		 */
-		i915->display.funcs.display->get_initial_plane_config(crtc, &plane_config);
+		i915->display.funcs.display->get_initial_plane_config(crtc, plane_config);
 
 		/*
 		 * If the fb is shared between multiple heads, we'll
 		 * just get the first one.
 		 */
-		intel_find_initial_plane_obj(crtc, &plane_config);
+		intel_find_initial_plane_obj(crtc, plane_configs);
 
-		plane_config_fini(&plane_config);
+		plane_config_fini(plane_config);
 	}
 }
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 0aaf4eb2cdc5..01787181a1ac 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -18,19 +18,20 @@
 #include "intel_plane_initial.h"
 
 static bool
-intel_reuse_initial_plane_obj(struct drm_i915_private *i915,
-			      const struct intel_initial_plane_config *plane_config,
+intel_reuse_initial_plane_obj(struct intel_crtc *this,
+			      const struct intel_initial_plane_config plane_configs[],
 			      struct drm_framebuffer **fb)
 {
+	struct drm_i915_private *i915 = to_i915(this->base.dev);
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&i915->drm, crtc) {
-		struct intel_crtc_state *crtc_state =
-			to_intel_crtc_state(crtc->base.state);
 		struct intel_plane *plane =
 			to_intel_plane(crtc->base.primary);
-		struct intel_plane_state *plane_state =
+		const struct intel_plane_state *plane_state =
 			to_intel_plane_state(plane->base.state);
+		const struct intel_crtc_state *crtc_state =
+			to_intel_crtc_state(crtc->base.state);
 
 		if (!crtc_state->uapi.active)
 			continue;
@@ -38,7 +39,7 @@ intel_reuse_initial_plane_obj(struct drm_i915_private *i915,
 		if (!plane_state->ggtt_vma)
 			continue;
 
-		if (intel_plane_ggtt_offset(plane_state) == plane_config->base) {
+		if (plane_configs[this->pipe].base == plane_configs[crtc->pipe].base) {
 			*fb = plane_state->hw.fb;
 			return true;
 		}
@@ -178,10 +179,10 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 
 static void
 intel_find_initial_plane_obj(struct intel_crtc *crtc,
-			     struct intel_initial_plane_config *plane_config)
+			     struct intel_initial_plane_config plane_configs[])
 {
-	struct drm_device *dev = crtc->base.dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_initial_plane_config *plane_config =
+		&plane_configs[crtc->pipe];
 	struct intel_plane *plane =
 		to_intel_plane(crtc->base.primary);
 	struct intel_plane_state *plane_state =
@@ -201,7 +202,7 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 
 	if (intel_alloc_initial_plane_obj(crtc, plane_config))
 		fb = &plane_config->fb->base;
-	else if (!intel_reuse_initial_plane_obj(dev_priv, plane_config, &fb))
+	else if (!intel_reuse_initial_plane_obj(crtc, plane_configs, &fb))
 		goto nofb;
 
 	plane_state->uapi.rotation = plane_config->rotation;
@@ -269,10 +270,12 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 
 void intel_initial_plane_config(struct drm_i915_private *i915)
 {
+	struct intel_initial_plane_config plane_configs[I915_MAX_PIPES] = {};
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&i915->drm, crtc) {
-		struct intel_initial_plane_config plane_config = {};
+		struct intel_initial_plane_config *plane_config =
+			&plane_configs[crtc->pipe];
 
 		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
 			continue;
@@ -284,14 +287,14 @@ void intel_initial_plane_config(struct drm_i915_private *i915)
 		 * can even allow for smooth boot transitions if the BIOS
 		 * fb is large enough for the active pipe configuration.
 		 */
-		i915->display.funcs.display->get_initial_plane_config(crtc, &plane_config);
+		i915->display.funcs.display->get_initial_plane_config(crtc, plane_config);
 
 		/*
 		 * If the fb is shared between multiple heads, we'll
 		 * just get the first one.
 		 */
-		intel_find_initial_plane_obj(crtc, &plane_config);
+		intel_find_initial_plane_obj(crtc, plane_configs);
 
-		plane_config_fini(&plane_config);
+		plane_config_fini(plane_config);
 	}
 }
-- 
2.43.0

