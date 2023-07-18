Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0470AEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 08:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EB310E2EC;
	Tue, 18 Jul 2023 08:11:50 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205B10E2FB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 08:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689667909; x=1721203909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ynh7iKQwWS3lnGQ/9UB9VbcQBCyU/l4MjnY3PCim/4k=;
 b=lZyI9N/Zn7b99U+0gM+VA4YhO36eyI0sXnyx9xogK7TY7bT83/T7GVVL
 To5BjHHKCWz6mAdtbQsofEH1RGh07asJ9H2odTQ9idTg4SjcU80Ue9mBb
 mkNUt6A2TGld/y+rq2T4ibI7G86gguJem8Nj1ESGy0fhvOexNnMggWcg+
 kBaWR2WFvkuD2wZO0BMpUiUj0kdquSuiubZFHoz509y+diCSX5qpUhDCN
 5kUYL+MgHmtmFa23UDZg5jYZQVcVIcTq3TkPIeYgCQ2ed9hCIR3yY2vPS
 IikYTA/f8lrFM1HYl3/lU9whSKuhwVllqM/hWsG9qjQNVoPwd0mc44HPu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="356084438"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="356084438"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717508203"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="717508203"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:46 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 13:37:02 +0530
Message-Id: <20230718080703.239343-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230718080703.239343-1-anshuman.gupta@intel.com>
References: <20230718080703.239343-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 4/5] xe/drm/pm: Toggle d3cold_allowed using
 vram_usages
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

Adding support to control d3cold by using vram_usages metric from
ttm resource manager.
When root port  is capable of d3cold but xe has disallowed d3cold
due to vram_usages above vram_d3ccold_threshol. It is required to
disable d3cold to avoid any resume failure because root port can
still transition to d3cold when all of pcie endpoints and
{upstream, virtual} switch ports will transition to d3hot.
Also cleaning up the TODO code comment.

v2:
- Modify d3cold.allowed in xe_pm_d3cold_allowed_toggle. [Riana]
- Cond changed (total_vram_used_mb < xe->d3cold.vram_threshold)
  according to doc comment.
v3:
- Added enum instead of true/false argument in
  d3cold_toggle(). [Rodrigo]
- Removed TODO comment. [Rodrigo]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 36 +++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pm.c  | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h  |  1 +
 3 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 32a676d27fa7..9b78dbe32742 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -26,6 +26,11 @@
 #include "xe_pm.h"
 #include "xe_step.h"
 
+enum toggle_d3cold {
+	D3COLD_DISABLE,
+	D3COLD_ENABLE,
+};
+
 struct xe_subplatform_desc {
 	enum xe_subplatform subplatform;
 	const char *name;
@@ -754,6 +759,28 @@ static int xe_pci_resume(struct device *dev)
 	return 0;
 }
 
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
 static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -771,6 +798,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 		pci_ignore_hotplug(pdev);
 		pci_set_power_state(pdev, PCI_D3cold);
 	} else {
+		d3cold_toggle(pdev, D3COLD_DISABLE);
 		pci_set_power_state(pdev, PCI_D3hot);
 	}
 
@@ -795,6 +823,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 			return err;
 
 		pci_set_master(pdev);
+	} else {
+		d3cold_toggle(pdev, D3COLD_ENABLE);
 	}
 
 	return xe_pm_runtime_resume(xe);
@@ -808,15 +838,15 @@ static int xe_pci_runtime_idle(struct device *dev)
 	if (!xe->d3cold.capable) {
 		xe->d3cold.allowed = false;
 	} else {
+		xe_pm_d3cold_allowed_toggle(xe);
+
 		/*
 		 * TODO: d3cold should be allowed (true) if
 		 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
 		 * but maybe include some other conditions. So, before
 		 * we can re-enable the D3cold, we need to:
 		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
-		 * 2. block D3cold if we have a big amount of device memory in use
-		 *    in order to reduce the latency.
-		 * 3. at resume, detect if we really lost power and avoid memory
+		 * 2. at resume, detect if we really lost power and avoid memory
 		 *    restoration if we were only up to d3cold
 		 */
 		xe->d3cold.allowed = false;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index caf19b7f1824..5bb7d597e97d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -291,3 +291,28 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 
 	return 0;
 }
+
+void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
+{
+	struct ttm_resource_manager *man;
+	u32 total_vram_used_mb = 0;
+	u64 vram_used;
+	int i;
+
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+		man = ttm_manager_type(&xe->ttm, i);
+		if (man) {
+			vram_used = ttm_resource_manager_usage(man);
+			total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
+		}
+	}
+
+	mutex_lock(&xe->d3cold.lock);
+
+	if (total_vram_used_mb < xe->d3cold.vram_threshold)
+		xe->d3cold.allowed = true;
+	else
+		xe->d3cold.allowed = false;
+
+	mutex_unlock(&xe->d3cold.lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index bbd91a5855cd..ee30cf025f64 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -25,5 +25,6 @@ bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
+void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
 
 #endif
-- 
2.38.0

