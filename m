Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A1606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtVjJeCa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B75E10E854;
	Wed, 25 Nov 2026 05:18:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A00F10E05E;
 Wed, 25 Nov 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583897; x=1827119897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aOKura//W6w8F3/oTwpzgnhK7ur3FZBVTsNcKfIfFIM=;
 b=YtVjJeCa+GVg3ZpHHDGYMAguclg1QSovZq6itQzBMe70D/LFcDpWSaul
 jC4FxlD0ru0Pb0nlm8H0L+hdOBDuLmAQYFZnP9Sa4OgmnDoRKgiU+Cxxg
 huw10KHzNq6xcjEAIHrEous/jASRWv6yTxY5OnXtJxPshd4prFkF66XXA
 cHr3EVfkCxf1XGPjhyfwqMhVdYIhtu34ncHXiivzvmWPvNbsZmJrKGCzE
 zjg2N1n81VT93xmMOuRrHLaULutD8cvdzx2mbnyoz2Bgt5PlS1zbwluiG
 U69ns6eG+rIxNSh6KR45s6sEU9StIN8PmeiTPIZnOi06LYydeTOUHQB7v A==;
X-CSE-ConnectionGUID: gJq1z0+gT9CfFE5NxfjqIQ==
X-CSE-MsgGUID: BejlwGdyTg2nJfXQd7AFRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4334179"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4334179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:17 -0800
X-CSE-ConnectionGUID: q0p95HZURkaKS04soKN2Yw==
X-CSE-MsgGUID: SlezacB2TXaISdgiXi9yIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12092997"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:15 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 6/7] drm/i915/hdmi: Add helper to check if DSC chunksize fits
 the sink limits
Date: Wed, 25 Nov 2026 10:32:30 +0530
Message-ID: <20261125050231.1942380-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125050231.1942380-1-ankit.k.nautiyal@intel.com>
References: <20261125050231.1942380-1-ankit.k.nautiyal@intel.com>
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
index 3321b673b3b6..027a337ad8b8 100644
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

