Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECCBE73144
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 08:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78610E24D;
	Mon,  2 Feb 2026 08:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRVS1849";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B610E24D;
 Mon,  2 Feb 2026 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020308; x=1801556308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+k/0STxU0zkzGCd/LIvDwgo89qL3gKic9g794TIXoQ=;
 b=dRVS184960qElaNIuk9AjN9Nf9Eft3P453WOtoWEqaFAq/VPsumY6q6l
 RkbeNMT7pa8ISXnhLSwGVrYSw1XxQRilnwNmoeJCcHIMQgjSSzreq+AL9
 YdyUN5CCX9jOZUWcRjckEfLT9X8KpLZFgnuJbCqtsDPJ1nI2QRU7Bv82d
 h95N6SHVnQPeSt1aGFn1lI74pqc603S1krsZCws36UL2/snbnZ23XRRGa
 94Xb4AC/iDkzPSk6nyP4SCH4kciabzMBAJPe3lI2jnoCaLOZRd7D4+dd0
 Chdn5C4KgSuc4d4tC1tg4bRsBJkPASjt3m09B87bQPNEGxmfomFazNndw w==;
X-CSE-ConnectionGUID: 6pu2ta1RRwu1xnmK/9ybpA==
X-CSE-MsgGUID: XS61jFMCQE+AAxzvNmBrMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81804930"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="81804930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:18:27 -0800
X-CSE-ConnectionGUID: j61cidJvTTWO22eCrSZp5Q==
X-CSE-MsgGUID: fhAjQaIRRh2LHiATbw9K1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213920319"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2026 00:18:25 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3] drm/i915/dp: Add a meaningful return to
 intel_dp_read_dsc_dpcd
Date: Mon,  2 Feb 2026 13:48:02 +0530
Message-Id: <20260202081801.1400708-1-suraj.kandpal@intel.com>
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

V2 -> V3:
-No need for the extra drm_err (Ankit)

 drivers/gpu/drm/i915/display/intel_dp.c | 31 +++++++++++++++----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 79fd3b8d8b25..380d9801c377 100644
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
@@ -4345,8 +4349,9 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
 
-	intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
-			       connector->dp.dsc_dpcd);
+	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				   connector->dp.dsc_dpcd) < 0)
+		return;
 
 	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
 			      &connector->dp.fec_capability) < 0) {
@@ -4376,7 +4381,9 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
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

