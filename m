Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62B9CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887E410E2EC;
	Tue, 30 Sep 2025 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JS9EX6/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5E710E2EC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+ueTJA+bQXVo/bGUNJKsVm7gvXYXvpo6o7EkHEJFuk=;
 b=JS9EX6/ysDoNFbADfHkjCVrPyOaht4Fb5VeGA7pF/oolU1lmiXkNCvN8
 xvwhkTltNOBUB5OcrXEOtecKmuJlAlbSJwUvnjlIFQlybbjOw720pIpmt
 MN82Nx9Jvyr8Xs08l/3nZaAhTBRJOjjWP5RI7yoSUDJcOxuY7cwOlq+K9
 ICc7IRV3ZarFTMYsacv8N6SzxhJ4CQf87oxUW4m5fyIIOvOr8CNyU1/Jp
 t7N5jQUg7PHd4Vt7GfqaE2FbjJRpCDFhQ/kc96xclp5zl5t9E3sCOtJO8
 bqI/LjuYIyjNKsh//blb7YPDEPy6IiIH23mnB+e5l4v2gUwUoHWLOnH37 A==;
X-CSE-ConnectionGUID: 4Ih4XhN/RJe53VuJk1/lIg==
X-CSE-MsgGUID: bxbVxPNjQpCROSRuP4dhAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397754"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:33 -0700
X-CSE-ConnectionGUID: Sgq3GB/ZRsOWTN6V6nB3zA==
X-CSE-MsgGUID: McEFLSiTSxmgV06/2FnPkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229474"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 14/23] drm/xe/irq: Don't try to lookup engine masks for
 non-existent primary GT
Date: Tue, 30 Sep 2025 15:56:31 -0700
Message-ID: <20250930225618.140071-39-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If the primary GT is disabled via configfs, we shouldn't try to access
it to lookup BCS/CCS engine masks.  For the purposes of IRQ reset (which
masks & disables interrupts in an sgunit register), assume all possible
instances are present.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5018a116852f..eaca56df08e4 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -494,11 +494,15 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 static void gt_irq_reset(struct xe_tile *tile)
 {
 	struct xe_mmio *mmio = &tile->mmio;
+	u32 ccs_mask = ~0;
+	u32 bcs_mask = ~0;
 
-	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
-						   XE_ENGINE_CLASS_COMPUTE);
-	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
-						   XE_ENGINE_CLASS_COPY);
+	if (tile->primary_gt) {
+		ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
+						       XE_ENGINE_CLASS_COMPUTE);
+		bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
+						       XE_ENGINE_CLASS_COPY);
+	}
 
 	/* Disable RCS, BCS, VCS and VECS class engines. */
 	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
-- 
2.51.0

