Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF78FC87FCB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 12:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DC310E004;
	Tue, 12 Aug 2025 12:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLvP5c9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CF310E004
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755001655; x=1786537655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JGBuMkM9NMJZBsSOJm0RRYdHjcevwCGARks02dCzJxI=;
 b=SLvP5c9UBggeLaG7STqVK7p8nfNat7NFhIqk/PDpf849FC5iGUNJ5LBT
 SfEc2BEIwtPN+6YErj5EP34SJIA9IThT5jyyNNYTomhSA4Gg49KwQWjTV
 k+SM/rW9EUpGjrDetEL1WJAcySCM53+3HK5EAqYO+Kz2px8N5cWN+tdRH
 1/4TJdN26AKs9zz/07rI4e53O6HgSz1QYR0EHnWdqsIeiBvkN0nIERBKO
 U6IFObuT8+nc3A7jeNJgVslaeLkb+FSQAkIC2GSzks7RKMNYe0z9A+yeJ
 dQ5C/RoAs3zVS1RBfFLtEqtwOTreuBBgVoGBNyhas+gHMrEkdcJWoRxw+ Q==;
X-CSE-ConnectionGUID: sJH3XRsPS1aWT7lHyEAM2Q==
X-CSE-MsgGUID: qtr8NWiaR1+eJyTDW6/DCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74855496"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="74855496"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 05:27:34 -0700
X-CSE-ConnectionGUID: JAedeROYQM+iqksFR0jWDQ==
X-CSE-MsgGUID: EvFr3bRjS8GLkCqHijmCMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="166571348"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2025 05:27:33 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Introduce xe_i2c_present()
Date: Tue, 12 Aug 2025 17:56:46 +0530
Message-Id: <20250812122646.1178231-1-raag.jadav@intel.com>
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

In preparation of wider usecases which require checking for I2C
controller presence, introduce xe_i2c_present() helper.

Suggested-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 18 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_i2c.h |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index bc7dc2099470..6534ec5de6dc 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -146,6 +146,20 @@ static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
 	fwnode_remove_software_node(i2c->adapter_node);
 }
 
+/**
+ * xe_i2c_present: I2C controller is present and functional
+ * @xe: xe device instance
+ *
+ * Check whether the I2C controller is present and functioning with valid
+ * endpoint cookie.
+ *
+ * Return: %true if present, %false otherwise.
+ */
+bool xe_i2c_present(struct xe_device *xe)
+{
+	return xe->i2c && xe->i2c->ep.cookie == XE_I2C_EP_COOKIE_DEVICE;
+}
+
 /**
  * xe_i2c_irq_handler: Handler for I2C interrupts
  * @xe: xe device instance
@@ -230,7 +244,7 @@ void xe_i2c_pm_suspend(struct xe_device *xe)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
-	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+	if (!xe_i2c_present(xe))
 		return;
 
 	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
@@ -241,7 +255,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
-	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+	if (!xe_i2c_present(xe))
 		return;
 
 	if (d3cold)
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index b767ed8ce52b..ecd5f10358e2 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -49,11 +49,13 @@ struct xe_i2c {
 
 #if IS_ENABLED(CONFIG_I2C)
 int xe_i2c_probe(struct xe_device *xe);
+bool xe_i2c_present(struct xe_device *xe);
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_i2c_pm_suspend(struct xe_device *xe);
 void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
 #else
 static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
+static inline bool xe_i2c_present(struct xe_device *xe) { return false; }
 static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
 static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
 static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
-- 
2.34.1

