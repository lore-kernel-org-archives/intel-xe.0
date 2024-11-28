Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4259D69105
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 12:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFD410E46A;
	Thu, 28 Nov 2024 12:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrWJ7QLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26BF10E46A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732798444; x=1764334444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uXY1m0AEJ3mvFgXPv0rM4dagVjs5GZ4hehXifIrV5D0=;
 b=KrWJ7QLFttKtn2IsejNtqscVrXGN1byYxo3QGZJxHAFECef4/3wXbo6r
 PLJte0bkS/ukdT/nx5qGbO268MenyLK3qxuVl+BU1CMmyJ1qNgVn6no6H
 eR5abH8QGg85Zft0agH21qDu4L4aZtZKgjcv8k/Zc2T1RUqdzRvuxrL7y
 Gvk0x2PZFWhl78wYx5+/9dWzUE/EhHfZ2nkvSxppSuu99CyZ3Bv9MRrCu
 BO2hoU1RNDU7ZDzJHeGgm1em7mMuQHdzXrzpK84UHClMRFFhtpMxbENlW
 f3hmSsy9kgGrfUZ9qgquEW2xqMs+cWxiZ2vF6mP4rfwcjVSb1FBDyZjWt w==;
X-CSE-ConnectionGUID: yh3hpHmCQGmcs2qrDSJsqA==
X-CSE-MsgGUID: 77MdtiCiQvGsWd6Iv/y3ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43698644"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="43698644"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:53:59 -0800
X-CSE-ConnectionGUID: BeTZzx11ScuC4Si9JBq8+A==
X-CSE-MsgGUID: XHrR1Xu4RTyqEBhbRwtItw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="93069839"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:53:55 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, piotr.piorkowski@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
Subject: [PATCH v5 1/5] drm/xe: Make irq enabled flag atomic
Date: Thu, 28 Nov 2024 14:53:41 +0200
Message-Id: <20241128125345.1115-2-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128125345.1115-1-ilia.levi@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
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
 drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h      |  2 +-
 drivers/gpu/drm/xe/xe_irq.c               | 29 ++++++-----------------
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index a7dbc6554d69..0c0f4533c34f 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -64,7 +64,7 @@ bool intel_irqs_enabled(struct xe_device *xe)
 	 * But at this point the xe irq is better protected against races,
 	 * although the full solution would be protecting the i915 side.
 	 */
-	return xe->irq.enabled;
+	return atomic_read(&xe->irq.enabled);
 }
 
 void intel_synchronize_irq(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6a04f975ec16..7ee114c17552 100644
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

