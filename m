Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A8ED767F4
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7864510E03D;
	Thu, 31 Oct 2024 18:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSAP4Ba6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C71610E03D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398223; x=1761934223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2/Yhs6J88l80iGeCGBbDGzpHSF6nyZczYZoGGGM1AX0=;
 b=WSAP4Ba6F5xPRksC5SoSLlCL0xxDLkwGMpt/T4712nvXVHdBlJ+ag9qV
 sg8cd0z4RqjBmLB5CBO2TX0Q+kRoFpmdL46Ikr6xGzF3lNz4/yE+OZbl+
 jbZHXZFd0Uc06eHaJOlLY7t26yscG4GyqzI1c+wdpmMfZwMeOs+pRWdA4
 on4HfTefO7pSLGxSNZtCB/L7XrW4bakzIrzUcK0SPOPQhARonj8KleyTB
 bCPeHZ3X+CPTPq/m2RosI7IuaIY/vWawhpK8gMwOv5Xb4FAUiLslGyBwu
 TgLhp3/YDIegndqVt94dxxNjFv2rKTSGite8mGFKH9D/Ys5Dfz2OhPkl7 g==;
X-CSE-ConnectionGUID: yNIkL05/RXeZ2a+z7mW9Mg==
X-CSE-MsgGUID: HxftkyQ3Sfe/1y3qdhnh4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255872"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255872"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:23 -0700
X-CSE-ConnectionGUID: oVL07/toRne5fKRGCBNQoQ==
X-CSE-MsgGUID: Q2QrAw+5RG6A2LJLzVgFGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637579"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 6/8] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
Date: Thu, 31 Oct 2024 11:10:46 -0700
Message-Id: <20241031181048.2948948-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
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

Non-contiguous mapping of BO in VRAM doesn't work, use ttm_bo_access
instead.

v2:
 - Fix error handling

Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..c8782da3a5c3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3303,7 +3303,6 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 
 	for (int i = 0; i < snap->num_snaps; i++) {
 		struct xe_bo *bo = snap->snap[i].bo;
-		struct iosys_map src;
 		int err;
 
 		if (IS_ERR(snap->snap[i].data))
@@ -3316,16 +3315,12 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		}
 
 		if (bo) {
-			xe_bo_lock(bo, false);
-			err = ttm_bo_vmap(&bo->ttm, &src);
-			if (!err) {
-				xe_map_memcpy_from(xe_bo_device(bo),
-						   snap->snap[i].data,
-						   &src, snap->snap[i].bo_ofs,
-						   snap->snap[i].len);
-				ttm_bo_vunmap(&bo->ttm, &src);
-			}
-			xe_bo_unlock(bo);
+			err = ttm_bo_access(&bo->ttm, snap->snap[i].bo_ofs,
+					    snap->snap[i].data, snap->snap[i].len, 0);
+			if (!(err < 0) && err != snap->snap[i].len)
+				err = -EIO;
+			else if (!(err < 0))
+				err = 0;
 		} else {
 			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
 
-- 
2.34.1

