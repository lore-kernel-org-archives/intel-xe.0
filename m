Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12282606A33F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUDeCFw/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC6310E1AF;
	Tue, 17 Nov 2026 10:58:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACF810E1AF;
 Tue, 17 Nov 2026 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794913123; x=1826449123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pr7V/DXejbzHpiSoOM6iUD7QIlBLG+ceiiMRelmecME=;
 b=iUDeCFw/6Z7nOPpkem4Rx/GZ2DNKBNyxFsMF1SDVScJskaACfSlOxH1I
 05OfBpxE1FgQwDtl7GIA1ExNYD1F6iQrYHIy4+3/Kfv7M/jDT29NWIuZF
 nGxLIo14RkRLyh8eeQhtPqvmFA5eq21V7rpKRNwECJ3TAT2lmB4OeQA+P
 FJC28Um+udzR5MLVHC8A0BB7RXpTICpE3OMS9kp8MRFvJGtBvqsjdn1XT
 q7hvvYFYVXZu9tfSxfLTjmGeewkqEPjwXsWrtQtJZ2l+40vDGBdfgUmiC
 eg/RjhOxErvcw7MSQIMSmg1uFcbBL8PZrBwBwZ699vsbJGKNzZLtDATNX A==;
X-CSE-ConnectionGUID: tnfd/QDLTrWc2Bd9yLG40g==
X-CSE-MsgGUID: zHi23U4USLWQwp1wjPzggg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3672399"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3672399"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 02:58:40 -0800
X-CSE-ConnectionGUID: eKsHC0V5SqyV2MobWAdaZw==
X-CSE-MsgGUID: pGeuSfDgQrO+N9dMPX7ZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9813792"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by orviesa002.jf.intel.com with ESMTP; 17 Nov 2026 02:58:36 -0800
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] drm/i915/dp: Extend HDR mode to HLG
Date: Tue, 17 Nov 2026 16:18:07 +0530
Message-ID: <20261117104808.2023577-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
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

intel_dp_in_hdr_mode() only recognizes the SMPTE ST 2084 (PQ) EOTF.
Extend it to treat BT.2100 HLG as HDR.

The eDP HDR backlight interface in intel_dp_aux_backlight.c
uses the same check, and its TCON can only decode ST 2084
set INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE only for a PQ
output and clear it otherwise, so that the panel doesn't decode HLG
signal as PQ.

Suggested-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c               |  5 ++++-
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797618..adaa8fb25732 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3388,17 +3388,20 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 	}
 }
 
+/* True for both HDR transfer functions, SMPTE ST 2084 (PQ) and BT.2100 HLG. */
 bool
 intel_dp_in_hdr_mode(const struct drm_connector_state *conn_state)
 {
 	struct hdr_output_metadata *hdr_metadata;
+	u8 eotf;
 
 	if (!conn_state->hdr_output_metadata)
 		return false;
 
 	hdr_metadata = conn_state->hdr_output_metadata->data;
+	eotf = hdr_metadata->hdmi_metadata_type1.eotf;
 
-	return hdr_metadata->hdmi_metadata_type1.eotf == HDMI_EOTF_SMPTE_ST2084;
+	return eotf == HDMI_EOTF_SMPTE_ST2084 || eotf == HDMI_EOTF_BT_2100_HLG;
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index dc2f0f3088a9..fa68cc6803a6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -284,8 +284,16 @@ intel_dp_aux_fill_hdr_tcon_params(const struct drm_connector_state *conn_state,
 	 * HDR mode.
 	 */
 	if (intel_dp_in_hdr_mode(conn_state)) {
+		const struct hdr_output_metadata *hdr_metadata =
+			conn_state->hdr_output_metadata->data;
+
 		*ctrl |= INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_ENABLE;
-		*ctrl |= INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
+
+		/* The TCON can only decode SMPTE ST 2084 (PQ), not HLG. */
+		if (hdr_metadata->hdmi_metadata_type1.eotf == HDMI_EOTF_SMPTE_ST2084)
+			*ctrl |= INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
+		else
+			*ctrl &= ~INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
 	}
 
 	if (DISPLAY_VER(display) < 11)
-- 
2.45.2

