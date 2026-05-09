Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4366CD37BC
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B0A10E3E2;
	Sat,  9 May 2026 16:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKm/Buhz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6410E3DA;
 Sat,  9 May 2026 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778344916; x=1809880916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EjtY4WJBCG4t4bdB3Rl52R+HDdYYMWgAOFl4frXcMZc=;
 b=XKm/BuhzCgP0h/2rPOt5PeglXYyO/t4hRL4bgG+72pIRYtp3OHODJ9H1
 Par/EKWqCPjW77anYZLPrEA95TkX+3dk2Y2XArvzVwO5aUk0xFtAO2Tuz
 bADfcSxBtbH8dLEuIIFO5qPduvhP5S6u5jA7xiRLW3Y9NhwRgu/fk3bPS
 /XzpkR5Jg8NumMwYtXN4P7VbpjWKNqRCtKJ64aEwkUvcHHxvjdZYcTvv0
 J1yhgwW+V9uDSmXboSMSY6xa8EWVeKYWZ5FWeiP4FYvQwN7K+JPQtoRe/
 mMWFjD+ZBI0wW/Qm4/ZG66KbozLu/jeyU1l74k66HcZFuhjHafVwB21FO w==;
X-CSE-ConnectionGUID: WYOT1D6JQ1+k04somA72Gw==
X-CSE-MsgGUID: vCOCwmDJRAOcwZeUkNz1iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90763615"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="90763615"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2026 09:41:56 -0700
X-CSE-ConnectionGUID: Cv4fiznHS8KnHVRGrm5SOw==
X-CSE-MsgGUID: C6WnfMQwSIKrj4azpeMlwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="236212257"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 09 May 2026 09:41:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, nemesa.garg@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 6/9] drm/i915/scaler: remove id in favor of scaler_id
Date: Sat,  9 May 2026 18:40:45 +0200
Message-ID: <20260509164048.627399-7-michal.grzelak@intel.com>
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

id is not really used anywhere in skl_scaler_get_config(). Replace it
with scaler_id.

Return if no scaler was found.

v1->v2
- check if any scaler was found (Ville)

Cc: Nemesa Garg <nemesa.garg@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index d15e0194ca10..6d9080ec74ce 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -951,7 +951,6 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
 	int scaler_id;
-	int id = -1;
 
 	/* find scaler attached to this pipe */
 	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
@@ -961,8 +960,6 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
 			continue;
 
-		id = scaler_id;
-
 		if (scaler_has_casf(display, scaler_id))
 			intel_casf_sharpness_get_config(crtc_state);
 
@@ -981,8 +978,11 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 		break;
 	}
 
-	scaler_state->scaler_id = id;
-	if (id >= 0)
+	if (scaler_id == crtc->num_scalers)
+		return;
+
+	scaler_state->scaler_id = scaler_id;
+	if (scaler_id >= 0)
 		scaler_state->scaler_users |= (1 << SKL_CRTC_INDEX);
 	else
 		scaler_state->scaler_users &= ~(1 << SKL_CRTC_INDEX);
-- 
2.45.2

