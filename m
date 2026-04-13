Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBBE93812
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FDD10E313;
	Mon, 13 Apr 2026 04:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbsVhaOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041A310E319;
 Mon, 13 Apr 2026 04:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776053349; x=1807589349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWJR0MC8RPndFVjczGfllR/Dl9/fbRjLxTHPJJvqkEI=;
 b=NbsVhaOsBfCeRnIiUAS5ke9BVo+3eo/hCCP5UVRqKGmDHxucmaqlsuv7
 XeRxDSSA3ij80I+cMXKvV0R7QvMDJ+Ax4GaRVXfkuh9h5C3Z+rUjeX4uE
 nVyusW7MyA6y7k2j258VtQxIVmjIRtN1MtgjoRhiF0Gqql9ArvwlfEnXF
 v636JF5f786bk4YtYe97GGO1r9JhuNWpOGGYfLE2vD5zm4bEHa+ewfDHk
 HDfkX/JTniuDuyhKAGEad/aWCSSNKvw6maNdBfSZSS9k5nBh10YvYlFry
 6pDl4Uicpmgwny5/11zEhgLNJlqnH4Rm7PaEGG9mXHLxLwEBx7sXjGbBb w==;
X-CSE-ConnectionGUID: LmFQ0gotSsqtfsoFbmENBA==
X-CSE-MsgGUID: aFsoITYDTRmhE9fw/JF47w==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80568794"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="80568794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:09:08 -0700
X-CSE-ConnectionGUID: SgnkrIv3StmeajpEFvxbzQ==
X-CSE-MsgGUID: kpCUht8dSU2WqWFUJmaTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="229546656"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:09:06 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 12/12] drm/i915/display: Dump SDP Transmission lines
Date: Mon, 13 Apr 2026 09:23:49 +0530
Message-ID: <20260413035349.1730312-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
References: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
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

Add SDP transmission lines to the CRTC state dump.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index c85ba9a95322..def696967706 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -251,6 +251,14 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   str_enabled_disabled(pipe_config->has_panel_replay),
 			   str_enabled_disabled(pipe_config->enable_psr2_sel_fetch));
 		drm_printf(&p, "minimum hblank: %d\n", pipe_config->min_hblank);
+
+		drm_printf(&p, "DP SDP TL: AS: %u, CMN: %u, GMP: %u, PPS: %u, VSC: %u, VSC_EXT: %u\n",
+			   pipe_config->dp_sdp_tl.as,
+			   pipe_config->dp_sdp_tl.cmn,
+			   pipe_config->dp_sdp_tl.gmp,
+			   pipe_config->dp_sdp_tl.pps,
+			   pipe_config->dp_sdp_tl.vsc,
+			   pipe_config->dp_sdp_tl.vsc_ext);
 	}
 
 	drm_printf(&p, "audio: %i, infoframes: %i, infoframes enabled: 0x%x\n",
-- 
2.45.2

