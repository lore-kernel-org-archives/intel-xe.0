Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BCBC55ABF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 04:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F3F10EC9F;
	Wed,  5 Aug 2026 04:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYmkS5tA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7667010EC9F;
 Wed,  5 Aug 2026 04:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785902852; x=1817438852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T5NuAhyEtyZ8xSKmMRUKDgAhOC40i+zdsoUD0qbaDBA=;
 b=IYmkS5tA0rxpcR7v8HSv7H4X+Hyp4OR46BYX0iCLOg9t6PFfbXICudNd
 0kRRGAHdoB5Bd+Fw/yjso6007TLTo/QKeK3p59B5Uc6VTzODpksy5K38i
 pfl8D7j9vdJ7cCXlfq4IJIJ+HgbXVUKfvkLKbojSlPBXCNziE0AdHrcaQ
 J4LIYyKEcURA0f8yGUlthXYgZlOmqsagHJFNFH26QcNWS9jT55KsAzizj
 Zu19GTdCUW6Xa7JhdJClmjCPTGqyIjpu56+0xQmkhTUfu07qvUrymgvK9
 78DbBkrnKAubB/8QYyBWxinbm3YWR2Rz0bgsRCdtb4f22DzmpUE1qFbVF Q==;
X-CSE-ConnectionGUID: MVByzRoWR5eBK6z0xyJFCw==
X-CSE-MsgGUID: EN7WB8YOQ3yqMwpq0OvE/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90143530"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="90143530"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:32 -0700
X-CSE-ConnectionGUID: haKN/sS2SqyQDyXG1AufDw==
X-CSE-MsgGUID: x0dOXGJfQfqGYG7adMGucQ==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:29 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/5] drm/i915/{dp,hdmi}: Pass bpc in intel_hdmi_dsc_get_bpp
Date: Wed,  5 Aug 2026 09:20:25 +0530
Message-ID: <20260805035027.3473398-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
References: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
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

Generalize intel_hdmi_dsc_get_bpp helper to accept bpc as a parameter
instead of assuming hardcoded value.

v2: Add {dp,hdmi} in subject prefix. (Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   |  3 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 76d8ebecec32..d029cea1055d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4340,9 +4340,10 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
 	int pcon_fractional_bpp = drm_dp_pcon_dsc_bpp_incr(intel_dp->pcon_dsc_dpcd);
 	int hdmi_max_chunk_bytes =
 		info->hdmi.dsc_cap.total_chunk_kbytes * 1024;
+	int bpc = crtc_state->pipe_bpp / 3;
 
 	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
-				      num_slices, output_format, hdmi_all_bpp,
+				      num_slices, output_format, bpc, hdmi_all_bpp,
 				      hdmi_max_chunk_bytes);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 228c5e2be164..d3efd9e4e86a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3333,6 +3333,7 @@ intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
  * @slice_width: dsc slice width supported by the source and sink
  * @num_slices: num of slices supported by the source and sink
  * @output_format: video output format
+ * @bpc: bits per color
  * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
  * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
  *
@@ -3340,7 +3341,7 @@ intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
  */
 int
 intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
-		       enum intel_output_format output_format,
+		       enum intel_output_format output_format, int bpc,
 		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
 {
 	int max_dsc_bpp, min_dsc_bpp;
@@ -3358,18 +3359,17 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	 * for each bpp we check if no of bytes can be supported by HDMI sink
 	 */
 
-	/* Assuming: bpc as 8*/
 	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
 		min_dsc_bpp = 6;
-		max_dsc_bpp = 3 * 4; /* 3*bpc/2 */
+		max_dsc_bpp = 3 * bpc / 2;
 	} else if (output_format == INTEL_OUTPUT_FORMAT_YCBCR444 ||
 		   output_format == INTEL_OUTPUT_FORMAT_RGB) {
 		min_dsc_bpp = 8;
-		max_dsc_bpp = 3 * 8; /* 3*bpc */
+		max_dsc_bpp = 3 * bpc;
 	} else {
 		/* Assuming 4:2:2 encoding */
 		min_dsc_bpp = 7;
-		max_dsc_bpp = 2 * 8; /* 2*bpc */
+		max_dsc_bpp = 2 * bpc;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index 4e2228ca0c5b..c3a0e81615e4 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -56,7 +56,7 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_format);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, enum intel_output_format output_format,
-			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
+			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
 int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 				  enum intel_output_format output_format,
 				  int src_max_slices, int src_max_slice_width,
-- 
2.50.1

