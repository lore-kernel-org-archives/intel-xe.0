Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A9C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 09:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F7910E1BB;
	Mon,  8 May 2023 09:20:21 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E248810E1BB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683537619; x=1715073619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yhqv0w3GYfov/vkM6pCrNL0OX+bKdn8jgSWx4DiJtFY=;
 b=ShWRVg1Ftg8QDYj73ONctB/VgCOxxjkjF7J/vUCkgJKccs1jfGphwJoA
 eTWXd30C7lQ/h6RpHcCCIskA1R4XRIkNLKmj2tTgxuYXOIxGJMSJcGjrH
 uJ53nwIOYLMya780epXUVMFAhsywhrRlzEpkW4Js4dgx9LxQNnFLM6Wfk
 E3aoj9WXCtI/9MM5feVjiUukhEalqpcUTe+DudemomJeUN9Xt/uGgLF4z
 z6QXvkjTssLE0rDBqLoDAuXKNjfhV5CRxUaMOkEchn/+sDHwszWC5OZe2
 rYgQodxLEqRXnJiaLYPPQMQwKmMQHm7IQULc9hh9kVUOo/p8hGPNNmwFU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329958375"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="329958375"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 02:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822603819"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="822603819"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 02:20:16 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 14:47:34 +0530
Message-Id: <20230508091734.1938204-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pm: WARN_ON() on unbounded pcie parent
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
assert drm_WARN_ON() on unbounded VSP.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 19ead642442e..dc0d5cb4950b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -667,12 +667,24 @@ static void xe_pci_shutdown(struct pci_dev *pdev)
 	xe_device_shutdown(pdev_to_xe_device(pdev));
 }
 
+static void xe_assert_on_unbounded_bridge(struct pci_dev *pdev)
+{
+	struct pci_dev *bridge = pci_upstream_bridge(pdev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	if (!bridge)
+		return;
+
+	drm_WARN_ON(&xe->drm, !bridge->driver);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int xe_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	int err;
 
+	xe_assert_on_unbounded_bridge(pdev);
 	err = xe_pm_suspend(pdev_to_xe_device(pdev));
 	if (err)
 		return err;
@@ -718,6 +730,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
+	xe_assert_on_unbounded_bridge(pdev);
 	err = xe_pm_runtime_suspend(xe);
 	if (err)
 		return err;
-- 
2.38.0

