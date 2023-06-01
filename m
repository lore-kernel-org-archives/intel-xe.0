Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D2DC7EE2F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A21810E5D5;
	Thu,  1 Jun 2023 20:30:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268D710E5CA
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651435; x=1717187435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X9Sfd43ItkMD6QzOgAEa8a1NHYwDvkKjAf2CqesoqPk=;
 b=UdYju2kcNqOvXTXtu91AcfGEgvmTNT9TaGwFLhhXqRwLSxbRvAGcdhhG
 eCBUOZLBNoXh4Tkr7mjWJmQIrgvE2+ZTNHuubjZxUQFywyvvJLsFAncIq
 BcN9w10ahjp7YQ7PY2Pam/jFGTYLJpwqSGuxG2SRn995Ix2+JPiyvCs9t
 xhCCe0oFXILwudfMpQXbY7V5/boNjoqubhHwYlk0x+1H5RKeDt678skxm
 PluZyNA3SSX9gWpPT+qmkknwQbYUdqOyDvkSr02n7YeYiB0fI+9WyI3ZF
 suEcsIDTJqGLorjVmG4bst5AU3sIdZIH1sbmBmtGz6KO626H4u2l0tZH4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102537"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493280"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493280"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:16 -0700
Message-Id: <20230601203025.615494-23-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 22/31] drm/xe/irq: Handle ASLE backlight interrupts
 at same time as display
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

