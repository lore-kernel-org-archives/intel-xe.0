Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BDC87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 15:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C43D10E042;
	Thu, 31 Jul 2025 15:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbVIUwCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E2D10E042
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753974980; x=1785510980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gJvMkKcr88AdfkkjnAcO5tku6FXZ84hTwYnAOAj/0ZM=;
 b=NbVIUwCkQApV3LFS4RalV7peZRO7yvlgeUNmPnp2eHkg4f9iQlCFCeJT
 mgiVoDt6GoR0yRJvsZBredoGvm5vS4vaGOqFNFORJBQ6gqd82AZxcgfmF
 +O8yhSRK9ZIpG11uf3faId8Zgr6ALkfpN4icKTWyx92dniSTZNrlhzmJL
 W52l77ygmLHq+GJXxte9dto4eD2sEghNCMBoJ1N0kB9EuaDh9IK5MSyvO
 QSvaqQ0Hw92Bhvas7yvD2tQaUZQzTMHbJp0l9gw9iIL5a6YQZ3wD7odoV
 i89pIpB9iohsdNGLuV+7UTSjGJ7l2NhwZWm5qnXyGr5UTWCu2o678bWNT A==;
X-CSE-ConnectionGUID: 4o0freEUS2+NybNsFZq0TA==
X-CSE-MsgGUID: ajlVimtDR9idUNPRKgI/4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55371041"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="55371041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 08:16:12 -0700
X-CSE-ConnectionGUID: 1AO/+0GgTt+8pQUuqNaBFg==
X-CSE-MsgGUID: KPR9ot1KQ/ancIIaBI6e5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="194278159"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 08:16:07 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
Date: Thu, 31 Jul 2025 21:02:51 +0530
Message-ID: <20250731153251.18864-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
their native Power Management (PM) capabilities. The specification (as per
section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
that Virtual Functions (VFs) without Power Management capability inherit
their associated Physical Function's (PF) power state.

As per PCIe spec "If a VF does not implement the PCI Power Management
Capability, then the VF behaves as if it had been programmed into the
equivalent power state of its associated PF"

Since Intel GPU VFs lack PM capability implementations, VFs power behavior
must mirror their PF's state. During VF creation, the PF remains active
from the PCI subsystem perspective. To maintain consistency, explicitly
disable RPM for VFs missing PM capability to ensure they follow their PF's
power management status rather than entering low-power states
independently.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

---
V1 -> V2:
- Disable RPM only for VF devices when PM cap is not implemented.
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pm.c           | 9 +++++++++
 drivers/gpu/drm/xe/xe_pm.h           | 5 +++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 38c8329b4d2c..3bbfc46044a0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -285,6 +285,8 @@ struct xe_device {
 		 * pcode mailbox commands.
 		 */
 		u8 has_mbx_power_limits:1;
+		/** @info.has_pm_capability: Device has PCI pm capability */
+		u8 has_pm_capability:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 44aaf154ddf7..5e6311964685 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -244,6 +244,9 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
+	if (!IS_RPM_SUPPORTED(xe))
+		return;
+
 	/*
 	 * Disable the system suspend direct complete optimization.
 	 * We need to ensure that the regular device suspend/resume functions
@@ -265,6 +268,7 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 
 int xe_pm_init_early(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int err;
 
 	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
@@ -278,6 +282,8 @@ int xe_pm_init_early(struct xe_device *xe)
 		return err;
 
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
+	xe->info.has_pm_capability = !!pdev->pm_cap;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
@@ -364,6 +370,9 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
+	if (!IS_RPM_SUPPORTED(xe))
+		return;
+
 	pm_runtime_get_sync(dev);
 	pm_runtime_forbid(dev);
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 59678b310e55..ec6291dad019 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -9,6 +9,11 @@
 #include <linux/pm_runtime.h>
 
 #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
+#define IS_RPM_SUPPORTED(xe) ({ \
+		struct xe_device *___xe = (xe); \
+		___xe->info.has_pm_capability || \
+		!IS_SRIOV_VF(___xe); \
+		})
 
 struct xe_device;
 
-- 
2.43.0

