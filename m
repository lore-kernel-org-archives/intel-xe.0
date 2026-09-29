Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC50CA5FB3
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4347B10EE55;
	Tue, 29 Sep 2026 11:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiSGUTNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F6D10EE4C;
 Tue, 29 Sep 2026 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679917; x=1822215917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B3csQCXBTdxquMU0DHyvS01zJFY4kFGU/TRmuVODjSs=;
 b=UiSGUTNVVKJc5Jqt02aEdBfD4bbBkh5mSdmPAZmN88+WeYhmsuxziow4
 xDajtE+Ipr6IKc61pN9jZjFwXoL8/CAawbw/5qHp7dgi++gK5Ieahd/VX
 IskLZMKXA74ertcweXOe7HUQt+rWMo8jtjpCEaTsje/kwbkjpAsYwntt/
 ZjOArl7Ssv9u1L10nMoBHGBGzkD4OzEAOtHzNnfcoB4vdSCNz1rbiAbph
 go8lduo3kQ28GM7FDSNUAKwDJhXJy5av2cJwNi8OiksWZjBO82HvsIB/N
 indLsXHhimfyxlqdnyLwnvgog53Hlue6jKyS+Ds2rfYoZIafQY9VW8Ha/ A==;
X-CSE-ConnectionGUID: TTTlELrhR+Gw8oFxcoftNA==
X-CSE-MsgGUID: PyGmS31DTQeG57YdQoUn/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295499"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295499"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:03 -0700
X-CSE-ConnectionGUID: U0UptTkaSgSDGiyFPEaPeA==
X-CSE-MsgGUID: B3Ot9VuWQGSx+CduYzSQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887337"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:02 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 05/10] drm/i915/hdmi: Expose DSC min/max bpp helpers
Date: Tue, 29 Sep 2026 16:18:30 +0530
Message-ID: <20260929104835.1050882-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
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

Expose intel_hdmi_dsc_get_min_max_bpp() to query the allowed compressed
bpp range.
This will be used in the subsequent change to compute the compressed bpp
range in mode_valid() for an HDMI with DSC connected to a DP DFP.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 20 +++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 205c55522bca..bee2ea570ca9 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3325,9 +3325,19 @@ intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 	return target_slices;
 }
 
-static void
-get_dsc_min_max_bpp(enum intel_output_format output_format, u8 bpc,
-		    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
+/*
+ * intel_hdmi_dsc_get_min_max_bpp - get the min and max compressed bpp range
+ * allowed for a given output format and bpc.
+ *
+ * @output_format: video output format
+ * @bpc: bits per color
+ * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
+ * @min_dsc_bpp: returns the minimum allowed compressed bpp
+ * @max_dsc_bpp: returns the maximum allowed compressed bpp
+ */
+void
+intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
+			       bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
 {
 	/*
 	 * Get min bpp and max bpp that can be supported for a
@@ -3433,8 +3443,8 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	int max_dsc_bpp, min_dsc_bpp;
 	int dsc_bpp_x16;
 
-	get_dsc_min_max_bpp(output_format, bpc, hdmi_all_bpp,
-			    &min_dsc_bpp, &max_dsc_bpp);
+	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
+				       &min_dsc_bpp, &max_dsc_bpp);
 
 	dsc_bpp_x16 = get_dsc_compressed_bpp(num_slices, slice_width,
 					     hdmi_max_chunk_bytes,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index c95ed37bcc0c..3ab75ef4836e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -57,6 +57,8 @@ int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_form
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, enum intel_output_format output_format,
 			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
+void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
+				    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp);
 int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 				  enum intel_output_format output_format,
 				  int src_max_slices, int src_max_slice_width,
-- 
2.50.1

