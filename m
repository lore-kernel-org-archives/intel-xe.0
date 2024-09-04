Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57B2CD37BC
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76F210E654;
	Wed,  4 Sep 2024 00:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfsXpHXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A4910E641
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+qgPzyNWMCPm3yimIiWycrVmvL/nh9N8nmzbuQJrNOg=;
 b=nfsXpHXrWKW+w0V+gLfIL3q0/YwuoR8prvQXhElNHagHVU16dIVsyIwr
 PcVzMCpoGHmDv9wS6OpUTmPL597y5mEEAODaHuX+ts+O6+LZ3+wyGlNMx
 a541jd93dvXn0TJ0JHx+93viFRcmC+NVABLfmSulKJPbn+8D0L+cz0YZ8
 JZRjMTjt/tOo06OG340jEWDdIjRFRrwZI290aSvY+0pOl73icJfIA0X7t
 cZmk35MfWT9NEnx+ZYb6KNnXK7GHtb/U0UttOq1keVcks0yLrzW9O3jA3
 rxCIB3MpDDSoQA1DRj1/nd+9beE9nRj+yYs/y8ILDYZ4jvFL1UyE9N9W+ g==;
X-CSE-ConnectionGUID: /S+imD2CTBWGrvvPXi7nRA==
X-CSE-MsgGUID: ZuVuQ477Q1GSN3L5v/WC+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904828"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904828"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: rvV5qptlQDmBLzs0dxySFg==
X-CSE-MsgGUID: KO1u0D08SqywnUwUQLoPRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944327"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 37/43] drm/xe/sriov: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:38 -0700
Message-ID: <20240904002100.2023834-82-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 6 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 4 ++--
 drivers/gpu/drm/xe/xe_sriov.c               | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 905f409db74b..db3e101c39b8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -72,7 +72,7 @@ static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
 
 static void pf_enable_ggtt_guest_update(struct xe_gt *gt)
 {
-	xe_mmio_write32(gt, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
+	xe_mmio_write32(&gt->mmio, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 0e23b7ea4f3e..924e75b94aec 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -237,7 +237,7 @@ static void read_many(struct xe_gt *gt, unsigned int count,
 		      const struct xe_reg *regs, u32 *values)
 {
 	while (count--)
-		*values++ = xe_mmio_read32(gt, *regs++);
+		*values++ = xe_mmio_read32(&gt->mmio, *regs++);
 }
 
 static void pf_prepare_runtime_info(struct xe_gt *gt)
@@ -402,7 +402,7 @@ static int pf_service_runtime_query(struct xe_gt *gt, u32 start, u32 limit,
 
 	for (i = 0; i < count; ++i, ++data) {
 		addr = runtime->regs[start + i].addr;
-		data->offset = xe_mmio_adjusted_addr(gt, addr);
+		data->offset = xe_mmio_adjusted_addr(&gt->mmio, addr);
 		data->value = runtime->values[start + i];
 	}
 
@@ -513,7 +513,7 @@ int xe_gt_sriov_pf_service_print_runtime(struct xe_gt *gt, struct drm_printer *p
 
 	for (; size--; regs++, values++) {
 		drm_printf(p, "reg[%#x] = %#x\n",
-			   xe_mmio_adjusted_addr(gt, regs->addr), *values);
+			   xe_mmio_adjusted_addr(&gt->mmio, regs->addr), *values);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2c61882ea411..acf421f6b0a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -882,7 +882,7 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
 u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg)
 {
 	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(&gt->mmio, reg.addr);
 	struct vf_runtime_reg *rr;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -919,7 +919,7 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg)
 void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val)
 {
 	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(&gt->mmio, reg.addr);
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, !reg.vf);
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 5a1d65e4f19f..69a066ef20c0 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -35,7 +35,7 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
 
 static bool test_is_vf(struct xe_device *xe)
 {
-	u32 value = xe_mmio_read32(xe_root_mmio_gt(xe), VF_CAP_REG);
+	u32 value = xe_mmio_read32(xe_root_tile_mmio(xe), VF_CAP_REG);
 
 	return value & VF_CAP;
 }
-- 
2.45.2

