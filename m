Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED78C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DB710E545;
	Wed, 20 Sep 2023 19:46:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAC110E552
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695239181; x=1726775181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pi6rFCQz1Lx0lnyBaICd2o622k+soLMIA86+4ihKSis=;
 b=Od7Ywj4GPdQ6Xtz+i7D3n3/FczdU4VVwKigrXIA6aGCeHdT7YujmLV/6
 IHgVATckNt2c7yLlc7jKft9OuJlE3iyRajauvWE0bBtVC9sogJTQlGONs
 6pocn9BipIfiHvLTW69AkudFSSDJFd68eEvphWyz/cfKUZy83xWMl/6Fo
 lfQactjodCboAM18MqCJeSxcgwn9/BHkKXE9Vpuo2O85YdLBdayMGb6/H
 ls1diMz2WkxZLI5cBFXji7qOddLM5p2YwPrBpPFzKNqVwjKWc0z1YrKeW
 SxMWln4oMvGMuIHo/brEZPKo8dxT/Kto1U9vv16lWR6CaNpWFBhmUWHUB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360573442"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="360573442"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="817054179"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="817054179"
Received: from baguirre-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.213.162.6])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:46:19 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 16:45:35 -0300
Message-ID: <20230920194534.57856-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
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

v2:
  - Make resetting GFX_MSTR_IRQ be the last step to avoid bit
    re-latching. (Ville)

BSpec: 50875, 54028, 62357
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ccb934f8fa34..cb03f40df272 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -519,6 +519,13 @@ static void dg1_irq_reset(struct xe_tile *tile)
 	mask_and_disable(tile, PCU_IRQ_OFFSET);
 }
 
+static void dg1_irq_reset_mstr(struct xe_tile *tile)
+{
+	struct xe_gt *mmio = tile->primary_gt;
+
+	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
+}
+
 static void xe_irq_reset(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -534,6 +541,15 @@ static void xe_irq_reset(struct xe_device *xe)
 	tile = xe_device_get_root_tile(xe);
 	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
 	xe_display_irq_reset(xe);
+
+	/*
+	 * The tile's top-level status register should be the last one
+	 * to be reset to avoid possible bit re-latching from lower
+	 * level interrupts.
+	 */
+	for_each_tile(tile, xe, id)
+		if (GRAPHICS_VERx100(xe) >= 1210)
+			dg1_irq_reset_mstr(tile);
 }
 
 static void xe_irq_postinstall(struct xe_device *xe)
-- 
2.42.0

