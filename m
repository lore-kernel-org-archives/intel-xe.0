Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F3EC44525
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F70D10E866;
	Mon, 20 Jul 2026 09:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDBm/PDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5802110E841;
 Mon, 20 Jul 2026 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538727; x=1816074727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xvy+QrzKjigdGp0HANntOCQ3nmI5Ue37iMryhVZTF7I=;
 b=KDBm/PDGDRNCwGxWy4wktY3nQTSqe5eyGXLF+KfViy8LScjmmUKmUsc5
 z4G4sNXxt3t0fJ2O6vuraOKhIlwvqe4nBN1qM9rQE9rzXUEaBLP7mArvg
 gVLpsHG5MaQFG87ehXtI6r6NRNbMuWxd2HBolnCZ0LQQZuXHUCcWCtmWJ
 S8jAw/H/ouYnKopdterQQ+ca2f9RZMrBYGMSz9nsCnvBGFRg6wbi8oHT8
 l4jGQaDD1/4iunkztFrKJD9xfj/ej8Wn5DUT6j1TjX3bZt9b/lMYRzrqN
 N2owxqbCiSojj8XYTZqEiuhxYWM9EMssSlSpIi82Qy12KXjpBMy0XIjk7 g==;
X-CSE-ConnectionGUID: rCy1QDohRuSk+vtTg07Idw==
X-CSE-MsgGUID: E0CcGD9pQFak9LA3/xuV1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102664785"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102664785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:12:07 -0700
X-CSE-ConnectionGUID: +cAIGfPiRU+ScOkY4O02Tg==
X-CSE-MsgGUID: yZOa3xLtR5ivmwDVkkndGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260963426"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2026 02:12:06 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v4 4/9] drm/i915/vrr: Update AS_SDP target_rr_divider based on
 CMRR config request
Date: Mon, 20 Jul 2026 14:31:36 +0530
Message-ID: <20260720090142.2864289-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b2464a3dac05..ec5ec22f5173 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3073,6 +3073,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	/*
 	 * #FIXME: SDP/infoframe updates aren’t truly atomic, and with the new
@@ -3093,7 +3094,11 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
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

