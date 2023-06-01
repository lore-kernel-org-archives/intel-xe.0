Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52EDC83003
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE23F10E5F4;
	Thu,  1 Jun 2023 21:52:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509D910E5DC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656369; x=1717192369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bP/LQuq9Qp43W69wP/r8kGFfXUewKSySY8aVGzcVyew=;
 b=lmitgkEIATBY90WDgMpTOxlAENhEamjYOCnjjNOgv22aCoyRU98R8SjA
 wYSBw81UTU5RbrTwxCvUDnxh9ijI3X5HFpu/9gn4YNyWLm/rOlHMLtJ42
 oXtWd0k7r4kSINY9sJHBtgvdrQsEfw7AooOQVuEY2Bc31cxJpatFlSDF+
 mDFKlGBrJZ2Gg9ODPbAccbt09D2RBmLj2Aq+TRdZz637x0KyhsJHtQr0W
 C44ZIKjUkdqMamnXldwAC4ckZvOxPA13JvR/WTm5yCphr33ju/JiJKtZp
 nBIrSGqStyxKWkC+78jhRlSYcNjxDAMZpXD87KfDn8JfuWm4vMPgE2WQP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313620"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313620"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563610"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563610"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:33 -0700
Message-Id: <20230601215244.678611-21-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 20/31] drm/xe: Move display IRQ postinstall out of
 GT function
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

Display interrupts are unrelated to the GT (and are also only relevant
to the root tile).  Move the postinstall call up a level in the
callstack.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 628057497cd5..654c34a5b99a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -490,8 +490,6 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
 		dg1_irq_postinstall(xe, gt);
 	else
 		xelp_irq_postinstall(xe, gt);
-
-	xe_display_irq_postinstall(xe, gt);
 }
 
 static void xe_irq_postinstall(struct xe_device *xe)
@@ -501,6 +499,8 @@ static void xe_irq_postinstall(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_gt_irq_postinstall(gt);
+
+	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
 }
 
 static irq_handler_t xe_irq_handler(struct xe_device *xe)
-- 
2.40.1

