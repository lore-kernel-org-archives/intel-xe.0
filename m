Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF765CCF9EB
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 08:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076610EABC;
	Fri, 31 Oct 2025 08:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLED0fop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5ADA10EABC
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897945; x=1793433945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XHPa/PVbMQEnuUlMM32PvhUJUogwiXlP89S+MDgkbqM=;
 b=lLED0foprcIAKcCsicqOnoY0Ojryy3g2BQwy97b4DZzfANkGOS9xMxty
 pL55Yrh6kffRTogIZ71q2tvJ5b5R84lq7dKL7G0FH4q8GIrBcvZhiCDlK
 3PHrlCKrx9d88qapgp4BtT6PQgYKCP+628mBTTdJmW8TjUxpzmNIsm7KH
 6UuRGB5Jbg8y0GG2oji83D/mPni32mbmygqN19vcAfNehB1q5Iv5bK+t2
 ZlVIXKdVAmaQdB8n/OuyTCKBgzv6Ul9ioaVXiG3VTH+g8/Mrtnmr2sps3
 HWV5PTBA71ky7Q/V1RhFPR3M4whisl7TqPfyPGhNDCaUZo3YbrZ3AXjBH w==;
X-CSE-ConnectionGUID: OeS5gykCQfuMjxf1RgUnmw==
X-CSE-MsgGUID: yIOtFiBBRLm/tLh/cYjfZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75503184"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75503184"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:45 -0700
X-CSE-ConnectionGUID: PINGxkB2S2intZJ/owI4jQ==
X-CSE-MsgGUID: +a8CpOKpQgq0Cr1d6UTswg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186631610"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:43 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 1/4] drm/xe: Add device flag to indicate standalone MERT
Date: Fri, 31 Oct 2025 09:04:58 +0100
Message-Id: <20251031080501.844-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251031080501.844-1-lukasz.laguna@intel.com>
References: <20251031080501.844-1-lukasz.laguna@intel.com>
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

The MERT subsystem manages memory accesses between host and device. On
the Crescent Island platform, it requires direct management by the
driver.

Introduce a device flag and corresponding helpers to identify platforms
with standalone MERT, enabling proper initialization and handling.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h       | 5 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 4 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..6604b89330d5 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -172,6 +172,11 @@ static inline bool xe_device_has_lmtt(struct xe_device *xe)
 	return IS_DGFX(xe);
 }
 
+static inline bool xe_device_has_mert(struct xe_device *xe)
+{
+	return xe->info.has_mert;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index af0ce275b032..0b95d6539bc0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -307,6 +307,8 @@ struct xe_device {
 		u8 has_mbx_power_limits:1;
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
 		u8 has_mem_copy_instr:1;
+		/** @info.has_mert: Device has standalone MERT */
+		u8 has_mert:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index aeae675c912b..1b02d4fd2cab 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -407,6 +407,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_display = false,
 	.has_flat_ccs = false,
 	.has_mbx_power_limits = true,
+	.has_mert = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
@@ -673,6 +674,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_mert = desc->has_mert;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..d89ee5d82439 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -47,6 +47,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_mem_copy_instr:1;
+	u8 has_mert:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.40.0

