Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57BCCD37B9
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D5B10E3E1;
	Sat,  9 May 2026 16:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9nRnyd3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D6910E3DA;
 Sat,  9 May 2026 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778344912; x=1809880912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GrP8S4SjQsCWQsMNhUzMo5NirR49JcKictkpuXLWNAQ=;
 b=N9nRnyd3pHlATASKItNw+EpO0O/WsO2WkTEYiqyfh5RPhRJybchktAqg
 dVXaccxIYgVVSsd1AepATtOq/2JE/woqOFqw6fioHu7/d/K0mSomBIriF
 fJZlGONt+/BW78SanoU83/Yrehq6D5neqAYS5Yo9Chw7TDRiCraVr1KaW
 ryP1bGsgPQvUfgz9F0Rk0YQTPWyWPJdgKR5mSaHtGaJh0uk/KZz+GmC8C
 14ZINqmFdpegxiry8+yuxxT611HezYhPR0yF4yzH3pVVUdC0TrhWBHxFL
 Kq1EbPZjd++VlLNS42wXViQbnspxLElnpRwL2+FEiLcCZ6T5xFPjj8lKQ g==;
X-CSE-ConnectionGUID: aKilHSJoTiS8zM4eAhRrmQ==
X-CSE-MsgGUID: CtHVpZB+TbCeOQqA4g2fLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90763610"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="90763610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2026 09:41:51 -0700
X-CSE-ConnectionGUID: ulQM3AjvR6+nU4a7bXZMhw==
X-CSE-MsgGUID: TGI2aoUnQsW2oJ6/7LMVWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="236212239"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 09 May 2026 09:41:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, nemesa.garg@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 3/9] drm/i915: rename t into tap
Date: Sat,  9 May 2026 18:40:42 +0200
Message-ID: <20260509164048.627399-4-michal.grzelak@intel.com>
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

Add more description to the casf_coeff()'s argument and
casf_coeff_tap()'s returned value.

Do the same for glk_nearest_filter_coef().

v1->v2
- apply the rename to nearest neighbor filter (Ville)

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 14 +++++++-------
 drivers/gpu/drm/i915/display/skl_scaler.c | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index c4fabffa369e..b9643548d182 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -148,12 +148,12 @@ static int casf_coeff_tap(int i)
 	return i % SCALER_FILTER_NUM_TAPS;
 }
 
-static u32 casf_coeff(const struct intel_crtc_state *crtc_state, int t)
+static u32 casf_coeff(const struct intel_crtc_state *crtc_state, int tap)
 {
 	struct scaler_filter_coeff value;
 	u32 coeff;
 
-	value = crtc_state->pch_pfit.casf.coeff[t];
+	value = crtc_state->pch_pfit.casf.coeff[tap];
 	value.sign = 0;
 
 	coeff = value.sign << 15 | value.exp << 12 | value.mantissa << 3;
@@ -183,13 +183,13 @@ static void intel_casf_write_coeff(const struct intel_crtc_state *crtc_state)
 
 	for (i = 0; i < 17 * SCALER_FILTER_NUM_TAPS; i += 2) {
 		u32 tmp;
-		int t;
+		int tap;
 
-		t = casf_coeff_tap(i);
-		tmp = casf_coeff(crtc_state, t);
+		tap = casf_coeff_tap(i);
+		tmp = casf_coeff(crtc_state, tap);
 
-		t = casf_coeff_tap(i + 1);
-		tmp |= casf_coeff(crtc_state, t) << 16;
+		tap = casf_coeff_tap(i + 1);
+		tmp |= casf_coeff(crtc_state, tap) << 16;
 
 		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
 				  tmp);
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 308b8d363bba..eceda1a909cc 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -661,9 +661,9 @@ static int glk_coef_tap(int i)
 	return i % 7;
 }
 
-static u16 glk_nearest_filter_coef(int t)
+static u16 glk_nearest_filter_coef(int tap)
 {
-	return t == 3 ? 0x0800 : 0x3000;
+	return tap == 3 ? 0x0800 : 0x3000;
 }
 
 /*
@@ -715,13 +715,13 @@ static void glk_program_nearest_filter_coefs(struct intel_display *display,
 
 	for (i = 0; i < 17 * 7; i += 2) {
 		u32 tmp;
-		int t;
+		int tap;
 
-		t = glk_coef_tap(i);
-		tmp = glk_nearest_filter_coef(t);
+		tap = glk_coef_tap(i);
+		tmp = glk_nearest_filter_coef(tap);
 
-		t = glk_coef_tap(i + 1);
-		tmp |= glk_nearest_filter_coef(t) << 16;
+		tap = glk_coef_tap(i + 1);
+		tmp |= glk_nearest_filter_coef(tap) << 16;
 
 		intel_de_write_dsb(display, dsb,
 				   GLK_PS_COEF_DATA_SET(pipe, id, set), tmp);
-- 
2.45.2

