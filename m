Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF47CC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4F610F7F4;
	Mon, 18 Mar 2024 18:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="it6Ncwna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F8B10F7F4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710787363; x=1742323363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yiPr2qnsMmfSkH8PrBV76SCMP277QH/qN1QapfSd8W0=;
 b=it6NcwnaQgG/7FCXCw+vMVzBa+uY8HFUDgPv4vaAzwxZMXXKAfpZ2bmJ
 clFKIHH5NG5UFMpq5OVDT/cG77f9kVHFlt/2DfFk1vfMug4WNRwMidFHt
 GYBdHc8GRX+xuxPqu3iXd+Ho7PUObGCasUEIM3AtSO/Xyo3PVC6SqYqzl
 lgBhbRWPc+AUuCQMX6FSMEOhiO7asQo0S7YHNsOu3Ruj0wftl2hvjZ5Vd
 jjIG7QiSqe7kJDbCYOeh1tumiFUSxniTmdRyEC6ZR351G1ozQTFv9Fbhd
 LZ25LGgj1J0byNow6nLEWxj8Va6b83vRO8RXt1tqek77HMe/o52ypd/FM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16347185"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="16347185"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18032102"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:42:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/uc: Use u64 for offsets for which we use
 upper_32_bits()
Date: Mon, 18 Mar 2024 11:42:25 -0700
Message-ID: <20240318184225.3808240-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The GGTT is currently a 32 bit address space, but the HW and GuC
support 48b addresses in GGTT-related operations, both to keep the
interface/HW paths common between PPGTT and GGTT and to allow for
future increase of the GGTT size.
This leaves us having to program a 64b field with a 32b offset, which
currently we're in some cases doing this by using an upper_32_bits()
call on a 32b variable, which doesn't make any sense. To do this cleanly
we have 2 options:

1 - Set the upper 32 bits directly to zero.
2 - Use 64b variables for the offset and keep programming the whole thing,
    so we're ready if we ever have bigger offsets.

This patch goes with option #2 and switches the related variables to u64.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          | 2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c        | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 9ed939c20602..1dfef2c29650 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -74,7 +74,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 {
-	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
+	u64 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
 	u32 flags;
 
 	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index ea49f3885c10..525e51cc7aa7 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -14,7 +14,7 @@
 #include "xe_guc.h"
 #include "xe_map.h"
 
-static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, u32 size)
+static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 size)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_GET_HWCONFIG,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d51cb9a4a6b7..9d3771ec5ceb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -533,7 +533,7 @@ static void register_engine(struct xe_exec_queue *q)
 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
 
 	if (xe_exec_queue_is_parallel(q)) {
-		u32 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
+		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
 
 		info.wq_desc_lo = lower_32_bits(ggtt_addr +
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 44b8c5f58fd8..7e44c468eb0f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -788,7 +788,8 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	u32 src_offset, dma_ctrl;
+	u64 src_offset;
+	u32 dma_ctrl;
 	int ret;
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
-- 
2.43.0

