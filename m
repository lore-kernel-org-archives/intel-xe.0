Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE74CC83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8415F10E618;
	Tue, 29 Jul 2025 11:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSjasZfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A9110E61D
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789365; x=1785325365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bj8PgZPvv4XZR3SpOIG6nJIO2ZYdRy7zSqkiE/zixfY=;
 b=OSjasZfhV7L0wbIFlW0vscSXfV7B/LPcJCebU0N61pNlh9k8nJYVFIii
 n0fn5uSUJvD5ELiyipt44UyFHeDDv4uHF7FLhh4vVh6S/J+yqGOEomcdr
 8xV6G10wig2WEGFYqOWUFBi//VmMnm4FrvDwjToCRSHlRQPEVM0ipi1HK
 lrptvbwCqoTDuLae0GhCA9qIqbQwRMBLJt4n82moYA1jiGvjPCeMt62yM
 QaWmwK0Zj2ihOD3nDuK7pxJyiHapu5GvQkLHfxolxAloGsWqyfZVkHH77
 88NdCPK/tWezZM9r6+VUKX85Q+2PpIbdiPZwFy8A94tiYnri4cPdOlpy/ A==;
X-CSE-ConnectionGUID: 81Yr+fNFSsu6lE/BFUW5HA==
X-CSE-MsgGUID: 2m4ycaq0RzimzycgQayCgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755597"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755597"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:45 -0700
X-CSE-ConnectionGUID: AkHyygB2T3KMJMhbyoYwkA==
X-CSE-MsgGUID: Z6nR1gWLTwacHPCmFMoYRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946985"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 11/11] drm/xe/configfs: Allow adding configurations for
 future VFs
Date: Tue, 29 Jul 2025 13:42:15 +0200
Message-ID: <20250729114215.177586-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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
---
v2: rebase and improve checks, fix include order
v3: put correct device (Lucas)
---
 drivers/gpu/drm/xe/xe_configfs.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 766775772eef..da9a8e64621f 100644
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
@@ -306,11 +315,22 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-EINVAL);
 
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
+	if (!pdev && function)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
+	if (!pdev && slot)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
+	pdev = get_physfn_instead(pdev);
 
 	match = xe_match_desc(pdev);
+	if (match) {
+		int vfnumber = PCI_DEVFN(slot, function) - pdev->devfn;
 
+		if (vfnumber && (!dev_is_pf(&pdev->dev) || !match->has_sriov ||
+				 vfnumber > pci_sriov_get_totalvfs(pdev)))
+			match = NULL;
+	}
 	pci_dev_put(pdev);
 
 	if (!match)
-- 
2.47.1

