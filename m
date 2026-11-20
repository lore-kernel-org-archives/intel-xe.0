Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB12606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=As3TXodD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E0E112A90;
	Fri, 20 Nov 2026 14:24:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1B4112AC1;
 Fri, 20 Nov 2026 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184632; x=1826720632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8AW2cHtUTizFzYaGem7dMwnEq0buhBT4MV8vMdSXhas=;
 b=As3TXodDO6gbJix7sx1Yp4EnAxffCcGxpMlVvVJBmq6tt7buLaJAXnQB
 DTdhxit2pHLYbqt7aQHr+WF1Bh5h9O6mpgB2EiG9kSXKCzKUZXSCSUUL+
 8P8raVU2LBUS7lDcmGpZpBddZLZK8n+UN1SJ+m7F3JARB/lxtpOeDXZcF
 +MzLzGtYpIN/ge9gTZg2qUUXt3+nZrINbeiHzbSrSjvsEgHhuaABvuRKe
 FiXIzam2JjC2xsNDuwHj61Hp6XJunb9FZj1f217J2kNJOAq4B5i/8UGNa
 8eQArHeqFUAyTEn2gq6ZIyMU+xTU2M+QsLjC1NSzGfJo6FdH4b/W3ffnp w==;
X-CSE-ConnectionGUID: nvOut4jGQ9Sf73QICUyazw==
X-CSE-MsgGUID: cJ+GDyWMRHmmwjFAt3xQXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090977"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090977"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:33 -0800
X-CSE-ConnectionGUID: ah5uOrQtS1ChTsSh6CrRuQ==
X-CSE-MsgGUID: rz8o8DbjQl2sYgYYSxNbVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422028"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:31 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 14/29] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
 bandwidth
Date: Fri, 20 Nov 2026 19:37:14 +0530
Message-ID: <20261120140729.466177-15-ankit.k.nautiyal@intel.com>
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

While configuring the PCON DSC encoder, intel_hdmi_dsc_get_bpp() picks
the highest compressed bpp that fits the sink's per-scanline chunk-bytes
limit. However it does not account for the FRL link bandwidth, so the
selected bpp can end up exceeding what the trained PCON/sink FRL link can
actually carry.

Add a parameter to limit the maximum bpp to what the link can carry. All
callers pass 0 for now, which means no limit.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 8 +++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h | 3 ++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9f6cd726af26..1b61f36adaa7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4578,7 +4578,7 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
 
 	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
 				      num_slices, output_format, bpc, hdmi_all_bpp,
-				      hdmi_max_chunk_bytes);
+				      hdmi_max_chunk_bytes, 0);
 }
 
 void
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 09c8d5b92b1c..6763275bb262 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3458,13 +3458,15 @@ get_dsc_compressed_bpp(enum intel_output_format output_format, int bpc,
  * @bpc: bits per color
  * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
  * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
+ * @max_link_dsc_bpp: max compressed bpp the link bandwidth can carry, or 0 if not limited
  *
  * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
  */
 int
 intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 		       enum intel_output_format output_format, int bpc,
-		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
+		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes,
+		       int max_link_dsc_bpp)
 {
 	int max_dsc_bpp, min_dsc_bpp;
 	int dsc_bpp_x16;
@@ -3472,6 +3474,10 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
 				       &min_dsc_bpp, &max_dsc_bpp);
 
+	/* Limit the bpp to what the link bandwidth can carry */
+	if (max_link_dsc_bpp)
+		max_dsc_bpp = min(max_dsc_bpp, max_link_dsc_bpp);
+
 	dsc_bpp_x16 = get_dsc_compressed_bpp(output_format, bpc,
 					     num_slices, slice_width,
 					     hdmi_max_chunk_bytes,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index 375f1b4decfb..acc025ae507c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -56,7 +56,8 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_format);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, enum intel_output_format output_format,
-			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
+			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes,
+			   int max_link_dsc_bpp);
 void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
 				    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp);
 bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_width,
-- 
2.50.1

