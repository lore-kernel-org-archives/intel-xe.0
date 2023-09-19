Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CDCCD5BCC
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FA610E3E5;
	Tue, 19 Sep 2023 14:41:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EDA10E3E7
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695134488; x=1726670488;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L13ZuVhI2X0gsdR31tpq3kwY1kC4QCVt5c+cw9f3zCM=;
 b=gElUhMa2ucj07noxW6Wh5CiSp9jlK2heTxad3QA6MZr+dzpTLTPcQRk8
 iu5iBFURw4JPNbz2wbM5ncHW8FeTU5WwIbsyGltkMb+finErVYHYNXJqO
 6tWfQLkuEZ+PwYNGWQl4K2jFgZw9SrgmA7/DzJ+NEv+adW88ewq1KFclm
 xIlidgCnDMITv76bPBHgFDEZfaUcdxF1LQbyejirAd9omkkJCjtnB+5p6
 VrtWs/TgYMc8PR8nU/y1msHFcuIRuarI8fGIHpo2a4uAIRH8aAv3zm6xU
 NTF15Tx7IG1Y67So6N2/ePvi6scu8Oiq1B1wxJ9O6tC5qTyCVIAGieo+x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379860942"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="379860942"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="993179027"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="993179027"
Received: from rsee-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.212.1.105])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:41:27 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 11:41:10 -0300
Message-ID: <20230919144111.32702-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ
 reset
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

Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
behavior. If we do not properly reset them, we would miss delivery of
interrupts if a pending bit is set when enabling IRQs.

As an example, the display part of our probe routine contains paths
where we wait for vblank interrupts. If a display interrupt was already
pending when enabling IRQs, we would time out waiting for the vblank.

That in fact happened recently when modprobing Xe on a Lunar Lake with a
specific configuration; and that's how we found out we were missing this
step in the IRQ enabling logic.

Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.

BSpec: 50875, 54028, 62357
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ccb934f8fa34..3746e9204e48 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 
 static void gt_irq_reset(struct xe_tile *tile)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *mmio = tile->primary_gt;
 
 	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
 	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
 						   XE_ENGINE_CLASS_COPY);
 
+	if (GRAPHICS_VERx100(xe) >= 1210)
+		xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
+
 	/* Disable RCS, BCS, VCS and VECS class engines. */
 	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
 	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
-- 
2.42.0

