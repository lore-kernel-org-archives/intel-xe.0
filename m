Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F916C982C7
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140E710F3D8;
	Tue, 15 Sep 2026 17:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZxAviHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B010F3D7;
 Tue, 15 Sep 2026 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491836; x=1821027836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgeV/aLlk7964l0ImVBr06FY3G5R3z1c68ZA62xvzLs=;
 b=UZxAviHSOUT3BDO8u9xWEh4NLibVklTSOVd8qZTLB8wr35AJYX/U02Un
 OrpBGL8tL1CelbaDO7urI129Yw6pC/EThLykpZvGrczyP6MJKDn7t53rK
 GnkGvh1bdyhxLpfHEsIIC/KPElXP/0UZviTOZYMgOmeQz+xDlje24luVb
 5nQTDe+jD+owBZgJjf89aTDol71q89jA/ckKWH0Ivf9Df+xyCiLC+8ZqP
 WHdTXB7wOYBy2BmXhtixjCMnNNqJiMP7fLaxipuDiuZ2NZlrrC3wI+zYp
 NYzuyi0pHxdWOOfz48bIp6+y4cf/JCJDpBsPoZ2d+gKeLtJpwEZ0b+bVq g==;
X-CSE-ConnectionGUID: QTSJdYBPSqG3YP4tOI9GaA==
X-CSE-MsgGUID: UTqyTOXhSJmAQBLn+tF22Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371915"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:56 -0700
X-CSE-ConnectionGUID: HONQP1ysRIOc9DTQ6gP6+A==
X-CSE-MsgGUID: tVZ1Gdu0Stys9H5CnSmbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443940"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:53 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 12/14] drm/i915/dp: Account VSC SDP in min guardband
Date: Tue, 15 Sep 2026 22:16:53 +0530
Message-ID: <20260915164657.3429075-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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

The transmission line for VSC SDP is the same as AS SDP
(EMP_AS_SDP_TL) when AS SDP is enabled. Otherwise, it uses the
second line of delayed vblank. For VSC without AS SDP, this
requires 2 lines plus 1 setup line, so the VRR guardband must be
at least 3 lines.

When both AS SDP and VSC SDP are enabled, the guardband
requirement is already accounted for during optimized guardband
calculation and the final guardband validation in
compute_config_late(). However, when VSC SDP is enabled without
AS SDP, the VSC SDP requirement is not checked explicitly.

Even in the unlikely case where the optimized guardband is
clamped to vblank length, it cannot fall below 5 lines since such
modes are already pruned. Still, for completeness, account for
VSC SDP and ensure a minimum guardband of 3 lines.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8c3a324e164e..018dc6303dfe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7359,6 +7359,8 @@ int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state, u32 ty
 		return 8;
 	case DP_SDP_PPS:
 		return 7;
+	case DP_SDP_VSC:
+		return 3;
 	case DP_SDP_ADAPTIVE_SYNC:
 		return crtc_state->vrr.vsync_start + 1;
 	default:
@@ -7390,6 +7392,11 @@ int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 		sdp_guardband = max(sdp_guardband,
 				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_ADAPTIVE_SYNC));
 
+	if (crtc_state->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
+		sdp_guardband = max(sdp_guardband,
+				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_VSC));
+
 	return sdp_guardband;
 }
 
-- 
2.50.1

