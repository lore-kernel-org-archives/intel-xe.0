Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA6BC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FD910E05A;
	Wed, 30 Jul 2025 12:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXiccnbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC3610E05A
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753877768; x=1785413768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s4LPjkV/BFrL/HKzJvGPv+CN4U1Sstji9voX9P9Gxlk=;
 b=AXiccnbZORCmcrvS7lubFm6KlCpN5yEsKZe6j0CxidzL4hswKaxmXexc
 iklda3O3STgEft7ltbGpFIXs8ilGolcKpEFnpmz3e9hmJwaJSdgLs4r2E
 kf3LRohUqVE/ohqSlEzlA0mO0smSfuWCmh+newsqnTYq6ftbly089wUG6
 FBQ4j6HGzlSN6DwccaZkmqv/EA8xIAkDJW4/NqQ92ISUB0dWjt20HfD3V
 KaTklJtjteVbFpxZC3chUqzFV/p2xYrDqp15YwsFu/daxxO/EbvLKe0X1
 0/8hzeoT2rb7kkNO8gcOEAvSk5aSuFX6Cwl/CT6az0udm6SgU+TQqfhKQ A==;
X-CSE-ConnectionGUID: 1Vo4S5GfSZitFRJLJrtMrA==
X-CSE-MsgGUID: 7mlTTcjdRauE/YNrxoNkDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="78724901"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="78724901"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:16:07 -0700
X-CSE-ConnectionGUID: 9iaL6l9sS4OfyT+fUnSYvQ==
X-CSE-MsgGUID: d8HWaV3ySs6ZIcXCYLA7Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162559122"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2025 05:16:05 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH] drm/xe/pm: Enable RPM via PCIe PM capability
Date: Wed, 30 Jul 2025 18:02:54 +0530
Message-ID: <20250730123254.11088-1-satyanarayana.k.v.p@intel.com>
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
their native Power Management (PM) capabilities.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pm.c           | 9 +++++++++
 drivers/gpu/drm/xe/xe_pm.h           | 4 ++++
 3 files changed, 15 insertions(+)

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
index 59678b310e55..55b65728f522 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -9,6 +9,10 @@
 #include <linux/pm_runtime.h>
 
 #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
+#define IS_RPM_SUPPORTED(xe) ({ \
+		struct xe_device *___xe = (xe); \
+		___xe->info.has_pm_capability; \
+		})
 
 struct xe_device;
 
-- 
2.43.0

