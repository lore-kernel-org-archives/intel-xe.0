Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1B606A339
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DX7x68X8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C588C112AF4;
	Fri, 20 Nov 2026 14:24:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D85112AE2;
 Fri, 20 Nov 2026 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184653; x=1826720653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xCqcMG9KnXLVrGmC1A5+fy0D836q2y0laoLwVwtNITw=;
 b=DX7x68X8O7Dy/hgxB2BVm4iqxydt0J8L7z7rvYu5amECpnkt5jNBuP6c
 TwCKDUyxq1SwU1Kaj6kdiWE8wZcz3ZRBHPhxjDY0Ho80oQIH09xV5gfsw
 lxbU6GrYGSzyVLTG382tuXx+0/TBnDc4aRBQAInMw5REtiU3u8A+30VyE
 joocTsnroJd3GcSJQms8CsAF2JbOp99Is9Ss4KK9avMGuBDesGSAoWHB5
 20wfqvvd94y+UX8G/CJWTf0YnXLWLn+htMDzSSMVC7nqPGwa/tc5VonNd
 sFLvbu2oc9ruPGHiGo0FzU3VFrp08vSlnS0FEpKs79dtfVJXwPSsFbe/O A==;
X-CSE-ConnectionGUID: g3kMKsLFSZGsi+H89Mmy9g==
X-CSE-MsgGUID: XGSJQMpNRoiXv1SRol19UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091040"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091040"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:54 -0800
X-CSE-ConnectionGUID: APEkVARkQ3OcA6cZpeUFpw==
X-CSE-MsgGUID: X5hkZ6VzT2yTNOvLZ2zgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422077"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:53 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 27/29] drm/i915/dp: Pick the DSC slice count for pass-through
 within the HDMI limits
Date: Fri, 20 Nov 2026 19:37:27 +0530
Message-ID: <20261120140729.466177-28-ankit.k.nautiyal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCON passes a DSC 1.2a stream to the HDMI sink as is, so the slice
count of the DP stream has to be one the HDMI sink can decode. The DP
side picks the smallest count that satisfies the DP sink only, which can
end up outside the limits of the HDMI sink, and then the pass-through
check rejects the mode.

Fill the limits of the slice count for a pass-through stream from the
HDMI sink, so that the slice config picks a valid count. Fail the limits
computation if the HDMI sink has no valid slice count.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9898e6c6266c..2282e7e027d7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3080,7 +3080,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 
 /*
  * The stream of a PCON passing DSC through is not recompressed, so it has to
- * fit the HDMI FRL link as is. Limit the compressed bpp of the DP stream.
+ * fit the HDMI link and be one the HDMI sink can decode as is. Limit the DSC
+ * parameters of the DP stream accordingly.
  *
  * This applies only if the HDMI link needs DSC and the DP stream is a DSC 1.2a
  * stream, as passing it through is the only PCON operation possible then.
@@ -3104,6 +3105,13 @@ intel_dp_pcon_dsc_compute_passthrough_limits(struct intel_dp *intel_dp,
 				  true) == MODE_OK)
 		return true;
 
+	if (!intel_dp_pcon_dsc_hdmi_slice_limits(connector, adjusted_mode,
+						 adjusted_mode->crtc_clock,
+						 crtc_state->sink_format,
+						 &limits->dfp_dsc.min_slices,
+						 &limits->dfp_dsc.max_slices))
+		return false;
+
 	limits->link.max_bpp_x16 =
 		min(limits->link.max_bpp_x16,
 		    intel_dp_hdmi_frl_payload_bw(intel_dp, true) * 16 / adjusted_mode->crtc_clock);
-- 
2.50.1

