Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D9860A2602
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mwTNiGKr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67234112AF3;
	Fri, 20 Nov 2026 14:24:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0971A112AE1;
 Fri, 20 Nov 2026 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184654; x=1826720654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Vvn5rkCahz/oM7P7dbAqqv2eqJaqdKm8oYCMyuVn+s=;
 b=mwTNiGKrhhoeg8URJMKOpHQ7X+B3/tM9bGxhCBIeJ/g2dc0ayr2WOfhr
 hjmxXoAIKywCPdlcc2dFv/EkwJcXuKYsGo5pYkh7LCwONZRSOJEiJgFS+
 nxJXycTOGg8udB/QRJPqfouX2mXGC4EkFAAdJTUXYJVOEHt0bMhQrY6Gk
 1OGsxG0HbyY+/1TNT0TLGVd9U6if7ccZmVKEDiHf8B+Z1hk/ZfO0zra/D
 bEb3dhYgwpktChefduE/wmPcYBlU9fhYYgVd+0WC/Yx5a1ORHKt+wMwNU
 tqh/9igN0cYVINGaankirZMJS7KPj/pueCfuhyiy4xxQenAvLu/sA/0it g==;
X-CSE-ConnectionGUID: o9NordvkRh2jdqjV10x6EA==
X-CSE-MsgGUID: tMgR2WjHQ6y5hri9JvNaGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091044"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091044"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:56 -0800
X-CSE-ConnectionGUID: OK6RElQ8QUqbo6uWT9itVg==
X-CSE-MsgGUID: WvdK22zQTPmCxAF8jSEA7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422080"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:54 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 28/29] drm/i915/dp: Limit the compressed bpp for pass-through
 to the HDMI sink
Date: Fri, 20 Nov 2026 19:37:28 +0530
Message-ID: <20261120140729.466177-29-ankit.k.nautiyal@intel.com>
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

The compressed bpp of a DSC stream passed through the PCON also has to
be one the HDMI sink can decode. So far only the FRL bandwidth limited
it, and the pass-through check rejected the mode if the bpp was outside
the range the sink supports, or made a line exceed the chunk bytes limit
of the sink.

Limit the link bpp range to the range the sink supports, and to the
highest bpp within the chunk bytes limit of the sink, using the same
helper as for the PCON DSC encoder. The slice count is picked later, so
use the minimum slice count of the HDMI sink for it. Fail the limits
computation if no bpp fits the chunk bytes limit.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2282e7e027d7..5ac687412406 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3092,7 +3092,10 @@ intel_dp_pcon_dsc_compute_passthrough_limits(struct intel_dp *intel_dp,
 					     struct link_config_limits *limits)
 {
 	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info = &connector->base.display_info;
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int bpc = limits->pipe.max_bpp / 3;
+	int min_dsc_bpp, max_dsc_bpp, hdmi_bpp_x16, slice_width;
 
 	if (!intel_dp_pcon_sink_support_frl(intel_dp) ||
 	    !intel_dp_pcon_can_passthrough_dsc(intel_dp) ||
@@ -3112,9 +3115,27 @@ intel_dp_pcon_dsc_compute_passthrough_limits(struct intel_dp *intel_dp,
 						 &limits->dfp_dsc.max_slices))
 		return false;
 
+	intel_hdmi_dsc_get_min_max_bpp(crtc_state->sink_format, bpc,
+				       info->hdmi.dsc_cap.all_bpp,
+				       &min_dsc_bpp, &max_dsc_bpp);
+
+	/*
+	 * The slice count of the stream is picked later, use the minimum one
+	 * for the highest bpp the sink supports in the range and within the
+	 * chunk bytes limit.
+	 */
+	slice_width = DIV_ROUND_UP(adjusted_mode->crtc_hdisplay, limits->dfp_dsc.min_slices);
+	hdmi_bpp_x16 = intel_hdmi_dsc_get_bpp(16, slice_width, limits->dfp_dsc.min_slices,
+					      crtc_state->sink_format, bpc,
+					      info->hdmi.dsc_cap.all_bpp,
+					      info->hdmi.dsc_cap.total_chunk_kbytes * 1024, 0);
+	if (!hdmi_bpp_x16)
+		return false;
+
+	limits->link.min_bpp_x16 = max(limits->link.min_bpp_x16, min_dsc_bpp * 16);
 	limits->link.max_bpp_x16 =
-		min(limits->link.max_bpp_x16,
-		    intel_dp_hdmi_frl_payload_bw(intel_dp, true) * 16 / adjusted_mode->crtc_clock);
+		min3(limits->link.max_bpp_x16, hdmi_bpp_x16,
+		     intel_dp_hdmi_frl_payload_bw(intel_dp, true) * 16 / adjusted_mode->crtc_clock);
 
 	return true;
 }
-- 
2.50.1

