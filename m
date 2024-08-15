Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B23C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 17:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CDB10E4A1;
	Thu, 15 Aug 2024 17:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmoysiXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549B310E4A1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723742782; x=1755278782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nqA/iHQCP72GdeTlv0tATJnkDKIMC8ogLTSf3brjK2s=;
 b=VmoysiXqpSyikGmPTuchA2PLDjer4odFBe4dKkVSxNstoyObpZe+yUzR
 ZC2tU6wjtiPt5QPUVPV4Og7rY6tJA4DHaHEaBfkXHMnLkmk1lmBICp2AS
 zxYMAkVovf8XIoUbIkT28ALmIGWr6LFvcoBfDoRWuecqjfPE8C1sgeIQG
 TQ4U7mSYKO2jxdfFBVjdL2XwFdMexuJSasPjH1zT2CAidRyQJaXn1rz4c
 XGr1iUDL+gegiMiJLcql5ffEs5sOzzn8VMWIR9+b1z9m0USTSJ+4RVwvg
 +i4HSNR2kQ1Z9hc0vej8b47L+MQ0foGPiNBO9u/OHdV4o3Bm6J6XopE9F Q==;
X-CSE-ConnectionGUID: FN3f6sznTaWZNUyIZCIapQ==
X-CSE-MsgGUID: oPIZjJ2lT6qWABG3RgK73g==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22183515"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22183515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:26:22 -0700
X-CSE-ConnectionGUID: q/9/ewmHRCq1G5DOGzjOrA==
X-CSE-MsgGUID: yivsrKDWQjqm10BImWhT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="82616564"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:26:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 2/2] drm/xe/mcr: Try to derive dss_per_grp from hwconfig
 attributes
Date: Thu, 15 Aug 2024 10:26:04 -0700
Message-ID: <20240815172602.2729146-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240815172602.2729146-3-matthew.d.roper@intel.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
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

When steering MCR register ranges of type "DSS," the group_id and
instance_id values are calculated by dividing the DSS pool according to
the size of a gslice or cslice, depending on the platform.  These values
haven't changed much on past platforms, so we've been able to hardcode
the proper divisor so far.  However the layout may not be so fixed on
future platforms so the proper, future-proof way to determine this is by
using some of the attributes from the GuC's hwconfig table.  The
hwconfig has two attributes reflecting the architectural maximum slice
and subslice counts (i.e., before any fusing is considered) that can be
used for the purposes of calculating MCR steering targets.

If the hwconfig is lacking the necessary values (which should only be
possible on older platforms before these attributes were added), we can
still fall back to the old hardcoded values.  Going forward the hwconfig
is expected to always provide the information we need on newer
platforms, and any failure to do so will be considered a bug in the
firmware that will prevent us from switching to the buggy firmware
release.

It's worth noting that over time GuC's hwconfig has provided a couple
different keys with similar-sounding descriptions.  For our purposes
here, we only trust the newer key "70" which has supplanted the
similarly-named key "2" that existed on older platforms.

Bspec: 73210
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c       | 40 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_types.h     |  6 +++++
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 40 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_hwconfig.h |  1 +
 4 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 6d948a469126..7d7bd0be6233 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -8,8 +8,10 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_topology.h"
 #include "xe_gt_types.h"
+#include "xe_guc_hwconfig.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 
@@ -297,6 +299,36 @@ static void init_steering_mslice(struct xe_gt *gt)
 
 static unsigned int dss_per_group(struct xe_gt *gt)
 {
+	struct xe_guc *guc = &gt->uc.guc;
+	u32 max_slices = 0, max_subslices = 0;
+	int ret;
+
+	/*
+	 * Try to query the GuC's hwconfig table for the maximum number of
+	 * slices and subslices.  These don't reflect the platform's actual
+	 * slice/DSS counts, just the physical layout by which we should
+	 * determine the steering targets.  On older platforms with older GuC
+	 * firmware releases it's possible that these attributes may not be
+	 * included in the table, so we can always fall back to the old
+	 * hardcoded layouts.
+	 */
+#define HWCONFIG_ATTR_MAX_SLICES	1
+#define HWCONFIG_ATTR_MAX_SUBSLICES	70
+
+	ret = xe_guc_hwconfig_lookup_u32(guc, HWCONFIG_ATTR_MAX_SLICES,
+					 &max_slices);
+	if (ret < 0 || max_slices == 0)
+		goto fallback;
+
+	ret = xe_guc_hwconfig_lookup_u32(guc, HWCONFIG_ATTR_MAX_SUBSLICES,
+					 &max_subslices);
+	if (ret < 0 || max_subslices == 0)
+		goto fallback;
+
+	return DIV_ROUND_UP(max_subslices, max_slices);
+
+fallback:
+	xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using typical fallback values\n");
 	if (gt_to_xe(gt)->info.platform == XE_PVC)
 		return 8;
 	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
@@ -314,16 +346,16 @@ static unsigned int dss_per_group(struct xe_gt *gt)
  */
 void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
 {
-	int dss_per_grp = dss_per_group(gt);
-
 	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
 
-	*group = dss / dss_per_grp;
-	*instance = dss % dss_per_grp;
+	*group = dss / gt->steering_dss_per_grp;
+	*instance = dss % gt->steering_dss_per_grp;
 }
 
 static void init_steering_dss(struct xe_gt *gt)
 {
+	gt->steering_dss_per_grp = dss_per_group(gt);
+
 	xe_gt_mcr_get_dss_steering(gt,
 				   min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
 				       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0)),
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8e46c0969bc7..82cf9f631736 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -376,6 +376,12 @@ struct xe_gt {
 		u16 instance_target;
 	} steering[NUM_STEERING_TYPES];
 
+	/**
+	 * @steering_dss_per_grp: number of DSS per steering group (gslice,
+	 *    cslice, etc.).
+	 */
+	unsigned int steering_dss_per_grp;
+
 	/**
 	 * @mcr_lock: protects the MCR_SELECTOR register for the duration
 	 *    of a steered operation
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 025bad701556..af2c817d552c 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -160,3 +160,43 @@ void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
 
 	kfree(hwconfig);
 }
+
+/*
+ * Lookup a specific 32-bit attribute value in the GuC's hwconfig table.
+ */
+int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
+{
+	size_t size = xe_guc_hwconfig_size(guc);
+	u64 num_dw = div_u64(size, sizeof(u32));
+	u32 *hwconfig;
+	bool found = false;
+	int i = 0;
+
+	if (num_dw == 0)
+		return -EINVAL;
+
+	hwconfig = kzalloc(size, GFP_KERNEL);
+	if (!hwconfig)
+		return -ENOMEM;
+
+	xe_guc_hwconfig_copy(guc, hwconfig);
+
+	/* An entry requires at least three dwords for key, length, value */
+	while (i + 3 <= num_dw) {
+		u32 key = hwconfig[i++];
+		u32 len_dw = hwconfig[i++];
+
+		if (key != attribute) {
+			i += len_dw;
+			continue;
+		}
+
+		*val = hwconfig[i];
+		found = true;
+		break;
+	}
+
+	kfree(hwconfig);
+
+	return found ? 0 : -ENOENT;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
index 7df315900e1c..ab4e5038236e 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
@@ -15,5 +15,6 @@ int xe_guc_hwconfig_init(struct xe_guc *guc);
 u32 xe_guc_hwconfig_size(struct xe_guc *guc);
 void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
 void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
+int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val);
 
 #endif
-- 
2.45.2

