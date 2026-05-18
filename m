Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41540CD4F50
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 05:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0056B10E682;
	Mon, 18 May 2026 05:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4gZqc0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D6410E681;
 Mon, 18 May 2026 05:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779082029; x=1810618029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+TfVu0OxdmYK2YYq3EU2Cmt7KVqMgORqoV4j+uj3PdY=;
 b=M4gZqc0Ddnkzf+LhihfiwE15KN7jDGB08K8kp1GGiEj6QDGPqeDHQrr/
 v3CILapf/KhqHSoze0WXRVogqqoedMOWfYlv7eHr/iVajxmbR69PciicV
 2xezFqm6exaVwAqfsWcAmSN0zzDWKLBeJG5114k7b4EqD31icS6inJan9
 qFOaREcrtYadahOjmBMceDoOpNf/wVBU26I8eBQPql7Y3LWHgW71iRR2m
 IMT0g713ZOBp49VAZmSsHsZi/9QtncOm5oZy5mOWEMxUDG8QAanPeX9Gd
 YXFDiT2HUsTbfL3hscnS/vpfj1G7hTIgBriBvfkUcXEhZ0yzmCGtlZWx2 g==;
X-CSE-ConnectionGUID: V8cK9D4ZSra6bLmS8bicVA==
X-CSE-MsgGUID: C+Fy56dPQLCMPDgPUg84jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79064965"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79064965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:27:09 -0700
X-CSE-ConnectionGUID: wlj7DZ1iSyGvVaB1PRNUaQ==
X-CSE-MsgGUID: 7fMgwUEVSFCriJtdwp+7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243606235"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:27:07 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 12/12] drm/i915/dp: Account for AS_SDP guardband only when
 enabled
Date: Mon, 18 May 2026 10:42:15 +0530
Message-ID: <20260518051216.2936634-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
References: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
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

Currently the intel_dp_sdp_min_guardband() accounts for AS_SDP for all
platforms that support adaptive sync SDP even for configurations where
it cannot be enabled. Instead account for adaptive sync SDP guardband
only when it is enabled.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2c1dbcb0a2ca..9887176bfc36 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7558,7 +7558,6 @@ int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state, u32 ty
 int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 			       bool assume_all_enabled)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
 	int sdp_guardband = 0;
 
 	if (assume_all_enabled ||
@@ -7573,8 +7572,8 @@ int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 		sdp_guardband = max(sdp_guardband,
 				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_PPS));
 
-	if ((assume_all_enabled && HAS_AS_SDP(display)) ||
-	    crtc_state->infoframes.enable & intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
+	if (crtc_state->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
 		sdp_guardband = max(sdp_guardband,
 				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_ADAPTIVE_SYNC));
 
-- 
2.45.2

