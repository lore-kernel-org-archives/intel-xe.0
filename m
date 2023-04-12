Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE64C77B72
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 18:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6C810E91F;
	Wed, 12 Apr 2023 18:48:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975BB10E920
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681325322; x=1712861322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J/hYUbhp2HENMraAETkzIRUPiflEr3elrYojnom4M2w=;
 b=Oe8GeF2aRatooy08r0vvoFoEidZfbrdYr8xdXv+UUkZH5Qtwz+mSh1sK
 bn5GU4kH5uzUUGwZGk20xsvsaRXS80VY8WcwzbF6wJScwHY2nCrccdsc/
 sfC0WvbY7X33E9gn8yMvM9foBJuFUscG3x4Ght1aDnY3iKOFX52evVsVp
 zYTx8g34bjbnKhAwnfZZuXdlSgn76f3hbtDnBPHmGFAKUw6c/GGhkSrq/
 3pmSj5H3PFhAK0ldTd1S1kpvJiUm3xKOwawByUg/IC37DlAL1LjGsnrCB
 4ARzoT7hW3sb7/5JEVYz3fsuGI8u38jA9lGi30hoePaTxK6aceeybwKY6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430276544"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430276544"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691638617"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691638617"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:48:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 11:48:32 -0700
Message-Id: <20230412184835.3157780-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412184835.3157780-1-matthew.d.roper@intel.com>
References: <20230412184835.3157780-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe/irq: Process Gunit interrupts in
 relation to the device
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

The only Gunit interrupts we handle today are GSE ASLE interrupts, which
are an old opregion way of doing display backlight notifications.  These
aren't related to GT at all, and if/when we have a multi-tile platform
with display in the future, we'll expect such ASLE interrupts to always
be delivered on the primary tile, the same as other display interrupts.

dg1_irq_handler() is currently passing whatever GT was processed last as
a parameter to gu_misc_irq_ack(), which isn't what we want.  Switch
gu_misc_irq_ack() to just take a drm_xe_device as a parameter so that
its handling isn't tied to the previous GT processing loop and there's
no ambiguity about what it's doing.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index bc71ceb99de2..a329454b00db 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -92,8 +92,9 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
 }
 
 static u32
-gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
+gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
 {
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
 	u32 iir;
 
 	if (!(master_ctl & GU_MISC_IRQ))
@@ -348,7 +349,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 	xe_display_irq_handler(xe, master_ctl);
 
-	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
+	gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 
 	xelp_intr_enable(gt, false);
 
@@ -455,7 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	xe_display_irq_handler(xe, tile0_master_ctl);
 
 	/* Gunit GSE interrupts can trigger display backlight operations */
-	gu_misc_iir = gu_misc_irq_ack(gt, tile0_master_ctl);
+	gu_misc_iir = gu_misc_irq_ack(xe, tile0_master_ctl);
 
 	dg1_intr_enable(xe, false);
 
-- 
2.39.2

