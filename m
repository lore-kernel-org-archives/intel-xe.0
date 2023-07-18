Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BE1EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 08:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E3710E2F5;
	Tue, 18 Jul 2023 08:11:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6701C10E2F3
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689667900; x=1721203900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KyIhdKHerGZxrYDUmxxHe8M+Ea5gSXfGJTHqqZmLgsE=;
 b=HL2nGcSgLXfbWRQtNwGKgcxQURHoIF9BNPwkZKmCsp4bsqZyjTxlQNfV
 UEkQNQ1IOgNbIn2Um3uPhMtoNXkTKG48s5gwkBR/LQwSWOUqnik3+jhj3
 fNUUv1g4aPu1l5mvLOa9z3trQVPSIhPX2Fzk0R6defgAgSap6aw33jMcD
 HfP1Omjl4PVZFuo5rQxC9BxQwgWhS1Ql/gyOk0igS+sRqpJPsvwxn0tZX
 5bWBaW8GjMNqbxugRUDItz+Ayqga7NO2QsXH8PJFP+jwze+OKhvVE/f/0
 GmjN4A8s84uAlQBDKtQQErIq6aFMkZUPxyaB7VpDjaUxa+yMmkoUlYtOJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="356084420"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="356084420"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717508165"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="717508165"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:37 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 13:36:59 +0530
Message-Id: <20230718080703.239343-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230718080703.239343-1-anshuman.gupta@intel.com>
References: <20230718080703.239343-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 1/5] drm/xe/pm: Add pci d3cold_capable support
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding pci d3cold_capable check in order to initialize
d3cold_allowed as false statically.
It avoids vram save/restore latency during runtime
suspend/resume

v2:
- Added else block to xe_pci_runtime_idle. [Rodrigo]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_pci.c          | 29 ++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pm.c           | 22 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h           |  1 +
 4 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5267ae02785d..448052162204 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -347,6 +347,9 @@ struct xe_device {
 		bool hold_rpm;
 	} mem_access;
 
+	/** d3cold_capable: Indicates if root port is d3cold capable */
+	bool d3cold_capable;
+
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4b5e78e08b4c..14675f7ebf68 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -693,6 +693,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_pci_disable;
 
 	xe_pm_runtime_init(xe);
+	xe_pm_init(xe);
 
 	return 0;
 
@@ -805,18 +806,22 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	/*
-	 * TODO: d3cold should be allowed (true) if
-	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
-	 * but maybe include some other conditions. So, before
-	 * we can re-enable the D3cold, we need to:
-	 * 1. rewrite the VRAM save / restore to avoid buffer object locks
-	 * 2. block D3cold if we have a big amount of device memory in use
-	 *    in order to reduce the latency.
-	 * 3. at resume, detect if we really lost power and avoid memory
-	 *    restoration if we were only up to d3cold
-	 */
-	 xe->d3cold_allowed = false;
+	if (!xe->d3cold_capable) {
+		xe->d3cold_allowed = false;
+	} else {
+		/*
+		 * TODO: d3cold should be allowed (true) if
+		 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
+		 * but maybe include some other conditions. So, before
+		 * we can re-enable the D3cold, we need to:
+		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
+		 * 2. block D3cold if we have a big amount of device memory in use
+		 *    in order to reduce the latency.
+		 * 3. at resume, detect if we really lost power and avoid memory
+		 *    restoration if we were only up to d3cold
+		 */
+		xe->d3cold_allowed = false;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c7901f379aee..1b8f25586470 100644
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
index 8418ee6faac5..864cd0be014a 100644
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

