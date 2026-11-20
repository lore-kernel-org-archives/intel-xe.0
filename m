Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DD7606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TLPY4FsU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D1C112AB1;
	Fri, 20 Nov 2026 14:23:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77F3112A9F;
 Fri, 20 Nov 2026 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184600; x=1826720600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aOKura//W6w8F3/oTwpzgnhK7ur3FZBVTsNcKfIfFIM=;
 b=TLPY4FsUcxaGR/LERzJGRhOgPLh+4u4dpZjHLz4yJno3i2l5Yvkl51lT
 w/Hcri2t0a+ntnSNTO3W0IffOX8LCsWiTmYMA+rP3jeNY+B5dGjswCucO
 4M+LCUreDHKLEB6r+10vdw6irvBxoNQLECuM0bv+lM/zL1XDauNubNG7a
 wiVYcF2sNeSjx/SgUyVgnVK3WyW0iVWE1fEWZB4pPnpzjKtm+9npQKMbI
 /gY7cGcKiwrKTgPLeb9PUiohADqCu20dqf30sn2gUQGc1jiy8uUCdSho7
 nTTWUFBZ120lQE70LIjhBgxxpAYV4ixqgBR/wO26BNuphZPJisFKZ/phS Q==;
X-CSE-ConnectionGUID: TeTm4SsKSFuHJ505bSJ6rQ==
X-CSE-MsgGUID: lh5Mv/EBQuWtC5CjTbY00Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090921"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090921"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:19 -0800
X-CSE-ConnectionGUID: WOzLVbg+T2at7xWKl9KeWg==
X-CSE-MsgGUID: +xJidTXSQyKnTjLtq0pDRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422000"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:18 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 06/29] drm/i915/hdmi: Add helper to check if DSC chunksize
 fits the sink limits
Date: Fri, 20 Nov 2026 19:37:06 +0530
Message-ID: <20261120140729.466177-7-ankit.k.nautiyal@intel.com>
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

