Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC92C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 14:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA1F10E1B5;
	Tue, 22 Jul 2025 14:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWunJcex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC29810E6A4
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753193503; x=1784729503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5W6RUWKd2M9b0pmubYt0jQRaFuGDoWVNw7Xbc9Aooqg=;
 b=WWunJcexbAbreBUWDuORBIS6ftcsGg5Wl+tssiWFpKuNRaTkS+Ik7X+a
 n28SAXgHnmUhw67KVfzTW8ubWonJo4Q0ufyH0c9dY4GU5ml9hjDMfjlqK
 Yf6DG1xTgEQoWGFAyB37N2+9wQw+Vzl7VKhHYDWVan4tdkna/kkMx/Y4H
 M8597D7KRzIcYTkNp53E35z1SBVwC56yC5Hhg4InTjeuBOHUCrBnPsxfA
 5ALMjiUgKN/FfTvni0AqEVzV9PG+g4tfwp8SIlkSozpBqTMaeWByDXkzH
 dwY3zScCfZe6RT2D3lZAlKKjt/uMtBaFgo5/nn1uaHonUUcARN8yrqyM6 A==;
X-CSE-ConnectionGUID: HMnlv7gpRVmI4AWi0b6OPQ==
X-CSE-MsgGUID: pPYswKbIRkauE4I75XoTkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54663035"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54663035"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:42 -0700
X-CSE-ConnectionGUID: I4zxTwrlRZ+Jn3GDeJX/7A==
X-CSE-MsgGUID: VtoKXI8PS+y1pn65wtZb+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163396285"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 5/6] drm/xe/configfs: Only allow configurations for
 supported devices
Date: Tue, 22 Jul 2025 16:10:58 +0200
Message-ID: <20250722141059.30707-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722141059.30707-1-michal.wajdeczko@intel.com>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index f83e8e9f070f..b593337d05b3 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -264,10 +264,21 @@ static const struct config_item_type xe_config_device_type = {
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
+	const struct xe_device_desc *match;
 	struct xe_config_device *dev;
 	struct pci_dev *pdev;
 	char canonical[16];
@@ -286,8 +297,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
+
+	match = xe_match_desc(pdev);
+
 	pci_dev_put(pdev);
 
+	if (!match)
+		return ERR_PTR(-ECANCELED);
+
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
-- 
2.47.1

