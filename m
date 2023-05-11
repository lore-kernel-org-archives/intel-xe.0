Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9540C7EE2F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE510E598;
	Thu, 11 May 2023 03:47:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859BA10E598
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5jPbmSyMosjB2thqDLArveBxiZ6J5+mtxNcqmmLsiSs=;
 b=M17LjGnaoac+AwU3CGkWXy2Obg4XYY2x8CtWlwmKDicD87T1LIxpQVOS
 n4ewyH7A3X84ytXimevOqnhjID4s20RxrPm8I/bhE9awyFi+UCHFkKZlt
 NcNqOWZviXMkzFo9fCLASzm6RYTJkEeO546dHkbVcsiHR4rm/61OrEhqM
 AgjEBX5lmUJtrW36dElw0SuGEot6JzMnWmS0pjJ0t6ulHINtLcrfy0ji4
 Wxh0mjpIXcWKkh23n4z4TBmA3U/1MscMRvJk+3n54H9s8L7KvRqzntfKJ
 kUeM249miywqwgwEmrCNZFBudNlMrDS1lbqcU/uyrkjeMVEkHYPcIlzIS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850648"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850648"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203232"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203232"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:14 -0700
Message-Id: <20230511034722.1929038-19-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 18/26] drm/xe/irq: Ensure primary GuC won't
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
index eb4af4c71124..2f01314c7f11 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -553,12 +553,15 @@ static void guc_enable_irq(struct xe_guc *guc)
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
2.40.0

