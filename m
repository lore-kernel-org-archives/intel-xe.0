Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8C8C88E65
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B109A10E942;
	Sun, 13 Sep 2026 15:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHfHdA2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B8910E93B;
 Sun, 13 Sep 2026 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312405; x=1820848405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vIkKzAIIU/Vlj6E/bHYWwD87/VtuOi63b32xyNXNAJE=;
 b=IHfHdA2GeHd0v+Y8Cs9YBgK5PFMwbhYljnp/ZpaglGi/FIE1clbNBR+p
 K/KjA993G4Cf4OnuiqUUb0SwN+EFlE2GdZj+ZZlIqCXYuUWmfqjVNHwdL
 KPShiJuKEkFCKaO0PORpsxEDwCfm34/OIn2TAyWZrWlAzeGwdbJN1u4Jb
 SG7ldw8IynvRHacBI6pOCPYnd36TRs4HtL8sMOdF6mdAi2++TvAfEBRdC
 zg1quUiOeeiYTXt7te8AiieuESIQow1s0WaRyoC4PJFiiLdLGKPoGShi2
 be2AAH0uZZcksqtC+H66oVlurZOkCT+u3ovT1hFAeRS9c2O4ZUMaHFAxa Q==;
X-CSE-ConnectionGUID: ukjHXiXETT6vVYACy2Lo6w==
X-CSE-MsgGUID: L0y9rLSvT9i8q2vTRplUCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388751"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388751"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:25 -0700
X-CSE-ConnectionGUID: WQd0tsAgQsipsvZSIGUNqQ==
X-CSE-MsgGUID: kZKP7jKTQA2XyaeM69rQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694025"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:23 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 03/13] drm/i915/intel_dip: Add check for DP encoder
Date: Sun, 13 Sep 2026 20:26:38 +0530
Message-ID: <20260913145649.3240904-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

At the moment, the common register for programming Transmission line for
Extended Metadata Packet and Adaptive-Sync Secondary Data Packet
(EMP_AS_SDP_TL) is only used to program Adaptive-Sync SDP (AS SDP).

Since VRR and Video Timing Extended Metadat Packet (VTEMP) are not yet
implemented for HDMI, add an explicit check to write the register only
for DP encoders (that may use AS SDP) and reset the register for non-DP
encoders.

In subsequent changes, instead of directly writing the value,
appropriate helpers will be called, that will supply the transmission line
for these packets.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index 2e2bdb2b199c..b28352a9e23f 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -26,14 +26,19 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 transmission_line = 0;
 
 	if (!HAS_EMP_AS_SDP_TL(display))
 		return;
 	/*
-	 * Since currently we support VRR only for DP/eDP, so this is programmed
-	 * only for Adaptive Sync SDP to Vsync start.
+	 * Since we currently support VRR only for DP/eDP, program the register
+	 * for Adaptive Sync SDP using vsync start. For non-DP encoders,
+	 * the register is reset to 0.
 	 */
+	if (intel_crtc_has_dp_encoder(crtc_state))
+		transmission_line = crtc_state->vrr.vsync_start;
+
 	intel_de_write(display,
 		       EMP_AS_SDP_TL(display, cpu_transcoder),
-		       EMP_AS_SDP_DB_TL(crtc_state->vrr.vsync_start));
+		       EMP_AS_SDP_DB_TL(transmission_line));
 }
-- 
2.50.1

