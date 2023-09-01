Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74007CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 13:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABE910E7C0;
	Fri,  1 Sep 2023 13:02:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60F710E7C0
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693573323; x=1725109323;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=acbrfvgFxeEHNb3r8TtH3yGFJzi2EVvtls/pVHiReoQ=;
 b=n+lnr1BIt63mTn4VSowyS0eG01gkGFXB/XEA6Np4+oEt9212jCnKSgOz
 cn77OdYjaRKRm3QNEiMggoKGYaa/wtVjzItAvpz+B2if3nYQFb7VTAAdH
 uhgTMtlwiPp1kUFTuul9pOUajd3fRNuvNeqv+d0rvaAye3rlE024xtlIz
 HIlP9koCbn1AO+NEeD6x84f4MVpJAw0UMZkgtPLZ/jCEFDqkzzsNTTtUy
 1iwd+MnIjewp/712dQuhnevfEmLDW/l9uLKZ9XM+8faZb56giFWzAyEwn
 BfEmlQ6eNnIvMRkhL7bqVAdfdvj7ycXcNjUwnl3YKqXnrP38Vdv1K8I7T A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361239950"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361239950"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739924569"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="739924569"
Received: from jeroenke-mobl.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.252.59.110])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:02:00 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	ville.syrajala@intel.com
Date: Fri,  1 Sep 2023 16:01:44 +0300
Message-Id: <20230901130144.76152-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901130144.76152-1-vinod.govindapillai@intel.com>
References: <20230901130144.76152-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] drm/i915/lnl: possibility to enable FBC
 on first three planes
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

In LNL onwards, FBC can be associated to the first three planes.
FBC will be enabled on planes first come first served basis
until the userspace can select one of these FBC capable plane
explicitly. FBC can be supported in planes with per pixel alpha

v2:
 - avoid fbc->state.plane check in intel_fbc_check_plane (Ville)
 - simplify plane binding register writes (Matt)
 - Update the subject to reflect that fbc can be enabled only in
   the first three planes (Matt)

Bspec: 69560
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c           | 7 ++++++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 ++++-
 drivers/gpu/drm/i915/i915_reg.h                    | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 66c8aed07bbc..f1537bb63775 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -660,6 +660,10 @@ static u32 ivb_dpfc_ctl(struct intel_fbc *fbc)
 	if (IS_IVYBRIDGE(i915))
 		dpfc_ctl |= DPFC_CTL_PLANE_IVB(fbc_state->plane->i9xx_plane);
 
+	if (DISPLAY_VER(i915) >= 20)
+		dpfc_ctl |= REG_FIELD_PREP(DPFC_CTL_PLANE_BINDING_MASK,
+					   fbc_state->plane->id);
+
 	if (fbc_state->fence_id >= 0)
 		dpfc_ctl |= DPFC_CTL_FENCE_EN_IVB;
 
@@ -1206,7 +1210,8 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 		return 0;
 	}
 
-	if (plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE &&
+	if (DISPLAY_VER(i915) < 20 &&
+	    plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE &&
 	    fb->format->has_alpha) {
 		plane_state->no_fbc_reason = "per-pixel alpha not supported";
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4d01c7ae4485..1291351c9941 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1962,7 +1962,10 @@ static bool skl_plane_has_fbc(struct drm_i915_private *dev_priv,
 	if ((DISPLAY_RUNTIME_INFO(dev_priv)->fbc_mask & BIT(fbc_id)) == 0)
 		return false;
 
-	return plane_id == PLANE_PRIMARY;
+	if (DISPLAY_VER(dev_priv) >= 20)
+		return plane_id <= PLANE_SPRITE1;
+	else
+		return plane_id == PLANE_PRIMARY;
 }
 
 static struct intel_fbc *skl_plane_fbc(struct drm_i915_private *dev_priv,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index aefad14ab27a..aadcc630cb52 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1327,6 +1327,7 @@
 #define   DPFC_CTL_PLANE_IVB(i9xx_plane)	REG_FIELD_PREP(DPFC_CTL_PLANE_MASK_IVB, (i9xx_plane))
 #define   DPFC_CTL_FENCE_EN_IVB			REG_BIT(28) /* ivb+ */
 #define   DPFC_CTL_PERSISTENT_MODE		REG_BIT(25) /* g4x-snb */
+#define   DPFC_CTL_PLANE_BINDING_MASK		REG_GENMASK(12, 11) /* lnl */
 #define   DPFC_CTL_FALSE_COLOR			REG_BIT(10) /* ivb+ */
 #define   DPFC_CTL_SR_EN			REG_BIT(10) /* g4x only */
 #define   DPFC_CTL_SR_EXIT_DIS			REG_BIT(9) /* g4x only */
-- 
2.34.1

