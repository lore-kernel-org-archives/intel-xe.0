Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5D4E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 17:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B996B10E140;
	Tue, 10 Dec 2024 17:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAJrtyCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A791210E939
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733852122; x=1765388122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TWGudFP3UOCRkSuEZQugDnOWc4SFAytRHhKcTbMiOb4=;
 b=ZAJrtyCseT2TZxTxl2nyu8vLidQy4FezFCPZ/gd5Bf4GyF74xs9pJd+N
 aYOhIb7gd8r6WQt+z2G7kPKHpsIWYtqFSuWyBZ5P2uWtCFtMsyLB3jdGD
 h2bj2nDipzBU4U4cn+SWU6YCqgF6lp7s0C2obNWDeQUBa0VguZ1W3P8C6
 PY0yWtyRO6dIvEQVkUzIxZnAfVD51GJU6XrllObjfDa2359cccDckSfuI
 DwAsD4akxUSa7I69HrFppr25+FWW48EpWxmxYHPcncU/2YKWNNBvMLnvl
 BodIA7gwigyr/hvPYv7zFLr6co2pFOZn0b8W8yqwjlSgtd9ptFyEqthiJ w==;
X-CSE-ConnectionGUID: /8hskE11QAu7HC6Gi15Kew==
X-CSE-MsgGUID: OJP5U6zeQkOLCYT5A/cDbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34345934"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="34345934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 09:35:21 -0800
X-CSE-ConnectionGUID: Y7jl3yEMQT2uuxkCwR8J1Q==
X-CSE-MsgGUID: IFD1bfVfSFSH2N2CgS2jLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="126281190"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.193.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 09:35:16 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, piotr.piorkowski@intel.com, rodrigo.vivi@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH] drm/xe: Make irq enabled flag atomic
Date: Tue, 10 Dec 2024 19:35:06 +0200
Message-Id: <20241210173506.202150-1-ilia.levi@intel.com>
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

The irq.enabled flag was protected by a spin lock (irq.lock).
By making it atomic we no longer need to wait for the spin lock in
irq handlers. This will become especially useful for MSI-X irq
handlers to prevent lock contention between different interrupts.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 13 +---------
 drivers/gpu/drm/xe/xe_device_types.h      |  2 +-
 drivers/gpu/drm/xe/xe_irq.c               | 29 ++++++-----------------
 3 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index a7dbc6554d69..ac4cda2d81c7 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -53,18 +53,7 @@ void gen2_irq_init(struct intel_uncore *uncore, struct i915_irq_regs regs,
 
 bool intel_irqs_enabled(struct xe_device *xe)
 {
-	/*
-	 * XXX: i915 has a racy handling of the irq.enabled, since it doesn't
-	 * lock its transitions. Because of that, the irq.enabled sometimes
-	 * is not read with the irq.lock in place.
-	 * However, the most critical cases like vblank and page flips are
-	 * properly using the locks.
-	 * We cannot take the lock in here or run any kind of assert because
-	 * of i915 inconsistency.
-	 * But at this point the xe irq is better protected against races,
-	 * although the full solution would be protecting the i915 side.
-	 */
-	return xe->irq.enabled;
+	return atomic_read(&xe->irq.enabled);
 }
 
 void intel_synchronize_irq(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1373a222f5a5..ace22e35e769 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -347,7 +347,7 @@ struct xe_device {
 		spinlock_t lock;
 
 		/** @irq.enabled: interrupts enabled on this device */
-		bool enabled;
+		atomic_t enabled;
 	} irq;
 
 	/** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 7bf7201529ac..1c509e66694d 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -348,12 +348,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 	unsigned long intr_dw[2];
 	u32 identity[32];
 
-	spin_lock(&xe->irq.lock);
-	if (!xe->irq.enabled) {
-		spin_unlock(&xe->irq.lock);
+	if (!atomic_read(&xe->irq.enabled))
 		return IRQ_NONE;
-	}
-	spin_unlock(&xe->irq.lock);
 
 	master_ctl = xelp_intr_disable(xe);
 	if (!master_ctl) {
@@ -417,12 +413,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 
 	/* TODO: This really shouldn't be copied+pasted */
 
-	spin_lock(&xe->irq.lock);
-	if (!xe->irq.enabled) {
-		spin_unlock(&xe->irq.lock);
+	if (!atomic_read(&xe->irq.enabled))
 		return IRQ_NONE;
-	}
-	spin_unlock(&xe->irq.lock);
 
 	master_tile_ctl = dg1_intr_disable(xe);
 	if (!master_tile_ctl) {
@@ -644,12 +636,8 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
 	struct xe_tile *tile;
 	unsigned int id;
 
-	spin_lock(&xe->irq.lock);
-	if (!xe->irq.enabled) {
-		spin_unlock(&xe->irq.lock);
+	if (!atomic_read(&xe->irq.enabled))
 		return IRQ_NONE;
-	}
-	spin_unlock(&xe->irq.lock);
 
 	for_each_tile(tile, xe, id)
 		xe_memirq_handler(&tile->memirq);
@@ -674,10 +662,9 @@ static void irq_uninstall(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int irq;
 
-	if (!xe->irq.enabled)
+	if (!atomic_xchg(&xe->irq.enabled, 0))
 		return;
 
-	xe->irq.enabled = false;
 	xe_irq_reset(xe);
 
 	irq = pci_irq_vector(pdev, 0);
@@ -724,7 +711,7 @@ int xe_irq_install(struct xe_device *xe)
 		return err;
 	}
 
-	xe->irq.enabled = true;
+	atomic_set(&xe->irq.enabled, 1);
 
 	xe_irq_postinstall(xe);
 
@@ -744,9 +731,7 @@ void xe_irq_suspend(struct xe_device *xe)
 {
 	int irq = to_pci_dev(xe->drm.dev)->irq;
 
-	spin_lock_irq(&xe->irq.lock);
-	xe->irq.enabled = false; /* no new irqs */
-	spin_unlock_irq(&xe->irq.lock);
+	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
 
 	synchronize_irq(irq); /* flush irqs */
 	xe_irq_reset(xe); /* turn irqs off */
@@ -762,7 +747,7 @@ void xe_irq_resume(struct xe_device *xe)
 	 * 1. no irq will arrive before the postinstall
 	 * 2. display is not yet resumed
 	 */
-	xe->irq.enabled = true;
+	atomic_set(&xe->irq.enabled, 1);
 	xe_irq_reset(xe);
 	xe_irq_postinstall(xe); /* turn irqs on */
 
-- 
2.43.2

