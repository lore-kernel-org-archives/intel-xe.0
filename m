Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2620CCCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFE110E9D4;
	Thu, 30 Oct 2025 15:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STuft6d5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C9810E9D4
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761836728; x=1793372728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XiRIoCZKFPnJdM8LGTkX68amvjTgCZM33fc8o79KCMw=;
 b=STuft6d5orh5t7Xu90cqVVCtnVDGYBBQsTuq4sM27mgPb8MTUIZu6S7L
 +6ig9Vp6vGgyeiZgGjfi0/WxS20/zqf1xZGr5x/3WFzDRjmM3ew2XAGYA
 QuTDcWSjuecpUIv7ujfgZeFjIucGahlqkDBh6GPKGrgLe/JXDTBSBiKmZ
 KJMKPJHbeLAommlyyMdZWUjrR9gBA07b7csZLluAnFUY85T1Fezr6HX2R
 jKyVKGuqU5q66aSzUn3T3QShfMmae2QfnwsEOsOwJVecXKkaOuztZRcl4
 kAaPTRIZQ3f0okfHBO588UG3bpjhssd8U3TLYLfH1oyuUPPdOtGhhOY1f w==;
X-CSE-ConnectionGUID: RJQpRdamRtqlGxHsltKy5Q==
X-CSE-MsgGUID: xObUgZsUQgyRblw1BquApg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64013170"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64013170"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:05:09 -0700
X-CSE-ConnectionGUID: y2UPakniQnuPKe4HgVUBMQ==
X-CSE-MsgGUID: DoDCT78hTd2Y/8kQQj5itw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185636707"
Received: from vnayana.iind.intel.com ([10.190.239.33])
 by orviesa009.jf.intel.com with ESMTP; 30 Oct 2025 08:05:09 -0700
From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com
Subject: [PATCH] drm/xe/irq: Handle msix vector0 interrupt
Date: Thu, 30 Oct 2025 20:40:20 +0530
Message-Id: <20251030151020.2042207-1-venkata.ramana.nayana@intel.com>
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

Current gu2host handler registered as MSI-X vector 0 and as per bspec for
an msix vector 0 interrupt, the driver must check the legacy registers
190008(TILE_INT_REG), 190060h (GT INTR Identity Reg 0) and other registers
mentioned in "Interrupt Service Routine Pseudocode" otherwise it's block
the next interrupts. To overcome this issue replacing guc2host handler
with legacy xe_irq_handler.

Bspec: 62357
Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index e5ed0242f7b1..024e13e606ec 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -897,22 +897,6 @@ static int xe_irq_msix_init(struct xe_device *xe)
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
@@ -1029,7 +1013,7 @@ int xe_irq_msix_request_irqs(struct xe_device *xe)
 	u16 msix;
 
 	msix = GUC2HOST_MSIX;
-	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
+	err = xe_irq_msix_request_irq(xe, xe_irq_handler(xe), xe,
 				      DRIVER_NAME "-guc2host", false, &msix);
 	if (err)
 		return err;
-- 
2.34.1

