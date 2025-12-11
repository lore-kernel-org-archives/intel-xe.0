Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E50D41D7E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 18:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C379D10E714;
	Thu, 11 Dec 2025 18:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqCpST2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2AC10E714
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765477510; x=1797013510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TspHZ95tx6Gb7jwKfSZszQDjgTsIj/urZfJN+MmY0Bg=;
 b=jqCpST2KV9JJTvLxCgYhN4QXGx914jUIf2jxgsfF0pKuCoLrzb+Ql9Af
 GfIGjqpGf9S9X+MabdfY1MnkwEq7ZhsP6uLtnYXBO4uPkWuguNkRy199C
 tvWecoAy2taiKqoESZ7dxkWHdlT9BpWLIeOxsvdgYK8yhzW4d2WQ+ep/e
 h6eHkmgvwctwl9AU7YZgVa+DIetuDCtZZkCeXa6iqpe9Au+0eP05cmFWc
 E1F3lNXf2TX2ccESQT5iG74+sGODLIPl+5V1Rhqk3d8pjnpbU1K1G2rYK
 L4HqOT4oePh91N2Rk4LGvNnVQnz5pLoxBkETDh+zGDdMQVwKKlC4TuFko w==;
X-CSE-ConnectionGUID: bcRHkXpBS8K8hGrFCjMFQg==
X-CSE-MsgGUID: xgkLGy1NRiGmc3umsEpG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70048861"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="70048861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:25:10 -0800
X-CSE-ConnectionGUID: aMfDMkR4R/C1A4ZHmm/Y1A==
X-CSE-MsgGUID: t6dFTr6CT+uXGS1b9Tm35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201955921"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 11 Dec 2025 10:25:09 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Force polling mode in survivability
Date: Thu, 11 Dec 2025 23:53:53 +0530
Message-ID: <20251211182353.1149481-1-raag.jadav@intel.com>
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

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c                | 8 +++++---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 8eccbae05705..6f14ba1e5217 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -213,11 +213,13 @@ static const struct irq_domain_ops xe_i2c_irq_ops = {
 	.map = xe_i2c_irq_map,
 };
 
-static int xe_i2c_create_irq(struct xe_i2c *i2c)
+static int xe_i2c_create_irq(struct xe_device *xe)
 {
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_i2c *i2c = xe->i2c;
 	struct irq_domain *domain;
 
-	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
+	if (survivability->mode || !(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
 		return 0;
 
 	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
@@ -351,7 +353,7 @@ int xe_i2c_probe(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	ret = xe_i2c_create_irq(i2c);
+	ret = xe_i2c_create_irq(xe);
 	if (ret)
 		goto err_unregister_notifier;
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7520d7b7f9b8..a34a638bfb76 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -324,7 +324,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
-	/* Make sure xe_heci_gsc_init() knows about survivability mode */
+	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
 	survivability->mode = true;
 
 	xe_heci_gsc_init(xe);
-- 
2.43.0

