Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF464C44537
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1DC10E71D;
	Tue, 21 Jul 2026 16:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioLWTTs9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BBA10E71D;
 Tue, 21 Jul 2026 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784650581; x=1816186581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KEXAu3WsVW4/BiuyOmrw7B/P8HAGk4nV9/EBz6iVIjA=;
 b=ioLWTTs997VlnGFE6rT9P2yCFBEDLCW7HX7IE5MrjI9WavpHHwJ+29Sx
 uFaCS8y2C4SiU++d0lKutabxr3caHt1p0y66gNH8J+cuMtKS4Htrln+4S
 6t8P4d3CRUgQDWuYxvAQHY9BiS/TbZ/7s5tG4zLiLnXULBIAmDPiFLvLN
 K7On88eqGw6PXE7E8YVXv4OhPxt/SDC0IgK2vn+bKOaEz2GQ+xuMitaGn
 HO8g9U8jjHFqWrM+enBjyrNfuHLjtM7HxF2QQcuvRgnd+u/YdT5HFoT4P
 xR3ReCpxbYoPjZhnLVQrnZl/9K8HK339k6FZslqAbncVf4FkJXc5UXlu5 Q==;
X-CSE-ConnectionGUID: ryImEDjmQda6md4+FOv1ig==
X-CSE-MsgGUID: U1/x87WDR2KnaocrEnnBFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95853554"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95853554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:16:20 -0700
X-CSE-ConnectionGUID: wwFlziPbSYq+tmyatAqrpQ==
X-CSE-MsgGUID: KzcnYNL/SuSyNHRbRSEY/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253904849"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2026 09:16:19 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v5 4/9] drm/i915/vrr: Update AS_SDP target_rr_divider based on
 CMRR config request
Date: Tue, 21 Jul 2026 21:35:50 +0530
Message-ID: <20260721160556.3144646-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
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
index 1915d376b943..23e169d8db7b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3111,6 +3111,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	/*
 	 * #FIXME: SDP/infoframe updates aren’t truly atomic, and with the new
@@ -3131,7 +3132,11 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
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

