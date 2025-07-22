Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA27C83F34
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 14:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B751710E6A1;
	Tue, 22 Jul 2025 14:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ib82FkVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207A810E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753193503; x=1784729503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GxvFMcRwVPkf+W87UnG6b3U/ERuMSD8h3CVrrg51aYk=;
 b=Ib82FkVeHGp0MJPOFtcjdJ6o8WpoADrTADT5WMEQXqu8CMxWDH16N8r+
 D6ZjIkIQ1kjzeangSUBIb01GvqGHxFj/r8jUd18Yee1QOmmxZ34b8maYI
 0r9OOtHhzirwEds+bhgH7rnl2poZrdjZM3KLytZsGVmeHRnnjZLs5eQil
 B8w17ga71VXCPYOQP7vYK0y+j/AMqEiM+bfNwQjexh2sDRcVrOqHdgzaN
 QddUTXDsTHSFKJw1dJ75ZBlaZboL0zxtqqyweddVDGtyZnYB4L3sE4ab9
 KsII7IaP9FO9I3iMpAvz2aQEs2AIQhSrJfLvDXNMgmFD6sm3Mp3bozsdX A==;
X-CSE-ConnectionGUID: 9D4nHVYjSaiWO507n+aUGA==
X-CSE-MsgGUID: ykuSu4bwRumwcMWkPTODmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54663038"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54663038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:42 -0700
X-CSE-ConnectionGUID: dzdbT+DvT9OBk3m9FGpdiQ==
X-CSE-MsgGUID: nTDGsWXgTDGtWILv76Aarg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163396290"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 6/6] drm/xe/configfs: Allow adding configurations for
 future VFs
Date: Tue, 22 Jul 2025 16:10:59 +0200
Message-ID: <20250722141059.30707-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722141059.30707-1-michal.wajdeczko@intel.com>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_configfs.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index b593337d05b3..f8222079b209 100644
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
@@ -295,11 +295,20 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-EINVAL);
 
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
+	if (!pdev && function)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
+	if (!pdev && slot)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
 
 	match = xe_match_desc(pdev);
-
+	if (match && PCI_DEVFN(slot, function) != pdev->devfn) {
+		pdev = pci_physfn(pdev);
+		if (!dev_is_pf(&pdev->dev) || !match->has_sriov ||
+		    PCI_DEVFN(slot, function) - pdev->devfn > pci_sriov_get_totalvfs(pdev))
+			match = NULL;
+	}
 	pci_dev_put(pdev);
 
 	if (!match)
-- 
2.47.1

