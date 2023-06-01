Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BACEC87FDD
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D781510E5DC;
	Thu,  1 Jun 2023 20:30:39 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4664210E5CB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651435; x=1717187435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBlOTvEdqeNQS1bCbCDzstnVpeZ/EUpbxuMHMN5CMhM=;
 b=UTr3UPvCcsZlLcLdZctALNeSc+gjHY75pkCHOnzjZJdvJrBoSEOzH4qf
 cBsqEwZAT1nF0GloDtSM/KKWxC+7z+c77zQEgV0DarjGhVy7L0I0Ufl9C
 LTnkyRAmpt1DiqhpkXVDAsRg1Xz4cf8TT+M/un4tciK2NREZNHNTYVtQb
 Zux3ajVnUNb0clENKShvIxA8Xfh+b+AB19zs/fcQ44xkrSbXHjdZ/AJ4k
 83pDsgVcycIUD+1TZnPej2XM7mi88dNgmc8dVXOoZsvjglQvyfKEzmABG
 uP5lYPLDCPVtLNvp7gMIY6M5ovBE/CfnvsXe/xj5Hw6MTdfCmR99dKWyu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102542"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102542"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493283"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493283"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:17 -0700
Message-Id: <20230601203025.615494-24-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 23/31] drm/xe/irq: Ensure primary GuC won't clobber
 media GuC's interrupt mask
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although primary and media GuC share a single interrupt enable bit, they
each have distinct bits in the mask register.  Although we always enable
interrupts for the primary GuC before the media GuC today (and never
disable either of them), this might not always be the case in the
future, so use a RMW when updating the mask register to ensure the other
GuC's mask doesn't get clobbered.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc843d91f62..04a57af85d9e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -532,12 +532,15 @@ static void guc_enable_irq(struct xe_guc *guc)
 		REG_FIELD_PREP(ENGINE0_MASK, GUC_INTR_GUC2HOST)  :
 		REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
 
+	/* Primary GuC and media GuC share a single enable bit */
 	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,
 			REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST));
-	if (xe_gt_is_media_type(gt))
-		xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
-	else
-		xe_mmio_write32(gt, GUC_SG_INTR_MASK, ~events);
+
+	/*
+	 * There are separate mask bits for primary and media GuCs, so use
+	 * a RMW operation to avoid clobbering the other GuC's setting.
+	 */
+	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
 }
 
 int xe_guc_enable_communication(struct xe_guc *guc)
-- 
2.40.1

