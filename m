Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89376C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9672410E4A5;
	Fri, 19 May 2023 23:18:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BE610E629
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538329; x=1716074329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9lMsoO8soXR3/piiNLsiDYgO6Ge7SoNFjSs2Bqj7ut8=;
 b=HmYXYsDCXO0KL/9pRyzHTKVwS9+osb+qb1H4EaRLw15yGDrLbfhmP/8m
 ohZWiGYZ4KFix3oZnaEtdhdpzjil7plCJNVu5DQXCxsO57YacHwfNe5T+
 QZZMzrKMULV38fFIj6ELnOtRza4f+iat97eE7FFva0gKXHTaa+k++cqkF
 v9uD/wMsY/eiaPYXDfOIxoMN4Rt8T9MQzJT27v8TTX64hjF9G/0+Ijhpb
 tDZrjzCIBvrIGuEjHQPYX/8trfVKmupVkfdgAXIn+SkwhOdm4aSAhrQDd
 mBA5y29L98FamPsZzK9LjQMYWGAtmhHi3J0Fi3UOgfkddeQDVc4couVKx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526373"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526373"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888740"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888740"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:16 -0700
Message-Id: <20230519231827.3572452-20-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 19/30] drm/xe: Move display IRQ postinstall
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
2.40.0

