Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B8DCD11C2
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F6D10E7D4;
	Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbZ0XTAQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6CF10E7D0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762386481; x=1793922481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZMMJyoSLtwM3y5SMoZNtMnWwg1aHWcuDo0g5HKx+8i8=;
 b=AbZ0XTAQioCbmJhV1uYvLtDEOZBYyVXG8nIz1jssLJZHbxHQdfNm67qx
 llKwuKTDIAr+IvwQ+WqM/kc2dpYlLOB4LMym8YAvBoTOsi88APwc38MHM
 fbKJSAt0XGjfzejNuhPTCmMy3tvcyv1uQqzdZGEC6b10aWBzfUD1oZtwW
 uRYs8vH8cdlzhXK07yHf7MShjgLb5cNMrdcSFVxTgP9X7NKPhqjLnpik7
 RR0wo0h/oS4S+o7amHl3/RdXOwsarT+ZzzcLJlXxGqIoxZAxnBU5zLH1n
 l7E2f8Y9d3oYXyJa8eDp9B2iki49S7aFxTHdO5B+3/a/0TrGinQh4eVLW w==;
X-CSE-ConnectionGUID: Tf6UC2UURZa0t7afuUIEqA==
X-CSE-MsgGUID: 9plLmYczTT69u+3agSwObg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="89980380"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="89980380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
X-CSE-ConnectionGUID: tIWni1tXTmKwh6Y2+6ugbg==
X-CSE-MsgGUID: 6we0H90OQWG1lyZzK08LeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="188319633"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	badal.nilawar@intel.com
Subject: [PATCH 4/4] drm/xe/remapper: Reprogram remapper index on PM resume
 events
Date: Wed,  5 Nov 2025 15:47:58 -0800
Message-ID: <20251105234753.603647-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
References: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
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

Device enters the D3 cold state during both runtime and system suspend,
which requires reprogramming the SoC re-mapper index

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_pm.c           |  5 +++++
 drivers/gpu/drm/xe/xe_remapper.c     | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_remapper.h     |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 72a251204fe3..30b6e5ff899d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -540,6 +540,12 @@ struct xe_device {
 	struct {
 		/* Serialize access to SoC Remapper's index registers */
 		spinlock_t lock;
+
+		/* Last value of INDEX1 register */
+		u32 state;
+
+		/* A flag indicating state is initialized */
+		bool state_initialized;
 	} remapper;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7b089e6fb63f..19f6b7611465 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -24,6 +24,7 @@
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
+#include "xe_remapper.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -236,6 +237,8 @@ int xe_pm_resume(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Resuming device\n");
 	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
+	xe_remapper_resume(xe);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_idle_disable_c6(gt);
 
@@ -633,6 +636,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_rpm_lockmap_acquire(xe);
 
+	xe_remapper_resume(xe);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_idle_disable_c6(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_remapper.c b/drivers/gpu/drm/xe/xe_remapper.c
index b910cef7b8c6..f46ad4199f1f 100644
--- a/drivers/gpu/drm/xe/xe_remapper.c
+++ b/drivers/gpu/drm/xe/xe_remapper.c
@@ -13,9 +13,12 @@ static void xe_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
 				   u32 mask, u32 val)
 {
 	unsigned long flags;
+	u32 old;
 
 	spin_lock_irqsave(&xe->remapper.lock, flags);
-	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
+	old = xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
+	xe->remapper.state = (old & ~mask) | val;
+	xe->remapper.state_initialized = true;
 	spin_unlock_irqrestore(&xe->remapper.lock, flags);
 }
 
@@ -31,6 +34,18 @@ void xe_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
 			       REG_FIELD_PREP(SG_REMAP_SYSCTRL_BITS, index));
 }
 
+void xe_remapper_resume(struct xe_device *xe)
+{
+	unsigned long flags;
+
+	if (!xe->remapper.state_initialized)
+		return;
+
+	spin_lock_irqsave(&xe->remapper.lock, flags);
+	xe_mmio_write32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, xe->remapper.state);
+	spin_unlock_irqrestore(&xe->remapper.lock, flags);
+}
+
 void xe_remapper_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->remapper.lock);
diff --git a/drivers/gpu/drm/xe/xe_remapper.h b/drivers/gpu/drm/xe/xe_remapper.h
index 728447ea5786..044cf70a131e 100644
--- a/drivers/gpu/drm/xe/xe_remapper.h
+++ b/drivers/gpu/drm/xe/xe_remapper.h
@@ -11,6 +11,7 @@
 #include "xe_device_types.h"
 
 void xe_remapper_init(struct xe_device *xe);
+void xe_remapper_resume(struct xe_device *xe);
 void xe_remapper_set_telem_region(struct xe_device *xe, u32 index);
 void xe_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
 
-- 
2.43.0

