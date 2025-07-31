Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE503C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCF110E7D9;
	Thu, 31 Jul 2025 19:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uk8AHk2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7234C10E7D9
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990450; x=1785526450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DvX058Afse2fj7j17ia/NeprTXyBBzQhAtXxhq8fmC0=;
 b=Uk8AHk2CKQajdwhKtGx7nrxbP7wl8B97Bht0lL4+uZszErM1Fo3UrQ/1
 JcAyY+nY3CVplu4dpan13whdDrVOrLtWIn7p67AfcNUlZX+vKGzE4ezR5
 aH73olVTEPDDpLk+RQthvmDMjPm/ZwcebFvgpdzLITIziVC23IKRoBeUE
 bC7GCXfS5IUS/LPzI27vARcIdAwHz1vHHvNv/WyvxKrqvARels01aP+9r
 hF+24emURmngfeakQnPRIOCsVG1qN/f1tJHf/YWo1REGAmD9VcWnb3ZP4
 PemZfBuxD9fd4NZLGOVhMJpTgfe0fKu1w2MnbcxpQQJPPhwyHomLYm2ec g==;
X-CSE-ConnectionGUID: bYph0Am7STysBoAAAR2F4Q==
X-CSE-MsgGUID: dsB0k6YPRzaDThQfhsOE/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395033"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:10 -0700
X-CSE-ConnectionGUID: 1rQHH6M1RUm5x7CnENrX3A==
X-CSE-MsgGUID: kqUCnofLS46CGX+yH1b3tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194334024"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 11/11] drm/xe/configfs: Allow adding configurations for
 future VFs
Date: Thu, 31 Jul 2025 21:33:39 +0200
Message-ID: <20250731193339.179829-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since we are expecting that all configuration directory names
will match some of the existing devices, we can't provide any
configuration for the VFs until they are actually enabled.

But we can relax that restriction by just checking if there
is a PF device that could create given VF. This is easy since
all our PF devices are always present at function 0 and we can
query PF device for number of VFs it could support.

Then for some system with PF device at 0000:00:02.0 we can add
configs for all VFs:

  /sys/kernel/config/xe/
  ├── 0000:00:02.0
  │   └── ...
  ├── 0000:00:02.1
  │   └── ...
  ├── 0000:00:02.2
  │   └── ...
  :
  └── 0000:00:02.7
      └── ...

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3
---
v2: rebase and improve checks, fix include order
v3: put correct device (Lucas)
v4: rebase and change reporting
---
 drivers/gpu/drm/xe/xe_configfs.c | 35 +++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 0e2da7907afc..c2da2c60e321 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -12,9 +12,9 @@
 #include <linux/string.h>
 
 #include "xe_configfs.h"
-#include "xe_module.h"
-
 #include "xe_hw_engine_types.h"
+#include "xe_module.h"
+#include "xe_pci_types.h"
 
 /**
  * DOC: Xe Configfs
@@ -285,6 +285,15 @@ static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
 	return found ? (const void *)found->driver_data : NULL;
 }
 
+static struct pci_dev *get_physfn_instead(struct pci_dev *virtfn)
+{
+	struct pci_dev *physfn = pci_physfn(virtfn);
+
+	pci_dev_get(physfn);
+	pci_dev_put(virtfn);
+	return physfn;
+}
+
 static struct config_group *xe_config_make_device_group(struct config_group *group,
 							const char *name)
 {
@@ -293,6 +302,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	const struct xe_device_desc *match;
 	struct pci_dev *pdev;
 	char canonical[16];
+	int vfnumber = 0;
 	int ret;
 
 	ret = sscanf(name, "%x:%x:%x.%x", &domain, &bus, &slot, &function);
@@ -306,12 +316,31 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-EINVAL);
 
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
+	if (!pdev && function)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
+	if (!pdev && slot)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
 
 	match = xe_match_desc(pdev);
-	if (!match)
+
+	if (PCI_DEVFN(slot, function) != pdev->devfn) {
+		pdev = get_physfn_instead(pdev);
+		vfnumber = PCI_DEVFN(slot, function) - pdev->devfn;
+		if (!dev_is_pf(&pdev->dev) || vfnumber > pci_sriov_get_totalvfs(pdev)) {
+			pci_dev_put(pdev);
+			return ERR_PTR(-ENODEV);
+		}
+	}
+
+	match = xe_match_desc(pdev);
+	if (match && vfnumber && !match->has_sriov) {
+		pci_info(pdev, "xe driver does not support VFs on this device\n");
+		match = NULL;
+	} else if (!match) {
 		pci_info(pdev, "xe driver does not support configuration of this device\n");
+	}
 
 	pci_dev_put(pdev);
 
-- 
2.47.1

