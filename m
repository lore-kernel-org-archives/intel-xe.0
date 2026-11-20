Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A58606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bp1Exbuu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7C410E8FD;
	Fri, 20 Nov 2026 14:23:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEF610E8FA;
 Fri, 20 Nov 2026 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184592; x=1826720592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMUGLpaDZMLtGc7RVhDatFhMQAt/F4+/Gr7dfvrcV0w=;
 b=bp1Exbuuaoi0ZhKjl80rAvbRyIfLBS1Q9NbjUdzB+LErlJde+WlEAQRH
 rAaBYjRBieotK7X223SYgXYl7oPn1VCQzooygF7Zka3BEW8G6oItBAYSF
 iw5kfqVLIvXBXsx/6P7b2gAQ3FZarUYourIm8Rh4m1QEWL7odiiQByrus
 QUd1lKgfAAJCKea/5vPGNaQ324FFQmevez49OGUxxATjrjc+IT5k/ooJ5
 TWnIJ+Pur/+YimNN8dGbbU9TkS2UwVdqJuFq2wk1C7gPd3ZnWl21jFiCH
 u42AyjU6+OfQIjj5cyJu/pfaANC5D7SFtMCHw9F1NLvG+rHRamqXxDX3N g==;
X-CSE-ConnectionGUID: tXURl05cRECnZGgmFHycUw==
X-CSE-MsgGUID: WftgqUtcTLOiatewke3ExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090891"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090891"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:12 -0800
X-CSE-ConnectionGUID: uJz1uZsTTMG8YNs631jFxw==
X-CSE-MsgGUID: Ocrgdl/ITw64m+rNqtcUEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12421986"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:10 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 02/29] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Date: Fri, 20 Nov 2026 19:37:02 +0530
Message-ID: <20261120140729.466177-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The FRL bandwidth check considers only the PCON's max FRL rate, ignoring
the HDMI2.1 sink's own max FRL rate. Cap the available bandwidth by the
minimum of the two, similar to the TMDS case.

Move the check into a helper intel_dp_frl_bw_valid() so it can also be
used in the compute_config phase in a subsequent change.

The DSC case, where both the PCON and HDMI sink support DSC, is left
as a FIXME and handled later.

v2: Remove extra braces and re-format comment. (Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 51 ++++++++++++++++---------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797618..05d78763c716 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -128,6 +128,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 }
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -1189,30 +1190,46 @@ static int frl_required_bw(int clock, int bpc,
 }
 
 static enum drm_mode_status
-intel_dp_mode_valid_downstream(struct intel_connector *connector,
-			       const struct drm_display_mode *mode,
-			       int target_clock,
-			       enum intel_output_format sink_format)
+intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
+		      int bpc, enum intel_output_format sink_format,
+		      bool respect_downstream_limits)
 {
-	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	int target_bw;
+	int max_frl_bw;
 
-	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
-	if (intel_dp->dfp.pcon_max_frl_bw) {
-		int target_bw, max_frl_bw;
+	if (!respect_downstream_limits)
+		return MODE_OK;
 
-		/* Assume 8bpc for the FRL bandwidth check */
-		target_bw = frl_required_bw(target_clock, 8, sink_format);
+	target_bw = frl_required_bw(target_clock, bpc, sink_format);
 
-		max_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
+	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
+	max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
+			 intel_dp_hdmi_sink_max_frl(intel_dp));
 
-		/* converting bw from Gbps to Kbps*/
-		max_frl_bw = max_frl_bw * 1000000;
+	/* converting bw from Gbps to Kbps*/
+	max_frl_bw = max_frl_bw * 1000000;
 
-		if (target_bw > max_frl_bw)
-			return MODE_CLOCK_HIGH;
+	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
+	if (target_bw > max_frl_bw)
+		return MODE_CLOCK_HIGH;
 
-		return MODE_OK;
-	}
+	return MODE_OK;
+}
+
+static enum drm_mode_status
+intel_dp_mode_valid_downstream(struct intel_connector *connector,
+			       const struct drm_display_mode *mode,
+			       int target_clock,
+			       enum intel_output_format sink_format)
+{
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+
+	/*
+	 * If PCON supports FRL MODE, check FRL bandwidth constraints.
+	 * Assume 8bpc for the HDMI2.1 FRL BW check
+	 */
+	if (intel_dp->dfp.pcon_max_frl_bw && intel_dp_hdmi_sink_max_frl(intel_dp))
+		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8, sink_format, true);
 
 	if (intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
-- 
2.50.1

