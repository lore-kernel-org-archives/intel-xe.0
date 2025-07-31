Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11502C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41FE10E7DF;
	Thu, 31 Jul 2025 19:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQTBAYD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B48D10E7D5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990449; x=1785526449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kz1EMGjnF9xWlCrjBEDBy5Z6K3izL8ptPifN7jbC3Q4=;
 b=fQTBAYD4aU3YDp8am8chY7v1hSz3i4p5wIooqbkgzvqIzEs4Js8S4SzR
 QOHR8MR/rQej5mFz41bEhQCu8zKNDcyXldQuP1vkdvhTrj4LXhCHYN4HC
 w6tqSffLJhnAL/1kp4ShEKN/YtYvTERQKV+6ovcrnegczBhif0BMFn97w
 17iEJoyC2sLnfbIcwYN951KUrjkjda+6wu1h2gIJlX4wuTo6v2d7KTSpb
 4QCTLUeK+FaMHHeRqaPgd4N0kjsG/Yhjf3c5gOYsFGMPSiNO4xAXjRjWf
 FRic/6b9oPfjU85GH1uzxX99X7ZnzDyBPxKndrZ7IF5wqz4w3M4eEMZcO A==;
X-CSE-ConnectionGUID: ytzi5X9ZTsiR75Crygy34Q==
X-CSE-MsgGUID: 4uQTGkHFSQSBf5Af/fnQDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395031"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395031"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:08 -0700
X-CSE-ConnectionGUID: rr+nnCVxTcGZ/KKrz3236Q==
X-CSE-MsgGUID: XnTgCC4oTZuf73+bUuieJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194334014"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Date: Thu, 31 Jul 2025 21:33:38 +0200
Message-ID: <20250731193339.179829-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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

Since we already lookup for the real PCI device before we allow
to create its directory config, we might also check if the found
device matches our driver PCI ID list. This will prevent creation
of the directory configs for the unsupported devices.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: rebased
v3: don't use -ECANCELED, print message instead (Rodrigo, John)
---
 drivers/gpu/drm/xe/xe_configfs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 5f145ccdf535..0e2da7907afc 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
+{
+	struct device_driver *driver = driver_find("xe", &pci_bus_type);
+	struct pci_driver *drv = to_pci_driver(driver);
+	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
+	const struct pci_device_id *found = pci_match_id(ids, pdev);
+
+	return found ? (const void *)found->driver_data : NULL;
+}
+
 static struct config_group *xe_config_make_device_group(struct config_group *group,
 							const char *name)
 {
 	unsigned int domain, bus, slot, function;
 	struct xe_config_group_device *dev;
+	const struct xe_device_desc *match;
 	struct pci_dev *pdev;
 	char canonical[16];
 	int ret;
@@ -297,8 +308,16 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
+
+	match = xe_match_desc(pdev);
+	if (!match)
+		pci_info(pdev, "xe driver does not support configuration of this device\n");
+
 	pci_dev_put(pdev);
 
+	if (!match)
+		return ERR_PTR(-ENOENT);
+
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
-- 
2.47.1

