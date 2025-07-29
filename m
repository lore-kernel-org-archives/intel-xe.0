Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DB6C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9829510E611;
	Tue, 29 Jul 2025 11:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/EpzcDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1611210E61D
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789364; x=1785325364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EY8TWkuy8vwGyjyNgffzumYiRKny6NCBME+YpJR5Jcg=;
 b=n/EpzcDVPOVP4LWQrX22n0GtxIt10RNDYQqGFbOcwWrucyposa961iT6
 4tgnTGsIvtcQet3ItVSCMAZmL9bZ/ccO92ibTenRijt/nwM8FnnQ8Sj1s
 erwGcmWOvIUEcrtrwcfI+14NdCe+p7BbJOQJYZHc/I82poLnTx601NYKO
 Y2Ek+R87keUciXJ3f9Wq80COxsDK3LhwlE+hxd6G2t7qcj1w/r8/aUiWa
 kx1itKmw/qtB/R+d1OP0LSzNrZi8ZuTbXuJEaKO6DzFhcL/hNTbUSibaY
 7y2Zshb/CgdahJhjT04GyZXOZ5r/gwvNS9BF69i1Th5iWabUqu4Dzifdm Q==;
X-CSE-ConnectionGUID: /GwxFBIeTF6Fjlf5sBzkfg==
X-CSE-MsgGUID: iqOs6oizTzyPZEOgIQm3Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755596"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755596"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:43 -0700
X-CSE-ConnectionGUID: 7NbL9Cu4Sg6MbEziTD6TaA==
X-CSE-MsgGUID: 10Cn49FeR1e4QFWm4fooxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946974"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Date: Tue, 29 Jul 2025 13:42:14 +0200
Message-ID: <20250729114215.177586-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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
v2: rebased
---
 drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 5f145ccdf535..766775772eef 100644
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
@@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
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

