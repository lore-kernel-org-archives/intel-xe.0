Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5818CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 19:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6694089048;
	Tue, 30 Sep 2025 19:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Okad/4bn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394E89048
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759259555; x=1790795555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HqcvJVfKw3EBXNl7kihS8D6qJ3oSF9wc7q4OjA+N06s=;
 b=Okad/4bnpuFx63EoyKlOeQGFhfE9DAQCNDWExn02FH0WzP3rHXpasdiL
 y+Nak4I3TbqMqkgL7i/OsTA0KQ1XUFqMl8HoXK8h93r1rng8ZpQJDBPUz
 +LEUUZCqKeBgWJ0vmpPjF4SDWEfM8pmlL91LaFNxXAP+JU9ImUB46U5ft
 Ciiz3fvV9qrSfXH79YvQtfFSgWjQbPm4Ck/UJiGClvHwb+agPyEHZtMTy
 qEwQSHsPsMCVDkX3oPqaYt/1ddh14Tg16q4JjYQSmMx1a52cQGSlOatRa
 gaV96igFR423hO1WIkd4Gkl5bVjNA0UYLevwsASjbKGcpyoG+MSCVkroh Q==;
X-CSE-ConnectionGUID: 1lFg65eQQ9OvKE3kGboVZA==
X-CSE-MsgGUID: yltyL73dQZGLQHx03KtKcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60561702"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="60561702"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 12:12:35 -0700
X-CSE-ConnectionGUID: LuS/mbjoRd+WQhxyDa3YIg==
X-CSE-MsgGUID: fne0CtYsSNKDccxhmMVoVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177719704"
Received: from vnayana.iind.intel.com ([10.190.239.33])
 by orviesa006.jf.intel.com with ESMTP; 30 Sep 2025 12:12:34 -0700
From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com
Subject: [PATCH] drm/xe/irq: Clear guc2host msix vector0
Date: Wed,  1 Oct 2025 00:47:02 +0530
Message-Id: <20250930191702.1725959-1-venkata.ramana.nayana@intel.com>
X-Mailer: git-send-email 2.34.1
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

MSI-X vector 0 interrupt routed through legacy port 190000 and driver
must check legacy registers and clear otherwise it's block the next
interrupts.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 870edaf69388..06976cc77918 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -847,22 +847,6 @@ static int xe_irq_msix_init(struct xe_device *xe)
 	return 0;
 }
 
-static irqreturn_t guc2host_irq_handler(int irq, void *arg)
-{
-	struct xe_device *xe = arg;
-	struct xe_tile *tile;
-	u8 id;
-
-	if (!atomic_read(&xe->irq.enabled))
-		return IRQ_NONE;
-
-	for_each_tile(tile, xe, id)
-		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
-				   GUC_INTR_GUC2HOST);
-
-	return IRQ_HANDLED;
-}
-
 static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 {
 	unsigned int tile_id, gt_id;
@@ -979,7 +963,7 @@ int xe_irq_msix_request_irqs(struct xe_device *xe)
 	u16 msix;
 
 	msix = GUC2HOST_MSIX;
-	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
+	err = xe_irq_msix_request_irq(xe, xe_irq_handler(xe), xe,
 				      DRIVER_NAME "-guc2host", false, &msix);
 	if (err)
 		return err;
-- 
2.34.1

