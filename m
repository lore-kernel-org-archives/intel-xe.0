Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAD3606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cViw+qAO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06441112AD9;
	Fri, 20 Nov 2026 14:24:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46099112ACB;
 Fri, 20 Nov 2026 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184640; x=1826720640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NsmBqcVB51282oYAJt8sgszK8Nm1lvB6fQeb/PGhTI=;
 b=cViw+qAONJSRbMg9Xmm8qvtTo13IRofukKk5cH6Q9YJY4uJstF8D5Bqb
 +axzzJkZKH92wkgvnzxuaJrNQiMqhXzKqVpMlmvyPsIRmfKeLPNJTTElG
 9pYn7JQHitdVFcHh9THJpx4Tyg0btYwsTsYjDoMK6YvbWc3WdsrE3EoIS
 tyP35TaJB+ZEkCOlmb6G5tkondOQ6s59Ma75UPmze9hoJuXjNndlWVBzT
 DoebaWVuq01WTC2msCbc3wriAI+EGkVx1p6n0T5G7YhI8v/WrbELjnWFG
 1mGgDHN1lxaeT1X9ZWELnfvDKshfk0Dy+9h1fON9YGYoJ5tYpQxJYntRF w==;
X-CSE-ConnectionGUID: iFk1alveTcOL1IhlZFdAAw==
X-CSE-MsgGUID: MkVT7e/sTnKS7XIoaZYN9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091010"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091010"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:43 -0800
X-CSE-ConnectionGUID: 9uwmr6H+Ru2ZH8768LkeIg==
X-CSE-MsgGUID: JZBfJB8PQ+uKfb6AWIeEtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422047"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:41 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 20/29] drm/i915/dp: Use the FRL rate of the stream on the HDMI
 link
Date: Fri, 20 Nov 2026 19:37:20 +0530
Message-ID: <20261120140729.466177-21-ankit.k.nautiyal@intel.com>
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

The HDMI sink has two max FRL rates: one for uncompressed video and a
separate, possibly lower one for compressed video transport. The FRL
training is sticky, so it can train the link only at a single rate, and
the max rate helper returned the lower of the two whenever the PCON has
a DSC encoder, even if the HDMI link carries an uncompressed stream.
That drops modes that fit the link uncompressed at the regular rate.

Pass to the helpers whether the stream on the HDMI link is compressed,
and use the regular max rate for an uncompressed stream and the sink DSC
max rate for a compressed one. The capability checks and the
bandwidth check for an uncompressed stream use the regular rate, the
check for a compressed stream the DSC rate. Store the rate matching the
PCON DSC operation in the crtc state, which the FRL training uses.

As a result, modes that fit the HDMI link uncompressed at the regular
max rate of a sink with a lower DSC max rate are not dropped any more
for a PCON with a DSC encoder.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 44 ++++++++++++++-----------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ff6fb5eca166..7d3b5f35c206 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -128,7 +128,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 }
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
-static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp, bool dsc);
 static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
 static int intel_dp_dsc_stream_version_minor(const struct intel_connector *connector);
 
@@ -1192,15 +1192,22 @@ static int frl_required_bw(int clock, int bpc,
 }
 
 /*
- * Both the PCON and the HDMI 2.1 sink limit the FRL rate. FRL uses 16b/18b
- * line coding, so only 16/18 of the raw rate carries payload. Returns kbps.
+ * Both the PCON and the HDMI 2.1 sink limit the FRL rate. The sink has a
+ * separate limit for @dsc, a compressed stream on the HDMI link.
  */
-static int intel_dp_hdmi_frl_payload_bw(struct intel_dp *intel_dp)
+static int intel_dp_pcon_max_frl_rate(struct intel_dp *intel_dp, bool dsc)
 {
-	int max_frl_rate = min(intel_dp->dfp.pcon_max_frl_bw,
-			       intel_dp_hdmi_sink_max_frl(intel_dp));
+	return min(intel_dp->dfp.pcon_max_frl_bw,
+		   intel_dp_hdmi_sink_max_frl(intel_dp, dsc));
+}
 
-	return max_frl_rate * 1000000 * 16 / 18;
+/*
+ * FRL uses 16b/18b line coding, so only 16/18 of the raw rate carries
+ * payload. Returns kbps.
+ */
+static int intel_dp_hdmi_frl_payload_bw(struct intel_dp *intel_dp, bool dsc)
+{
+	return intel_dp_pcon_max_frl_rate(intel_dp, dsc) * 1000000 * 16 / 18;
 }
 
 static enum drm_mode_status
@@ -1217,7 +1224,7 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	target_bw = frl_required_bw(target_clock, bpc, sink_format);
 
 	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
-	max_frl_bw = intel_dp_hdmi_frl_payload_bw(intel_dp);
+	max_frl_bw = intel_dp_hdmi_frl_payload_bw(intel_dp, false);
 
 	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
 	if (target_bw > max_frl_bw)
@@ -1230,7 +1237,7 @@ static bool
 intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp)
 {
 	return intel_dp->dfp.pcon_max_frl_bw &&
-		intel_dp_hdmi_sink_max_frl(intel_dp);
+		intel_dp_hdmi_sink_max_frl(intel_dp, false);
 }
 
 static bool intel_dp_pcon_can_encode_dsc(struct intel_dp *intel_dp)
@@ -1275,7 +1282,7 @@ intel_dp_pcon_dsc_enc_compute(struct intel_dp *intel_dp,
 	slice_width = DIV_ROUND_UP(mode->hdisplay, num_slices);
 
 	/* The compressed stream has to fit the FRL link */
-	max_link_dsc_bpp = intel_dp_hdmi_frl_payload_bw(intel_dp) / pixel_clock;
+	max_link_dsc_bpp = intel_dp_hdmi_frl_payload_bw(intel_dp, true) / pixel_clock;
 	if (!max_link_dsc_bpp)
 		return false;
 
@@ -3101,8 +3108,8 @@ intel_dp_pcon_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
 		return 0;
 
-	crtc_state->pcon_config.frl_rate_gbps =
-		min(intel_dp->dfp.pcon_max_frl_bw, intel_dp_hdmi_sink_max_frl(intel_dp));
+	/* The HDMI link carries an uncompressed stream, unless the PCON compresses it */
+	crtc_state->pcon_config.frl_rate_gbps = intel_dp_pcon_max_frl_rate(intel_dp, false);
 
 	if (crtc_state->dsc.compression_enable)
 		crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE;
@@ -3130,6 +3137,7 @@ intel_dp_pcon_compute_config(struct intel_dp *intel_dp,
 	}
 
 	crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE_ENCODE;
+	crtc_state->pcon_config.frl_rate_gbps = intel_dp_pcon_max_frl_rate(intel_dp, true);
 
 	return 0;
 }
@@ -4481,7 +4489,7 @@ static int intel_dp_pcon_set_frl_mask(int max_frl)
 	return 0;
 }
 
-static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp, bool dsc)
 {
 	struct intel_connector *connector = intel_dp->attached_connector;
 	struct drm_connector *drm_connector = &connector->base;
@@ -4490,12 +4498,10 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 
 	/*
 	 * The sink's DSC max FRL rate only applies to compressed video
-	 * transport, which requires a DSC 1.2 encoder in the PCON. Without
-	 * one the HDMI link always carries uncompressed video, for which
-	 * the regular max FRL rate is the limit.
+	 * transport. For uncompressed video the regular max FRL rate is the
+	 * limit.
 	 */
-	if (drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd) &&
-	    dsc_max_frl_rate)
+	if (dsc && dsc_max_frl_rate)
 		return min(max_frl_rate, dsc_max_frl_rate);
 
 	return max_frl_rate;
@@ -4581,7 +4587,7 @@ static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp)
 {
 	if (drm_dp_is_branch(intel_dp->dpcd) &&
 	    intel_dp_has_hdmi_sink(intel_dp) &&
-	    intel_dp_hdmi_sink_max_frl(intel_dp) > 0)
+	    intel_dp_hdmi_sink_max_frl(intel_dp, false) > 0)
 		return true;
 
 	return false;
-- 
2.50.1

