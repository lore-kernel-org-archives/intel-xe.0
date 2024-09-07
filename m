Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BEAE6FE49
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F1610EB2A;
	Sat,  7 Sep 2024 00:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjOyoBlk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA9B10EB39
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q8mTS5qSWrzKSDlE6euQW6GKjNOgI106WutSwrv5GSA=;
 b=QjOyoBlkheFj9lNV5dm3QFwdDbdoZXHood/6s9ei6uDVB479VgNsIR78
 vHRXYUzPOXv7P1l8ZYgI9RncGHFJwcARmvF/Ki6XZZEnIM9rIWpDq0bHP
 DEASxXk99eJJJbWS+0FULcmEflDyWvjGrg8etDU2wsRIoLfm8rYoPAlg8
 k6NWwyBNk2iIE9XBpclgkHEy2VUJF0dEuYq/d+HLZsGKLXZi2BNei7R6N
 oU42WbTZdGn1YAQV9k2T7z60cx0Lo02Mly05uVuB9BVG57xjvPQ1ZRYc6
 rs8r7XIOlqPBJwoOgTh8Zpv5wP5baSI0zT5onBBRPA209EhAMqOvanoH0 A==;
X-CSE-ConnectionGUID: VlWKkQmqTZKPjNuYXe6gwQ==
X-CSE-MsgGUID: uvBnI47+RaiGihkJv7kw0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855327"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855327"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: RpdBMZXESKOxq8w8nieWww==
X-CSE-MsgGUID: rYnUirt3Qf29aZw9eXGj9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792731"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 37/43] drm/xe/sriov: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:26 -0700
Message-ID: <20240907000748.2614020-82-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 6 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 6 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 4 ++--
 drivers/gpu/drm/xe/xe_sriov.c               | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 919d960165d5..065a9878f8e9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -74,7 +74,7 @@ static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
 
 static void pf_enable_ggtt_guest_update(struct xe_gt *gt)
 {
-	xe_mmio_write32(gt, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
+	xe_mmio_write32(&gt->mmio, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
 }
 
 /**
@@ -116,13 +116,13 @@ static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
 		count = MED_VF_SW_FLAG_COUNT;
 		for (n = 0; n < count; n++) {
 			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
-			xe_mmio_write32(gt, scratch, 0);
+			xe_mmio_write32(&gt->mmio, scratch, 0);
 		}
 	} else {
 		count = VF_SW_FLAG_COUNT;
 		for (n = 0; n < count; n++) {
 			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
-			xe_mmio_write32(gt, scratch, 0);
+			xe_mmio_write32(&gt->mmio, scratch, 0);
 		}
 	}
 }
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
index 4ebc82e607af..d3baba50f085 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -881,7 +881,7 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
  */
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
 {
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(&gt->mmio, reg.addr);
 	struct vf_runtime_reg *rr;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -917,7 +917,7 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
  */
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 {
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

