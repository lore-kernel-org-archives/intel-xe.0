Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB4ACFC515
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 04:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4BF10E04D;
	Sat, 22 Nov 2025 04:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqaCkExs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD0E10E8BC
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 04:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763787511; x=1795323511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8zRcMyqhSsSDVjqDFxcsiDGpp2NTTwnDDuK1+imXKuI=;
 b=DqaCkExs4AIZzIl/P5WqdzoWADblv0mFlmw5sC+JsSLkxlWd4rmgO7am
 ZLtCk8DerYxCYGKwMRXWENuG6LwXUcb7eJqfltbIO300r763Llq2/jwUC
 hnC8D3RAQ6VRuXoUxce6qhdemXJI56yBbBiETGnrcJkz0H8VAP+EXSnSU
 of0+JROvW7dEvbfi8SzxH27+euGqpmdjrag1r/6cjvqHlEEQWQtkn+NWq
 sJDhlJl1+VBBuVsP9kuLsNHTOcsCX2tFumR8Y0lesIJgBg5YOjcqTA9wv
 1wCkwfU/eQXzi2nnIDtEcZWtxPFF5RZzaxMwmAFsms0tPGGOReL5mBTJA g==;
X-CSE-ConnectionGUID: TSGIn9KzS1maKrkOO5sFrg==
X-CSE-MsgGUID: Z9mFdOQfTs+R8NvePwrMZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65921462"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65921462"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:31 -0800
X-CSE-ConnectionGUID: W/9mfgsqRY+eYt6eETuKmQ==
X-CSE-MsgGUID: +CjNulICRxSglwROVQHiAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191976566"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:27 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [RFC 4/5] drm/xe/remapper: Reprogram remapper index on PM resume
 events
Date: Fri, 21 Nov 2025 20:58:06 -0800
Message-ID: <20251122045803.3616201-11-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Device enters the D3 cold state during both runtime and system suspend,
which requires reprogramming the SoC re-mapper index

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_pm.c           |  5 +++++
 drivers/gpu/drm/xe/xe_soc_remapper.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_soc_remapper.h |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4d23b75bc728..3f118c64a124 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -556,6 +556,12 @@ struct xe_device {
 	struct {
 		/* Serialize access to SoC Remapper's index registers */
 		spinlock_t lock;
+
+		/* Last value of INDEX1 register */
+		u32 state;
+
+		/* A flag indicating state is initialized */
+		bool state_initialized;
 	} soc_remapper;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ad92a142dc7e..2196c21c4bb1 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -24,6 +24,7 @@
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
+#include "xe_soc_remapper.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -236,6 +237,8 @@ int xe_pm_resume(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Resuming device\n");
 	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
+	xe_soc_remapper_resume(xe);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_idle_disable_c6(gt);
 
@@ -629,6 +632,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_rpm_lockmap_acquire(xe);
 
+	xe_soc_remapper_resume(xe);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_idle_disable_c6(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
index ed6b6c594e51..c425195f7152 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -13,9 +13,12 @@ static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
 				       u32 mask, u32 val)
 {
 	unsigned long flags;
+	u32 old;
 
 	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
-	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
+	old = xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
+	xe->soc_remapper.state = (old & ~mask) | val;
+	xe->soc_remapper.state_initialized = true;
 	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
 }
 
@@ -31,6 +34,18 @@ void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
 				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
 }
 
+void xe_soc_remapper_resume(struct xe_device *xe)
+{
+	unsigned long flags;
+
+	if (!xe->soc_remapper.state_initialized)
+		return;
+
+	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
+	xe_mmio_write32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, xe->soc_remapper.state);
+	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
+}
+
 int xe_soc_remapper_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->soc_remapper.lock);
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
index 289aa41c3408..507701c74f6f 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.h
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
@@ -13,5 +13,6 @@
 int xe_soc_remapper_init(struct xe_device *xe);
 void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
 void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
+void xe_soc_remapper_resume(struct xe_device *xe);
 
 #endif
-- 
2.43.0

