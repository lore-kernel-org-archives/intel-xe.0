Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DABCEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 11:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390C18825E;
	Tue, 27 Jun 2023 11:58:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640310E2E3
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 11:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687867108; x=1719403108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iyJGz456ZmLAdPLWjy7JyGqV/uVTdIIGeDqQQeXYl7M=;
 b=GBZgVP5O9bjMCOzNvYmrWUQDJs8KbOW3GIzoEjQ+VQGrmkJNOeV97YZI
 orVFYPpzwOaffM3seHo8JJTFkIxbhqyzsBuiJv1wW9gViQghAXyQp/wAL
 mR2nLMUyaVjiCd3k55jSjsYOgEh+beSnSMmMIv6PWpav+BSs3YRt4vMPh
 awM1dNXwhpQtMZPjuTKdb4vHW7hmfY0911Z2/5BiQaSTdxsQJOeE9eolO
 cDqp/ATwemPGXmdcUz4ZasOU3F9H/Uhn2p6ARzjLEqHVShegfW4jyunBN
 QXIERziSWQqy/+YeBfh+rBE4TPvAk6t4dq5kG86ditWgNK3wWejXPK4BZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351334021"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="351334021"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890668149"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="890668149"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:26 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:26:41 +0530
Message-Id: <20230627115642.2087251-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230627115642.2087251-1-anshuman.gupta@intel.com>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/5] xe/drm/pm: Toggle d3cold_allowed using
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pm.c  | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h  |  1 +
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 848de5dcdaa5..78e906607188 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -746,6 +746,24 @@ static int xe_pci_resume(struct device *dev)
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
@@ -763,6 +781,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 		pci_ignore_hotplug(pdev);
 		pci_set_power_state(pdev, PCI_D3cold);
 	} else {
+		d3cold_toggle(pdev, false);
 		pci_set_power_state(pdev, PCI_D3hot);
 	}
 
@@ -787,6 +806,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 			return err;
 
 		pci_set_master(pdev);
+	} else {
+		d3cold_toggle(pdev, true);
 	}
 
 	return xe_pm_runtime_resume(xe);
@@ -800,15 +821,15 @@ static int xe_pci_runtime_idle(struct device *dev)
 	if (!xe->d3cold.capable) {
 		xe->d3cold.allowed = false;
 	} else {
+		xe->d3cold.allowed = xe_pm_vram_d3cold_allowed(xe);
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
index 7028c9b6e94c..4db4e5a1b051 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -277,3 +277,32 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 
 	return 0;
 }
+
+bool xe_pm_vram_d3cold_allowed(struct xe_device *xe)
+{
+	struct ttm_resource_manager *man;
+	u32 total_vram_used_mb = 0;
+	bool allowed;
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
+	if (total_vram_used_mb <= xe->d3cold.vram_threshold)
+		allowed = true;
+	else
+		allowed = false;
+
+	mutex_unlock(&xe->d3cold.lock);
+
+	return allowed;
+}
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index b50ec8bdce6f..08612cf3e67b 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -24,5 +24,6 @@ int xe_pm_runtime_put(struct xe_device *xe);
 bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
+bool xe_pm_vram_d3cold_allowed(struct xe_device *xe);
 
 #endif
-- 
2.38.0

