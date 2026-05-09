Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9878CD37BD
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632DF10E3E3;
	Sat,  9 May 2026 16:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJmZKVXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C0610E3DA;
 Sat,  9 May 2026 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778344914; x=1809880914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMgoa2gPALwXMcwIvOtiRgBBohUQHwNUdjtWtT6WdpI=;
 b=iJmZKVXj1ns1D8K1FDwxeUQkaq6G+Asp3CEuaLMcWiA4XWtYG8UvDXhy
 G+HpC4bvD9fiwLe/lkg2c6029JC002FjGomryTSMdoMw1zPMDyF4W1JYY
 Al+0V7OsZJRTMRRfGYN5oyclUy8g1EGmdfm7MER8js0VwjD4NB0T59ehE
 jy5icczkXJmiFkqYXKQ0cqZlKune0AwGvzfSxHfb7ptoHaUh5HsfqpW9W
 VHfktNpI/f4qqjfBgMzrCmyXzgbjoi5mCZxgQsbWEA6vpUFTRInrp1kYs
 YgXHb2i1tI7tcmFPZupurAuKKOxYnNXimlUD0nw4Vl/A3T+BdYCxSLHd6 A==;
X-CSE-ConnectionGUID: Hqbk31tLTradJ1ABd+VyLQ==
X-CSE-MsgGUID: c15xmcyJTIOuJedqUbMaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90763613"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="90763613"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2026 09:41:54 -0700
X-CSE-ConnectionGUID: Nwb5B2OJTdSjjpOaCy6sbw==
X-CSE-MsgGUID: tohq9ZXlQiSae51yBecxvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="236212249"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 09 May 2026 09:41:53 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, nemesa.garg@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 5/9] drm/i915/scaler: s/i/scaler_id/ where appropriate
Date: Sat,  9 May 2026 18:40:44 +0200
Message-ID: <20260509164048.627399-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260509164048.627399-1-michal.grzelak@intel.com>
References: <20260509164048.627399-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Switch from generic iterator naming into more specific scaler_id where
it is possible.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index eceda1a909cc..d15e0194ca10 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -950,26 +950,26 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
+	int scaler_id;
 	int id = -1;
-	int i;
 
 	/* find scaler attached to this pipe */
-	for (i = 0; i < crtc->num_scalers; i++) {
+	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
 		u32 ctl, pos, size;
 
-		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, i));
+		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, scaler_id));
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
 			continue;
 
-		id = i;
+		id = scaler_id;
 
-		if (scaler_has_casf(display, i))
+		if (scaler_has_casf(display, scaler_id))
 			intel_casf_sharpness_get_config(crtc_state);
 
 		crtc_state->pch_pfit.enabled = true;
 
-		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
-		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
+		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, scaler_id));
+		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, scaler_id));
 
 		drm_rect_init(&crtc_state->pch_pfit.dst,
 			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
@@ -977,7 +977,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
 			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
 
-		scaler_state->scalers[i].in_use = true;
+		scaler_state->scalers[scaler_id].in_use = true;
 		break;
 	}
 
-- 
2.45.2

