Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109B606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IvSFoSWh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E658112ACF;
	Fri, 20 Nov 2026 14:24:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6402C112AC4;
 Fri, 20 Nov 2026 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184633; x=1826720633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F1QOls99GkVN6XdHUeJLgrjNQ45bGuJKEO/PJDgHuxQ=;
 b=IvSFoSWhzbqhacTQqS1SHJZMrd4V5Lu35t2GEDKpiUYh/L0sYEB5kIKN
 hQS/v3tE1Kh5wUPTreXtSaaftmWT0tlTeCnYAdTxo0eL8fkb6jquDJkT4
 hHC9eV2PwCytsov4ySD2+mAOVk+6uQW51qWgbotpYyf7l50n1SdVXTz6+
 arh/M16buuDp5Ha0ppMbGKOp1iNJly0zwH6efUbyS5eC2m1ZeXlIC6VXc
 wrS0/mjdBXpQeRDxIvp6QQxz5+evD/T7dlMV/2NidHOI8dRQCCgcCLsPk
 A2sZf75pw5Os7eWOBLcoT/E64MYp9uc6VCrE4YTQO9iWaHq9H2EC7QsRY w==;
X-CSE-ConnectionGUID: ms/+p0U8SAyO/1YMIvcSLg==
X-CSE-MsgGUID: NPr+5ryqS2iCvChncGzi6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090987"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090987"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:36 -0800
X-CSE-ConnectionGUID: kJMc44WITkWqqiaO3sdNBg==
X-CSE-MsgGUID: QvJIxLXiQ4ajwSmukcPEcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422035"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:35 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 16/29] drm/i915/dp: Add a helper for the FRL payload bandwidth
Date: Fri, 20 Nov 2026 19:37:16 +0530
Message-ID: <20261120140729.466177-17-ankit.k.nautiyal@intel.com>
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

The payload bandwidth of the HDMI FRL link is limited by both the PCON
and the HDMI 2.1 sink. Add a helper for it, so that the following
changes can use it as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 14df2cebd17c..07ce99829303 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1190,6 +1190,18 @@ static int frl_required_bw(int clock, int bpc,
 	return clock * bpc * 3;
 }
 
+/*
+ * Both the PCON and the HDMI 2.1 sink limit the FRL rate. FRL uses 16b/18b
+ * line coding, so only 16/18 of the raw rate carries payload. Returns kbps.
+ */
+static int intel_dp_hdmi_frl_payload_bw(struct intel_dp *intel_dp)
+{
+	int max_frl_rate = min(intel_dp->dfp.pcon_max_frl_bw,
+			       intel_dp_hdmi_sink_max_frl(intel_dp));
+
+	return max_frl_rate * 1000000 * 16 / 18;
+}
+
 static enum drm_mode_status
 intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 		      int bpc, enum intel_output_format sink_format,
@@ -1204,14 +1216,7 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	target_bw = frl_required_bw(target_clock, bpc, sink_format);
 
 	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
-	max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
-			 intel_dp_hdmi_sink_max_frl(intel_dp));
-
-	/*
-	 * Convert the rate from Gbps to kbps. FRL uses 16b/18b line coding, so
-	 * only 16/18 of the raw rate carries payload.
-	 */
-	max_frl_bw = max_frl_bw * 1000000 * 16 / 18;
+	max_frl_bw = intel_dp_hdmi_frl_payload_bw(intel_dp);
 
 	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
 	if (target_bw > max_frl_bw)
-- 
2.50.1

