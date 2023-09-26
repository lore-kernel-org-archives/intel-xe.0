Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD9EE7E633
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A73410E3D7;
	Tue, 26 Sep 2023 13:06:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA5C10E3D7
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733581; x=1727269581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pHvxN22EtIL+SARAnNS223iPI8U11pMNE+FYOQFMHhQ=;
 b=VCBX2aOlGaqGNvilENYzlgwu8s5N+X0FvuORpr2CE9j57xxQ5IDA5+Qs
 HOuyn+aL9eOsg4uZcMxRCqlHO9VGXrERuPhA+Pn5zOTlVXotqVqAIncZH
 hI71Zh/3CD6AvvUzgq0x0um4foYDh6Vp/OGktEy3lCn9Jy3C9CbpwPJrU
 vJI+O2GlIOFGb22OlQobHw/0BiI4iW1ZoEEQTf8xXkFULW60MYa2jLM8O
 BLXi0eF8KFkOUojlRjs3nQamomYJ6rYx90WmNZuQtCJxc2Lv60qzqy2Ob
 OWLXN6cKoZ+WgbuozBTpZ3IybvnjN8CAwUm7vjehAwB8PMMRHRcstVsos A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467845005"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="467845005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="140145"
Received: from ferdigrx-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.38.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:05:36 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 10:05:52 -0300
Message-ID: <20230926130552.10605-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ
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
v3:
  - Swap nesting order: guard loop with the IP version check instead of
    doing the check at each iteration. (Lucas)

BSpec: 50875, 54028, 62357
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 504cb94d0ee8..33c1f0e4f2f3 100644
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
+	if (GRAPHICS_VERx100(xe) >= 1210)
+		for_each_tile(tile, xe, id)
+			dg1_irq_reset_mstr(tile);
 }
 
 static void xe_irq_postinstall(struct xe_device *xe)
-- 
2.42.0

