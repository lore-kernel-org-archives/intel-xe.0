Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA212C8300C
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C1A10E523;
	Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F376F10E1F0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577856; x=1717113856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBlOTvEdqeNQS1bCbCDzstnVpeZ/EUpbxuMHMN5CMhM=;
 b=l7nfSHJG37ezr3SsqaIRkClYv/h0aOV7SZRgpXCIl7IU+xhMMu+PDyn7
 9wyBZTGOCU+Ke8cW8DwCBsxA9YBzmM29MS7JPaBbTSuoMG51nMAeD35Ux
 A1TFSpyPoU1pSBYdWCvmn0hGFN+FnAPLOqb1JbObenTKXP/kiz4OoQOgq
 XoJe3S9mrpO2RcGzyckij7wj1oqqA2PmpX7PRVnk/LoKh0+6yF4Z7N0sI
 UCuRlrXN7iAdQS6kMBtf3M6/+CrbJp4a8MGNGueR9HDTxtI9n1pLfQ3t4
 BC0jHpTw2Fr0Ez7id+eGapcOCZjQP23aBTkp+GheCnEZ7++xAk9WtZQJP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996862"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996862"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556228"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556228"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:55 -0700
Message-Id: <20230601000403.432517-24-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 23/31] drm/xe/irq: Ensure primary GuC won't
 clobber media GuC's interrupt mask
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

Although primary and media GuC share a single interrupt enable bit, they
each have distinct bits in the mask register.  Although we always enable
interrupts for the primary GuC before the media GuC today (and never
disable either of them), this might not always be the case in the
future, so use a RMW when updating the mask register to ensure the other
GuC's mask doesn't get clobbered.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc843d91f62..04a57af85d9e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -532,12 +532,15 @@ static void guc_enable_irq(struct xe_guc *guc)
 		REG_FIELD_PREP(ENGINE0_MASK, GUC_INTR_GUC2HOST)  :
 		REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
 
+	/* Primary GuC and media GuC share a single enable bit */
 	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,
 			REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST));
-	if (xe_gt_is_media_type(gt))
-		xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
-	else
-		xe_mmio_write32(gt, GUC_SG_INTR_MASK, ~events);
+
+	/*
+	 * There are separate mask bits for primary and media GuCs, so use
+	 * a RMW operation to avoid clobbering the other GuC's setting.
+	 */
+	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
 }
 
 int xe_guc_enable_communication(struct xe_guc *guc)
-- 
2.40.1

