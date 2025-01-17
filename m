Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58717C02185
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 07:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E6C10EA84;
	Fri, 17 Jan 2025 07:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mq8Yx7TS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DF010EA82
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737100062; x=1768636062;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yv6DxmYLw9n3xOSrm/j9NPP0CbXFRPly+J/nYEt3yNc=;
 b=Mq8Yx7TSAYjy9TUnjTH1bjMyF9idsrdLQ64OcGzgIm/uERQoR9m+amgB
 EZvfcHd4FQnByIM2SjVnaHx4OTFow97mtsnBSvR2wuz4uqJ392HR1n7uD
 DkveUsDBOqmWHrzTSEbfKlPLJTr2ZTDnGb2HaJFHUzCJ+1a0Md1SqlXMH
 vdsJxZUTyPo9K7Kflc92Hq22CK4HLMVJIqcBP8Dwbw+qwFU4heVZPA50S
 55oMOtjxxdAFjQDNreaXWkfIsttxVCiHIVkTuMfLAjyUeadeuWqMDTnjr
 wVlfNEVkAiUmO4bkNvRh+yMvClx4Y2xzOedmF7WjOJt9jFc98Yb7Qdn0H g==;
X-CSE-ConnectionGUID: nLitaKF+S6yusbv+nYdOEg==
X-CSE-MsgGUID: cSfUxbFVRY+fK/xdZJTkBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37760757"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37760757"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:47:42 -0800
X-CSE-ConnectionGUID: ZAvx5Xk+SNareE/7x/lXSA==
X-CSE-MsgGUID: pz8fwjeGSICbjoFyh+DBJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105687952"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 23:47:41 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 7/7] drm/i915/dsc: Check if vblank is sufficient for dsc
 prefill
Date: Fri, 17 Jan 2025 13:14:21 +0530
Message-ID: <20250117074422.3965519-8-mitulkumar.ajitkumar.golani@intel.com>
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
dsc prefill latency.

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

--v5:
- Update bspec link in trailer. [Ankit]
- Correct hscale, vscale datatype. [Ankit]
- Use intel_crtc_compute_min_cdclk. [Ankit]

--v6:
- Use cdclk_state->logical.cdclk instead of
intel_crtc_compute_min_cdclk. [Ankit]

Bspec: 70151
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 34 +++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index c8e540dd66cc..aacda7f7174c 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2307,6 +2307,38 @@ cdclk_prefill_adjustment(const struct intel_crtc_state *crtc_state)
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
+	u64 hscale_k[2] = {0, 0};
+	u64 vscale_k[2] = {0, 0};
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
+	latency *= DIV_ROUND_UP(15 * crtc_state->linetime, 10) * chroma_downscaling_factor;
+
+	return latency * cdclk_prefill_adjustment(crtc_state);
+}
+
 static int
 scaler_prefill_latency(const struct intel_crtc_state *crtc_state)
 {
@@ -2346,10 +2378,10 @@ skl_is_vblank_too_short(const struct intel_crtc_state *crtc_state,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
-	/* FIXME missing DSC pre-fill time */
 	return crtc_state->framestart_delay +
 		intel_usecs_to_scanlines(adjusted_mode, latency) +
 		scaler_prefill_latency(crtc_state) +
+		dsc_prefill_latency(crtc_state) +
 		wm0_lines >
 		adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vblank_start;
 }
-- 
2.48.1

