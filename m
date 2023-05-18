Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80731C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 08:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3574710E4ED;
	Thu, 18 May 2023 08:55:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4F10E50E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684400128; x=1715936128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=43kZzz93Jyy5pu39viVSO0MX02JUUhonQ5r+3gulCeI=;
 b=aJgZBe6nTzNi2Wt5mr68QVuHLmkMJcUHd761NJ6k2XX60zBHtK3VO+fG
 jOJDFjQrMfPD7h1FcWEyaevBZX4B8ydderWNSnCd5NXbYSQO9vsBbvgz7
 Dg32XZaD4UcYUnTEuphFNrgIO8SNHRVu1DV8hWFk6CA1bBx4pNLC4bMsJ
 gPrtOIdTYz0QRwSr/+ZkAexXKdyfqS1uUYXgB1Z80Ad/V7NPClmSsK2+m
 Dbvwn+iiYJWTBUfB1HUdj1gSGvgJJQEuUegn240Fd4+NmUgOXOt+M11fU
 5eL613j2TYyfvqZxAtbOA52nub+DwNeA9SrmhTyVI7aW70st3YSGXDgPE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="415438500"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; d="scan'208";a="415438500"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 01:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696231403"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; d="scan'208";a="696231403"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 01:55:26 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 14:22:59 +0530
Message-Id: <20230518085259.4083944-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded pcie
 parent bridge
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
Cc: jani.nikula@intel.com, Anshuman Gupta <anshuman.gupta@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Intel Discrete GFX cards gfx may have multiple PCIe endpoints,
they connects to root port via pcie upstream switch port(USP)
and virtual pcie switch port(VSP), sometimes VSP pcie devices
doesn't bind to pcieport driver. Without pcieport driver, pcie PM
comes without any warranty and with unbounded VSP gfx card won't
transition to low power pcie device and link state therefore
assert dev_warn on unbounded VSP and disable xe driver
PM support.

v2:
- Disable Xe PCI PM support. [Rodrigo]
v3:
- Changed subject and Rebase.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e789a50a1310..e09d76b7755a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -603,6 +603,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
+static void xe_pci_unbounded_bridge_disable_pm(struct pci_dev *pdev)
+{
+	struct pci_dev *bridge = pci_upstream_bridge(pdev);
+
+	if (!bridge)
+		return;
+
+	if (!bridge->driver) {
+		dev_warn(&pdev->dev, "unbounded parent pci bridge, device won't support any PM support.\n");
+		pdev->driver->driver.pm = NULL;
+	}
+}
+
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
@@ -628,10 +641,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
+
 	err = xe_display_driver_probe_defer(pdev);
 	if (err)
 		return err;
 
+	xe_pci_unbounded_bridge_disable_pm(pdev);
+
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
-- 
2.38.0

