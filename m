Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88ADC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 11:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0410E663;
	Tue,  5 Aug 2025 11:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fs0Mubaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B1010E660
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754394897; x=1785930897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OCGoLlp5oPFRIwPH6ow3f4rFqBpnh8NkB1A6DLQzXhg=;
 b=fs0Mubawm0N1O8uLQ1uMnfoxJrDFi6qCT19kf11sRZGvmzWUmkB0x7Ay
 c/XcUL9RoPki9dcVy5qXxxYf24X/rBVoWVTPi05g9IvbyGxXcbvkfSRUO
 hs9EdgS0fRh5bv8a7UaUySZmm8ulqJzyvFTp2LUYcDQx9T+0WzYJYwhuX
 iLGINQThf3c3W1AX70TKusyBwxqVqp/Lz9Lr51MOLbtPfAJHerMs4PVCt
 9wPsqX3WQ2VA3WijF5vvB9+1KBbrBGtoxEbv+jejXeVmy6WvomJiDFtmk
 WoC2Mgz7ko4dls0zYvzeegDIrOQ28ggTjqVjxoqLWRd3FnJUmOMElZ0fV A==;
X-CSE-ConnectionGUID: +17A5tQdR4C6Ym4khjBKMg==
X-CSE-MsgGUID: ZuOtJUV6TQuLJB0b7alFOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56763894"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56763894"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:54:57 -0700
X-CSE-ConnectionGUID: jriBYw12QYenM+x0TE2P5g==
X-CSE-MsgGUID: ilQpJ7eISPGiq/2dedPA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="169859423"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa005.jf.intel.com with ESMTP; 05 Aug 2025 04:54:55 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
Date: Tue,  5 Aug 2025 17:40:58 +0530
Message-ID: <20250805121058.7103-1-satyanarayana.k.v.p@intel.com>
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

VFs without native PCIe Power Management (PM) capabilities inherit their
PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
driver suspend/resume operations that ultimately perform no PCI-level power
transition.

Since VFs without PM capabilities cannot independently enter low-power
states, the existing RPM workflow becomes redundant:
1. Driver executes full suspend/resume sequence
2. PCI PM transition step becomes no-op
3. VF power state remains tied to PF's status

Disabling RPM for PM-incapable VFs eliminates this redundant processing
while maintaining proper power management through PF dependency. This
optimization ensures VFs follow their PF's power state without superfluous
runtime handling.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
V3 -> V4:
- Fixed review comments (Rodrigo & Maarten)

V2 -> V3:
- Fixed review comments (Michal Wajdeczko).

V1 -> V2:
- Disable RPM only for VF devices when PM cap is not implemented.
---
 drivers/gpu/drm/xe/xe_pm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5e8126ca8e27..9d62d3f99ed9 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -245,8 +245,13 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
 
 static void xe_pm_runtime_init(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = xe->drm.dev;
 
+	/* For VF that doesn't implement pm_caps, the rpm functions are no-op */
+	if (IS_SRIOV_VF(xe) && !pdev->pm_cap)
+		return;
+
 	/*
 	 * Disable the system suspend direct complete optimization.
 	 * We need to ensure that the regular device suspend/resume functions
@@ -365,8 +370,13 @@ int xe_pm_init(struct xe_device *xe)
 
 static void xe_pm_runtime_fini(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = xe->drm.dev;
 
+	/* For VF that doesn't implement pm_caps, the rpm functions are no-op */
+	if (IS_SRIOV_VF(xe) && !pdev->pm_cap)
+		return;
+
 	pm_runtime_get_sync(dev);
 	pm_runtime_forbid(dev);
 }
-- 
2.43.0

