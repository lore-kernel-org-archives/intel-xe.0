Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEC8CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414E010EF71;
	Thu,  7 May 2026 01:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLwoLYok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CEC10EF6E;
 Thu,  7 May 2026 01:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117559; x=1809653559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K4yp/cNMoIpD7CkAwHZTwF+x4IXDbBnGuQ1ot/iqFp4=;
 b=jLwoLYokXsGd+yEBDrN5bDw8h+zrKq5igffdEyxWO6MEXsUTeIvU0YUl
 bSsEtTEt3IdoQRID4hKs6rJdJCFBENmRLnxsHTTUqPFNwxl756wNkvhwG
 TMGOjGXNNtfiF0iD7LOJjfFPaQ5SZ6LRCLn5na0Gzq3MozCnv8/xHfryO
 aTHGGfPQP3griVEGyaPbHoz8TR4kvu6b5AAYAraJiviRGDzU0I2wud438
 RT4WziA3aYGQ7yNLYJ6fX8MBh/We8Meio0S5z5Xie4uN1JfoM5wnZVMBj
 g8TOOuoiJr/pQGDYcMvaOl1Gcpnsf4mSaXdUVGVeyvyB4a4e9fXfAfJSF g==;
X-CSE-ConnectionGUID: g4QePkraT+unfwuQcM3SGQ==
X-CSE-MsgGUID: fJG2H9cBQZ2+99AM/7tZ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089073"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089073"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:39 -0700
X-CSE-ConnectionGUID: 5tBEBPWJTg2DghHuk3rSHg==
X-CSE-MsgGUID: RnH71mOgQrOcCdPm6rBHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692918"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:38 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 31/31] drm/i915/buf_trans: enumerate JSL's VS/PE-O indices
Date: Thu,  7 May 2026 03:31:37 +0200
Message-ID: <20260507013137.527510-32-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Encapsulate JSL's VS/PE-O's indices in enum jsl_vspeo_index.

Use index of -1 as an indication of error case. Refer to it as JSL_ERR.

1st VS/PE-O's table is used for external DP. Use it also if eDP does not
use low vswing. Use it as well when eDP uses low vswing but supports
HBR3. Refer to it as JSL_COMBO_DP_DEF.

2nd table is used for eDP using low vswing and supporting HBR2. Refer to
it as JSL_COMBO_EDP_HBR2.

3rd table is used for eDP using low vswing and supporting modes lower
than HBR2. Refer to it as JSL_COMBO_EDP_HBR.

Indices for other tables have not yet been observed to be used as of
now.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |  8 ++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index a38e74aaca1f7..57923044cfe3d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1786,29 +1786,29 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
-static int
+static enum jsl_vspeo_index
 jsl_compute_index(struct intel_encoder *encoder,
 		  const struct intel_crtc_state *crtc_state)
 {
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
 		if (use_edp_low_vswing(encoder)) {
 			if (crtc_state->port_clock > 540000)
-				return 0;
+				return JSL_COMBO_DP_DEF;
 			else if (crtc_state->port_clock > 270000)
-				return 2;
+				return JSL_COMBO_EDP_HBR2;
 			else
-				return 1;
+				return JSL_COMBO_EDP_HBR;
 		}
 	}
 
 	if (intel_crtc_has_dp_encoder(crtc_state))
-		return 0;
+		return JSL_COMBO_DP_DEF;
 
 	drm_WARN(to_intel_display(crtc_state)->drm, 1,
 		 "non-DP (%d) encoder asks to compute VS/PE-O index\n",
 		 crtc_state->output_types);
 
-	return -EINVAL;
+	return JSL_ERR;
 }
 
 static enum ehl_vspeo_index
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
index aa2a47445af76..f2706ab53f6de 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
@@ -115,6 +115,14 @@ enum ehl_vspeo_index {
 	EHL_COMBO_EDP_HBR3
 };
 
+enum jsl_vspeo_index {
+	JSL_ERR = -1,
+
+	JSL_COMBO_DP_DEF = 0,
+	JSL_COMBO_EDP_HBR,
+	JSL_COMBO_EDP_HBR2
+};
+
 bool is_hobl_buf_trans(const struct intel_ddi_buf_trans *table);
 
 void intel_ddi_buf_trans_init(struct intel_encoder *encoder);
-- 
2.45.2

