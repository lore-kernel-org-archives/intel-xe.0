Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98331FC6162
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 16:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630F510EBE0;
	Fri, 13 Sep 2024 16:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDnNNJbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D7310EBE0
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726244956; x=1757780956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m3JDQfnYFXyBkTWIrnOD9B48tk9YlRsQkWUguOUhyG4=;
 b=MDnNNJbl26Vesg9mrwXIyaC2lXOLJjZ/aw1vsWNptx6adsdlxxd0p7q1
 4daifdYpbVePqq4NovLBl7ZyOhw/0qAWSdvaajt+VPudxIaVNUC6ejCQ3
 IcYPJ6zhS/cWaDaYP1rQ5x90CAAjiRFqZjjOml/Ud3j4U8gOOTDso8ALE
 6vTmo4a0g1X0cCprOgnslXGF40hme6vtvwFmD0Fol7bjdMt0hky4MdOUu
 4Uhpr1sey0dw+OooqYrEAwM/CcGTHkfaZUkNrWm44Pg+tXVCYxC/4pgyt
 KE5DjYg983cS9kHX7xz1Bc/sBryFauMn4PNKzUjtX5tkRVXF/gpxkPeek Q==;
X-CSE-ConnectionGUID: IJ4IL+3KT+KyRqgt6vuLEA==
X-CSE-MsgGUID: KrgfyERmQpG2XZV9SzXR6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24692391"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="24692391"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:29:15 -0700
X-CSE-ConnectionGUID: LbhcG+dTRMiW9JMqQ2dZTg==
X-CSE-MsgGUID: qzUn4kx1TQeZIqzdCiGKAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68440206"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:29:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Don't try to derive GT clock freq from display
 register on Xe2
Date: Fri, 13 Sep 2024 09:29:12 -0700
Message-ID: <20240913162910.4145142-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913162910.4145142-4-matthew.d.roper@intel.com>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
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

Driver initialization has two approaches for calculating the GT clock --
it either derives it from the crystal clock frequency as read from a GT
register, or it derives it from the display's TIMESTAMP_OVERRIDE
register.  The driver is informed of which approach needs to be used by
a bit setting in the CTC_MODE register.

Use of a display register to initialize the GT frequency seems a bit
suspicious and doesn't seem to really be documented clearly in the
bspec.  However there is a note on the CTC_MODE register indicating that
the setting that corresponds to use of the display register (which the
bspec simply describes as "Broadwell Divide logic") is no longer
supported on Xe2 and beyond.  Furthermore, the TIMESTAMP_OVERRIDE
register itself was removed in display version 20.  Rework the GT clock
init function to only consider CTC_MODE (and then possibly use display's
TIMESTAMP_OVERRIDE) on pre-Xe2 platforms.

Bspec: 62395
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 886c071c10f5..93940dc2c146 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -43,29 +43,29 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 int xe_gt_clock_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
-	u32 freq = 0;
+	u32 c0, freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
 	xe_gt_assert(gt, GRAPHICS_VER(xe) >= 11);
 
-	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20 &&
+	    xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC) {
 		xe_gt_assert(gt, xe->info.probe_display);
+		gt->info.reference_clock = xe_display_read_ref_ts_freq(xe);
 
-		freq = xe_display_read_ref_ts_freq(xe);
-	} else {
-		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
-
-		freq = get_crystal_clock_freq(c0);
-
-		/*
-		 * Now figure out how the command stream's timestamp
-		 * register increments from this frequency (it might
-		 * increment only every few clock cycle).
-		 */
-		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
+		return 0;
 	}
 
+	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
+	freq = get_crystal_clock_freq(c0);
+
+	/*
+	 * Now figure out how the command stream's timestamp
+	 * register increments from this frequency (it might
+	 * increment only every few clock cycle).
+	 */
+	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
+
 	gt->info.reference_clock = freq;
 	return 0;
 }
-- 
2.45.2

