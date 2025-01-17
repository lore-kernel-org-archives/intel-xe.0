Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A420C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 07:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BE510EA82;
	Fri, 17 Jan 2025 07:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqEIhU1G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE2310EA81
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737100061; x=1768636061;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3Nxakm7tIHIt8qjf6Ssycd8dx3NMvW9TJ20XC3Q+lOw=;
 b=VqEIhU1G/8cedamBprW76Ml2/UJMpxeU9KGKp0UO2cvrzO4CXG9UuP1D
 IK1vcsrlSQpHqpsmDSx1oCvgFc1tDLb8SkA49Hn1k0kaDN9BQpjh0O1ea
 yBBtWNrnHPWHka2IZdIbCFCliEgfc58V5j05NMZYLggPAZhRGLnrmV7Mf
 6yK1q39GYkzUYOSPFu2u+ljyiJ1yaRQgV+BndukUk8t9K45OqKErPLfrk
 wPGnZ68CIipZC3SyJoriNpe5zVW8fk0rIjYqpzrTEwPglQkj4eZMdmdOQ
 R5No9u3IeVzTDXI3QPdUn6I2U9LZVeac2aqugSo3uMnvMCY/ImjFd/RCD Q==;
X-CSE-ConnectionGUID: tMALaza9TKCxXzQW8+dqgg==
X-CSE-MsgGUID: vykL2TTsS1iwCUUGMhEX5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37760755"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37760755"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:47:41 -0800
X-CSE-ConnectionGUID: d+v3QyoBQOCX4qioiXaDsA==
X-CSE-MsgGUID: M3TnvHtJSA+qIMS2+KCJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105687949"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 23:47:40 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 6/7] drm/i915/scaler: Check if vblank is sufficient for
 scaler
Date: Fri, 17 Jan 2025 13:14:20 +0530
Message-ID: <20250117074422.3965519-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
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

High refresh rate panels which may have small line times
and vblank sizes, Check if vblank size is sufficient for
enabled scaler users.

--v2:
- Use hweight* family of functions for counting bits. [Jani]
- Update precision handling for hscale and vscale. [Ankit]
- Consider chroma downscaling factor during latency
calculation. [Ankit]
- Replace function name from scaler_prefill_time to
scaler_prefill_latency.

--v3:
- hscale_k and vscale_k values are already left shifted
by 16, after multiplying by 1000, those need to be right
shifted to 16. [Ankit]
- Replace YCBCR444 to YCBCR420. [Ankit]
- Divide by 1000 * 1000 in end to get correct precision. [Ankit]
- Initialise latency to 0 to avoid any garbage.

--v4:
- Elaborate commit message and add Bspec number. [Ankit]
- Improvise latency calculation. [Ankit]
- Use ceiling value for down scaling factor when less than 1
as per bspec. [Ankit]
- Correct linetime calculation. [Ankit]
- Consider cdclk prefill adjustment while prefill
computation.[Ankit]

--v5:
- Add Bspec link in commit message trailer. [Ankit]
- Correct hscale, vscale data type.
- Use intel_crtc_compute_min_cdclk. [Ankit]

--v6:
- Update FIXME comment.
- Use cdclk_state->logical.cdclk instead of
intel_crtc_compute_min_cdclk. [Ankit]

Bspec: 70151
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 50 +++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index f4458d1185b3..c8e540dd66cc 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2292,6 +2292,53 @@ static int icl_build_plane_wm(struct intel_crtc_state *crtc_state,
 	return 0;
 }
 
+static int
+cdclk_prefill_adjustment(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_atomic_state *state =
+		to_intel_atomic_state(crtc_state->uapi.state);
+	const struct intel_cdclk_state *cdclk_state;
+
+	cdclk_state = intel_atomic_get_cdclk_state(state);
+	if (IS_ERR(cdclk_state))
+		return PTR_ERR(cdclk_state);
+
+	return min(1, DIV_ROUND_UP(crtc_state->pixel_rate,
+				   2 * cdclk_state->logical.cdclk));
+}
+
+static int
+scaler_prefill_latency(const struct intel_crtc_state *crtc_state)
+{
+	const struct intel_crtc_scaler_state *scaler_state =
+					&crtc_state->scaler_state;
+	int num_scaler_users = hweight32(scaler_state->scaler_users);
+	int latency = 0;
+	int linetime =
+		intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
+					 DIV_ROUND_UP(1000 * crtc_state->hw.adjusted_mode.htotal,
+						      crtc_state->pixel_rate));
+	u64 hscale_k, vscale_k;
+
+	if (!num_scaler_users)
+		return latency;
+
+	latency = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode, 4 * linetime);
+
+	if (num_scaler_users > 1) {
+		int chroma_downscaling_factor =
+			crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ? 2 : 1;
+		hscale_k = max(1000, mul_u32_u32(scaler_state->scalers[0].hscale, 1000) >> 16);
+		vscale_k = max(1000, mul_u32_u32(scaler_state->scalers[0].vscale, 1000) >> 16);
+
+		latency += chroma_downscaling_factor *
+			   DIV_ROUND_UP_ULL((4 * linetime * hscale_k * vscale_k),
+					    1000000);
+	}
+
+	return latency * cdclk_prefill_adjustment(crtc_state);
+}
+
 static bool
 skl_is_vblank_too_short(const struct intel_crtc_state *crtc_state,
 			int wm0_lines, int latency)
@@ -2299,9 +2346,10 @@ skl_is_vblank_too_short(const struct intel_crtc_state *crtc_state,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
-	/* FIXME missing scaler and DSC pre-fill time */
+	/* FIXME missing DSC pre-fill time */
 	return crtc_state->framestart_delay +
 		intel_usecs_to_scanlines(adjusted_mode, latency) +
+		scaler_prefill_latency(crtc_state) +
 		wm0_lines >
 		adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vblank_start;
 }
-- 
2.48.1

