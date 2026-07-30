Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6BFC55169
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D0710EEF3;
	Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhPpB6TS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B6510EEE2;
 Thu, 30 Jul 2026 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409786; x=1816945786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8LKHFL7oCkDAVQO7kUY4x59Hj0GlShP4IFIgj9mvB9w=;
 b=YhPpB6TSvkAsmc2Fs8/WW2VI5BRF6cDsU15UBBWctKXmt4rWfc9iFSQm
 14CsOSSHv9jlNmHZZL9yx97W7JSJgUMpNLtX20VoGHSaK52DBtC0Y3oPm
 udHp5ropXtSsBw180ASbB6QHFxibh+zl3mb2C6I8WwQge6MRi4EL1LJDP
 Z2z5+eZ0mz8Z7pPX2B2hrTEGNEURz6UfQXAPCwWzXavEblUFe08uyH7+V
 AhvCT9dKuQlkY6REIF6ZPc+SamrMO51MMPYBLMN/Vqsk7gmbLCZwA3UaQ
 chGo7KIDK7Qix7KbsSEEYhhNmSfdoelhGVCXIu/b3hxL0ySNaW+4rskjL w==;
X-CSE-ConnectionGUID: p2mekidDTyOOLSu4RX9g6A==
X-CSE-MsgGUID: 3m/KMCFZStWpN/qzsei3JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182424"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:46 -0700
X-CSE-ConnectionGUID: sRUWPOjbQsK8+MNnDehq1w==
X-CSE-MsgGUID: FsyHH6CHSn+s0Qq0MxKrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327133"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:43 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/14] drm/i915/hdmi: Expose DSC min/max bpp helpers
Date: Thu, 30 Jul 2026 16:22:21 +0530
Message-ID: <20260730105226.2731341-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 20 +++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 428631abca74..c58c9202fc10 100644
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
 	 * Get min bpp and max bpp as per Table 7.23, in HDMI2.1 spec
@@ -3434,8 +3444,8 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	int max_dsc_bpp, min_dsc_bpp;
 	int dsc_bpp_x16;
 
-	get_dsc_min_max_bpp(output_format, bpc, hdmi_all_bpp,
-			    &min_dsc_bpp, &max_dsc_bpp);
+	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
+				       &min_dsc_bpp, &max_dsc_bpp);
 
 	dsc_bpp_x16 = get_dsc_compressed_bpp(num_slices, slice_width,
 					     hdmi_max_chunk_bytes,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index c3a0e81615e4..dc81a62aac5e 100644
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

