Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C605EE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 09:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B23510E3FE;
	Wed, 23 Aug 2023 09:10:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A1B10E3FE
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692781832; x=1724317832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q0CQLT/O0Nmua6V90JIqCv2FuEX2Hv690NKg2AjaN5A=;
 b=ZzpfUgFIGh8nBTechFRW0rVB3VDNT8Q1EJYvFS/Sf/NGdb5Mt3EpWToc
 SK2rA0Z7AGpnSrc7UKatSQreyqx8HFP7iHYXXoneKcW31qDU1t/Fw/G5t
 aNPBmaUnevEhpYhPnDhc0qmCpJbHrWw0cOe+EyFaeI5LRnfz5bwoiSsLZ
 JIJdVQ/jfnGYfm12K4p9ob0vKKhdwFkI7S/FqJloD58ImxxozaPuit3KE
 Q5FVBsehRXUyt+AO13WtnHJQ5VlXOaFKN/q7whYgoMDGDCRFonrr3mrmO
 DzPPZkkl43aGHnPOJIlsDBXIkRm1vfdu6SOPPsgdf/AnAgmq4WtCG4/4K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="374088830"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374088830"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 02:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730153503"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="730153503"
Received: from kmreisi-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.55.230])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 02:10:29 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 09:10:20 +0000
Message-Id: <20230823091020.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pm: Use PM functions only if
 CONFIG_PM_SLEEP is enabled
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This fixes the build without CONFIG_PM_SLEEP such as for riscv.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 48 +++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f6bc6ae1c920..066bd12bf7b3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -31,28 +31,6 @@ enum toggle_d3cold {
 	D3COLD_ENABLE,
 };
 
-static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
-{
-	struct xe_device *xe = pdev_to_xe_device(pdev);
-	struct pci_dev *root_pdev;
-
-	if (!xe->d3cold.capable)
-		return;
-
-	root_pdev = pcie_find_root_port(pdev);
-	if (!root_pdev)
-		return;
-
-	switch (toggle) {
-	case D3COLD_DISABLE:
-		pci_d3cold_disable(root_pdev);
-		break;
-	case D3COLD_ENABLE:
-		pci_d3cold_enable(root_pdev);
-		break;
-	}
-}
-
 struct xe_subplatform_desc {
 	enum xe_subplatform subplatform;
 	const char *name;
@@ -730,6 +708,28 @@ static void xe_pci_shutdown(struct pci_dev *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct pci_dev *root_pdev;
+
+	if (!xe->d3cold.capable)
+		return;
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev)
+		return;
+
+	switch (toggle) {
+	case D3COLD_DISABLE:
+		pci_d3cold_disable(root_pdev);
+		break;
+	case D3COLD_ENABLE:
+		pci_d3cold_enable(root_pdev);
+		break;
+	}
+}
+
 static int xe_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -834,12 +834,12 @@ static int xe_pci_runtime_idle(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops xe_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
 	SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
 };
+#endif
 
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
@@ -847,7 +847,9 @@ static struct pci_driver xe_pci_driver = {
 	.probe = xe_pci_probe,
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
+#ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
+#endif
 };
 
 int xe_register_pci_driver(void)
-- 
2.34.1

