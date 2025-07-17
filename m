Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BFFC83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 18:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2785A10E15A;
	Thu, 17 Jul 2025 18:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeUXtOsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3393110E887
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 18:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752778125; x=1784314125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dm2RS9Lu781ioofJArJZFRXNDQqJ0tqrz8cMtsOZrOg=;
 b=MeUXtOsnYy8WgVjuKmQae2z1OC59q264LltWtgV1QCthQPpUw6QWM/+x
 9F/REjUuFLaOJdrxI2p95HxHjT648DksQ+R831Ga9Q9BhMH4Tx+iEQk3a
 n8vbCpf1nx1S0N49pangOqtc8Tj5nyPBL/LnwbOI9VCdhMDum+/tQ8Kew
 mJu7u7UbVXjeAA3yYtAcxx23yT3lT8Yxp9HShmk42HyitZd/cqRpeVX64
 W4/kbVupYdA7YYRRQnWwRneFHz/WzI7gRbnZy+QYiRaPymbqzUDqJUkLQ
 9yeEhuhb6+RQnLT0Z4V3cRIYe1FojxpJtAKGtf+MBi/wbla81vgcmSG6I A==;
X-CSE-ConnectionGUID: EPO2T3TNTwudDrNaNl1omQ==
X-CSE-MsgGUID: JGAyctBdTuK5konVEIxLAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80513746"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="80513746"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:45 -0700
X-CSE-ConnectionGUID: eIXrVaFTTSK8b6SohAy8Jw==
X-CSE-MsgGUID: Bo/Uqy/CTCCjLpsszJRDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181580974"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/5] drm/xe/configfs: Allow adding configurations for future
 VFs
Date: Thu, 17 Jul 2025 20:48:25 +0200
Message-Id: <20250717184825.851-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250717184825.851-1-michal.wajdeczko@intel.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 1df8cce78f13..e6246f1761cf 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -274,10 +274,17 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-EINVAL);
 
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
+	if (!pdev && function)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
+	if (!pdev && slot)
+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
 
-	match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;
+	match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL &&
+		(PCI_DEVFN(slot, function) == pdev->devfn ||
+		 function <= pci_sriov_get_totalvfs(pdev) ||
+		 PCI_DEVFN(slot, function) <= pci_sriov_get_totalvfs(pdev));
 
 	pci_dev_put(pdev);
 
-- 
2.47.1

