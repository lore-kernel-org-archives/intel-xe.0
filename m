Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E0CCFD34E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 19:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC06110E251;
	Mon, 24 Nov 2025 19:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4Pjd23K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD12A10E251
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 19:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764010971; x=1795546971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d/OsjdJgncHmQG61vqi3L1UQGokASyQqIYw9uMOTy2w=;
 b=Z4Pjd23K86BbtVd6/nPIJxF527WOIFW5TVjMKm1xs70dfALoGRpxoDJe
 uuVFVZB2fmoenHgCM/Hy6aKoPr/h7fVaX1xHrWVqeGTed+TEs4E0PCKX9
 dTXwaO2DIvi8NNB7EigKSkaAscwXwkRAc1PoiXQf716a6s4Xu2/IDglxp
 keQagAe8M2S+VE40AYXx873uQOsNZkKTq4xcAuLho/Fs5/Pm4ExdyBKj4
 /9MQdBVqihRVObDtx/z43of/vCLKWaj80Ec8GIAwM9aJwNcTIXDQeyIlr
 JwUPqYxX7iKSY8sI0KMwhWZEbLs3cdck/Ic8q9sTga/nhXiU92ABDvbzj w==;
X-CSE-ConnectionGUID: t8WYFmJ9RSKpJQeFwgHm/A==
X-CSE-MsgGUID: vAyTBpRdS1avWfThD8tH8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83410031"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="83410031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:02:50 -0800
X-CSE-ConnectionGUID: 88mnFLjlTBiQP/1oWUXrvA==
X-CSE-MsgGUID: r9BhhsvwSUe34f0B0ZOTJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196858120"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:02:49 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v3 1/4] drm/xe: Add device flag to indicate standalone MERT
Date: Mon, 24 Nov 2025 20:02:34 +0100
Message-Id: <20251124190237.20503-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124190237.20503-1-lukasz.laguna@intel.com>
References: <20251124190237.20503-1-lukasz.laguna@intel.com>
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
index 6ce3247d1bd8..8e51167390fd 100644
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
index cd03b4b3ebdb..0af320268870 100644
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

