Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEB5CCD18C
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 12:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDE510E2FC;
	Sat, 11 Oct 2025 12:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hm8Js/YV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840B10E2FC
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Oct 2025 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760186147; x=1791722147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QiwSRNpzwi0lKmhwmPo45z8mYjpdUsHDsP+cB15+EL4=;
 b=Hm8Js/YV/udlks3EgCXpHUeI69Kl6ryz37ByN59EeSIVi0fqn1qrjLge
 I3F1reGA6ulj89QJ7JLdWU0JxzXyvOL0KtLoTeeyALSsBu4v1x6ESosrF
 O+5jLbCXosuKE1bNvQm0dW0huzH1QaaH6yX0/Qrzp8XgJcLY5TyUgcaFZ
 oE8mV4aG6Hj1vqj4R1rkCUuBpzzCoDuKczu44cZZdxIaL9p6cINDVOs0B
 FNmnbwro8QXtxgz1crgz63dAU15DNXeZMneNGeGU6iv1T458wZSGFNiVr
 FLKb9NA4yiJc6LZ+hN5BJCEG9dLa10W4GGnct+kB6dNEsAgxon6tv0SWZ w==;
X-CSE-ConnectionGUID: cZs58pFhR96UmQbETKEb6A==
X-CSE-MsgGUID: zcTkp2y4Sxa67d2qLOk+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="79828062"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="79828062"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 05:35:47 -0700
X-CSE-ConnectionGUID: ZySDj0csTcazI/zsX+ltGA==
X-CSE-MsgGUID: shIhN3XvQBKi0gmeaLJQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="180876090"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2025 05:35:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Date: Sat, 11 Oct 2025 18:05:09 +0530
Message-Id: <20251011123509.3233213-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251011123509.3233213-1-raag.jadav@intel.com>
References: <20251011123509.3233213-1-raag.jadav@intel.com>
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

I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
it. Wire up reset/postinstall handles for I2C IRQ to take care of this.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_i2c.c           | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
index af781c8e4a80..f2e455e2bfe4 100644
--- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
@@ -14,6 +14,9 @@
 #define REG_SG_REMAP_ADDR_PREFIX	XE_REG(SOC_BASE + 0x0164)
 #define REG_SG_REMAP_ADDR_POSTFIX	XE_REG(SOC_BASE + 0x0168)
 
+#define I2C_BRIDGE_PCICFGCTL		XE_REG(I2C_BRIDGE_OFFSET + 0x200)
+#define   ACPI_INTR_EN			REG_BIT(1)
+
 #define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
 #define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
 
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 25c6b8f3c0bb..0b5452be0c87 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -182,6 +182,26 @@ void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
 		generic_handle_irq_safe(xe->i2c->adapter_irq);
 }
 
+void xe_i2c_irq_reset(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!xe_i2c_irq_present(xe))
+		return;
+
+	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, 0);
+}
+
+void xe_i2c_irq_postinstall(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!xe_i2c_irq_present(xe))
+		return;
+
+	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, 0, ACPI_INTR_EN);
+}
+
 static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
 			  irq_hw_number_t hw_irq_num)
 {
@@ -339,6 +359,7 @@ int xe_i2c_probe(struct xe_device *xe)
 	if (ret)
 		goto err_remove_irq;
 
+	xe_i2c_irq_postinstall(xe);
 	return devm_add_action_or_reset(drm_dev, xe_i2c_remove, i2c);
 
 err_remove_irq:
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index ecd5f10358e2..425d8160835f 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -51,12 +51,16 @@ struct xe_i2c {
 int xe_i2c_probe(struct xe_device *xe);
 bool xe_i2c_present(struct xe_device *xe);
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
+void xe_i2c_irq_postinstall(struct xe_device *xe);
+void xe_i2c_irq_reset(struct xe_device *xe);
 void xe_i2c_pm_suspend(struct xe_device *xe);
 void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
 #else
 static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
 static inline bool xe_i2c_present(struct xe_device *xe) { return false; }
 static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
+static inline void xe_i2c_irq_postinstall(struct xe_device *xe) { }
+static inline void xe_i2c_irq_reset(struct xe_device *xe) { }
 static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
 static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 870edaf69388..af519414a429 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -616,6 +616,7 @@ static void xe_irq_reset(struct xe_device *xe)
 	tile = xe_device_get_root_tile(xe);
 	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
 	xe_display_irq_reset(xe);
+	xe_i2c_irq_reset(xe);
 
 	/*
 	 * The tile's top-level status register should be the last one
@@ -657,6 +658,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
 	}
 
 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
+	xe_i2c_irq_postinstall(xe);
 
 	/*
 	 * ASLE backlight operations are reported via GUnit GSE interrupts
-- 
2.34.1

