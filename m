Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EB0C7115E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 18:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584710E8F2;
	Wed, 18 Jun 2025 18:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBci/RzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B2F10E29D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750272612; x=1781808612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l9pptPT7bmWEy3B+P5zcrKlzmEM2u7VDrSP3hqJU+2s=;
 b=lBci/RzYB5KtzZ+r1a+i6WodGQgXNSxMG7H0MGBfuTvCZGDVJfnLzCN2
 LdNj4AVk4hCDGg27wB7LIoHdxN6zPqpJC1GwNVNdmx9q8hSPs/H4/tffa
 04oFm4wjD3BYHJtpzk4e/XbmfC93iKC+4FfXvP4alMy4ldRH2wvhJQhE3
 EYIiv8AmYAV/5BVRKO30b4e7t23JUaRmuHkD2kMVykcCx/LHf41u/nMgu
 azlzuUvfoSZdPuOqUoH21xd/gKseI3qCemXNSotyTedPnLBV7OPn4hBAE
 06j7ApMQtivnsUKZLbL9g2on7UP82NjAZBabmkjEw5+RbjNdTZlyI6bfS A==;
X-CSE-ConnectionGUID: vZ2laQY4RxO2aEkfC8aVKw==
X-CSE-MsgGUID: CefdSDZyQ5SvHb8rC5wK3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="75036863"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="75036863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:12 -0700
X-CSE-ConnectionGUID: vZQadyN2QxuU8IEa65gRTw==
X-CSE-MsgGUID: BtH73RzkSVC6jept958LuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150730713"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 4/4] drm/xe/bmg: Update Wa_22019338487
Date: Wed, 18 Jun 2025 11:50:01 -0700
Message-ID: <20250618-wa-22019338487-v5-4-b888388477f2@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
References: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Limit GT max frequency to 2600MHz and wait for frequency to reduce
before proceeding with a transient flush. This is really only needed for
the transient flush: if L2 flush is needed due to 16023588340 then
there's no need to do this additional wait since we are already using
the bigger hammer.

v2: Use generic names, ensure user set max frequency requests wait
for flush to complete (Rodrigo)
v3:
 - User requests wait via wait_var_event_timeout (Lucas)
 - Close races on flush + user requests (Lucas)
 - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
   rather than root gt (Lucas)
v4:
 - Only apply the freq reducing part if a TDF is needed: L2 flush trumps
   the need for waiting a lower frequency

Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v3
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Rodrigo, since the change in v4 changed it considerably, please let me
know if your review still stands
---
 drivers/gpu/drm/xe/xe_device.c       |   8 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 125 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
 4 files changed, 135 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8396612b68d4b..c3aee79aa1acb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -40,6 +40,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_pc.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
@@ -1066,11 +1067,14 @@ void xe_device_td_flush(struct xe_device *xe)
 		return;
 
 	root_gt = xe_root_mmio_gt(xe);
-	if (XE_WA(root_gt, 16023588340))
+	if (XE_WA(root_gt, 16023588340)) {
 		/* A transient flush is not sufficient: flush the L2 */
 		xe_device_l2_flush(xe);
-	else
+	} else {
+		xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
 		tdf_request_sync(xe);
+		xe_guc_pc_remove_flush_freq_limit(&root_gt->uc.guc.pc);
+	}
 }
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 538b4ea61c17c..eb3552baa6029 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -7,7 +7,9 @@
 
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/ktime.h>
+#include <linux/wait_bit.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -53,9 +55,11 @@
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
 #define BMG_MIN_FREQ		1200
+#define BMG_MERT_FLUSH_FREQ_CAP	2600
 
 #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
 #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
+#define SLPC_ACT_FREQ_TIMEOUT_MS 100
 
 /**
  * DOC: GuC Power Conservation (PC)
@@ -143,6 +147,36 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
 	return -ETIMEDOUT;
 }
 
+static int wait_for_flush_complete(struct xe_guc_pc *pc)
+{
+	const unsigned long timeout = msecs_to_jiffies(30);
+
+	if (!wait_var_event_timeout(&pc->flush_freq_limit,
+				    !atomic_read(&pc->flush_freq_limit),
+				    timeout))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
+{
+	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
+	int slept, wait = 10;
+
+	for (slept = 0; slept < timeout_us;) {
+		if (xe_guc_pc_get_act_freq(pc) <= freq)
+			return 0;
+
+		usleep_range(wait, wait << 1);
+		slept += wait;
+		wait <<= 1;
+		if (slept + wait > timeout_us)
+			wait = timeout_us - slept;
+	}
+
+	return -ETIMEDOUT;
+}
 static int pc_action_reset(struct xe_guc_pc *pc)
 {
 	struct xe_guc_ct *ct = pc_to_ct(pc);
@@ -689,6 +723,11 @@ static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
  */
 int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
+	if (XE_WA(pc_to_gt(pc), 22019338487)) {
+		if (wait_for_flush_complete(pc) != 0)
+			return -EAGAIN;
+	}
+
 	guard(mutex)(&pc->freq_lock);
 
 	return xe_guc_pc_set_max_freq_locked(pc, freq);
@@ -889,6 +928,92 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+
+	return  XE_WA(gt, 22019338487) &&
+		pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP;
+}
+
+/**
+ * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
+ * @pc: the xe_guc_pc object
+ *
+ * As per the WA, reduce max GT frequency during L2 cache flush
+ */
+void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 max_freq;
+	int ret;
+
+	if (!needs_flush_freq_limit(pc))
+		return;
+
+	guard(mutex)(&pc->freq_lock);
+
+	ret = xe_guc_pc_get_max_freq_locked(pc, &max_freq);
+	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
+		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
+		if (ret) {
+			xe_gt_err_once(gt, "Failed to cap max freq on flush to %u, %pe\n",
+				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
+			return;
+		}
+
+		atomic_set(&pc->flush_freq_limit, 1);
+
+		/*
+		 * If user has previously changed max freq, stash that value to
+		 * restore later, otherwise use the current max. New user
+		 * requests wait on flush.
+		 */
+		if (pc->user_requested_max != 0)
+			pc->stashed_max_freq = pc->user_requested_max;
+		else
+			pc->stashed_max_freq = max_freq;
+	}
+
+	/*
+	 * Wait for actual freq to go below the flush cap: even if the previous
+	 * max was below cap, the current one might still be above it
+	 */
+	ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
+	if (ret)
+		xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
+			       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
+}
+
+/**
+ * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
+ * @pc: the xe_guc_pc object
+ *
+ * Retrieve the previous GT max frequency value.
+ */
+void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret = 0;
+
+	if (!needs_flush_freq_limit(pc))
+		return;
+
+	if (!atomic_read(&pc->flush_freq_limit))
+		return;
+
+	mutex_lock(&pc->freq_lock);
+
+	ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
+	if (ret)
+		xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
+			       pc->stashed_max_freq, ret);
+
+	atomic_set(&pc->flush_freq_limit, 0);
+	mutex_unlock(&pc->freq_lock);
+	wake_up_var(&pc->flush_freq_limit);
+}
+
 static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0a2664d5c8114..52ecdd5ddbff2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
 int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
 void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
+void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
+void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 2978ac9a249b5..c02053948a579 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -15,6 +15,8 @@
 struct xe_guc_pc {
 	/** @bo: GGTT buffer object that is shared with GuC PC */
 	struct xe_bo *bo;
+	/** @flush_freq_limit: 1 when max freq changes are limited by driver */
+	atomic_t flush_freq_limit;
 	/** @rp0_freq: HW RP0 frequency - The Maximum one */
 	u32 rp0_freq;
 	/** @rpa_freq: HW RPa frequency - The Achievable one */

-- 
2.49.0

