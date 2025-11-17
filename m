Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7507CCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 20:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BFA10E1CE;
	Mon, 17 Nov 2025 20:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOZkmtBY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4232D10E1CC
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763412802; x=1794948802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3xq2PcJB27eo9TmE2gnXHeXBW97JIrOwtLOKpuY0jok=;
 b=XOZkmtBYZAMOSMNYSfGmxtzd4t4kZQIy0doHhMiFRvWBzW/FRyTAgsfQ
 v/HKDon4u4E0kLSsyDNAm0r9qdjrjgM58nfzVhhowgs7WaulRmhaZfQvp
 VPcZqsZmX7thfeu9JPlnBNC0p6NuFf/V/iAuqzYEiLvyLFn+DpOPAFa46
 Iys1jq/XKtGxlrGs96DQ3hBKSPJfjmbneR6fRmHrMrbj+thvdLST3gzy+
 2k01qpmwOZUksUwYkfr1zcFOC4LWJp02po7TI4/UKQvvsJythj+U1B7jb
 GYzhK/wP7N8J85kGZTxdyUio/vyauaoGkhY7hVWdl7bG4hImnMkHvaGBw Q==;
X-CSE-ConnectionGUID: Wg+Y4o/WQIaj2EHIBrzNyA==
X-CSE-MsgGUID: Y+HDdjyRSz2yD3iPQg7j7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65516555"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65516555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:22 -0800
X-CSE-ConnectionGUID: C8Ry/ZPoTCiKUYr8nA8HKw==
X-CSE-MsgGUID: 7IpF8m3FT2e7k/axrYtXJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190227347"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, lucas.demarchi@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 4/4] drm/xe/remapper: Reprogram remapper index on PM resume
 events
Date: Mon, 17 Nov 2025 12:53:20 -0800
Message-ID: <20251117205315.1458477-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
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
 drivers/gpu/drm/xe/xe_soc_remapper.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_soc_remapper.h |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index de23fff3262c..9875e3db4a1f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -551,6 +551,12 @@ struct xe_device {
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
index 44924512830f..8a1b440df4ce 100644
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
 
@@ -633,6 +636,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
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

