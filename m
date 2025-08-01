Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA2C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 16:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F4B10E044;
	Fri,  1 Aug 2025 16:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGi3siUD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC32610E044
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754064810; x=1785600810;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XAjNU9Hhbop7jl5M1IDQNv0FOX89NulKllf2nIEfyzM=;
 b=DGi3siUDSYSeKt/j4j+KH/Z2FwyoZD2xUtEPlQr5K+7MpexsMNc65qEj
 KwNeJ9WLHTVlnA5EAUbsXSemFscqO1ifOVgbhh7okUD9EjFSp43OdLjex
 psJ2HpOVV2ZzDyexjLxpP8R6LMbkh3ds4HMbTRnLNcwv7DVOsQ44BPDR2
 aQsRaubN41LQ082JenlETNWFWE+9eSD/Mo8ROHQEa3owAbE5DtE9A7iNL
 HNck4vlVX9lCb9mC2XUweHNwSVQt1eZNXxo8api1CivpEt+8gJbJ/3ezq
 WUmCmEir5/3BBMkGFLFzNcCXh35+6gs0kylGKKFdvKpHxoclfu1aW4U1M w==;
X-CSE-ConnectionGUID: E+cINFBsRmuw45YAHNLkMQ==
X-CSE-MsgGUID: Or4aTFgETe2Sku89GqV4NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81870287"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="81870287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 09:13:30 -0700
X-CSE-ConnectionGUID: HHbhjRMVRDaNgtLf4zAMWg==
X-CSE-MsgGUID: m6kO3/H5QNyqamgj62KqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="187275763"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa002.fm.intel.com with ESMTP; 01 Aug 2025 09:13:27 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
Date: Fri,  1 Aug 2025 22:00:17 +0530
Message-ID: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
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
V2 -> V3:
- Fixed review comments (Michal Wajdeczko).

V1 -> V2:
- Disable RPM only for VF devices when PM cap is not implemented.
---
 drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 8aae66660931..019de04fa7bb 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -246,8 +246,18 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
 
 static void xe_pm_runtime_init(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = xe->drm.dev;
 
+	/*
+	 * Disable RPM for VFs if PM cap is not supported.
+	 * As per PCIe specification, "If a VF does not implement the PCI Power
+	 * Management Capability, then the VF behaves as if it had been programmed
+	 * into the equivalent power state of its associated PF"
+	 */
+	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
+		return;
+
 	/*
 	 * Disable the system suspend direct complete optimization.
 	 * We need to ensure that the regular device suspend/resume functions
@@ -366,8 +376,12 @@ int xe_pm_init(struct xe_device *xe)
 
 static void xe_pm_runtime_fini(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = xe->drm.dev;
 
+	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
+		return;
+
 	pm_runtime_get_sync(dev);
 	pm_runtime_forbid(dev);
 }
-- 
2.43.0

