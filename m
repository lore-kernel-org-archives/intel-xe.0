Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E6CC7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 09:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACD910E5C5;
	Thu, 11 May 2023 09:51:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15F010E5C5
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683798695; x=1715334695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jFaJPlnKdjApg4OtW+xlwVfJ9lhf3c8IdxR061XZFHk=;
 b=D9TnafS2Ag/p2OH54Xc2Wa/QypSaq+YeqD5Y2S8llrGuhOVRVZ38HZEy
 e6St40MMGcD2NB/U0+y9f+kDBYwpB6MqhsG7Sh6Q8tqc9hMQHas+hkJ19
 +0hDYeYRlPMMvzQmvmd+9nM2hk/o99tossGT/zhptoiXcmmRrNoeoyDJC
 96KtXs9dH+wfARVtAqDXRXCDZspnA8D1N3SgQZc0kClSd96EZy55mGUid
 XtXUgmDzQ3VJIjHV7UsXPKPDYfOjXBoMIwX90dakDzmdbH5HR+ahT+8uM
 ez07GOcRj4QGVkFqWB8jDqe1rimV6/rhHXQjMsTT8QgTxvMLn2wNqO0oR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339725483"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="339725483"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="693733525"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="693733525"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:51:21 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 15:18:17 +0530
Message-Id: <20230511094817.2734836-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/pm: WARN_ON() on unbounded pcie parent
 bridge device
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Intel Discrete GFX cards gfx may have multiple PCIe endpoints,
they connects to root port via pcie upstream switch port(USP)
and virtual pcie switch port(VSP), sometimes VSP pcie devices
doesn't bind to pcieport driver. Without pcieport driver pcie PM
comes without any warranty and with unbounded VSP gfx card won't
transition to low power pcie device and link state therefore
assert dev_warn on unbounded VSP and disable xe driver
PM support.

v2:
- Disable Xe PCI PM support. [Rodrigo]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 855cf8557056..ee61a03d1afd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -579,6 +579,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
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
@@ -604,6 +617,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
+	xe_pci_unbounded_bridge_disable_pm(pdev);
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
-- 
2.38.0

