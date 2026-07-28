Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B45FC54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC5810E97C;
	Tue, 28 Jul 2026 16:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuQqWi4t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBF510E97D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255085; x=1816791085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tKem+tHenuyUhYlAp6KWLtRnrI0GUbhZmvgmOb7prSI=;
 b=ZuQqWi4txL+vsoAw9UvSV5EaJZmRHz3qZHi4OvaI/VO46DV4aLRUTqjS
 X2gIxr5O9AYWlXKKnJ+c1OMWAPGR594Tx6YDJhUpdrSWH7W7zBthHVAVX
 8LAZZlCzF5HxOzY3VyRMiLhfs9gYYpFq21+WfbvHXesxDNzjYDEKlei0i
 V8TwblCZTI8zsjbs0ELgxFbqqoSmXa8F0AnoCP/g+6NA18bMSUDk1JfVm
 A/l37KuM5eXPMIUzlrej2Ujmb1MYy1z+EnzL0du0+WYhilQdR3/UlfDP1
 WGKPVorX2kvpDUmuKZQobPEmvG8W+Ucdw03lvr1RLHdum5tEicGiXo17k A==;
X-CSE-ConnectionGUID: XZ5sOmfkTd6d+pIYJYS+PQ==
X-CSE-MsgGUID: fsEzX0TRQ3yPupeoRnFm+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386271"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386271"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:24 -0700
X-CSE-ConnectionGUID: A0XP0iZiQ3yUACkmd3bIOg==
X-CSE-MsgGUID: vFBGsVNfTCOjRYOV3Rc8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819339"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
Subject: [PATCH v2 10/22] drm/xe/log: Add hardware error signatures
Date: Tue, 28 Jul 2026 18:10:25 +0200
Message-ID: <20260728161039.579-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

Extend our error signatures definitions xe_sigid to cover also
hardware-originated errors and make them distinguishable from
initially defined software-initiated errors.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Yoni Levitt <yoni.levitt@intel.com>
---
v2: update comment (Sashiko)
---
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
index 99717fdf74a6..69cce4b45635 100644
--- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -159,14 +159,19 @@
  * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
  * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
  * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
+ * @XE_SIGID_HW: Generic hardware failure.
+ * @XE_SIGID_PCIE: PCIe interface errors.
+ * @XE_SIGID_DEVICE_MEMORY: Device memory errors
+ * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
+ * @XE_SIGID_FABRIC: Fabric errors.
+ * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
  *
  * The situations the driver detects and reports in software. Values are
  * numbered sequentially, are only ever appended, and are never renumbered or
  * reused. The tag in brackets is the default resolution bucket (see the `Xe
  * Error Signatures (SIGID)`_ section).
  *
- * Firmware- and hardware-originated signatures are not listed here; they are
- * logged as reported by those layers.
+ * Firmware- and hardware-originated signatures are numbered separately.
  */
 enum xe_sigid {
 	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
@@ -178,6 +183,13 @@ enum xe_sigid {
 	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
 	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
 	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
+
+	XE_SIGID_HW			= INTEL_SIGID_GPU_XE_HARDWARE_START,
+	XE_SIGID_PCIE			= INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
+	XE_SIGID_DEVICE_MEMORY		= INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
+	XE_SIGID_CORE_COMPUTE		= INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
+	XE_SIGID_FABRIC			= INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
+	XE_SIGID_SOC_INTERNAL		= INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
 };
 
 #endif
-- 
2.47.1

