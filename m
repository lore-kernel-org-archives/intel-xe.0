Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE81606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkLmdlYh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FA8112AC0;
	Fri, 20 Nov 2026 14:23:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851DF10E8FD;
 Fri, 20 Nov 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184625; x=1826720625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0UP3rfg6jYSaz2dCLRThePSLDXQ6vxbq22UDHpG0ujg=;
 b=mkLmdlYh4k699xZ2WQWQalPzBQAx6ghHA52zXN/8WHiXUg8GrWxRskFZ
 Nu5bhklHXVbXxeb4pGS/JIXP8DAvfKNNB8X6b7qc7UPo8Cdb/TRaOV79D
 fBRCkiWQapBa+2Z3TOmrb8da71/EVREj8Uu/FvAmmgWlOgnDhJVCF4GZj
 LpLopW2swjLy7tuEJvL+8/jz1ULR4ma+XhaBCsf7ZZ3joAIms49RXHZ07
 rDIssxKqM6P08DDbT1ODQNagBOq4nIzgQVomfwTH4coiQX05XGhnW4/5Z
 zjJulqQeSR30TA0HISWHYbvMzCVcPQJr+grlBPGJi0apMJWUY6tVlwdhD g==;
X-CSE-ConnectionGUID: 9oNHTHVxT9K2Te/qWhWKuw==
X-CSE-MsgGUID: L2DewmfZSjOV6y5Pav2x/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090959"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090959"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:28 -0800
X-CSE-ConnectionGUID: osXt7iHwQFydbvPgAa8sjw==
X-CSE-MsgGUID: 6ZdPnTXsR+ylnGQti8revg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422017"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:26 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 11/29] drm/dp: Add a helper to disable the PCON DSC encoder
Date: Fri, 20 Nov 2026 19:37:11 +0530
Message-ID: <20261120140729.466177-12-ankit.k.nautiyal@intel.com>
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

The DSC encoder of a PCON is enabled through DPCD 3052h[1], together
with an optional PPS override in DPCD 3052h[3:2]. The existing helpers
only ever set these bits.

Add a helper to clear both, so that a driver can switch the encoder off
when the PCON does not need to encode the stream.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 23 +++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 2b6ce05556b0..e810addf52bc 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4161,6 +4161,29 @@ int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6])
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
 
+/**
+ * drm_dp_pcon_dsc_enc_disable() - Disable the DSC encoder of a PCON
+ * @aux: DisplayPort AUX channel
+ *
+ * Disable the DSC encoder of a PCON, along with the encoder PPS override.
+ *
+ * Returns 0 on success, else returns negative error code.
+ */
+int drm_dp_pcon_dsc_enc_disable(struct drm_dp_aux *aux)
+{
+	u8 buf;
+	int ret;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
+	if (ret < 0)
+		return ret;
+
+	buf &= ~(DP_PCON_ENABLE_DSC_ENCODER | DP_PCON_ENCODER_PPS_OVERRIDE_MASK);
+
+	return drm_dp_dpcd_write_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
+}
+EXPORT_SYMBOL(drm_dp_pcon_dsc_enc_disable);
+
 /*
  * drm_dp_pcon_convert_rgb_to_ycbcr() - Configure the PCon to convert RGB to Ycbcr
  * @aux: displayPort AUX channel
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index f497c9f3a550..32c95f657631 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -1019,6 +1019,7 @@ int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE
 int drm_dp_pcon_pps_default(struct drm_dp_aux *aux);
 int drm_dp_pcon_pps_override_buf(struct drm_dp_aux *aux, u8 pps_buf[128]);
 int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6]);
+int drm_dp_pcon_dsc_enc_disable(struct drm_dp_aux *aux);
 bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 					       const u8 port_cap[4], u8 color_spc);
 int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
-- 
2.50.1

