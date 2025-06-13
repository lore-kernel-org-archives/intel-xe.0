Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E46DC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556310E9A6;
	Fri, 13 Jun 2025 19:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7nzurOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84C10E5F9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843116; x=1781379116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rksVA4nsv9sxAe8WRmIyRB1qFaIDAJk163M5Pw0FQIA=;
 b=W7nzurOd14C2JYmMGkkDlfPBH5lGSiyBNps9f/FazuE0uqjIi/2OV+ja
 1NvTb0s0RlnFdfksw8c1Px2eB7j7U/y7lRROce1YcJvKsphoELY5nE81o
 8l+WAsEOpC9K7/sjxU+PeMb/TpR2P7TwFNljx6bdXo9SdRldxnTI5cIoS
 FtE1C6cyktQGTxDnTQkpowV2Nl0uNMozQc3WF+8jx37lpRWtbko4dDCqO
 856ECW1qbvUTZl9YE6RVPU7SdIdYBVJgW31NdSYkiso5TfShpbmL/IKa3
 H3izhRSNYPvj5KiZ6ydbri7ekd1r5KljZDdvrp6T0li47yHCpaXIQf3uQ Q==;
X-CSE-ConnectionGUID: oj4UdiP6T16aj2kUlxzQDQ==
X-CSE-MsgGUID: 3HY6pZltTFOybRnmMPLrLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510511"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:31:55 -0700
X-CSE-ConnectionGUID: bjEgR8MFQeWJkKorFRHNZg==
X-CSE-MsgGUID: 14dibPHWShaIFh6al0eqsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722655"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:31:54 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v6 4/9] drm/i915/xe3lpd: Update bandwidth parameters for
 display version 30.02
Date: Sat, 14 Jun 2025 01:01:41 +0530
Message-Id: <20250613193146.3549862-5-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Atwood <matthew.s.atwood@intel.com>

Bandwidth parameters for WCL have been updated with respect to
previous display releases. Encode them into xe3lpd_3002_sa_info and use
that new struct.

-v2: Resolve conflict to apply patch.

Bspec: 68859
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 6c2ab2e0dc91..a515241d80db 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -420,6 +420,13 @@ static const struct intel_sa_info xe3lpd_sa_info = {
 	.derating = 10,
 };
 
+static const struct intel_sa_info xe3lpd_3002_sa_info = {
+	.deburst = 32,
+	.deprogbwlimit = 22, /* GB/s */
+	.displayrtids = 256,
+	.derating = 10,
+};
+
 static int icl_get_bw_info(struct intel_display *display,
 			   const struct dram_info *dram_info,
 			   const struct intel_sa_info *sa)
@@ -771,7 +778,9 @@ void intel_bw_init_hw(struct intel_display *display)
 	if (!HAS_DISPLAY(display))
 		return;
 
-	if (DISPLAY_VER(display) >= 30)
+	if (DISPLAY_VERx100(display) >= 3002)
+		tgl_get_bw_info(display, dram_info, &xe3lpd_3002_sa_info);
+	else if (DISPLAY_VER(display) >= 30)
 		tgl_get_bw_info(display, dram_info, &xe3lpd_sa_info);
 	else if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx &&
 		 dram_info->type == INTEL_DRAM_GDDR_ECC)
-- 
2.34.1

