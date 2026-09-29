Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AA0CA5FB1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E1310EE58;
	Tue, 29 Sep 2026 11:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LawobCUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4490C10EE61;
 Tue, 29 Sep 2026 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679917; x=1822215917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PEKi3h44BqKvUO2Z+ovyha4YMna/hsKsF6W4agtwR9o=;
 b=LawobCUsw/r1FxAaugz/knQpx7W46es5H6SsH8JdEaUEnuCgp9RxzGYj
 Fs+oRHbQlpkaC6pMcdGcM4LHYNvcbPjImBcPkWIZezOtbFOCSWDcV62X0
 +Q7GYDm4TqGt4PRaWew2GcNOD5PyJrkYkN1jxTC09a0cPC5Q0C13QoHds
 qcnuMh15T565+Z8K7RUb78sLGQu7PYv46lBP9OLKW7JKd54WhGGK/vNb8
 MSFpoi37i+qdWDs8gZS/VXJ2tFJlS9yNfCRm+nqzaO+Voa/p2PS0uTFW7
 im4hxp6+KXCsuaDQRYYXbJb/EohPM0YHEvytM+hUTpoFPJImNzaKeMpH0 g==;
X-CSE-ConnectionGUID: GW+W03W6SY6Ozo9qfA85mg==
X-CSE-MsgGUID: 0whPKRIXQW2L3ARphM/WuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295503"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:05 -0700
X-CSE-ConnectionGUID: +7gtI8TWQ+uuqB7dpU12iQ==
X-CSE-MsgGUID: TkEQZW0pQmW3X5DRgmxrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887352"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:04 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 06/10] drm/i915/hdmi: Add helper to check if DSC chunksize
 fits the sink limits
Date: Tue, 29 Sep 2026 16:18:31 +0530
Message-ID: <20260929104835.1050882-7-ankit.k.nautiyal@intel.com>
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

Introduce the helper intel_hdmi_dsc_bpp_fits_chunk_bytes() to check
whether the chunksize computed for the given slice configuration is with
in the sink's max chunksize limits.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 25 ++++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index bee2ea570ca9..a15dee6ef329 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3369,11 +3369,30 @@ intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
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
@@ -3408,8 +3427,8 @@ get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes
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
index 3ab75ef4836e..db87656eb27f 100644
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

