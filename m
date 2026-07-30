Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CE8C55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED52010EEDD;
	Thu, 30 Jul 2026 11:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJmd/1be";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2449710EECA;
 Thu, 30 Jul 2026 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409778; x=1816945778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AVrr404QUAI2/fEETfiidb12sV5aiEvmQQ7ldYLFZNI=;
 b=iJmd/1bewguCabut8R5o4UZbI1Yk9FD8Pn9fMzcZSuiil4Hw4RtZVWPB
 t0gTypwhMWQMBr1cCcFT2btnxa4PNLEa+Jh+gF8g7B31V0vDiHKFTe46g
 SGnhMaWM5WC+MTZgn0yl4EPKgPHCz/f+rl9PdtKmZvU9WRBQOyikWuqfZ
 IqsOUdCAl1toayZhtgw7xu5GDC4P3xr23Vm44PMaws36JCamLxuU/kkVU
 BFC/s1bKIwY5yq9OuCKWdHDTDZesoxTgSsRg6fHLfHFvrLkgfQk3lJ0nk
 EUio+MGsGASBufGNidQ8QwHkuHOKKNFYRNyMikPOVh4CvFyuhmpAnhWHH g==;
X-CSE-ConnectionGUID: MP9ZrjQITMWWDgSqEb4gyQ==
X-CSE-MsgGUID: vft4pipZTz+Q7nkJ/F17VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217232"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86217232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:38 -0700
X-CSE-ConnectionGUID: 4QxNGqXITj6pvcIVYl3xdw==
X-CSE-MsgGUID: ZyTtpFMXTBiSPlLUTowsnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298482270"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 04:09:37 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v8 04/10] drm/i915/vrr: Update AS_SDP target_rr_divider based
 on CMRR config request
Date: Thu, 30 Jul 2026 16:29:11 +0530
Message-ID: <20260730105919.3913412-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Compute AS_SDP target_rr_divider based on actual CMRR request
requirement.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 113d767e62e9..9e2db310b7d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3125,6 +3125,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	/*
 	 * #FIXME: SDP/infoframe updates aren’t truly atomic, and with the new
@@ -3145,7 +3146,11 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	if (crtc_state->cmrr.enable) {
 		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
 		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
-		as_sdp->target_rr_divider = true;
+
+		if (crtc->force_cmrr.denominator == 1001)
+			as_sdp->target_rr_divider = true;
+		else
+			as_sdp->target_rr_divider = false;
 	} else if (crtc_state->vrr.enable) {
 		as_sdp->mode = DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
 	} else {
-- 
2.48.1

