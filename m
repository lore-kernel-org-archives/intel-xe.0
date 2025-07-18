Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190D8C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 14:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA17510E9C7;
	Fri, 18 Jul 2025 14:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSasR4Ky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E7210E9C7
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752848258; x=1784384258;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J+CpfRVVaymiS4YbbjqUB2wyKw0mfT7QcToCQBsyNEE=;
 b=iSasR4KyJQKFibghdmZfbR2zMBjKbTIMOEynXwFO+MhdtAqX3HWQTau7
 dVp9QnBcRhBzyhd/Pvcn7ViholX5S7fj8ts4Xu45jZvQJWntyXwB/TrhS
 toftzZf38gAc0tUethmhJy/pUfP3UBTiLSXpCOEaOhXn8gNpP8EAmMQAt
 2UBerl0SECGerSmBZjdwAuupf5eAD4YiNLYdmau2cG5hYrvllkwkDIFFq
 HSLI0pNkIaJkrO+rtc/Im0RezmicCfzz/n3wC0pieNVHcjiVzwAeZfAv3
 x4Nw7/PGQGmyvFhJDTxf0a9IF0ODXNxDeSGOgiW14yVcTDEzj97OvM2Ej g==;
X-CSE-ConnectionGUID: aQtfgV6DRlyv7d7f9Mn0MQ==
X-CSE-MsgGUID: 8+PzzqL4Qc26/Z0/9CiMKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55265345"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="55265345"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:17:38 -0700
X-CSE-ConnectionGUID: cJc6g/HRTfaGP5n0CPYxtg==
X-CSE-MsgGUID: N2wAn0trRJ2o4Gn/+a/waQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="195201207"
Received: from avoron-mobl1.ccr.corp.intel.com (HELO
 mwajdecz-MOBL.ger.corp.intel.com) ([10.245.96.74])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:17:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Date: Fri, 18 Jul 2025 16:17:27 +0200
Message-Id: <20250718141727.939-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250717184825.851-5-michal.wajdeczko@intel.com>
References: <20250717184825.851-5-michal.wajdeczko@intel.com>
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

The Xe driver supports only Intel GPUs devices that all are PCI
VGA class devices. Reject creation of configuration directories
for PCI device addresses that are not Intel or VGA.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 36e2b45b305f..59b18f6a46b0 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -260,6 +260,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	struct xe_config_device *dev;
 	struct pci_dev *pdev;
 	char canonical[16];
+	bool match;
 	int ret;
 
 	ret = sscanf(name, "%x:%x:%x.%x", &domain, &bus, &slot, &function);
@@ -275,8 +276,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
+
+	match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;
+
 	pci_dev_put(pdev);
 
+	if (!match)
+		return ERR_PTR(-ENODEV);
+
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
-- 
2.47.1

