Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0170C88C83
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2210E449;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B10310E43A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481370; x=1717017370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bP/LQuq9Qp43W69wP/r8kGFfXUewKSySY8aVGzcVyew=;
 b=a+d+HvCRIeTrJoStZNGtBu6//tLh2RY0uUHtTLLXOZdUq/fKHHhNN0nL
 ZxeE2G81BuSRQuwZwLM+9dX9WCdAf3+4w+9lpruBufs8WKReI3MZo/SD4
 7zfrlkN9ZtEQTy290dVu+fOBWlMNNTXP71kqK2deEzqcAApF7/wT/IyBe
 u4BmX5qVqMiDeqC3Yv1JIVW4ShmimO4atU+ROB7WjdtmGPChSN9A/XRcB
 2Narzdh2nOWeqdhYhkR0SA09nSbdDFBMsVYW1b7XXTuPbExc6Ih66i0KQ
 gBA7FMLnMac6c0DB6UdylOm0fyTFZt10wCI0/Ce1Ya1rTVzRpmIHpuNmy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311958"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311958"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139452"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139452"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:38 -0700
Message-Id: <20230530211549.2632538-21-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 20/31] drm/xe: Move display IRQ postinstall
 out of GT function
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

