Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431EDCD37B6
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DF810E3D8;
	Sat,  9 May 2026 16:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDqWhJtM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C485A10E3D8;
 Sat,  9 May 2026 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778344910; x=1809880910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7wFIL0nOXtG/G1b7uYdKRHa/ua4mnC51FBzHLYr9mPs=;
 b=QDqWhJtMLr4hX+qGpPDJpXn7k2RXuNuQ1BtM0xjVPfGxehPhRf889YTj
 nfteEiPgKDvsXNXjal4ksogVZc0QkOSXHR0HFUP7zf+kPUjh5nKmb/wyq
 5rk4UaTUjQ8O0v45qQ7bRnp5Pf5ppkDNrMwjixoZVLVhyYIzUqGWNDr8d
 HvKif/Qk5P4w2NZfAOdG0kGSJ4OTdH8NPGjhBJjFD/HU1xc23lkJCE4sc
 eowReyPsooCaAp6nKEs0wjqCQtUyANhqYvDJr/jOUaxrqIsZVCWxSOyZ3
 oHfJaZ4AYdsrvIdG/13Ywh3o1JZ3ZMsnBLWNjooND0RZ0XJZNEWM5DbRL Q==;
X-CSE-ConnectionGUID: DxJvQ7sFTtK65ESdKOq59Q==
X-CSE-MsgGUID: N7GGfFCJRlKke9QOkwLzkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90763608"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="90763608"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2026 09:41:50 -0700
X-CSE-ConnectionGUID: XgBq/T0aRs60UCo+cCOKQQ==
X-CSE-MsgGUID: bV7aGoMZSnKZ5oZzXpuFzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="236212232"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 09 May 2026 09:41:48 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, nemesa.garg@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 2/9] drm/i915/casf: rename *_coef*() into *_coeff*()
Date: Sat,  9 May 2026 18:40:41 +0200
Message-ID: <20260509164048.627399-3-michal.grzelak@intel.com>
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

Stick to the notion of already used *_coeff*() instead of *_coef*().
Rename that way convert_sharpness_coef_binary() and
intel_casf_scaler_compute_coef().

v1->v2
- rename intel_casf_scaler_compute_coef()

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 9a306aee2199..c4fabffa369e 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -88,7 +88,7 @@ static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
 		crtc_state->pch_pfit.casf.win_size = SHARPNESS_FILTER_SIZE_7X7;
 }
 
-static void intel_casf_scaler_compute_coef(struct intel_crtc_state *crtc_state);
+static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state);
 
 int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 {
@@ -118,7 +118,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 
 	intel_casf_compute_win_size(crtc_state);
 
-	intel_casf_scaler_compute_coef(crtc_state);
+	intel_casf_scaler_compute_coeff(crtc_state);
 
 	return 0;
 }
@@ -196,7 +196,7 @@ static void intel_casf_write_coeff(const struct intel_crtc_state *crtc_state)
 	}
 }
 
-static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
+static void convert_sharpness_coeff_binary(struct scaler_filter_coeff *coeff,
 					  u16 coefficient)
 {
 	if (coefficient < 25) {
@@ -214,7 +214,7 @@ static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
 	}
 }
 
-static void intel_casf_scaler_compute_coef(struct intel_crtc_state *crtc_state)
+static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
 {
 	const u16 *filtercoeff;
 	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
@@ -233,7 +233,7 @@ static void intel_casf_scaler_compute_coef(struct intel_crtc_state *crtc_state)
 
 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
 		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
-		convert_sharpness_coef_binary(&crtc_state->pch_pfit.casf.coeff[i],
+		convert_sharpness_coeff_binary(&crtc_state->pch_pfit.casf.coeff[i],
 					      filter_coeff[i]);
 	}
 }
-- 
2.45.2

