Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF803C87FCC
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7605910E313;
	Sun, 27 Jul 2025 17:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXAfrhzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD0610E31A
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636835; x=1785172835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k6wVa5Hltj5Bty2DL3pSJA1hC9w1W4Bg/kRYUpqfOj4=;
 b=iXAfrhzdZY2CO430j7aUqd+ojmUtbsxOxuiIKrC2im/UZ+t7UoxclTmw
 YRLfMQcF1m24vgoQLnHHFZeR89wN6CfwGtE9t/+iloQCtSeF/JptbE+NP
 fuVkI1mWykpMxyO/4Gxujce9dLVbcLXcmttcLqhGmTkKihU8+/XKqmTG0
 94LOvnC4gBZWSeDgG7aX1lSLMSZh+4TxuqHljV0COmoj4THu/0gLUrbc/
 YBd6a4MDz5yWrOKOGaseVRYpsP/SLXvV49+vu59rVspFm1MfFOQR5JN81
 0Qpomh4QX5iCkJ3nrlxr6mMQ8kuuOJaNrKS0Q0hCRJ3QC+TZ52JS83+yj Q==;
X-CSE-ConnectionGUID: ob4ZT9ltT5iNk0/MidOGXg==
X-CSE-MsgGUID: MpSR0fMxTuyWZQLhdjUMbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046738"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:34 -0700
X-CSE-ConnectionGUID: FbVnnSpSSeOujkLD6fCcnA==
X-CSE-MsgGUID: Q22WvEvgTgi4NX0VWzaQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556855"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 11/11] drm/xe/configfs: Allow adding configurations for
 future VFs
Date: Sun, 27 Jul 2025 19:20:08 +0200
Message-ID: <20250727172009.587-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727172009.587-1-michal.wajdeczko@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
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
index 928d62750d55..b3252bc9d76c 100644
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
@@ -283,6 +283,15 @@ static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
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
@@ -304,11 +313,22 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
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

