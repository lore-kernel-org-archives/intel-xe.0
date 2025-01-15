Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3D3C02185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 15:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F1A10E787;
	Wed, 15 Jan 2025 15:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZQ0V1FX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E8E10E738
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736954572; x=1768490572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nihD+WgmgQqrBHx1J26UZNpRpsaMhOyRdWuSmfm//YE=;
 b=CZQ0V1FXbYmHpt4tWVUttomTqJnRHDQmcX+J18htrzGN9Axn2QwVS77o
 xPIHxXUKUXj3dKWT430N0i/Q2aVoyEwG/wdQ5a5XY5dmZc/Wil1PGyiga
 AJ4VNo8/D2Bfz0J9LQ/jPD2o2iP208sIv2cfaKttVPmOB7C77zz8jn9fA
 Ra1AfIcQ8hRtFcJdN7uMBOb41wUmsBYY5Sowj7r01zWQyf18CngBvZh/y
 FOXS/mhoi6orBUhH5S0Z4qm9hYiNMjs5hgQu7E+je90+HDKBp0Xi3JIfV
 oA5vdBb7G4hFkoPcybu4LGJ3MS9A6111acZ/D1mjEyzEGdrfwsEbLB7y3 Q==;
X-CSE-ConnectionGUID: mt7utHV+QeaxH/lQDOCs2A==
X-CSE-MsgGUID: r18N5GLFTAGGTslpl8AnSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40106966"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="40106966"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:22:52 -0800
X-CSE-ConnectionGUID: zf+91IIRSHSbxrRpYLcnfQ==
X-CSE-MsgGUID: V7K0/9AdSImFXxVoF+2FmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="110147945"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa004.jf.intel.com with ESMTP; 15 Jan 2025 07:22:51 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 7/7] drm/i915/dsc: Check if vblank is sufficient for dsc
 prefill
Date: Wed, 15 Jan 2025 20:49:30 +0530
Message-ID: <20250115151930.3665295-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115151930.3665295-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250115151930.3665295-1-mitulkumar.ajitkumar.golani@intel.com>
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
dsc prefill latency.

Bspec: 70151

--v2:
- Consider chroma downscaling factor in latency calculation. [Ankit]
- Replace with appropriate function name.

--v3:
- Remove FIXME tag.[Ankit]
- Replace Ycbcr444 to Ycbcr420.[Anit]
- Correct precision. [Ankit]
- Use some local valiables like linetime_factor and latency to
adjust precision.
- Declare latency to 0 initially to avoid returning any garbage values.
- Account for second scaler downscaling factor as well. [Ankit]

--v4:
- Improvise hscale and vscale calculation. [Ankit]
- Use appropriate name for number of scaler users. [Ankit]
- Update commit message and rebase.
- Add linetime and cdclk prefill adjustment calculation. [Ankit]

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 35 +++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index ca9d5677c356..13666adb8e36 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2307,6 +2307,39 @@ cdclk_prefill_adjustment(const struct intel_crtc_state *crtc_state)
 				   2 * cdclk_state->logical.cdclk));
 }
 
+static int
+dsc_prefill_latency(const struct intel_crtc_state *crtc_state)
+{
+	const struct intel_crtc_scaler_state *scaler_state =
+						&crtc_state->scaler_state;
+	int latency = 0;
+	int num_scaler_users = hweight32(scaler_state->scaler_users);
+	int chroma_downscaling_factor =
+		crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ? 2 : 1;
+	long long hscale_k[2] = {0, 0};
+	long long vscale_k[2] = {0, 0};
+
+	if (!crtc_state->dsc.compression_enable || !num_scaler_users)
+		return latency;
+
+	for (int i = 0; i < num_scaler_users; i++) {
+		hscale_k[i] =
+			max(1000, mul_u32_u32(scaler_state->scalers[i].hscale, 1000) >> 16);
+		vscale_k[i] =
+			max(1000, mul_u32_u32(scaler_state->scalers[i].vscale, 1000) >> 16);
+	}
+
+	latency  = DIV_ROUND_UP_ULL(hscale_k[0] * vscale_k[0], 1000000);
+
+	if (num_scaler_users > 1)
+		latency *= DIV_ROUND_UP_ULL(hscale_k[1] * vscale_k[1], 1000000);
+
+	latency *= DIV_ROUND_UP(15 * crtc_state->linetime, 10) * chroma_downscaling_factor *
+		   cdclk_prefill_adjustment(crtc_state);
+
+	return latency;
+}
+
 static int
 scaler_prefill_latency(const struct intel_crtc_state *crtc_state)
 {
@@ -2347,10 +2380,10 @@ skl_is_vblank_too_short(const struct intel_crtc_state *crtc_state,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
-	/* FIXME missing scaler and DSC pre-fill time */
 	return crtc_state->framestart_delay +
 		intel_usecs_to_scanlines(adjusted_mode, latency) +
 		scaler_prefill_latency(crtc_state) +
+		dsc_prefill_latency(crtc_state) +
 		wm0_lines >
 		adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vblank_start;
 }
-- 
2.48.0

