Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63230EEE26C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE15210EC42;
	Thu, 12 Sep 2024 21:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyOq/Hux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5E510EC16
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726178176; x=1757714176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PozvnBOEUPlDs8AndMJn+whLOw2N0n/WBCAyupuY/hQ=;
 b=VyOq/HuxJYnse7xVPicLgNcDbHE1BtYh5GCEugMIPgtLsAsNDsOToCCq
 R5QwmXH3iWmGdZzhOAMffmcMXlC+qpVRXRxkBysDnAoFfOn2t8iPaE8KS
 admjR3iRyt/KyHG44h3uBD7mwUPXXE6J6rGp4KJ8VqNqHj2siEaY5XuKC
 GENU/JjGEELSNKCcMrIAg0tGlBzsPggGsW+naPQr9QSTkKbYc/Lj6CZ6L
 t2MFLIw1HwpY5SeldjA2+TcvGRO+2aZV27klIUuZQX5xnAC7TP+xkVkEg
 62Gp9H4dKbFluBKMSVF7b1BsfyQjL+JCsOoUKtJMoYkEtIxXIpWcg79Ts Q==;
X-CSE-ConnectionGUID: LXXR3RIqS++1vMhwyVnbGw==
X-CSE-MsgGUID: fDrjV7iUSX2QPSZfdIvqCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36410918"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="36410918"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:56:16 -0700
X-CSE-ConnectionGUID: 9KZcy0izQ9mbN9kC4zPrKQ==
X-CSE-MsgGUID: G4SiFUWPSSKlPxYjaHV+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67780762"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:56:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/2] drm/xe: Don't try to derive GT clock freq from display
 register on Xe2
Date: Thu, 12 Sep 2024 14:56:00 -0700
Message-ID: <20240912215559.4070443-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index cc2ae159298e..9afa5415d627 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -57,27 +57,27 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 
 int xe_gt_clock_init(struct xe_gt *gt)
 {
-	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
-	u32 freq = 0;
+	u32 c0, freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
-	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
-		freq = read_reference_ts_freq(gt);
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
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20 &&
+	    xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC) {
+		gt->info.reference_clock = read_reference_ts_freq(gt);
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

