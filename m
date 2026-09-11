Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F02C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA88910F553;
	Fri, 11 Sep 2026 08:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsVI5DWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C407810F550;
 Fri, 11 Sep 2026 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113916; x=1820649916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u7stv12FszoWRSCxkIeD3K+nyfSnHrkT4N7pywfe9O8=;
 b=LsVI5DWS5YgXm0b1KO7p4YJlBcaNv+ymmaQMu9cksvadE48V0miHduMS
 cY5cbNzJnO+cbBF8dlvPhQWEj7SDg58FbtwHFqHK5eMHDjgNXLB3DmEC+
 Wygig97l0QlXGl5RF9vpuWbBt5OBorW5LMS4kqKIbbRMtIuWQXT+c9mdG
 YzG6LPSk/spbu4sez/EnEjd4oxOllw92oofCF2HRJ4oBde0BSz03kLWtf
 XNpOz3BwMiFHg5AsTK3r2er0o49RPRRDJqvUEUjqXPLCbWAj6guNeG3SD
 Y0xfIQtvs/JkJivob9qyYC8RDkO9KO1MEydgzPo4NPfXZ/UCDU2TzI3Zb w==;
X-CSE-ConnectionGUID: NAxzHAiuQzC4U8NkUw4kvQ==
X-CSE-MsgGUID: 2c1AnDVKSFO+tcxAYiLwFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094734"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094734"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:16 -0700
X-CSE-ConnectionGUID: qN8kmYVjSTqPEZKb5NRbBQ==
X-CSE-MsgGUID: B+kX1qq1R1OqIG4YNF/RaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295333583"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:13 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 02/10] drm/xe/pm: introduce PM PME support
Date: Fri, 11 Sep 2026 11:04:40 +0300
Message-ID: <20260911080448.778316-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Introduce PME support for PME capable devices. Whether device is
PME capable is assessed during PCI probe routine. And the whether
PME is enabled for a specific context is assessed during the PM
runtime suspend call if the device is PME capable.

If the PME is enabled, HPDs can generate PME which in turn call
the runtime resume call and do the wakeup routines. Till now
the driver was relying on HPD polling to wakeup in case of any
HPDs. HPD polling can be avoided in platforms with PME support
and instead rely on this PCI PME for HPD induced wakeup.

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_pci.c          | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c           | 13 +++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f88bacf63c83..37190473f6db 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -454,6 +454,19 @@ struct xe_device {
 		struct mutex lock;
 	} d3cold;
 
+	/** @pme: Encapsulate pme related stuff */
+	struct {
+		/** @pme.capable: Indicates if device is PME capable */
+		bool capable;
+
+		/** @pme.enabled:
+		 *
+		 * Indicates if PME is enabled - depends on user controllable
+		 * sysfs interface as well
+		 */
+		bool enabled;
+	} pme;
+
 	/** @pm_notifier: Our PM notifier to perform actions in response to various PM events. */
 	struct notifier_block pm_notifier;
 	/** @pm_block: Completion to block validating tasks on suspend / hibernate prepare */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f8e16aefd2f8..5cb9c140461b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1387,6 +1387,9 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
+	xe->pme.enabled = xe->pme.capable && !xe->d3cold.allowed &&
+			  pci_enable_wake(pdev, PCI_D3hot, true) == 0;
+
 	/*
 	 * We hold an additional reference to the runtime PM to keep PF in D0
 	 * during VFs lifetime, as our VFs do not implement the PM capability.
@@ -1397,8 +1400,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	xe_assert(xe, !pci_num_vf(pdev));
 
 	err = xe_pm_runtime_suspend(xe);
-	if (err)
+	if (err) {
+		if (xe->pme.enabled) {
+			pci_enable_wake(pdev, PCI_D3hot, false);
+			xe->pme.enabled = false;
+		}
+
 		return err;
+	}
 
 	pci_save_state(pdev);
 
@@ -1427,6 +1436,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
+	xe->pme.enabled = false;
+
 	if (xe->d3cold.allowed) {
 		err = pci_enable_device(pdev);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..c79f55b66a41 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -78,6 +78,8 @@
  * management (RPS).
  */
 
+#define HAS_PM_PME_SUPPORT(xe) (GRAPHICS_VERx100(xe) >= 3500)
+
 #ifdef CONFIG_LOCKDEP
 static struct lockdep_map xe_pm_runtime_d3cold_map = {
 	.name = "xe_rpm_d3cold_map"
@@ -384,6 +386,14 @@ int xe_pm_init_early(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
 
+static bool xe_pm_pci_pme_capable(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	return HAS_PM_PME_SUPPORT(xe) ?
+		pci_pme_capable(pdev, PCI_D3hot) : false;
+}
+
 /**
  * xe_pm_probe() - Initialize Xe Power Management
  * @xe: the &xe_device instance
@@ -397,6 +407,9 @@ int xe_pm_probe(struct xe_device *xe)
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe->d3cold.capable));
 
+	xe->pme.capable = xe_pm_pci_pme_capable(xe);
+	xe_dbg(xe, "pme: capable=%s\n", str_yes_no(xe->pme.capable));
+
 	return 0;
 }
 
-- 
2.43.0

