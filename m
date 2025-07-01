Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE0DC7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED61310E59D;
	Tue,  1 Jul 2025 12:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7yUwRnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A364510E59D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751372599; x=1782908599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rc7OivDJNjRA9VAKR93l3lXEH93MlI9b8rIftpAFcwM=;
 b=a7yUwRnBGmdoVYddY5ftKtFkd/ocIvEI0fPQkmJ81oZUQ5ZvdJwmPpBq
 GR2MSHdICEHYasxUqz+CWcHZYj/StAOhtHMlXQoORADbVB3uN4q8GbZGn
 +IGcKGhQ8yYHUQp/4yCpNjVEHiiYcY2jMqW1m7Gt2HZc0P8PqDvi5icxf
 WoevFl98DgZ9PMOBQGuj6rD8cUJtKAZxFdZayAM5paX90yO8LvjTNQqeI
 8qXHZ2mDUScIxVqllHFjEc4Te3h9+cKfbBxwTPjjBUpDLkCi37G8M6vjL
 PwgDCIJ3mBvbvGYZfpBfVRrrrVaNVEyix5/e0JtycBtalWKB4wmXw4kQk Q==;
X-CSE-ConnectionGUID: ML3ab9SHSoyly23WNivJIg==
X-CSE-MsgGUID: bCNNI7RPQ4+LcvYBEi+90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196736"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71196736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:23:18 -0700
X-CSE-ConnectionGUID: QZKXZb2RQBW1IEzXE+eU1g==
X-CSE-MsgGUID: KvIzNQviToKtS7Cl2YSXMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153157500"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:23:13 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karthik Poosa <karthik.poosa@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v6 4/5] drm/xe/pm: Wire up suspend/resume for I2C controller
Date: Tue,  1 Jul 2025 15:22:51 +0300
Message-ID: <20250701122252.2590230-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
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

From: Raag Jadav <raag.jadav@intel.com>

Wire up suspend/resume handles for I2C controller to match its power
state with SGUnit.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_i2c.c           | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
 drivers/gpu/drm/xe/xe_pm.c            |  9 +++++++++
 4 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
index 92dae4487614..af781c8e4a80 100644
--- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
@@ -2,6 +2,8 @@
 #ifndef _XE_I2C_REGS_H_
 #define _XE_I2C_REGS_H_
 
+#include <linux/pci_regs.h>
+
 #include "xe_reg_defs.h"
 #include "xe_regs.h"
 
@@ -12,4 +14,7 @@
 #define REG_SG_REMAP_ADDR_PREFIX	XE_REG(SOC_BASE + 0x0164)
 #define REG_SG_REMAP_ADDR_POSTFIX	XE_REG(SOC_BASE + 0x0168)
 
+#define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
+#define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
+
 #endif /* _XE_I2C_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index ef91239879c0..d395795d1e7e 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -226,6 +226,31 @@ static const struct regmap_config i2c_regmap_config = {
 	.fast_io = true,
 };
 
+void xe_i2c_pm_suspend(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+		return;
+
+	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
+	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
+}
+
+void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+		return;
+
+	if (d3cold)
+		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
+
+	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
+	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
+}
+
 static void xe_i2c_remove(void *data)
 {
 	struct xe_i2c *i2c = data;
@@ -270,6 +295,10 @@ int xe_i2c_probe(struct xe_device *xe)
 	i2c->mmio = xe_root_tile_mmio(xe);
 	i2c->drm_dev = drm_dev;
 	i2c->ep = ep;
+	xe->i2c = i2c;
+
+	/* PCI PM isn't aware of this device, bring it up and match it with SGUnit state. */
+	xe_i2c_pm_resume(xe, true);
 
 	regmap = devm_regmap_init(drm_dev, NULL, i2c, &i2c_regmap_config);
 	if (IS_ERR(regmap))
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index 7ea40f4e4aa4..b767ed8ce52b 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -50,9 +50,13 @@ struct xe_i2c {
 #if IS_ENABLED(CONFIG_I2C)
 int xe_i2c_probe(struct xe_device *xe);
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
+void xe_i2c_pm_suspend(struct xe_device *xe);
+void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
 #else
 static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
 static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
+static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
+static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 26e95460af87..46471e166b96 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -19,6 +19,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
+#include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
@@ -146,6 +147,8 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_display_pm_suspend_late(xe);
 
+	xe_i2c_pm_suspend(xe);
+
 	drm_dbg(&xe->drm, "Device suspended\n");
 	return 0;
 
@@ -191,6 +194,8 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
@@ -484,6 +489,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_display_pm_runtime_suspend_late(xe);
 
+	xe_i2c_pm_suspend(xe);
+
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return 0;
@@ -531,6 +538,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 
+	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-- 
2.47.2

