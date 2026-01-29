Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECBFD3566C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 04:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A54210E1F4;
	Thu, 29 Jan 2026 04:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1T8+xta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6412B10E1F4;
 Thu, 29 Jan 2026 04:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769660329; x=1801196329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USE6LafXa09gCWuWsT7cVe0vIunkLfSv7TGpm+jbBeE=;
 b=l1T8+xtaIMltf0oOIB/wh2npDtNPffgEatbwg0TZMRv39NqgF8X2LJdL
 QokUPLXu1RJUP9mWdZnHefNERzTbFRo60lljh4r5//D21LZLTmPmBYoqW
 T+EwJrnGRiy/4YyUtAmNySG2hsAmIrEeRtLyrFQVrfB4WZGYoZiOoMhsV
 Lzxif5cJhZYH06gwfAoZcGXK0+BInWzAu1UI6P58OKJU0v3zrA6qdK3rp
 8Ka53ltixjHewXqvmPJ0B2XDVFt+F3WqF73uJlBh3RM3OChBcPBHi9xNb
 KWWUabLLaJvK60ui2DreS1Eq0SPzcWlkPEcWWplLg1Y7D1JfQNjPnneFa g==;
X-CSE-ConnectionGUID: TmcB2H7jRdq7Q48XxjziwQ==
X-CSE-MsgGUID: CYnyQ7/ERkS08DOQOVwdeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69902653"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69902653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 20:18:49 -0800
X-CSE-ConnectionGUID: 2bUshlg+R8C06GH6IMBV2Q==
X-CSE-MsgGUID: yHqzQxjyST6xP7f95l0jUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208055623"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2026 20:18:47 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2] drm/i915/dp: Add a meaningful return to
 intel_dp_read_dsc_dpcd
Date: Thu, 29 Jan 2026 09:48:17 +0530
Message-Id: <20260129041816.1332954-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128044904.1293185-1-suraj.kandpal@intel.com>
References: <20260128044904.1293185-1-suraj.kandpal@intel.com>
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

Add a meaningful return to intel_dp_read_dsc_dpcd. This is to avoid
unwanted DPCD reads which are not needed once we know DSC DPCD
read fails. To do this convert drm_dp_dpcd_read to drm_dp_dpcd_read_data
which returns a meaningful error which can be propogated up when all
bits are not read.
While we are at it convert the drm_err in intel_dp_read_dsc_dpcd to
drm_dbg_kms. This is because we do not want a hard ERROR when we
call this function, during the intel_dp_detect phase since AUX may not
be up, it is expected to fail but we do not expect a failure in read
when we call intel_dp_dsc_get_sink_cap so we move the drm_err there.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
V1 -> V2:
-Commit message fixup (Jani)
-Convert drm_dp_dpcd_read to drm_dp_dpcd_read_data (Jani)
-Propogate the error sent by drm_dp_dpcd_read_data up (Jani)
-Use %pe and ERR_PTR() to log the extact error (Jani)

 drivers/gpu/drm/i915/display/intel_dp.c | 33 ++++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 79fd3b8d8b25..ec277dcb24bc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4281,20 +4281,24 @@ static bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
 	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
 }
 
-static void intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
-				   u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-{
-	if (drm_dp_dpcd_read(aux, DP_DSC_SUPPORT, dsc_dpcd,
-			     DP_DSC_RECEIVER_CAP_SIZE) < 0) {
-		drm_err(aux->drm_dev,
-			"Failed to read DPCD register 0x%x\n",
-			DP_DSC_SUPPORT);
-		return;
+static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
+				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
+				    DP_DSC_RECEIVER_CAP_SIZE);
+	if (ret) {
+		drm_dbg_kms(aux->drm_dev,
+			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
+			    DP_DSC_SUPPORT, ERR_PTR(ret));
+		return ret;
 	}
 
 	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
 		    DP_DSC_RECEIVER_CAP_SIZE,
 		    dsc_dpcd);
+	return 0;
 }
 
 static void init_dsc_overall_throughput_limits(struct intel_connector *connector, bool is_branch)
@@ -4345,8 +4349,11 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
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
@@ -4376,7 +4383,9 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
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

