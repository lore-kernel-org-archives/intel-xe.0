Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932D9106FD9B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 08:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5310E10EB0B;
	Fri, 13 Mar 2026 08:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ok1oKO7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1E010EB0B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773389287; x=1804925287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wnssDGKb8jkcjBWVCOV4dMocqygJdkF0NapiEHlHSno=;
 b=Ok1oKO7h1QVQABJgAQIB0NXqWIP3grdBwQuPZMYwfuqA31QDWNozphrs
 Ez5z/5Wd2YEFR4l4sxoM6646WRKKmTP3XKCBeCMG39r+P8Il8TkIyvIfy
 s4sZfTXk4WkDu15N2qU4dOL7M6KtT0RTj5B7GJYnTdzogsh8vbEhYu/u8
 9T3l4U/t0oVXSXIyGPOlfgo54Fq2FR2pGsQi4VgtE1ZOcLvYX10P6oIxx
 DNF1SvLNPaeMqHmVI2PsSnJaXfwNjLLtXg+ophMu74R+QykW+9qjXt3UC
 gObB5YeAfSbFvyG8+FetTdA1F5v21VPSsJiTTzCbMBv+pifHA2XvJeRuX w==;
X-CSE-ConnectionGUID: hHn6VCZHQXirAUbfPE7jGQ==
X-CSE-MsgGUID: hpc8Dtk1ThK59b0TmFYARQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="73512201"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="73512201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 01:08:06 -0700
X-CSE-ConnectionGUID: tbuuktkrTZ+qoUY1b3R69Q==
X-CSE-MsgGUID: 4SqpYi8BQFyRdZkf380mvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="223466875"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 13 Mar 2026 01:08:04 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Assert/Deassert I2C IRQ
Date: Fri, 13 Mar 2026 13:34:38 +0530
Message-ID: <20260313080438.4166251-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

I2C IRQ is triggered using virtual wire. Assert/Deassert it in IRQ
handler to allow subsequent interrupt generation.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 1deb812fe01d..706783863d07 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -176,11 +176,18 @@ static bool xe_i2c_irq_present(struct xe_device *xe)
  */
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
-	if (!xe_i2c_irq_present(xe))
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
 		return;
 
-	if (master_ctl & I2C_IRQ)
-		generic_handle_irq_safe(xe->i2c->adapter_irq);
+	/* Forward interrupt to I2C adapter */
+	generic_handle_irq_safe(xe->i2c->adapter_irq);
+
+	/* Deassert after I2C adapter clears the interrupt */
+	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
+	/* Reassert to allow subsequent interrupt generation */
+	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
 }
 
 void xe_i2c_irq_reset(struct xe_device *xe)
@@ -190,6 +197,7 @@ void xe_i2c_irq_reset(struct xe_device *xe)
 	if (!xe_i2c_irq_present(xe))
 		return;
 
+	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
 	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, 0);
 }
 
@@ -201,6 +209,7 @@ void xe_i2c_irq_postinstall(struct xe_device *xe)
 		return;
 
 	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, 0, ACPI_INTR_EN);
+	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
 }
 
 static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
-- 
2.43.0

