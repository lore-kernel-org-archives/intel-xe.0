Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E1DD35673
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 04:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6500B10E0FD;
	Wed, 28 Jan 2026 04:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1GKTSv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4699310E0FD;
 Wed, 28 Jan 2026 04:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769575763; x=1801111763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lo0h5NhuLOt77WQoxnmuqftAr6zGsioJ6+YxyiwPHJ0=;
 b=M1GKTSv05EdVGWPHQR5labMgvWIKt9teIhfog41zE+cnzB/tL0iAEUDf
 BI9XSNiia8wD9ShAE+m3hVPR8TV2M1KzS4f/dMCvzE9nAkif0wkljlYAv
 IKVMYx6ivozcuuo8b0PiSvPI5fjt0L7d4c0boQfJDqvfOof2Kp0/OZO5C
 tXA0o1IbSZA+EMlZ3mOYcMu6JpxmHT+lXCMO0O2zs19cXdH3cd+ORzBFs
 sFzXZN3+zL3/YKjvY9DwEhlFUFh+R4cxERDdJpbTCGpmCcal1Z77UCRj9
 7FhDoQmMef4mXKgy3IsPOj1sTeGK5DLMarPMzY462kWxWeE03TkcrPjEt g==;
X-CSE-ConnectionGUID: WOcKTQhtRUi30iPggHHzIA==
X-CSE-MsgGUID: Sxu7HjbtSnuVWRe23AjfLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82211975"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82211975"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 20:49:23 -0800
X-CSE-ConnectionGUID: izKETlabSta83ucD2hoTnA==
X-CSE-MsgGUID: QIZbab4uThyHcQr0gxUeyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207786781"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 27 Jan 2026 20:49:21 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/dp: Add a meaningful return to intel_dp_read_dsc_dpcd
Date: Wed, 28 Jan 2026 10:19:05 +0530
Message-Id: <20260128044904.1293185-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a meaningful return to intel_dp_read_dsc_dpcd so tha we avoid
unwanted DPCD reads which are not needed once we know DSC DPCD
read fails. While we are at it remove the drm_err since we do not
shout error during intel_dp_detect phase since it may take time
to come up after pps_on is called for eDP scenario.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 79fd3b8d8b25..d2ed8ec145a2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4281,20 +4281,21 @@ static bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
 	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
 }
 
-static void intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
-				   u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
+static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
+				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 {
 	if (drm_dp_dpcd_read(aux, DP_DSC_SUPPORT, dsc_dpcd,
 			     DP_DSC_RECEIVER_CAP_SIZE) < 0) {
-		drm_err(aux->drm_dev,
-			"Failed to read DPCD register 0x%x\n",
-			DP_DSC_SUPPORT);
-		return;
+		drm_dbg_kms(aux->drm_dev,
+			    "Could not read DSC DPCD register 0x%x\n",
+			    DP_DSC_SUPPORT);
+		return -EINVAL;
 	}
 
 	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
 		    DP_DSC_RECEIVER_CAP_SIZE,
 		    dsc_dpcd);
+	return 0;
 }
 
 static void init_dsc_overall_throughput_limits(struct intel_connector *connector, bool is_branch)
@@ -4345,8 +4346,11 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
 
-	intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
-			       connector->dp.dsc_dpcd);
+	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				   connector->dp.dsc_dpcd) < 0) {
+		drm_err(display->drm, "Failed to read DSC DPCD register\n");
+		return;
+	}
 
 	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
 			      &connector->dp.fec_capability) < 0) {
@@ -4376,7 +4380,9 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
 	if (edp_dpcd_rev < DP_EDP_14)
 		return;
 
-	intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux, connector->dp.dsc_dpcd);
+	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				   connector->dp.dsc_dpcd) < 0)
+		return;
 
 	if (connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
 		init_dsc_overall_throughput_limits(connector, false);
-- 
2.34.1

