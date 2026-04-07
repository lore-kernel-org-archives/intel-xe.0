Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CC9FF5130
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 17:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533810E123;
	Tue,  7 Apr 2026 17:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOwG9uJh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9623310E3F7;
 Tue,  7 Apr 2026 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775584388; x=1807120388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UV/w1kEqyupiu4V67R/x8qWRaNwj/RGXra4GO2rRZPI=;
 b=bOwG9uJhrizkDz/wE76FF3pFuXdBPEruVyKPsUuxAl9Hie6V3/t9RXC4
 Gmi8N3+6ZhPvwIi87Wgjp2cPpF7aSSpj9v/coBzisf34DRkz2BQ7U73PV
 RWWTTTmVDRlScjhZHBkLpcgFgx7wvMvX7uQJfdOyF0J7hlI9p8xHOpaGk
 aIoOofnWAm+CuPovzy0pSJrhpb5gWRtqEX9cMiMiCCRiPukyoBSea2lXP
 1SMkx32t+lrigVPTGT7K/QWd3BhoCJqr+dCPJR2vlRtxvea34FTfsguYK
 bfyoO9oZ81+bvbH9rwipQjn4nCg91OU5LTsknh2ff9z2aPP/Odf9zdUGE w==;
X-CSE-ConnectionGUID: k4vS/PsHR0e7laHIqQdSTA==
X-CSE-MsgGUID: iiIiCAfsQlmIE031gc52Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="64101755"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="64101755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:53:07 -0700
X-CSE-ConnectionGUID: nI4RFPaxQtuRqWROAhFAJw==
X-CSE-MsgGUID: HOf0m/XgRIutpxJMrP1c6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="258661159"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:53:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v2 4/9] drm/i915/casf: Extract scaler_has_casf()
Date: Tue,  7 Apr 2026 20:52:38 +0300
Message-ID: <20260407175244.19654-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407175244.19654-1-ville.syrjala@linux.intel.com>
References: <20260407175244.19654-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
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

