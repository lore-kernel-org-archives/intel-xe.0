Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF62EBFD25
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2F210E3A1;
	Mon, 13 Apr 2026 09:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1nABkfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B1010E3A1;
 Mon, 13 Apr 2026 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776072870; x=1807608870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DrLU6n0IIxKYVn+LVEpiG+PQs6YhuFefs3gRmJtMdx8=;
 b=U1nABkfO+oSxlmqose4KyKe4Csn7c1CY+F9mUYEabXLKMwpWF0ZtheQy
 9rnuYOlXgrW2MhWRHiTkyJ3DBnEY18wu8zpiKXEFa0BF9czvn4vukVGMD
 5uWkOD/ip3ue+0wFEwkk+KYGL/DRHriELBbpLsQIMHNAs4ywuWLpkJFQR
 YD9weEP0g9IVoMZpH7Or9iJZozea3PwETXZJZ1CL85pC5uQ403siL6/VV
 TWIClOIeynnF7QJ33cNXrUwmk8LN77UFzCI9s+npNH4HJqkvOSLFw1HEc
 k/sUNK0KH0LeZS6Lx3RfVqi35kagvy0ibnAZIkWQU4JWXOZIm0bLn82vp A==;
X-CSE-ConnectionGUID: NSe3GoZDRtao/RbPAqweFg==
X-CSE-MsgGUID: PUZFmoSKTHunmLvBSufmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="77073235"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="77073235"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:34:30 -0700
X-CSE-ConnectionGUID: AfM763l+Twuc72LMHc9Y1g==
X-CSE-MsgGUID: ihvbETkDTmilk3dWR+D/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="234147666"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 13 Apr 2026 02:34:29 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, uma.shankar@intel.com, imre.deak@intel.com,
 chaitanya.kumar.borah@gmail.com
Subject: [PATCH] drm/i915/dp: Fix VSC dynamic range signaling for RGB formats
Date: Mon, 13 Apr 2026 14:39:49 +0530
Message-Id: <20260413090949.1425953-1-chaitanya.kumar.borah@intel.com>
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

Cc: stable@vger.kernel.org #v5.8+
Fixes: 9799c4c3b76e ("drm/i915/dp: Add compute routine for DP VSC SDP")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15874
Assisted-by: GitHub Copilot (GPT-5.4)
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b8b6d62fb275..2b6283b4dec6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3127,8 +3127,12 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	drm_WARN_ON(display->drm,
 		    vsc->bpc == 6 && vsc->pixelformat != DP_PIXELFORMAT_RGB);
 
-	/* all YCbCr are always limited range */
-	vsc->dynamic_range = DP_DYNAMIC_RANGE_CTA;
+	if (vsc->pixelformat == DP_PIXELFORMAT_RGB)
+		vsc->dynamic_range = crtc_state->limited_color_range ?
+			DP_DYNAMIC_RANGE_CTA : DP_DYNAMIC_RANGE_VESA;
+	else
+		vsc->dynamic_range = DP_DYNAMIC_RANGE_CTA;
+
 	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 }
 
-- 
2.25.1

