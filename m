Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74367CD37B7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278E410E63D;
	Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZxrmyHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B8210E63D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FtQoPHpuAL2k2VW2AsZp4cQvMEeyZeNv3xlIcYsgHnY=;
 b=UZxrmyHd+JXxc2pC9Tydy/b069YyNEE9/0e4PmXb+yRIxyrUvrqff12Q
 2CltWxT6VtOkSH6xzVvTD8ygb3MzXEZXDH78z0VQlpzu9pMqTkqyoVhXY
 iqaFEtkr+JCuDa8aQ5BFMam5bjTdtZax1hsTQe+kyKgTIWI3PgILt161/
 R6RHRznHnrgrH06QlnLeuGoJcx1ZrqgpkRSzCIlHwsdGVpR31O2q2YjBS
 Ac2Zyl9PYVTn5fPFTGJew7JBWYFzLrnf3Du7/pYiL9H5OuKyk92R3nOGL
 BlMMr1ZaYjw4SQFQdK02lTXSJ+MW9zBSuyXUYgVviO+rECvY0tJf4OU5i Q==;
X-CSE-ConnectionGUID: Iv373anXQ6aaSXe9qp5Arw==
X-CSE-MsgGUID: jyTegvE+QiO+Q3cS3ic+pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904795"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
X-CSE-ConnectionGUID: wTGQVpH0SDiTPIP5IP3v4w==
X-CSE-MsgGUID: /a5UlTYUR922zUwHpR6TGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944218"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 08/43] drm/xe: Adjust mmio code to pass VF substructure to
 SRIOV code
Date: Tue,  3 Sep 2024 17:21:09 -0700
Message-ID: <20240904002100.2023834-53-matthew.d.roper@intel.com>
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

Although we want to break the GT-centric nature of the MMIO code in the
general driver, the SRIOV handling still relies on data in a VF
substructure of the GT.  Pass this substructure, rather than the GT
itself, to the SRIOV code called from the MMIO operations.  Most of what
the SRIOV code needs is within this substructure, and container_of() can
be used to get back to the GT itself if necessary.
Also store a backpointer to this structure within the xe_mmio in
preparation for removal of xe_gt from the MMIO interface.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 6 ++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h  | 5 +++--
 drivers/gpu/drm/xe/xe_mmio.c         | 4 ++--
 drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 19c21e55e153..15a371f81c60 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -121,6 +121,9 @@ struct xe_mmio {
 	/** @regs: Map used to access registers. */
 	void __iomem *regs;
 
+	/** @sriov_vf: For GT regions, backpointer to SRIOV VF structure */
+	struct xe_gt_sriov_vf *sriov_vf;
+
 	/**
 	 * @map_size: Length of the register region within the map.
 	 *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ebc82e607af..2c61882ea411 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -879,8 +879,9 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
  *
  * Return: register value obtained from the PF or 0 if not found.
  */
-u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
+u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg)
 {
+	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	struct vf_runtime_reg *rr;
 
@@ -915,8 +916,9 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
  * This function is for VF use only.
  * Currently it will trigger a WARN if running on debug build.
  */
-void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
+void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val)
 {
+	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index e541ce57bec2..0437c937f5b0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 struct xe_gt;
+struct xe_gt_sriov_vf;
 struct xe_reg;
 
 int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
@@ -21,8 +22,8 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
-u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
-void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
+u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg);
+void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val);
 
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index dd2076b9003e..8068663e7d28 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -239,7 +239,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
 
 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
-		xe_gt_sriov_vf_write32(gt, reg, val);
+		xe_gt_sriov_vf_write32(gt->mmio.sriov_vf, reg, val);
 	else
 		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
@@ -254,7 +254,7 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	mmio_flush_pending_writes(gt);
 
 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
-		val = xe_gt_sriov_vf_read32(gt, reg);
+		val = xe_gt_sriov_vf_read32(gt->mmio.sriov_vf, reg);
 	else
 		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e222539022d5..04d34fd015ce 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -715,6 +715,9 @@ static int xe_info_init(struct xe_device *xe,
 		gt->mmio.regs = tile->mmio.regs;
 		gt->mmio.regs_length = tile->mmio.regs_length;
 		gt->mmio.xe = xe;
+		if (IS_SRIOV_VF(xe))
+			gt->mmio.sriov_vf = &gt->sriov.vf;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
@@ -738,6 +741,8 @@ static int xe_info_init(struct xe_device *xe,
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
 		gt->mmio.xe = xe;
+		if (IS_SRIOV_VF(xe))
+			gt->mmio.sriov_vf = &gt->sriov.vf;
 
 		/*
 		 * FIXME: At the moment multi-tile and standalone media are
-- 
2.45.2

