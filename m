Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF69C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0405210E9D9;
	Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EEE10E9D9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681339976; x=1712875976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8I7qlF6ZC39+r4ptbDihbhpRz/MNfJTqvLPj0ABdmCQ=;
 b=gxaBdxCcdyyoB3hTcmMAxLqmxR3o7kMoj/BQ+pbipi3khKYcRhsACniu
 UbUY3xZidkfOQ211GnDNwhEWSvHjquLWgMyK75/5Lp3O4pAP48kxEj2oC
 UNZeDCwqapPyC0E8PTauOMRzKZlFXiEK0CmKba6f47l7HYQdNC/p5SebI
 krgdp4AoNd8Ad8AhreSxfnmdftVakZQHJC+Q0wLYMo0sHl7A8Guc7yuJp
 SbKZ/EofC5q9i5yxYV482qLu0HkyPmgOcmYHJRnB3g1wj8QoPnFGOwKBH
 tqCtaVPf5+/ysuAXvE3GdXV7nHJ6VFaK2ijiRhIp0JbA6W5Gg7UzTOdlP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344038893"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="344038893"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721757077"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721757077"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 15:52:43 -0700
Message-Id: <20230412225248.3229571-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412225248.3229571-1-matthew.d.roper@intel.com>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/8] drm/xe/irq: Process Gunit interrupts in
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
index ca86c99f8007..2648fe53887d 100644
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

