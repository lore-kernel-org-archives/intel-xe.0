Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5D1CD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 14:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BA010F4FD;
	Fri,  8 May 2026 14:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYv96c5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B122110F4FF;
 Fri,  8 May 2026 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778250894; x=1809786894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b0CJKA98qJll8JqQMKlMcjYljGkMIiNqrNYBgW1IWzc=;
 b=aYv96c5z5N8aGsEC7vq8Bnf1q9uM+nuceU/hNO6e5T3C1czocc/H/Xrf
 kjjQkPUO6ENnfTtuKxm8n3st7lg7+l+1tqiYyinuq8R0/1VqiE7utAPwA
 BEFW9kP2JeqMugZkdVAW/qiexyzakZiChHy9SYaKkmnJr6GmJbYWi+5hZ
 PfE8yRDVE6cAh1r8KYsRDWRxQcMZPIUnQAQLxSLZu3bQVDHH79YR91Q2V
 BRAoYY0X26pSQVq4Wkme66DywuBR6tbq7SpBkgtAN5mw6BVP2dp5cM4M2
 m5D0Tt0oLkvC8WSzC9m9iCt1zhdZ2C6fnKNHk7YUIci1X8UHeG56fcxAe w==;
X-CSE-ConnectionGUID: s26nrvtSTtSEsZ5HShVTCQ==
X-CSE-MsgGUID: 24YkusJhT1q6pbRBLMnI3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89808863"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="89808863"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:34:53 -0700
X-CSE-ConnectionGUID: C1GeXMqLTImuTY2VPq/ShA==
X-CSE-MsgGUID: pQy0cPnhQhm5xaVcMpb+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="237024124"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:34:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 05/16] drm/i915: Introduce i915_fb_pin_dpt_(un)pin()
Date: Fri,  8 May 2026 17:34:15 +0300
Message-ID: <20260508143426.26504-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
References: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
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

Extract the inner DPT parts of intel_plane_(un)pin() into the
i915_fb_pin_dpt_(un)pin(). These will become part of the new
fb_pin parent interface.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_fb_pin.c | 76 ++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index bc2e185b4573..0019f570d843 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -257,6 +257,49 @@ intel_plane_fb_vtd_guard(const struct intel_plane_state *plane_state)
 				       plane_state->hw.rotation);
 }
 
+static int i915_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dpt *dpt,
+			       const struct intel_fb_pin_params *pin_params,
+			       struct i915_vma **out_dpt_vma,
+			       struct i915_vma **out_ggtt_vma,
+			       u32 *out_offset)
+{
+	struct i915_vma *ggtt_vma, *dpt_vma;
+
+	WARN_ON(!dpt);
+
+	ggtt_vma = i915_dpt_pin_to_ggtt(dpt, pin_params->alignment / 512);
+	if (IS_ERR(ggtt_vma))
+		return PTR_ERR(ggtt_vma);
+
+	dpt_vma = intel_fb_pin_to_dpt(obj, dpt, pin_params);
+	if (IS_ERR(dpt_vma)) {
+		i915_dpt_unpin_from_ggtt(dpt);
+		return PTR_ERR(dpt_vma);
+	}
+
+	drm_WARN_ON(obj->dev, ggtt_vma == dpt_vma);
+
+	*out_ggtt_vma = ggtt_vma;
+	*out_dpt_vma = dpt_vma;
+
+	*out_offset = i915_ggtt_offset(ggtt_vma);
+
+	return 0;
+}
+
+static void i915_fb_pin_dpt_unpin(struct intel_dpt *dpt,
+				  struct i915_vma *dpt_vma,
+				  struct i915_vma *ggtt_vma)
+{
+	WARN_ON(!dpt);
+	WARN_ON(!!dpt_vma != !!ggtt_vma);
+
+	if (dpt_vma)
+		intel_fb_unpin_vma(dpt_vma, -1);
+	if (ggtt_vma)
+		i915_dpt_unpin_from_ggtt(dpt);
+}
+
 int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 		       const struct intel_plane_state *old_plane_state)
 {
@@ -268,6 +311,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 	struct i915_vma *dpt_vma = NULL;
 	int fence_id = -1;
 	u32 offset;
+	int ret;
 
 	if (!intel_fb_uses_dpt(&fb->base)) {
 		struct intel_fb_pin_params pin_params = {
@@ -306,19 +350,11 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 			.needs_cpu_lmem_access = intel_fb_needs_cpu_access(&fb->base),
 		};
 
-		ggtt_vma = i915_dpt_pin_to_ggtt(fb->dpt, pin_params.alignment / 512);
-		if (IS_ERR(ggtt_vma))
-			return PTR_ERR(ggtt_vma);
-
-		dpt_vma = intel_fb_pin_to_dpt(intel_fb_bo(&fb->base), fb->dpt, &pin_params);
-		if (IS_ERR(dpt_vma)) {
-			i915_dpt_unpin_from_ggtt(fb->dpt);
-			return PTR_ERR(dpt_vma);
-		}
-
-		WARN_ON(ggtt_vma == dpt_vma);
-
-		offset = i915_ggtt_offset(ggtt_vma);
+		ret = i915_fb_pin_dpt_pin(intel_fb_bo(&fb->base), fb->dpt,
+					  &pin_params, &dpt_vma,
+					  &ggtt_vma, &offset);
+		if (ret)
+			return ret;
 	}
 
 	plane_state->dpt_vma = dpt_vma;
@@ -333,22 +369,22 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 {
 	const struct intel_framebuffer *fb =
 		to_intel_framebuffer(old_plane_state->hw.fb);
-	struct i915_vma *vma;
 
 	if (!intel_fb_uses_dpt(&fb->base)) {
+		struct i915_vma *vma;
+
 		vma = fetch_and_zero(&old_plane_state->ggtt_vma);
 		if (vma) {
 			intel_fb_unpin_vma(vma, old_plane_state->fence_id);
 			old_plane_state->fence_id = -1;
 		}
 	} else {
-		vma = fetch_and_zero(&old_plane_state->dpt_vma);
-		if (vma)
-			intel_fb_unpin_vma(vma, -1);
+		i915_fb_pin_dpt_unpin(fb->dpt,
+				      old_plane_state->dpt_vma,
+				      old_plane_state->ggtt_vma);
 
-		vma = fetch_and_zero(&old_plane_state->ggtt_vma);
-		if (vma)
-			i915_dpt_unpin_from_ggtt(fb->dpt);
+		old_plane_state->dpt_vma = NULL;
+		old_plane_state->ggtt_vma = NULL;
 	}
 }
 
-- 
2.52.0

