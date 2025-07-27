Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9934AC87FCF
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFD710E309;
	Sun, 27 Jul 2025 17:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jD5nxea2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2540310E3DA
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636833; x=1785172833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1j3Y5fRxL1m+ZOfAqeiMSwW+u9k+/spm7dfhJbqFa6I=;
 b=jD5nxea2eCxKDx/uyiO6NqUPfrswET02Je8C8DYn5dQTZ1i/THDtAUxu
 oJ8ZJEmREXHFu8aDcNUwL/fNJk9dAO0M0j1thiyZ3IbGtNds/5BKWyssi
 17ms+VSQj897LTzBJAc3hb4qUxnpAaaLD2HILMDdllYBlsWWG9teo4OV5
 pG2qCcxBeIAsZhmLCoUJEohGKB7/F2VOjN9dkLw7lTA6ZSmiIpKQPBm8s
 6lfH5P/OyZtqo1PrvqRmGvdarLel1EAfDmocHUjjYZy8WxoB+2ksvKt+K
 R0CC1NzKsPp9WeVK+NsHJsdug1R5v0lnDs9K9oXVwzqqap/RD84vGUHBi w==;
X-CSE-ConnectionGUID: hJqV3h1USyOlsMRrWDPqJw==
X-CSE-MsgGUID: iOzH7W44RmuaidK+m+9k1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046736"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:33 -0700
X-CSE-ConnectionGUID: oZ66yvPJSNyykzXLw50BYw==
X-CSE-MsgGUID: RxDmfxvwTp28xVOEGub9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556850"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Date: Sun, 27 Jul 2025 19:20:07 +0200
Message-ID: <20250727172009.587-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727172009.587-1-michal.wajdeczko@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
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
index 73fb6812efe0..928d62750d55 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -273,11 +273,22 @@ static const struct config_item_type xe_config_device_type = {
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
@@ -295,8 +306,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
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

