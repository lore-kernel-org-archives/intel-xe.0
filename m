Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069D5C7EE29
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 16:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A010E45E;
	Fri, 19 May 2023 16:28:27 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760B10E5AD
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684513704; x=1716049704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u8hYpqFGPKfqucflgnJs99u29RNmH5cM7FXlEmaAd48=;
 b=me45FHz16yFe+Epqp9DVVi0TAOJ7AvBAnq9GFl+MKuOh9zwvEC0J8RXk
 eKPJaLMTLMH40o8P+vzkJRP/b7WdOGxvrB6mEBEPafk9riwcA7cj4S9w5
 DKVJHuIw3t8Tw+pu13KPpi+8tI62qZfvU8gTJ3MSupR19xRIZcq1bp4ln
 R854W6z3LN8ZJfErSM3vEow22BC9iFkHOwHgtiVN8uKxm6P6/YsqNgxPQ
 1P6z1S4u9b5CjNQ8aXr41aSc9MhhgN6Ib2V5IsvrfQ+sKYSTOOM7S7Zz0
 9h5cOpIUkRjrjjH8opNcwqbVqkI76lCLDSJhUINGRPcKUT7qCYEbvPHll Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332022404"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="332022404"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="1032660328"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="1032660328"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:28:22 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 21:55:52 +0530
Message-Id: <20230519162555.409853-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230519162555.409853-1-anshuman.gupta@intel.com>
References: <20230519162555.409853-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe/pm: Add pci d3cold_capable support
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

Adding pci d3cold_capable check in order to initialize
d3cold_allowed as false statically.
It avoids vram save/restore latency during runtime
suspend/resume

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
 drivers/gpu/drm/xe/xe_pm.c           | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h           |  1 +
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 77d1cc6514c4..8fd3acf60719 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -266,6 +266,9 @@ struct xe_device {
 		bool hold_rpm;
 	} mem_access;
 
+	/** d3cold_capable: Indicates if root port is d3cold capable */
+	bool d3cold_capable;
+
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e789a50a1310..96826b4d5fc3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -685,6 +685,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	xe_pm_runtime_init(xe);
+	xe_pm_init(xe);
 
 	return 0;
 }
@@ -789,6 +790,11 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
+	if (!xe->d3cold_capable) {
+		xe->d3cold_allowed = false;
+		return 0;
+	}
+
 	/*
 	 * TODO: d3cold should be allowed (true) if
 	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7b57f10ba25..534768ac4410 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -117,6 +117,21 @@ int xe_pm_resume(struct xe_device *xe)
 	return 0;
 }
 
+static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
+{
+	struct pci_dev *root_pdev;
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev)
+		return false;
+
+	/* D3Cold requires PME capability and _PR3 power resource */
+	if (!pci_pme_capable(root_pdev, PCI_D3cold) || !pci_pr3_present(root_pdev))
+		return false;
+
+	return true;
+}
+
 void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -129,6 +144,13 @@ void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put_autosuspend(dev);
 }
 
+void xe_pm_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
+}
+
 void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6a885585f653..38764537a566 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -14,6 +14,7 @@ int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
 void xe_pm_runtime_init(struct xe_device *xe);
+void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
-- 
2.38.0

