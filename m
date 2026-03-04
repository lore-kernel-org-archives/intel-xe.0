Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C083FEF8FE2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C8D10EA01;
	Wed,  4 Mar 2026 13:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iiqf3xWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E7610EA01;
 Wed,  4 Mar 2026 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630085; x=1804166085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LgLfIgj6kFyATIVeMCRrW4eJKXgj8K+FoFly3Kk5LQE=;
 b=Iiqf3xWvKA8kztIZr+8vWBIiYoHnCyrinhGwCJRayLel8rWCY3V+70ga
 BbwA9YlaTdbeU1pZQvDu5Hl2MrwHGLXdhOry9ENAet0pDg1NsmGBeUC11
 sIYB/EaVQMbrnBaQz5B0OU+jnEEjH3ByQsJZYzulqe4gp8VuXv84T04kg
 +qey+FpeF3HMljE3bBgQvOuoysAUWoz5HN911iDz2FSuuCU0PreMl2Vu1
 bBRJuPB7elqJG1HwTUGPMWJSaE88A4pLJrF7opNsDV+MtxCCgjoSXDh7D
 Zz9dFIXM6EkfZMWduvu3vRID9Qv2EsvLoOo/GJUQoSMaUIbknH6eG6ukb Q==;
X-CSE-ConnectionGUID: 0uqdCPkQRbyANfUSqcYK+Q==
X-CSE-MsgGUID: Jj/ySrbfTs6FhZaefoJ8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293477"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293477"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:45 -0800
X-CSE-ConnectionGUID: 4gPlUGsaTEmMBKhXgYDZ3A==
X-CSE-MsgGUID: dWoBX6M7RjKx6WjiyY+KDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350828"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:44 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 16/24] drm/i915/lt_phy: Replace crtc compute clock
Date: Wed,  4 Mar 2026 13:14:15 +0000
Message-ID: <20260304131423.1017821-17-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
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

The existing DPLL compute clock callback for the XE3PLPD platform
(`xe3plpd_crtc_compute_clock`) was specific to that platform. Replace it
with the more generic Haswell (`hsw_crtc_compute_clock`) implementation
so that the compute clock path does not rely on the XE3PLPD
hook.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index abc85ee9b832..c7d37e74fbe9 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1212,24 +1212,6 @@ static int dg2_crtc_compute_clock(struct intel_atomic_state *state,
 	return 0;
 }
 
-static int xe3plpd_crtc_compute_clock(struct intel_atomic_state *state,
-				      struct intel_crtc *crtc)
-{
-	struct intel_crtc_state *crtc_state =
-		intel_atomic_get_new_crtc_state(state, crtc);
-	struct intel_encoder *encoder =
-		intel_get_crtc_new_encoder(state, crtc_state);
-	int ret;
-
-	ret = intel_lt_phy_pll_calc_state(crtc_state, encoder, &crtc_state->dpll_hw_state);
-	if (ret)
-		return ret;
-
-	crtc_state->hw.adjusted_mode.crtc_clock = intel_crtc_dotclock(crtc_state);
-
-	return 0;
-}
-
 static int ilk_fb_cb_factor(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -1690,7 +1672,7 @@ static int i8xx_crtc_compute_clock(struct intel_atomic_state *state,
 }
 
 static const struct intel_dpll_global_funcs xe3plpd_dpll_funcs = {
-	.crtc_compute_clock = xe3plpd_crtc_compute_clock,
+	.crtc_compute_clock = hsw_crtc_compute_clock,
 	.crtc_get_dpll = hsw_crtc_get_dpll,
 };
 
-- 
2.43.0

