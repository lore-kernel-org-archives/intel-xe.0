Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E2ACEDD89
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 13:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6AC10E4AF;
	Tue, 18 Nov 2025 13:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKbZxJ8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B84110E4AF;
 Tue, 18 Nov 2025 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763473291; x=1795009291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MeO3kHiZUk+KWTMIivZ4yQ+3/o69UVTYfXz+gk/bpAU=;
 b=FKbZxJ8bBkI7a1zyVkXZANReC/OrjLajRqzG1bLAwYIjNwBhBsOQVJfU
 J4K164AWyYifW1aGCuOiGH4XDRRqtG07YAnxjoNth8pY1HQHLf888fffG
 jgYjtn2tdE6hlwTjuP5QR/zampU4CparnVhQjEqVveXOFOXGmymSz0KQK
 FCtyKcjR1+LdAz1sK7jf2Lx8kBh3q7zRRcYJmmONGFhbXzi6zmDluVRdm
 bLCZD7gABs7bsdy6o3dWrH6Xl0lbzf4OGtSSg4bCPOzRNLE2zreiaRN4I
 RCfVh3MyLjq29p5KtzKZXczIKv0kuLuPqtMCunB6CqGjbDBne6rFpaqLQ g==;
X-CSE-ConnectionGUID: 2MzGDCfvSLO0EmZv0h0U4Q==
X-CSE-MsgGUID: JZ7TPncATuitUKJSKWfZqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69346453"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69346453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 05:41:31 -0800
X-CSE-ConnectionGUID: 63g/eFtYRrepG8xsz0+d2A==
X-CSE-MsgGUID: fqtPPE7kTOSVvvDgsW3M6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221419462"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa002.jf.intel.com with ESMTP; 18 Nov 2025 05:41:29 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 21/32] drm/i915/cx0: Add MTL+ .update_active_dpll hook
Date: Tue, 18 Nov 2025 15:28:30 +0200
Message-Id: <20251118132830.2584422-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117104602.2363671-22-mika.kahola@intel.com>
References: <20251117104602.2363671-22-mika.kahola@intel.com>
MIME-Version: 1.0
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

Add .update_active_dpll function pointer to support
dpll framework. Reuse ICL function pointer.

v2: Add check for !HAS_LT_PHY (Suraj)
v3: Remove the incorrect !HAS_LT_PHY condition and
    check for existing dpll_mgr

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com> # v1
---
 drivers/gpu/drm/i915/display/intel_ddi.c      | 4 ++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 002ccd47856d..40ce117bb088 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3667,8 +3667,8 @@ void intel_ddi_update_active_dpll(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_crtc *pipe_crtc;
 
-	/* FIXME: Add MTL pll_mgr */
-	if (DISPLAY_VER(display) >= 14 || !intel_encoder_is_tc(encoder))
+	/* FIXME: Add NVL+ pll_mgr */
+	if (!intel_encoder_is_tc(encoder) || !display->dpll.mgr)
 		return;
 
 	for_each_intel_crtc_in_pipe_mask(display->drm, pipe_crtc,
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index c45f18201ee8..e6dd6f1123d6 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4449,6 +4449,7 @@ static const struct intel_dpll_mgr mtl_pll_mgr = {
 	.compute_dplls = mtl_compute_dplls,
 	.get_dplls = mtl_get_dplls,
 	.put_dplls = icl_put_dplls,
+	.update_active_dpll = icl_update_active_dpll,
 };
 
 /**
-- 
2.34.1

