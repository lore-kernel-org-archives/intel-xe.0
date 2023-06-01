Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F48C7EE37
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC8C10E5EA;
	Thu,  1 Jun 2023 21:52:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59C410E5DC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656369; x=1717192369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBlOTvEdqeNQS1bCbCDzstnVpeZ/EUpbxuMHMN5CMhM=;
 b=RLOofhuw7L7KKPGLElw70/17CccQ+T85Tn2nf2ZcTVHPWuIWSBJcULYg
 8quzjoF8dt9beYyqIxP/AkY75vBjDUEq/kAr1xPYt2Kzc1wjN5Davew1H
 Bb2H84VlO+FuUTzBNgseuMkoVPTV5AeYy7hsBKI+cEU2eILHAcyrqosxs
 ZP7XCIuIhUQwR6WA8fwA/LcFvxSjGm/qr9Hdrxt0WAl72GzoRGSb71pTt
 S/JHOxhwrLVOM9A7ROQHtIhRc26sw0MsP/GXftQXwzBMBr4M79sFqV+Ae
 4Fh99PownhX7SEtHk2wt79X2Mr6PLZY5yYpVjKcGH5pkM0adq7uY4B/WO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313627"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313627"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563620"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563620"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:36 -0700
Message-Id: <20230601215244.678611-24-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 23/31] drm/xe/irq: Ensure primary GuC won't
 clobber media GuC's interrupt mask
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

