Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E6606A332
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jRdw8Oiw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96800112AE4;
	Fri, 20 Nov 2026 14:24:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A865B112AEB;
 Fri, 20 Nov 2026 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184656; x=1826720656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y10V3uBNCcFPgIVTsnlmmF8Rs5Fu+jmwb/tA71KVJP4=;
 b=jRdw8OiwQaw5njC66V0nllw5w0keINcgehgaz0l+Zt+bL04PsYHiUMbj
 5hKrUgU/puIyCIpSejhmlSQZ/eY31PGA4h7GuhEaJQhmeanpMgraA3qPj
 t4HtEp3wcuJjVNojCOndWNkw5oV2hW/0AeG0knS2gD7RpVHhMmbKc1quQ
 7LmqxIpxxH+4w2sX1tw31IA7ElgjmHmSZjrxkOKJj1b5GYDeLhsY4xUsv
 pGbzoIIHEpsO3SvDIDRa3vuDPlc02lgsvifBXfSehSCjMeWmOxUaUEdIM
 KAONJ0wQ2nTrvNsaflfqDimUB7vMXugIAzbxqnDJDYs7i8FQ//RVcOHcj A==;
X-CSE-ConnectionGUID: ROMn3fI+Sqq9twnp3cCc4A==
X-CSE-MsgGUID: GBNkpuejTo+/d8T8uMMLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091046"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091046"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:58 -0800
X-CSE-ConnectionGUID: VC6xFmKUSwCnFKZpy+NPAQ==
X-CSE-MsgGUID: OEECQpNxQ8a3bekywU5l4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422083"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:56 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 29/29] drm/i915/dp: Accept DSC 1.2a pass-through modes in the
 PCON mode check
Date: Fri, 20 Nov 2026 19:37:29 +0530
Message-ID: <20261120140729.466177-30-ankit.k.nautiyal@intel.com>
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

An HDMI 2.1 PCON that supports DSC pass-through can forward a DSC 1.2a
stream of the source to the HDMI sink as is. The mode check only
considered the PCON DSC encoder, which can re-encode just a DSC 1.1
stream, so modes that need DSC on the HDMI link were never accepted for
a DSC 1.2a source.

Now that the pass-through is selected when computing the config, accept
such a mode if the PCON supports pass-through and the lowest compressed
bpp the HDMI sink supports fits the FRL bandwidth. The stream
parameters are only known once the DP link is computed, so this is just
a rough estimate, the config computation does the exact check.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 28 +++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5ac687412406..81a8e4ad2c92 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1392,8 +1392,9 @@ intel_dp_pcon_dsc_passthrough_ok(struct intel_dp *intel_dp,
 }
 
 /*
- * Whether the PCON can compress a stream that doesn't fit the HDMI FRL link
- * uncompressed. The DP stream has to be compressed for that as well.
+ * Whether the PCON can pass a DSC 1.2a stream through, or compress a stream
+ * that doesn't fit the HDMI FRL link uncompressed. The DP stream has to be
+ * compressed for that as well.
  */
 static bool
 intel_dp_hdmi_dsc_possible(struct intel_dp *intel_dp,
@@ -1401,11 +1402,26 @@ intel_dp_hdmi_dsc_possible(struct intel_dp *intel_dp,
 			   int bpc, enum intel_output_format sink_format)
 {
 	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info = &connector->base.display_info;
+	int min_dsc_bpp, max_dsc_bpp;
+
+	if (!intel_dp_pcon_sink_support_frl(intel_dp))
+		return false;
+
+	/* A DSC 1.1 stream is re-encoded, a DSC 1.2a stream is passed through */
+	if (intel_dp_dsc_stream_version_minor(connector) < 2)
+		return intel_dp_pcon_dsc_enc_compute(intel_dp, mode, pixel_clock, bpc,
+						     sink_format, NULL);
+
+	if (!intel_dp_pcon_can_passthrough_dsc(intel_dp) ||
+	    intel_dp_output_format(connector, sink_format) != sink_format)
+		return false;
+
+	/* The stream parameters are only known once the DP link is computed */
+	intel_hdmi_dsc_get_min_max_bpp(sink_format, bpc, info->hdmi.dsc_cap.all_bpp,
+				       &min_dsc_bpp, &max_dsc_bpp);
 
-	return intel_dp_pcon_sink_support_frl(intel_dp) &&
-		intel_dp_dsc_stream_version_minor(connector) < 2 &&
-		intel_dp_pcon_dsc_enc_compute(intel_dp, mode, pixel_clock, bpc,
-					      sink_format, NULL);
+	return intel_dp_hdmi_frl_payload_bw(intel_dp, true) / pixel_clock >= min_dsc_bpp;
 }
 
 static enum drm_mode_status
-- 
2.50.1

