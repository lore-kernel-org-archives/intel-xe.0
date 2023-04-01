Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C1C77B6F
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E58010F35C;
	Sat,  1 Apr 2023 00:21:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7094610F35B
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308472; x=1711844472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p8a/t0/h+0TCxeChnTTfbzq4jn1/eAxjN2iArDml3pE=;
 b=X3V5Ikcx9oNrJbTEdW3uDQk9KX5hBeMxaCTDxHgpAEmYlmcbaB0GTjAG
 3YW64FITsd2DSvOM695qJBfbDsfZacPd9z2cpGX3g33V6hTdCI/mXna9/
 XlzdgLVK62JQfKwG3dIsmw4FIIAb4tv1+iq7yzru1DsKkCP8/MkrlDGPp
 2rVQ1fykqhpu97npycZPzVLz+5dxqBTMhZrz2bow7LasbD5hDuRv8qIyA
 ae3MNvTNDhY9L/pHeYw656B68xlWjsb1deCdmOnDqLxE54um82hYp6rjy
 /LCtdAXTdYWeXiMWiCJLMD0nV5VqRSGdRqXBP6CPk5eo3DsBGNbp2ecA9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624218"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624218"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520557"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520557"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:21:06 -0700
Message-Id: <20230401002106.588656-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401002106.588656-1-matthew.d.roper@intel.com>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 8/8] drm/xe/irq: Don't clobber display
 interrupts on multi-tile platforms
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although our only multi-tile platform today (PVC) doesn't support
display, it's possible that some future multi-tile platform will.
If/when this happens, display interrupts (both traditional display and
ASLE backlight interrupts raised as a Gunit interrupt) should be
delivered to the primary tile.  Save away tile0's master_ctl value so
that it can still be used for display interrupt handling after the GT
loop.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9a119aa95cbb..13f9f220bca0 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -355,7 +355,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct xe_device *xe = arg;
 	struct xe_gt *gt;
-	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir;
+	u32 master_tile_ctl, master_ctl = 0, tile0_master_ctl = 0, gu_misc_iir;
 	long unsigned int intr_dw[2];
 	u32 identity[32];
 	u8 id;
@@ -389,11 +389,19 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
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

