Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E011AC7EE2D
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588F910E624;
	Fri, 19 May 2023 23:19:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5EE10E623
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538329; x=1716074329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zhaJYvyOrc51mNb/rXsDQDzrrWZIzATiUMbcmIfVG1E=;
 b=Wskl23hTrAMmjed5ENPxAnWF3a/Rjnfxx3vkSrtbAIqwZfr7duFgUoM5
 Qjwt6U+sdNdSw8zJNmqwpeNvgkaYiIlFhwSq0dGDZHROFv0jnwEcbCkwj
 nHLVLYEap9atysVhnmsfMq6NU0w1zVJu+ji5i+5cW5FGwqMVt2Rq+zSuM
 p0qmzCu9owrCSCsux707A7h3b+MOvrlJT23wSFd1gtDuOhdVvbB/y/h53
 wzogtoYeNZQ2p+jI4+C3Frc8bRjkUiIBWu6OEvWET03cNeygscWktWNVq
 AtY4pPPZ33geTaQvvgApCs2EkWvMlv8Kz1Br6JPsSRAt2Awd9iopxZnY9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526379"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526379"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888749"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888749"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:19 -0700
Message-Id: <20230519231827.3572452-23-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 22/30] drm/xe/irq: Ensure primary GuC won't
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
index 71f18b32d09b..a14d71bc8202 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -551,12 +551,15 @@ static void guc_enable_irq(struct xe_guc *guc)
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

