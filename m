Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5440AC83003
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DBE10E51F;
	Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F3B10E519
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577855; x=1717113855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X9Sfd43ItkMD6QzOgAEa8a1NHYwDvkKjAf2CqesoqPk=;
 b=k3mpZ8eeoyIptx+ycrACy9Nk73IjRugkvL8xwxG+gJjc6wtx8M20pqoF
 IxHS7mMwvYLB/LLq9IriZwBDxUyGgWjUD0Gg6Z23xwz+mA33/xupw620K
 s35BjslC3aErTOG5P11breCn9+ferTpIeXxPmqdgsvL14/7mAE/kbvSeZ
 T5YiwOXJCjFKp3FyhfAwONV76rfl+b2pbwoaAQRt60/FJ/ez89lD8dYi/
 OJX/sm2xiU76jYJnjKk7fpmtI3dqxtdveqPNRb/4Z+Yau1rg1CRxtGh3u
 ZkGvNkhp6I3JMCLGx+dolMmWRcOm6nV8ZscaGwkxQ6+mSDV6KB+qkI+Ma w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996859"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996859"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556224"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556224"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:54 -0700
Message-Id: <20230601000403.432517-23-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 22/31] drm/xe/irq: Handle ASLE backlight
 interrupts at same time as display
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

Our only use of GUnit interrupts is to handle ASLE backlight operations
that are reported as GUnit GSE interrupts.  Move the enable/disable of
these interrupts adjacent to display interrupts.

In the future we may want to even move these inside the
xe_display_irq_*() functions.  But since these rely on xe_irq static
functions like mask_and_disable() it's easier to keep them separate for
now.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ad2f73b2a031..c069e374a947 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -187,8 +187,6 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
 
 	gt_irq_postinstall(tile);
 
-	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
-
 	xelp_intr_enable(xe, true);
 }
 
@@ -372,8 +370,6 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
 {
 	gt_irq_postinstall(tile);
 
-	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
-
 	if (tile->id == 0)
 		dg1_intr_enable(xe, true);
 }
@@ -486,7 +482,6 @@ static void xelp_irq_reset(struct xe_tile *tile)
 
 	gt_irq_reset(tile);
 
-	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
 	mask_and_disable(tile, PCU_IRQ_OFFSET);
 }
 
@@ -497,7 +492,6 @@ static void dg1_irq_reset(struct xe_tile *tile)
 
 	gt_irq_reset(tile);
 
-	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
 	mask_and_disable(tile, PCU_IRQ_OFFSET);
 }
 
@@ -513,6 +507,8 @@ static void xe_irq_reset(struct xe_device *xe)
 			xelp_irq_reset(tile);
 	}
 
+	tile = xe_device_get_root_tile(xe);
+	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
 	xe_display_irq_reset(xe);
 }
 
@@ -535,6 +531,13 @@ static void xe_irq_postinstall(struct xe_device *xe)
 		xe_gt_irq_postinstall(tile);
 
 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
+
+	/*
+	 * ASLE backlight operations are reported via GUnit GSE interrupts
+	 * on the root tile.
+	 */
+	unmask_and_enable(xe_device_get_root_tile(xe),
+			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
 }
 
 static irq_handler_t xe_irq_handler(struct xe_device *xe)
-- 
2.40.1

