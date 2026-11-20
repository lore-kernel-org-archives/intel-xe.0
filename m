Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE10C606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bPoTxdKy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBFC112AC5;
	Fri, 20 Nov 2026 14:23:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A237F112AC3;
 Fri, 20 Nov 2026 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184627; x=1826720627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gmsrFmC8BNExCTTOKCacZ0le4XUVaCI6sshVP/DzEhc=;
 b=bPoTxdKyw8JuAnalAesbpK7yZ9RmoILCecmO8jaaU73T3+T42Ug+MSnN
 ic3KHAZBy/XqWxnUyo8FXDypVjgow5HNZBCfe+eegp5WoEaMuXl7ai90+
 zZ8+67EfKdaISBaiBX/xhlPyKO79R98t+Wus+wXER1MMORdPPRIZa7H4g
 UjOf8nLZjzD7c698GKWfnpdtva170qkTUWKYUm4c5GI9Dp8JvV1VOKkl4
 NUrgCUTViGIg7OtbD6j67Ja+RYoLzJ8Y894n1F254xygyxG2yMTK6rsI1
 6k6LE7tyFaN2vvj88UVk9XfIftRQLnNmtX6xDGeBpp1hAmJ+NXA9e8zLn w==;
X-CSE-ConnectionGUID: HVkyv9YhRvaQ2DuqeMCmXg==
X-CSE-MsgGUID: VwpyZg6WTl2J5O60W8kCcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090967"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090967"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:29 -0800
X-CSE-ConnectionGUID: /Gbg3U0fRE2JUGpgw/j8Pg==
X-CSE-MsgGUID: lfHfTdzoT5eOBWIKKxs6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422021"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:28 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 12/29] drm/i915/dp: Compute the PCON DSC operation
Date: Fri, 20 Nov 2026 19:37:12 +0530
Message-ID: <20261120140729.466177-13-ankit.k.nautiyal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the DP stream is compressed and the HDMI link of an HDMI 2.1 PCON
carries it uncompressed, the PCON decodes the DSC stream. Record this in
the PCON DSC state once the DP link configuration is final.

The operations for HDMI links that need DSC are added once such modes
can be selected.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6412248e9dcc..e837645a6421 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -129,6 +129,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
 static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
+static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -3013,6 +3014,19 @@ bool intel_dp_joiner_needs_dsc(struct intel_display *display,
 		num_joined_pipes == 4;
 }
 
+static int
+intel_dp_pcon_compute_config(struct intel_dp *intel_dp,
+			     struct intel_crtc_state *crtc_state)
+{
+	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
+		return 0;
+
+	if (crtc_state->dsc.compression_enable)
+		crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE;
+
+	return 0;
+}
+
 static int
 intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
 				       struct intel_crtc_state *pipe_config,
@@ -3098,6 +3112,10 @@ intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
 			return -EINVAL;
 	}
 
+	ret = intel_dp_pcon_compute_config(intel_dp, pipe_config);
+	if (ret)
+		return ret;
+
 	drm_dbg_kms(display->drm,
 		    "DP lane count %d clock %d bpp input %d compressed " FXP_Q4_FMT " HDR %s link rate required %d available %d\n",
 		    pipe_config->lane_count, pipe_config->port_clock,
-- 
2.50.1

