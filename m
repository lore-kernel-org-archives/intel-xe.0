Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556B0C83F38
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 18:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADA510E0B7;
	Thu, 17 Jul 2025 18:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGw9Tbb2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F250010E0B7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 18:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752778120; x=1784314120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEqBmPdfB4updYe3UzzyWmsB3izoUCbFVHBVYMOpjyM=;
 b=NGw9Tbb2GslP4mNvuRKteajJKJdwkFHS+6iwfoRhwqvPfJgG1C4h6ZxB
 rW81Q7JSHO4GOiNc5MK6dMDQ3JlPdeP3hxa3FKCfcaXBna2ZddmkXwaZv
 /7Br55ELS0Ii8vOoSAoRdx/1V/u1c+WCnLdwKSAyV1FscGvC2+uvbtw2E
 zhUY+QqIoNRBusn1qhpvGP18q7YB6vJ9mQvabO1Kxeos+fsRHDzuad6C+
 gtVbBoLYaLsEASsjatAkJS6JEbWhQBvGDrf3BdwvyZ8KIRn5n10O6/l1B
 SHQrlHWrf/HlOggm1Qtw3PsKwxAW5IWwRt62mwTpzshjNhSj6elBYlvz6 w==;
X-CSE-ConnectionGUID: PHLnnW0cTpme3eNnHVdhnw==
X-CSE-MsgGUID: lZcd2G6fTnSVLqn8HTMCHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80513738"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="80513738"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:39 -0700
X-CSE-ConnectionGUID: g3PEJQ78T5iF3DmkDWCtQA==
X-CSE-MsgGUID: o0lgi39bSuOKnAEidqbkPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181580951"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
Date: Thu, 17 Jul 2025 20:48:22 +0200
Message-Id: <20250717184825.851-3-michal.wajdeczko@intel.com>
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

While we expect config directory names to match PCI device name,
currently we are only scanning provided names for domain, bus,
device and function numbers, without checking their format.
This would pass slightly broken entries like:

  /sys/kernel/config/xe/
  ├── 0000:00:02.0000000000000
  │   └── ...
  ├── 0000:00:02.0x
  │   └── ...
  ├──  0: 0: 2. 0
  │   └── ...
  └── 0:0:2.0
      └── ...

To avoid such mistakes, check if the name provided exactly matches
the canonical PCI device address format, which we recreated from
the parsed BDF data. Also simplify scanf format as it can't really
catch all formatting errors.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e9b46a2d0019..90b4fe92a611 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -259,12 +259,19 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	unsigned int domain, bus, slot, function;
 	struct xe_config_device *dev;
 	struct pci_dev *pdev;
+	char canonical[16];
 	int ret;
 
-	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
+	ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
 	if (ret != 4)
 		return ERR_PTR(-EINVAL);
 
+	ret = scnprintf(canonical, sizeof(canonical), "%04x:%02x:%02x.%d", domain, bus,
+			PCI_SLOT(PCI_DEVFN(slot, function)),
+			PCI_FUNC(PCI_DEVFN(slot, function)));
+	if (ret != 12 || strcmp(name, canonical))
+		return ERR_PTR(-EINVAL);
+
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
-- 
2.47.1

