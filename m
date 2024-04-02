Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4411CCD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 13:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E7710FD2F;
	Tue,  2 Apr 2024 13:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9Hfm99s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99A810FD2F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712064614; x=1743600614;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1RAD2xVlKT7MEtxLckXtLc6u/O11uevPh+qIKF3sr6U=;
 b=j9Hfm99sWn2zWoDO0IUCrX7HWC6PP+KfdS5qGVMfZEoB9LG4SgdRcX9N
 arrRx9mUtTH+ii8kzIe1fMX70XEtdaMQI/BBlGTipeoDar0PXlTtRW+m0
 ydiLJh2TbXDgyCfZAHPi5UiXz2EAyEY3uXNa/0stENep+rqAVEFAYH60g
 fDcYXw7X8T5T+f4v8E6ltB++weZCOYEVJs/U+4lFJM6l/hQW95JkBK4sP
 h+ByZxCUmUiPH+wgx8qGlINiVkNjBwHkDFikhH3ypIgo3YyC/KGeieK/w
 /3hq/LHi+GF7lYAxuc8m2FvaJOFgrseHJD0Usi4jKmczyjsOnsBxP3Aud Q==;
X-CSE-ConnectionGUID: gcyDLr76SCGdLk3yBtW+tQ==
X-CSE-MsgGUID: 8a1z4DFuQE+3/WOdTNOZFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="29714838"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="29714838"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 06:30:14 -0700
X-CSE-ConnectionGUID: DY676JoVQySL4XeHbOVmpQ==
X-CSE-MsgGUID: 4ciQmEcmREOTgYCBo9PR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18039536"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa009.jf.intel.com with ESMTP; 02 Apr 2024 06:30:11 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/xe2: Add workaround 18034896535
Date: Tue,  2 Apr 2024 19:00:18 +0530
Message-Id: <20240402133018.118798-1-krishnaiah.bommu@intel.com>
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

Add 18034896535 as driver permanent workaround, Also reverting
16021540221 workaround since it is no longer required after 18034896535.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 74b33a3845f2..4d8e0d64cf42 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -423,8 +423,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
 	},
-	{ XE_RTP_NAME("16021540221"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
-- 
2.25.1

