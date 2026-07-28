Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A43C54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA8110E96E;
	Tue, 28 Jul 2026 15:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ggv7G0yp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D775010E6E9;
 Tue, 28 Jul 2026 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251483; x=1816787483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AVrr404QUAI2/fEETfiidb12sV5aiEvmQQ7ldYLFZNI=;
 b=Ggv7G0yprIt8g0OXHoBYTsKWVB24k16YbKIiOR2AMMwHkwyPD+DiRHsv
 1ZVzmUq4HyhgrhjxufUBZXRSobzRYzVUZtV/Q7v50AebzT96qvToHH0vc
 b1NaPj5AlR8LAgqvAxfeXrZgiAv69yf+yQO7/s8eFw1GgVRvWxRz7CHzd
 eLVZCAzOaxDhfimJZTMz4sCUyrXYtyikcZVhko0mpVlNb+XkIaXG7UnEB
 xwITbzQtvdOVwc3pH8dPh0sdTsUiu2HSlKPMb/IO9Esk5PnraXpGGbqHv
 YBCPSc2cmcpNAhlB07TyP7qATfoZ54T9a+dUq+pBhWiu3+WFmosEXCTgi Q==;
X-CSE-ConnectionGUID: q9ex1OQIRjSIpmRMpUohjQ==
X-CSE-MsgGUID: qHhw9HFCSyazYvRhgZdk7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376928"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:10:04 -0700
X-CSE-ConnectionGUID: pD+8q+ICTPmgXCEQaKdXnQ==
X-CSE-MsgGUID: nAq+DouHQve+AkZ6TNuezA==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:10:02 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 04/10] drm/i915/vrr: Update AS_SDP target_rr_divider based
 on CMRR config request
Date: Tue, 28 Jul 2026 20:29:36 +0530
Message-ID: <20260728145943.3848704-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
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

