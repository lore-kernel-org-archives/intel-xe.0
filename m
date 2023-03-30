Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A890C77B71
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EC610EF83;
	Thu, 30 Mar 2023 18:24:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83F10EF78
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200674; x=1711736674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qld8Zu/8/HiQtHdf80fJMzwiF2U3JAdKRQJmF76klyE=;
 b=ZFCwMf75528B2NhXL0HsVzfvjhxDCclVdacNO4GIPJCfDYWdQ7pO0kEH
 RBEArbzdXPltVjkirw4SLeVxCRMv/M2cbg9jpzk6n28pIvK8Sp8p8iuUN
 NnPbl11Vawmkcv5Cs+OYYFHDp2liSSh3ToWoj8qXmXZyW47J2kyFbQZhF
 PVa9NzRyr2ZVjJ9KbkKrSii5txAZh20erxqEK33AKucytINpt5p4A4ds1
 MDuuzqawxnoxxXyvmqUfOqRUC4taz0ucY40iDo2wdKnWUTdMvQITXrpY2
 mVB+6E1L2EQpBXV3FpG+4BEXFzyFkpQ9Hnek176uMf54TAc3nHjle00NN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641492"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641492"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021832"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021832"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:24:05 -0700
Message-Id: <20230330182405.43993-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/8] drm/xe/irq: Don't clobber display interrupts
 on multi-tile platforms
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

Although our only multi-tile platform today (PVC) doesn't support
display, it's possible that some future multi-tile platform will.
If/when this happens, display interrupts (both traditional display and
ASLE backlight interrupts raised as a Gunit interrupt) should be
delivered to the primary tile.  Save away tile0's master_ctl value so
that it can still be used for display interrupt handling after the GT
loop.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 02292e60e52c..636653f4e7ad 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -347,7 +347,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct xe_device *xe = arg;
 	struct xe_gt *gt;
-	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir;
+	u32 master_tile_ctl, master_ctl = 0, tile0_master_ctl = 0, gu_misc_iir;
 	long unsigned int intr_dw[2];
 	u32 identity[32];
 	u8 id;
@@ -381,11 +381,19 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		if (!xe_gt_is_media_type(gt))
 			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
 		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
+
+		/*
+		 * Save primary tile's master interrupt register for display
+		 * processing below.
+		 */
+		if (id == 0)
+			tile0_master_ctl = master_ctl;
 	}
 
-	xe_display_irq_handler(xe, master_ctl);
+	xe_display_irq_handler(xe, tile0_master_ctl);
 
-	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
+	/* Gunit GSE interrupts can trigger display backlight operations */
+	gu_misc_iir = gu_misc_irq_ack(gt, tile0_master_ctl);
 
 	dg1_intr_enable(xe, false);
 
-- 
2.39.2

