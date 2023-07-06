Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BF4EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 12:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C3110E4FD;
	Thu,  6 Jul 2023 12:03:47 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92C310E4FE
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688645024; x=1720181024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2WwgS6BEI25b2WcXsdhVw+A5CayB/YkDHkTp5TWyHpg=;
 b=YJo/IEpGbv0okMv81wCA5Khhuprm0BuSuXTOuYrJm/Wl5TyXQLYN4uYf
 ntXH62dXwQW2dkWLlnUW6CgIvGdtASLZY7+K03L7HFQ/zwOtTC0SgGoMI
 9NpfQ9YhG6csmoEuP74axJ5l0ieUnsm0a1jevnjG+Q2RuKSwItMHcTZZE
 N0DQFjuGBfwRXaSVAH0hJ/78t3Bh+N9GjeG6oTcp/ktHYszUUxod2CYkr
 BvHcJd2YJ16QJdTghHp0kxxC4NoNNsmQt8dmG9sNpC3UqHfdCoUKX2cjf
 C7yDDzrw4uPUkMY9GZvovxb2FMfEqy3ci5lIn9NOKtYH5pykbKQWSbrO3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449942910"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="449942910"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843663446"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="843663446"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:41 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:32:07 +0530
Message-Id: <20230706120208.2828158-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230706120208.2828158-1-anshuman.gupta@intel.com>
References: <20230706120208.2828158-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/5] xe/drm/pm: Toggle d3cold_allowed using
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
due to vrame_usages above vram_d3ccold_threshol. It is required to
disable d3cold to avoid any resume failure because root port can
still transition to d3cold when all of pcie endpoints and
{upstream, virtual} switch ports will transition to d3hot.
Also cleaning up the TODO code comment.

v2:
- Modify d3cold.allowed in xe_pm_d3cold_allowed_toggle. [Riana]
- Cond changed (total_vram_used_mb < xe->d3cold.vram_threshold)
  according to doc comment.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pm.c  | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h  |  1 +
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ce4bdfcbc46d..8585b090ff0e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -754,6 +754,24 @@ static int xe_pci_resume(struct device *dev)
 	return 0;
 }
 
+static void d3cold_toggle(struct pci_dev *pdev, bool enable)
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
+	if (enable)
+		pci_d3cold_enable(root_pdev);
+	else
+		pci_d3cold_disable(root_pdev);
+}
+
 static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -771,6 +789,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 		pci_ignore_hotplug(pdev);
 		pci_set_power_state(pdev, PCI_D3cold);
 	} else {
+		d3cold_toggle(pdev, false);
 		pci_set_power_state(pdev, PCI_D3hot);
 	}
 
@@ -795,6 +814,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 			return err;
 
 		pci_set_master(pdev);
+	} else {
+		d3cold_toggle(pdev, true);
 	}
 
 	return xe_pm_runtime_resume(xe);
@@ -808,15 +829,15 @@ static int xe_pci_runtime_idle(struct device *dev)
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
index 07e204990aa9..74a9bccb78c7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -292,3 +292,29 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 
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
+	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
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

