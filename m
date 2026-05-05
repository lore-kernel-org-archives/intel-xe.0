Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64757FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 09:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F4F10EA16;
	Tue,  5 May 2026 09:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdmNz7MT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11310EA16;
 Tue,  5 May 2026 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777973631; x=1809509631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zC85hwRfuu/eBQfcZfR1bL5Fss7ScSU6b2YmZVq7/+c=;
 b=WdmNz7MT91BEak6ik5ZbJRNgAS1VdyVbHSd8UGWC0g0Y6Pmwatxb4sTX
 HFUQl6Ke8oLO/w4570tcrWnS5ZNMdLyV0yWc2ZPsGzbrXCgkz7NcUMwkz
 FQ/VDiFahzzCAJeeZWZApFgpZqiGEbm9s1KQmEJ8VJGHIEtD62qS1BPnO
 GQdTOzX2AUjH1Epl+YiCClEmdleaFRL663ypzlhVUICjYAxJ050UGqbTh
 ho+kgIQQL33H3mzWbFC61+DJouc9ASgVReT5mof42ZM+UKuYdgx16ggZV
 eXXisvoRw5IwqgJd3Tdy1v1vXXi56+z79reM1kOoKSVWEaYexptPf7TAN w==;
X-CSE-ConnectionGUID: r63gVZwMQNakGC9KxvpSkA==
X-CSE-MsgGUID: tB16RGEMTwy8uQYPn9Pa3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78889688"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78889688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:33:51 -0700
X-CSE-ConnectionGUID: T1BvX/UeStKHKMntSqpvDg==
X-CSE-MsgGUID: GHyA6LkjRPyLNrVcee55zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="273915241"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 05 May 2026 02:33:49 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, uma.shankar@intel.com, imre.deak@intel.com,
 chaitanya.kumar.borah@gmail.com, stable@vger.kernel.org,
 suraj.kandpal@intel.com
Subject: [PATCH v3] drm/i915/dp: Fix VSC dynamic range signaling for RGB
 formats
Date: Tue,  5 May 2026 14:39:20 +0530
Message-Id: <20260505090920.2479112-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

For RGB, set dynamic_range to CTA or VESA based on
crtc_state->limited_color_range so sinks apply correct
quantization. YCbCr remains limited (CTA) range.
(DP v1.4, Table 5-1)

v2:
- Added Reported-by and Tested-by tags

v3:
- Add back YCbCr comment(Suraj)

Cc: stable@vger.kernel.org #v5.8+
Reported-by: DeepChirp <DeepChirp@outlook.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15874
Tested-by: DeepChirp <DeepChirp@outlook.com>
Fixes: 9799c4c3b76e ("drm/i915/dp: Add compute routine for DP VSC SDP")
Assisted-by: GitHub Copilot (GPT-5.4)
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 98df93884e9a..c1279afe0224 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3163,8 +3163,13 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	drm_WARN_ON(display->drm,
 		    vsc->bpc == 6 && vsc->pixelformat != DP_PIXELFORMAT_RGB);
 
-	/* all YCbCr are always limited range */
-	vsc->dynamic_range = DP_DYNAMIC_RANGE_CTA;
+	if (vsc->pixelformat == DP_PIXELFORMAT_RGB)
+		vsc->dynamic_range = crtc_state->limited_color_range ?
+			DP_DYNAMIC_RANGE_CTA : DP_DYNAMIC_RANGE_VESA;
+	/* All YCbCr formats are always limited range. */
+	else
+		vsc->dynamic_range = DP_DYNAMIC_RANGE_CTA;
+
 	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 }
 
-- 
2.25.1

