Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B377CC4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 00:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E3910E5EF;
	Thu, 11 Jan 2024 00:21:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0010E5EF
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 00:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704932487; x=1736468487;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zyy7q+nZBBE8spC9hqkoCTizWlzIUz1qcpAIWSJOjTs=;
 b=RI5F/LNX6/y4DGLQDVE1QPvlf67RHHu710L3hj/bq1M5sqzpDtAHZxmK
 2BHMvXSs9n+wihPa0Imu+On7S9T+TyZziShA0Kh78SRXSksGO1YJ6+2iW
 axt7m8rERKNBSEUsbM9pYHFx3yHCuo4yrufNLQQ2V3sse6yPuIFMl/bQc
 q5GGFfgRx++hbav9xvjII2gfW9TxleOEBI6H9cYtj1gmj7ZgRn0jTxm6g
 WKb89T31Rh/VNq5Dpbb2NiNJfhKIo9nrpb2JJYoZlpl9J09zO7M3fl4F+
 joZF1jHXsJZGGjWG1M3gyqGOcn5LNdB/3GZNeXG7ESK1tvNjZeeTd/I+x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="462980225"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="462980225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 16:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="24437459"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 16:21:12 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
Date: Wed, 10 Jan 2024 16:21:11 -0800
Message-ID: <20240111002111.10190-1-brian.welty@intel.com>
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

Requesting all memory regions on PVC will fill bo->placements up to
XE_BO_MAX_PLACEMENTS. The subsequent call to try_add_stolen() will trip
over the bounds checking even though XE_PL_STOLEN is not expected to
be used in this case.

This is hit with igt@xe_exec_fault_mode@once-basic-prefetch:
    xe 0000:8c:00.0: [drm] Assertion `*c < (sizeof(bo->placements) / sizeof((bo->placements)[0]) + ((int)(sizeof(struct { int:(-!!(__builtin_types_compatible_p(typeof((bo->placements)), typeof(&(bo->placements)[0])))); }))))` failed!
    WARNING: CPU: 30 PID: 6161 at drivers/gpu/drm/xe/xe_bo.c:203 __xe_bo_placement_for_flags+0x218/0x240 [xe]

Is fixed here by moving the bounds checks closer to where we actually
write into the bo->placement array.

Fixes: 8c54ee8a8606 ("drm/xe: Ensure that we don't access the placements array out-of-bounds")
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 338f9688a2c9..26fe73f58d72 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -125,9 +125,9 @@ static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 			   u32 bo_flags, u32 *c)
 {
-	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
-
 	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
+		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_TT,
 		};
@@ -145,6 +145,8 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 	struct xe_mem_region *vram;
 	u64 io_size;
 
+	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
 	xe_assert(xe, vram && vram->usable_size);
 	io_size = vram->io_size;
@@ -175,8 +177,6 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 			 u32 bo_flags, u32 *c)
 {
-	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
-
 	if (bo->props.preferred_gt == XE_GT1) {
 		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
 			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
@@ -193,9 +193,9 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 			   u32 bo_flags, u32 *c)
 {
-	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
-
 	if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
+		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_STOLEN,
 			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
-- 
2.43.0

