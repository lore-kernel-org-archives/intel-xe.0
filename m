Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F183D10AB82B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 22:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40FF10EAAF;
	Thu, 26 Mar 2026 22:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVfBDrcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5EB10EAAF;
 Thu, 26 Mar 2026 22:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774564320; x=1806100320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5nuxdu67dENFumv1dL/XgtJP7rlVfti3Qld3bFfC9J4=;
 b=hVfBDrcEYtWKKQeeCSUP7GXEj5Cm1FfkCOnIo6UZm2aC3LW+NM3oYESb
 Ug1aiEQJCfgb1JE2XORSExzLJ+fb3kQUK2NssFmefkTcjJ7byYv+cWQ5X
 3mv+BKvvM5uGB8LF+yzD3NXVV0ruD5xGFiagackMI8mUFp8DQca6ekGqc
 0C2A4Jg4nf9W29FHKVQeXzFYeTzgvJn9oFE6YQGlNnRuiyet3eGSzOgxk
 vWS06G7W/bgPy0UVlBgB+k4y8BHZHDEOaggNGZOvJjVLB55szB4vGtDAE
 MTxebuHiPcKFmfMufiNTv2xRG191hHXKGDeVTmCZT1Gp5DpcTkJ7oGR2i Q==;
X-CSE-ConnectionGUID: bmXp+E/vR2OK7AA5hTDCWQ==
X-CSE-MsgGUID: KpmuApIRTN6loVwALgpMAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78233062"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78233062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:32:00 -0700
X-CSE-ConnectionGUID: RvTcTwftSmK0EejF89rElw==
X-CSE-MsgGUID: xFv9KOgTTjanlMNO+6GzWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="226769481"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:31:58 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 4/9] drm/i915/casf: Extract scaler_has_casf()
Date: Fri, 27 Mar 2026 00:31:34 +0200
Message-ID: <20260326223139.19116-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
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

Extract a small helper to determine if the scaler supports
the sharpness filter or not.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index e9fe5c0bf6ff..525afd736195 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -323,19 +323,24 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 				 need_scaler);
 }
 
+static bool scaler_has_casf(struct intel_display *display, int scaler_id)
+{
+	return HAS_CASF(display) && scaler_id == 1;
+}
+
 static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 				 struct intel_crtc *crtc,
 				 struct intel_plane_state *plane_state,
 				 bool casf_scaler)
 {
+	struct intel_display *display = to_intel_display(crtc);
 	int i;
 
 	for (i = 0; i < crtc->num_scalers; i++) {
 		if (scaler_state->scalers[i].in_use)
 			continue;
 
-		/* CASF needs second scaler */
-		if (!plane_state && casf_scaler && i != 1)
+		if (casf_scaler && !scaler_has_casf(display, i))
 			continue;
 
 		scaler_state->scalers[i].in_use = true;
@@ -982,8 +987,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 		id = i;
 
-		/* Read CASF regs for second scaler */
-		if (HAS_CASF(display) && id == 1)
+		if (scaler_has_casf(display, i))
 			intel_casf_sharpness_get_config(crtc_state);
 
 		if (!crtc_state->pch_pfit.casf.enable)
-- 
2.52.0

