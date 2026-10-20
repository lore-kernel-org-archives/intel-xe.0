Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F4D606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZPeYz+X0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA9410E182;
	Tue, 20 Oct 2026 18:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8049110E182;
 Tue, 20 Oct 2026 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792521528; x=1824057528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wQM+jf7kZ87TYpKnYj11dIEi4PBwOLEmg7DS0i48b5A=;
 b=ZPeYz+X0zhKyzHrl5jZhB812ieuXsEFE91HuqD+wTdWUx4Ks5w37+5Qr
 TQk/MsOkvY0XCh2WFdyLZ9/omrxt+QF/fWBdptKYn4aeyvNaE2qQHwvYM
 tAd2+8fHg9w/KHdY5kS92cFpIUK4v57juonzKcbCLMHm72YhJzmTtEJXe
 N87J5+v4KSsHptnKNAzqudDcVISGaBi/vcVeR58mmtj8hoYa5+bu2PVdW
 zraOtuKMNHKD3ygBZQGnsEL4xpVu7ts2qzVypwgSpbvHDsK56XYvV/049
 4lG+vP38uEsOn0Djya4aod2QmxTKK29NEL11+zAu2WsW/0/zy9mbGbq2O w==;
X-CSE-ConnectionGUID: 6zuWIN4/SJ6F3Vph90kWWA==
X-CSE-MsgGUID: GPp0xOGQQ9+zD2+xHOEDbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1138381"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1138381"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 11:38:47 -0700
X-CSE-ConnectionGUID: 34ep+/7VQ1yMHXRLxxXJzA==
X-CSE-MsgGUID: /D48C4SYRxGpRq3naTxxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3286758"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 11:38:46 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 06/15] drm/i915/pfit: Extract i965_pfit_get_config()
Date: Tue, 20 Oct 2026 21:38:42 +0300
Message-ID: <20261020183842.5218-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-7-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-7-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Split i965_pfit_get_config() out from i9xx_pfit_get_config() to
unconfuse things a bit.

Note that we stop reading PFIT_PGM_RATIOS into
crtc_state->gmch_pfit.pgm_ratios since wen ever use the
progammed ratios on i965+. The .compute_config() path doesn't
populate crtc_state->gmch_pfit.pgm_ratios either.

v2: Highlight the crtc_state->gmch_pfit.pgm_ratios change (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 58 +++++++++++++++--------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 972218346362..82804159d0a1 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -720,38 +720,51 @@ void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 	intel_de_write(display, PFIT_CONTROL(display), 0);
 }
 
-static bool i9xx_has_pfit(struct intel_display *display)
+static void i965_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	enum pipe pipe;
+	u32 tmp;
+
+	tmp = intel_de_read(display, PFIT_CONTROL(display));
+	if (!(tmp & PFIT_ENABLE))
+		return;
+
+	/* Check whether the pfit is attached to our pipe. */
+	pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
+	if (pipe != crtc->pipe)
+		return;
+
+	crtc_state->gmch_pfit.control = tmp;
+}
+
+static bool i9xx_has_pfit(struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+
+	if (crtc->pipe != PIPE_B)
+		return false;
+
 	if (display->platform.i830)
 		return false;
 
-	return DISPLAY_VER(display) >= 4 ||
-		display->platform.pineview || display->platform.mobile;
+	return display->platform.pineview || display->platform.mobile;
 }
 
 static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	enum pipe pipe;
 	u32 tmp;
 
-	if (!i9xx_has_pfit(display))
+	if (!i9xx_has_pfit(crtc))
 		return;
 
 	tmp = intel_de_read(display, PFIT_CONTROL(display));
 	if (!(tmp & PFIT_ENABLE))
 		return;
 
-	/* Check whether the pfit is attached to our pipe. */
-	if (DISPLAY_VER(display) >= 4)
-		pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
-	else
-		pipe = PIPE_B;
-
-	if (pipe != crtc->pipe)
-		return;
-
 	crtc_state->gmch_pfit.control = tmp;
 	crtc_state->gmch_pfit.pgm_ratios =
 		intel_de_read(display, PFIT_PGM_RATIOS(display));
@@ -761,10 +774,15 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
-	if (HAS_GMCH(display))
-		i9xx_pfit_get_config(crtc_state);
-	else if (DISPLAY_VER(display) >= 9)
-		skl_scaler_get_config(crtc_state);
-	else
-		ilk_pfit_get_config(crtc_state);
+	if (HAS_GMCH(display)) {
+		if (DISPLAY_VER(display) >= 4)
+			i965_pfit_get_config(crtc_state);
+		else
+			i9xx_pfit_get_config(crtc_state);
+	} else {
+		if (DISPLAY_VER(display) >= 9)
+			skl_scaler_get_config(crtc_state);
+		else
+			ilk_pfit_get_config(crtc_state);
+	}
 }
-- 
2.55.0

