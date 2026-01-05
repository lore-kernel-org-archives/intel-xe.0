Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF99C2A062
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 08:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FBF10E212;
	Mon,  5 Jan 2026 08:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4T2dRRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126610E212
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767600560; x=1799136560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RzFNHXPqPcFszRbhXPi0rru1KZ7U+oc1xaQlGFCGwZU=;
 b=X4T2dRRqz8V0H2NtUEh2cK2BIsd+0a43Uls+74Bcp7xA88A9GHo8zU2X
 SW5sxmySRjfwfviNby4KcTlwiykp2sKUGy3FHhzSBe1BeRLjREEiret/O
 x1LieGfk2Z/Pq6ACrZ7KWhnCatiNriWRp1F0el5ePx/Ot2c6S86OItILz
 za2wyd8Qo+jC4xXR0rjnZ3uWkx/8ouiOYdXSVXud9ykX0ErU5HgNMqvvE
 Nxhzp+OtB3tlMNuDLxLUv9AEEZACjcAgOEqNUXucxjuqqJccuMvg6inhQ
 97rwTljoqFult7P3e6HrS6V+eI6ZsxOXzX9R9cLcE0u7Q8CNEpetmpDaM w==;
X-CSE-ConnectionGUID: rXn1GhKlT/q+6lahrp+BoA==
X-CSE-MsgGUID: pZJ8ZLVKQGGwxKJyiYtT1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69007256"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69007256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:09:20 -0800
X-CSE-ConnectionGUID: LHlOJG+bQrSdHV+svXcpgQ==
X-CSE-MsgGUID: QzDKzp2dRni4thqhzABtIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="233474904"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2026 00:09:17 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/i2c: Force polling mode in survivability
Date: Mon,  5 Jan 2026 13:37:50 +0530
Message-ID: <20260105080750.16605-1-raag.jadav@intel.com>
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

SGUnit interrupts are not initialized in survivability. Force I2C
controller to polling mode while in survivability.

v2: Use helper function instead of manual check (Riana)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c                | 9 ++++++---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 8eccbae05705..befc77e46eae 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -31,6 +31,7 @@
 #include "xe_i2c.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_survivability_mode.h"
 
 /**
  * DOC: Xe I2C devices
@@ -213,11 +214,13 @@ static const struct irq_domain_ops xe_i2c_irq_ops = {
 	.map = xe_i2c_irq_map,
 };
 
-static int xe_i2c_create_irq(struct xe_i2c *i2c)
+static int xe_i2c_create_irq(struct xe_device *xe)
 {
+	struct xe_i2c *i2c = xe->i2c;
 	struct irq_domain *domain;
 
-	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
+	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ) ||
+	    xe_survivability_mode_is_boot_enabled(xe))
 		return 0;
 
 	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
@@ -351,7 +354,7 @@ int xe_i2c_probe(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	ret = xe_i2c_create_irq(i2c);
+	ret = xe_i2c_create_irq(xe);
 	if (ret)
 		goto err_unregister_notifier;
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4c716182ad3b..31456f432fc8 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -321,7 +321,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
-	/* Make sure xe_heci_gsc_init() knows about survivability mode */
+	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
 	survivability->mode = true;
 
 	xe_heci_gsc_init(xe);
-- 
2.43.0

