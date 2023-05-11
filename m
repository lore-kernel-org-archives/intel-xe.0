Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B65C7EE26
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675A10E591;
	Thu, 11 May 2023 03:47:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666BB10E597
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sE3avj31Y8sp6ipsWQGGFAgMUOvG2oFtEjMSU5wyOA0=;
 b=MGnFnrAyWWtwlhUECzs0E42Ee/T6BNVaYbIrsCFUTOebO/Zow48IrAoN
 yJd9a86bFoaduPjjPl7B1/zq8NfBYaQvqWUXURgXU9BWh7j7199OqmLh0
 NCkQfh+p0URdQXqfnl08bwUJyWlCz1Fa41xIinyO+fTKRN60GCskjbOu7
 Q83IJ59H6W1+AQvqaQmR01V5bas2ZgypRoLqT3XJifPV/e5jIFy2LbzK8
 kCv+vNMpPn3BRShrixTpTzAxX6ZJvy5UNUHV1siKh7N9cQDod91YNNwu5
 urPm8BjRQPFOht5QNXrQLEoRI8bi8zL/g6d+qjqZfCYW7hdAxhMK3VkC3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850645"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850645"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203226"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203226"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:12 -0700
Message-Id: <20230511034722.1929038-17-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/26] drm/xe/irq: Handle ASLE backlight
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
---
 drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index fa7d04ba23c0..02f44b58ce3e 100644
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
 
 	xe_display_irq_postinstall(xe, xe_primary_mmio_gt(xe));
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
2.40.0

