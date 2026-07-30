Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A44C55167
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C936310EEF2;
	Thu, 30 Jul 2026 11:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyTikdyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD21210EEDE;
 Thu, 30 Jul 2026 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409788; x=1816945788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QY2+SlbNUP6hZrmTI8Mtnl2oNAigL6HWaZw1rfdd5Hg=;
 b=ZyTikdyUL77/r7TWnMR0pyAsJblLDB4+t8kPjozAY6o8/Y5AwGUb6+P9
 BNYK6SL1sAlRhabiJJwOgV8LSvx1wRMINQcGICSj3d2hhKfH19n//wQJf
 lWNGUPVo0ht2vMOINK7KcelA+avQIntO2/zaBqKwktuDvywAObRj1lBYj
 sv9en0gTSO4kg2mCMsRULa0OxH4gtFD40S3hbD1mxmIQyKQ4J9XfHyixx
 FMGSYPcSgEmgjwsgSE1rsYh2lWvxOL9q0Tgf5tW04xVG8z2Th8akDPUln
 xhJTUf3vPNlHPtHMb3RAEQ1Gjc7vsvf7JnLQ8F8nYv700hMgUAdbsnPGA Q==;
X-CSE-ConnectionGUID: 4azvFTFxREagOz4muKVtTw==
X-CSE-MsgGUID: 3iSm7syfRHa/b94jrwyNNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182430"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:48 -0700
X-CSE-ConnectionGUID: vV8s2aM5TKyOujvwvFFaeA==
X-CSE-MsgGUID: irK1ZE6RReGvJ7fvvuBgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327149"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:45 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/14] drm/i915/hdmi: Add helper to check if DSC chunksize
 fits the sink limits
Date: Thu, 30 Jul 2026 16:22:22 +0530
Message-ID: <20260730105226.2731341-11-ankit.k.nautiyal@intel.com>
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

Introduce the helper intel_hdmi_dsc_bpp_fits_chunk_bytes() to check
whether the chunksize computed for the given slice configuration is with
in the sink's max chunksize limits.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 25 ++++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c58c9202fc10..c26a3d0b2d2e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3370,11 +3370,30 @@ intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
 		*max_dsc_bpp = min(*max_dsc_bpp, 12);
 }
 
+/*
+ * intel_hdmi_dsc_bpp_fits_chunk_bytes - check if a given compressed bpp keeps
+ * the per-scanline chunk size within the sink's max_chunk_bytes limit.
+ *
+ * @bpp: compressed bits per pixel to test
+ * @num_slices: num of slices supported by the source and sink
+ * @slice_width: dsc slice width supported by the source and sink
+ * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
+ *
+ * @return: true if the resulting chunk size fits the sink limit
+ */
+bool
+intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_width,
+				    int hdmi_max_chunk_bytes)
+{
+	int target_bytes = DIV_ROUND_UP((num_slices * slice_width * bpp), 8);
+
+	return target_bytes <= hdmi_max_chunk_bytes;
+}
+
 static int
 get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes,
 		       int src_fractional_bpp, int min_dsc_bpp, int max_dsc_bpp)
 {
-	int target_bytes;
 	bool bpp_found = false;
 	int bpp_decrement_x16;
 	int bpp_target;
@@ -3409,8 +3428,8 @@ get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes
 		int bpp;
 
 		bpp = DIV_ROUND_UP(bpp_target_x16, 16);
-		target_bytes = DIV_ROUND_UP((num_slices * slice_width * bpp), 8);
-		if (target_bytes <= hdmi_max_chunk_bytes) {
+		if (intel_hdmi_dsc_bpp_fits_chunk_bytes(bpp, num_slices, slice_width,
+							hdmi_max_chunk_bytes)) {
 			bpp_found = true;
 			break;
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index dc81a62aac5e..e7d0cd5bc293 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -59,6 +59,8 @@ int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
 void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
 				    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp);
+bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_width,
+					 int hdmi_max_chunk_bytes);
 int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 				  enum intel_output_format output_format,
 				  int src_max_slices, int src_max_slice_width,
-- 
2.50.1

