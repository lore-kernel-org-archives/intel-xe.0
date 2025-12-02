Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2D6D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438D810E655;
	Tue,  2 Dec 2025 13:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvnCqKKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287B10E656
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683624; x=1796219624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6o4lfqiGjY8/iLnLNS8uf6ekioTGYofIJXc5QZy+o8I=;
 b=hvnCqKKYcxAU8lNgp6mXHhi9DXvNMAEM3/NRFukU080uoq9qP2DEbdn8
 c7DdFsowd6Zijw8BpWfnAdVD0yaq1t3TP1sn8I6iuHeVw/UYzqTCLhp/W
 G/G46nsgI8d9hFM+B3ACy3we/Y6GSMXUsg2zUPdIx8n/MwB3hHdUzBkuh
 s1Ob+33DLhgOAkdwm7hT7UPMFeUdAVCmmgQ+TOqigNzc/g+hyjAASve8l
 TNYFLXLoqXs7leDJL9s2qNThxCyIqXzQC3GFzkUuoHSLEzfJN3nxM0sGt
 LqNhxe8LUtYj63sZ/Uq9Hli3O3dK6tM4s7q9IvGN3aHk3Bb5IE7fDpRHu w==;
X-CSE-ConnectionGUID: U43iCcpWTeigAOFt5go8pw==
X-CSE-MsgGUID: 9cp7P4T3RVGe7fYByMAyEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537100"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537100"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:43 -0800
X-CSE-ConnectionGUID: IXBEYpJIR9uho88S3YD+2g==
X-CSE-MsgGUID: E7c6oeUKT/yj2O7aLaGfrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505718"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:39 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 12/20] drm/xe/eudebug: Introduce EU control interface
Date: Tue,  2 Dec 2025 15:52:31 +0200
Message-ID: <20251202135241.880267-13-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Introduce EU control functionality, which allows EU debugger
to interrupt, resume, and inform about the current state of
EU threads during execution. Provide an abstraction layer,
so in the future guc will only need to provide appropriate callbacks.

Based on implementation created by authors and other folks within
i915 driver.

v2: - checkpatch (Maciej)
    - lrc index off by one fix (Mika)
    - checkpatch (Tilak)
    - 32bit fixes (Andrzej, Mika)
    - find_resource_get for client (Mika)

v3: - fw ref (Mika)
    - attention register naming

v4: - fused off handling (Dominik)
    - squash xe3 parts and ptl attentions (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
 drivers/gpu/drm/xe/xe_eudebug.c          |  52 ++
 drivers/gpu/drm/xe/xe_eudebug.h          |   2 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c       | 658 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h       |   7 +
 drivers/gpu/drm/xe/xe_eudebug_types.h    |  25 +
 include/uapi/drm/xe_drm_eudebug.h        |  18 +
 7 files changed, 763 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index d588975e5be9..09d335927eb8 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -146,6 +146,7 @@
 #define   IDLE_DELAY				REG_GENMASK(20, 0)
 
 #define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
+#define   CURRENT_LRCA_VALID			REG_BIT(0)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 41a9cdfd6142..5faa06ba44db 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -15,11 +15,14 @@
 #include "xe_debug_data_types.h"
 #include "xe_device.h"
 #include "xe_eudebug.h"
+#include "xe_eudebug_hw.h"
 #include "xe_eudebug_types.h"
 #include "xe_eudebug_vm.h"
 #include "xe_exec_queue.h"
+#include "xe_gt.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
 
@@ -690,6 +693,29 @@ struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 id)
 	return vm;
 }
 
+struct xe_exec_queue *xe_eudebug_exec_queue_get(struct xe_eudebug *d, u32 id)
+{
+	struct xe_exec_queue *q;
+
+	mutex_lock(&d->res->lock);
+	q = find_resource__unlocked(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, id);
+	if (q)
+		xe_exec_queue_get(q);
+	mutex_unlock(&d->res->lock);
+
+	return q;
+}
+
+struct xe_lrc *xe_eudebug_find_lrc(struct xe_eudebug *d, u32 id)
+{
+	struct xe_lrc *lrc;
+
+	mutex_lock(&d->res->lock);
+	lrc = find_resource__unlocked(d->res, XE_EUDEBUG_RES_TYPE_LRC, id);
+	mutex_unlock(&d->res->lock);
+
+	return lrc;
+}
 
 static struct drm_xe_eudebug_event *
 xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
@@ -1659,6 +1685,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_vm_open_ioctl(d, arg);
 		eu_dbg(d, "ioctl cmd=VM_OPEN ret=%ld\n", ret);
 		break;
+	case DRM_XE_EUDEBUG_IOCTL_EU_CONTROL:
+		ret = xe_eudebug_eu_control(d, arg);
+		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -1741,6 +1771,8 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_detach;
 	}
 
+	xe_eudebug_hw_init(d);
+
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.wq, &d->discovery_work);
 
@@ -1770,6 +1802,10 @@ bool xe_eudebug_is_enabled(struct xe_device *xe)
 
 int xe_eudebug_enable(struct xe_device *xe, bool enable)
 {
+	struct xe_gt *gt;
+	int i;
+	u8 id;
+
 	mutex_lock(&xe->eudebug.lock);
 
 	if (xe->eudebug.state == XE_EUDEBUG_NOT_SUPPORTED) {
@@ -1787,6 +1823,22 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 		return 0;
 	}
 
+	xe_pm_runtime_get(xe);
+
+	for_each_gt(gt, xe, id) {
+		for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++) {
+			if (!(gt->info.engine_mask & BIT(i)))
+				continue;
+
+			xe_eudebug_init_hw_engine(&gt->hw_engines[i], enable);
+		}
+
+		xe_gt_reset_async(gt);
+		flush_work(&gt->reset.worker);
+	}
+
+	xe_pm_runtime_put(xe);
+
 	xe->eudebug.state = enable ?
 		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
 	mutex_unlock(&xe->eudebug.lock);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 74171cc81fe1..bd9fd7bf454f 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -63,6 +63,8 @@ struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 vm_id);
 
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
+struct xe_exec_queue *xe_eudebug_exec_queue_get(struct xe_eudebug *d, u32 id);
+struct xe_lrc *xe_eudebug_find_lrc(struct xe_eudebug *d, u32 id);
 
 void xe_eudebug_vm_bind_execute(struct xe_vm *vm, struct xe_vma_ops *ops);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
index aa31b4c91713..7ac0dd03ebf0 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -70,3 +70,661 @@ void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable)
 		add_sr_entry(hwe, TD_CTL,
 			     TD_CTL_GLOBAL_DEBUG_ENABLE, enable);
 }
+
+static int __current_lrca(struct xe_hw_engine *hwe, u32 *lrc_hw)
+{
+	u32 lrc_reg;
+
+	lrc_reg = xe_hw_engine_mmio_read32(hwe, RING_CURRENT_LRCA(0));
+
+	if (!(lrc_reg & CURRENT_LRCA_VALID))
+		return -ENOENT;
+
+	*lrc_hw = lrc_reg & GENMASK(31, 12);
+
+	return 0;
+}
+
+static int current_lrca(struct xe_hw_engine *hwe, u32 *lrc_hw)
+{
+	unsigned int fw_ref;
+	int ret;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	ret = __current_lrca(hwe, lrc_hw);
+
+	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
+
+	return ret;
+}
+
+static bool lrca_equals(u32 a, u32 b)
+{
+	return (a & GENMASK(31, 12)) == (b & GENMASK(31, 12));
+}
+
+static int match_exec_queue_lrca(struct xe_exec_queue *q, u32 lrc_hw)
+{
+	int i;
+
+	for (i = 0; i < q->width; i++)
+		if (lrca_equals(lower_32_bits(xe_lrc_descriptor(q->lrc[i])), lrc_hw))
+			return i;
+
+	return -1;
+}
+
+static int rcu_debug1_engine_index(const struct xe_hw_engine * const hwe)
+{
+	if (hwe->class == XE_ENGINE_CLASS_RENDER) {
+		XE_WARN_ON(hwe->instance);
+		return 0;
+	}
+
+	XE_WARN_ON(hwe->instance > 3);
+
+	return hwe->instance + 1;
+}
+
+static u32 engine_status_xe1(const struct xe_hw_engine * const hwe,
+			     u32 rcu_debug1)
+{
+	const unsigned int first = 7;
+	const unsigned int incr = 3;
+	const unsigned int i = rcu_debug1_engine_index(hwe);
+	const unsigned int shift = first + (i * incr);
+
+	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
+}
+
+static u32 engine_status_xe2(const struct xe_hw_engine * const hwe,
+			     u32 rcu_debug1)
+{
+	const unsigned int first = 7;
+	const unsigned int incr = 4;
+	const unsigned int i = rcu_debug1_engine_index(hwe);
+	const unsigned int shift = first + (i * incr);
+
+	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
+}
+
+static u32 engine_status_xe3(const struct xe_hw_engine * const hwe,
+			     u32 rcu_debug1)
+{
+	const unsigned int first = 6;
+	const unsigned int incr = 4;
+	const unsigned int i = rcu_debug1_engine_index(hwe);
+	const unsigned int shift = first + (i * incr);
+
+	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
+}
+
+static u32 engine_status(const struct xe_hw_engine * const hwe,
+			 u32 rcu_debug1)
+{
+	u32 status = 0;
+
+	if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20)
+		status = engine_status_xe1(hwe, rcu_debug1);
+	else if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 30)
+		status = engine_status_xe2(hwe, rcu_debug1);
+	else if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 35)
+		status = engine_status_xe3(hwe, rcu_debug1);
+	else
+		XE_WARN_ON(GRAPHICS_VER(gt_to_xe(hwe->gt)));
+
+	return status;
+}
+
+static bool engine_has_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)
+{
+	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_RUNALONE_ACTIVE;
+}
+
+static bool engine_has_context_set(const struct xe_hw_engine * const hwe,
+				  u32 rcu_debug1)
+{
+	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_CONTEXT_ACTIVE;
+}
+
+static struct xe_hw_engine *get_runalone_active_hw_engine(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe, *first = NULL;
+	unsigned int num_active, id, fw_ref;
+	u32 val;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref) {
+		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone failed to get force wake\n");
+		return NULL;
+	}
+
+	val = xe_mmio_read32(&gt->mmio, RCU_DEBUG_1);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone RCU_DEBUG_1 = 0x%08x\n", val);
+
+	num_active = 0;
+	xe_eudebug_for_each_hw_engine(hwe, gt, id) {
+		bool runalone, ctx;
+
+		runalone = engine_has_runalone_set(hwe, val);
+		ctx = engine_has_context_set(hwe, val);
+
+		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: engine %s: runalone=%s, context=%s",
+			hwe->name, runalone ? "active" : "inactive",
+			ctx ? "active" : "inactive");
+
+		/*
+		 * On earlier gen12 the context status seems to be idle when
+		 * it has raised attention. We have to omit the active bit.
+		 */
+		if (IS_DGFX(gt_to_xe(gt)))
+			ctx = true;
+
+		if (runalone && ctx) {
+			num_active++;
+
+			drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone engine %s %s",
+				hwe->name, first ? "selected" : "found");
+			if (!first)
+				first = hwe;
+		}
+	}
+
+	if (num_active > 1)
+		drm_err(&gt_to_xe(gt)->drm, "eudbg: %d runalone engines active!",
+			num_active);
+
+	return first;
+}
+
+static struct xe_exec_queue *active_hwe_to_exec_queue(struct xe_hw_engine *hwe,
+						      int *lrc_idx)
+{
+	struct xe_device *xe = gt_to_xe(hwe->gt);
+	struct xe_gt *gt = hwe->gt;
+	struct xe_exec_queue *q, *found = NULL;
+	struct xe_file *xef;
+	unsigned long i;
+	int idx, err;
+	u32 lrc_hw;
+
+	err = current_lrca(hwe, &lrc_hw);
+	if (err)
+		return ERR_PTR(err);
+
+	mutex_lock(&xe->eudebug.lock);
+	list_for_each_entry(xef, &xe->eudebug.targets, eudebug.target_link) {
+		down_write(&xef->eudebug.ioctl_lock);
+		xa_for_each(&xef->exec_queue.xa, i, q) {
+			if (q->gt != gt)
+				continue;
+
+			if (q->class != hwe->class)
+				continue;
+
+			if (xe_exec_queue_is_idle(q))
+				continue;
+
+			idx = match_exec_queue_lrca(q, lrc_hw);
+			if (idx < 0)
+				continue;
+
+			found = xe_exec_queue_get(q);
+
+			if (lrc_idx)
+				*lrc_idx = idx;
+
+			break;
+		}
+		up_write(&xef->eudebug.ioctl_lock);
+
+		if (found)
+			break;
+	}
+	mutex_unlock(&xe->eudebug.lock);
+
+	if (!found)
+		return ERR_PTR(-ENOENT);
+
+	if (XE_WARN_ON(current_lrca(hwe, &lrc_hw)) &&
+	    XE_WARN_ON(match_exec_queue_lrca(found, lrc_hw) < 0)) {
+		xe_exec_queue_put(found);
+		return ERR_PTR(-ENOENT);
+	}
+
+	return found;
+}
+
+static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
+{
+	struct xe_hw_engine *active;
+
+	active = get_runalone_active_hw_engine(gt);
+	if (!active) {
+		drm_dbg(&gt_to_xe(gt)->drm, "Runalone engine not found!");
+		return ERR_PTR(-ENOENT);
+	}
+
+	return active_hwe_to_exec_queue(active, lrc_idx);
+}
+
+static int do_eu_control(struct xe_eudebug *d,
+			 const struct drm_xe_eudebug_eu_control * const arg,
+			 struct drm_xe_eudebug_eu_control __user * const user_ptr)
+{
+	void __user * const bitmask_ptr = u64_to_user_ptr(arg->bitmask_ptr);
+	struct xe_device *xe = d->xe;
+	u8 *bits = NULL;
+	unsigned int hw_attn_size, attn_size;
+	struct xe_exec_queue *q;
+	struct xe_lrc *lrc;
+	u64 seqno;
+	int ret;
+
+	if (xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	/* Accept only hardware reg granularity mask */
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(arg->bitmask_size, sizeof(u32))))
+		return -EINVAL;
+
+	q = xe_eudebug_exec_queue_get(d, arg->exec_queue_handle);
+	if (XE_IOCTL_DBG(xe, !q))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_debuggable(q))) {
+		ret = -EINVAL;
+		goto queue_put;
+	}
+
+	lrc = xe_eudebug_find_lrc(d, arg->lrc_handle);
+	if (XE_IOCTL_DBG(xe, !lrc)) {
+		ret = -EINVAL;
+		goto queue_put;
+	}
+
+	hw_attn_size = xe_gt_eu_attention_bitmap_size(q->gt);
+	attn_size = arg->bitmask_size;
+
+	if (attn_size > hw_attn_size)
+		attn_size = hw_attn_size;
+
+	if (attn_size > 0) {
+		bits = kmalloc(attn_size, GFP_KERNEL);
+		if (!bits) {
+			ret =  -ENOMEM;
+			goto queue_put;
+		}
+
+		if (copy_from_user(bits, bitmask_ptr, attn_size)) {
+			ret = -EFAULT;
+			goto out_free;
+		}
+	}
+
+	if (!pm_runtime_active(xe->drm.dev)) {
+		ret = -EIO;
+		goto out_free;
+	}
+
+	ret = -EINVAL;
+	mutex_lock(&d->hw.lock);
+
+	switch (arg->cmd) {
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
+		/* Make sure we dont promise anything but interrupting all */
+		if (!attn_size)
+			ret = d->ops->interrupt_all(d, q, lrc);
+		break;
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED:
+		ret = d->ops->stopped(d, q, lrc, bits, attn_size);
+		break;
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME:
+		ret = d->ops->resume(d, q, lrc, bits, attn_size);
+		break;
+	default:
+		break;
+	}
+
+	if (ret == 0)
+		seqno = atomic_long_inc_return(&d->events.seqno);
+
+	mutex_unlock(&d->hw.lock);
+
+	if (ret)
+		goto out_free;
+
+	if (put_user(seqno, &user_ptr->seqno)) {
+		ret = -EFAULT;
+		goto out_free;
+	}
+
+	if (copy_to_user(bitmask_ptr, bits, attn_size)) {
+		ret = -EFAULT;
+		goto out_free;
+	}
+
+	if (hw_attn_size != arg->bitmask_size)
+		if (put_user(hw_attn_size, &user_ptr->bitmask_size))
+			ret = -EFAULT;
+
+out_free:
+	kfree(bits);
+queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+static int xe_eu_control_interrupt_all(struct xe_eudebug *d,
+				       struct xe_exec_queue *q,
+				       struct xe_lrc *lrc)
+{
+	struct xe_gt *gt = q->hwe->gt;
+	struct xe_device *xe = d->xe;
+	struct xe_exec_queue *active;
+	struct xe_hw_engine *hwe;
+	unsigned int fw_ref;
+	int lrc_idx, ret;
+	u32 lrc_hw;
+	u32 td_ctl;
+
+	hwe = get_runalone_active_hw_engine(gt);
+	if (XE_IOCTL_DBG(xe, !hwe)) {
+		drm_dbg(&gt_to_xe(gt)->drm, "Runalone engine not found!");
+		return -EINVAL;
+	}
+
+	active = active_hwe_to_exec_queue(hwe, &lrc_idx);
+	if (XE_IOCTL_DBG(xe, IS_ERR(active)))
+		return PTR_ERR(active);
+
+	if (XE_IOCTL_DBG(xe, q != active)) {
+		xe_exec_queue_put(active);
+		return -EINVAL;
+	}
+	xe_exec_queue_put(active);
+
+	if (XE_IOCTL_DBG(xe, lrc_idx >= q->width || q->lrc[lrc_idx] != lrc))
+		return -EINVAL;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), hwe->domain);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	/* Additional check just before issuing MMIO writes */
+	ret = __current_lrca(hwe, &lrc_hw);
+	if (ret)
+		goto put_fw;
+
+	if (!lrca_equals(lower_32_bits(xe_lrc_descriptor(lrc)), lrc_hw)) {
+		ret = -EBUSY;
+		goto put_fw;
+	}
+
+	td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+
+	/* Halt on next thread dispatch */
+	if (!(td_ctl & TD_CTL_FORCE_EXTERNAL_HALT))
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXTERNAL_HALT);
+	else
+		eu_warn(d, "TD_CTL force external halt bit already set!\n");
+
+	/*
+	 * The sleep is needed because some interrupts are ignored
+	 * by the HW, hence we allow the HW some time to acknowledge
+	 * that.
+	 */
+	usleep_range(100, 110);
+
+	/* Halt regardless of thread dependencies */
+	if (!(td_ctl & TD_CTL_FORCE_EXCEPTION))
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXCEPTION);
+	else
+		eu_warn(d, "TD_CTL force exception bit already set!\n");
+
+	usleep_range(100, 110);
+
+	xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &
+				  ~(TD_CTL_FORCE_EXTERNAL_HALT | TD_CTL_FORCE_EXCEPTION));
+
+	/*
+	 * In case of stopping wrong ctx emit warning.
+	 * Nothing else we can do for now.
+	 */
+	ret = __current_lrca(hwe, &lrc_hw);
+	if (ret || !lrca_equals(lower_32_bits(xe_lrc_descriptor(lrc)), lrc_hw))
+		eu_warn(d, "xe_eudebug: interrupted wrong context.");
+
+put_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	return ret;
+}
+
+struct ss_iter {
+	struct xe_eudebug *debugger;
+	unsigned int i;
+
+	unsigned int size;
+	u8 *bits;
+};
+
+static int check_attn_mcr(struct xe_gt *gt, void *data,
+			  u16 group, u16 instance, bool present)
+{
+	struct ss_iter *iter = data;
+	struct xe_eudebug *d = iter->debugger;
+	unsigned int reg, row;
+
+	for (reg = 0; reg < xe_gt_eu_att_regs(gt); reg++) {
+		for (row = 0; row < XE_GT_EU_ATT_ROWS; row++) {
+			u32 val, cur = 0;
+
+			if (iter->i >= iter->size)
+				return 0;
+
+			if (XE_WARN_ON((iter->i + sizeof(val)) >
+					(xe_gt_eu_attention_bitmap_size(gt))))
+				return -EIO;
+
+			memcpy(&val, &iter->bits[iter->i], sizeof(val));
+			iter->i += sizeof(val);
+
+			if (present)
+				cur = xe_gt_mcr_unicast_read(gt, EU_ATT(reg, row), group, instance);
+
+			if ((val | cur) != cur) {
+				eu_dbg(d,
+				       "WRONG CLEAR (%u:%u:%u:%u) EU_ATT_CLR: 0x%08x; EU_ATT: 0x%08x\n",
+				       group, instance, reg, row, val, cur);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int clear_attn_mcr(struct xe_gt *gt, void *data,
+			  u16 group, u16 instance, bool present)
+{
+	struct ss_iter *iter = data;
+	struct xe_eudebug *d = iter->debugger;
+	unsigned int reg, row;
+
+	for (reg = 0; reg < xe_gt_eu_att_regs(gt); reg++) {
+		for (row = 0; row < XE_GT_EU_ATT_ROWS; row++) {
+			u32 val;
+
+			if (iter->i >= iter->size)
+				return 0;
+
+			if (XE_WARN_ON((iter->i + sizeof(val)) >
+					(xe_gt_eu_attention_bitmap_size(gt))))
+				return -EIO;
+
+			memcpy(&val, &iter->bits[iter->i], sizeof(val));
+			iter->i += sizeof(val);
+
+			if (!val)
+				continue;
+
+			if (present) {
+				xe_gt_mcr_unicast_write(gt, EU_ATT_CLR(reg, row), val,
+							group, instance);
+
+				eu_dbg(d,
+				       "EU_ATT_CLR: (%u:%u:%u:%u): 0x%08x\n",
+				       group, instance, reg, row, val);
+			} else {
+				eu_warn(d,
+					"EU_ATT_CLR: (%u:%u:%u:%u): 0x%08x to fused off dss\n",
+					group, instance, reg, row, val);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int xe_eu_control_resume(struct xe_eudebug *d,
+				struct xe_exec_queue *q,
+				struct xe_lrc *lrc,
+				u8 *bits, unsigned int bitmask_size)
+{
+	struct xe_device *xe = d->xe;
+	struct ss_iter iter = {
+		.debugger = d,
+		.i = 0,
+		.size = bitmask_size,
+		.bits = bits
+	};
+	int ret = 0;
+	struct xe_exec_queue *active;
+	int lrc_idx;
+
+	active = runalone_active_queue_get(q->gt, &lrc_idx);
+	if (IS_ERR(active))
+		return PTR_ERR(active);
+
+	if (XE_IOCTL_DBG(xe, q != active)) {
+		xe_exec_queue_put(active);
+		return -EBUSY;
+	}
+	xe_exec_queue_put(active);
+
+	if (XE_IOCTL_DBG(xe, lrc_idx >= q->width || q->lrc[lrc_idx] != lrc))
+		return -EBUSY;
+
+	/*
+	 * hsdes: 18021122357
+	 * We need to avoid clearing attention bits that are not set
+	 * in order to avoid the EOT hang on PVC.
+	 */
+	if (GRAPHICS_VERx100(d->xe) == 1260) {
+		ret = xe_gt_foreach_dss_group_instance(q->gt, check_attn_mcr, &iter);
+		if (ret)
+			return ret;
+
+		iter.i = 0;
+	}
+
+	xe_gt_foreach_dss_group_instance(q->gt, clear_attn_mcr, &iter);
+	return 0;
+}
+
+static int xe_eu_control_stopped(struct xe_eudebug *d,
+				 struct xe_exec_queue *q,
+				 struct xe_lrc *lrc,
+				 u8 *bits, unsigned int bitmask_size)
+{
+	struct xe_device *xe = d->xe;
+	struct xe_exec_queue *active;
+	int lrc_idx;
+
+	if (XE_WARN_ON(!q) || XE_WARN_ON(!q->gt))
+		return -EINVAL;
+
+	active = runalone_active_queue_get(q->gt, &lrc_idx);
+	if (IS_ERR(active))
+		return PTR_ERR(active);
+
+	if (active) {
+		if (XE_IOCTL_DBG(xe, q != active)) {
+			xe_exec_queue_put(active);
+			return -EBUSY;
+		}
+
+		if (XE_IOCTL_DBG(xe, lrc_idx >= q->width || q->lrc[lrc_idx] != lrc)) {
+			xe_exec_queue_put(active);
+			return -EBUSY;
+		}
+	}
+
+	xe_exec_queue_put(active);
+
+	return xe_gt_eu_attention_bitmap(q->gt, bits, bitmask_size);
+}
+
+static struct xe_eudebug_eu_control_ops eu_control = {
+	.interrupt_all = xe_eu_control_interrupt_all,
+	.stopped = xe_eu_control_stopped,
+	.resume = xe_eu_control_resume,
+};
+
+void xe_eudebug_hw_init(struct xe_eudebug *d)
+{
+	d->ops = &eu_control;
+}
+
+long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg)
+{
+	struct drm_xe_eudebug_eu_control __user * const user_ptr =
+		u64_to_user_ptr(arg);
+	struct drm_xe_eudebug_eu_control user_arg;
+	struct xe_device *xe = d->xe;
+	int ret;
+
+	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(DRM_XE_EUDEBUG_IOCTL_EU_CONTROL) & _IOC_WRITE)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(DRM_XE_EUDEBUG_IOCTL_EU_CONTROL) & _IOC_READ)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, _IOC_SIZE(DRM_XE_EUDEBUG_IOCTL_EU_CONTROL) != sizeof(user_arg)))
+		return -EINVAL;
+
+	if (copy_from_user(&user_arg,
+			   user_ptr,
+			   sizeof(user_arg)))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, user_arg.flags))
+		return -EINVAL;
+
+	if (!access_ok(u64_to_user_ptr(user_arg.bitmask_ptr), user_arg.bitmask_size))
+		return -EFAULT;
+
+	eu_dbg(d,
+	       "eu_control: cmd=%u, flags=0x%x, exec_queue_handle=%llu, bitmask_size=%u\n",
+	       user_arg.cmd, user_arg.flags, user_arg.exec_queue_handle,
+	       user_arg.bitmask_size);
+
+	ret = do_eu_control(d, &user_arg, user_ptr);
+
+	eu_dbg(d,
+	       "eu_control: cmd=%u, flags=0x%x, exec_queue_handle=%llu, bitmask_size=%u ret=%d\n",
+	       user_arg.cmd, user_arg.flags, user_arg.exec_queue_handle,
+	       user_arg.bitmask_size, ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.h b/drivers/gpu/drm/xe/xe_eudebug_hw.h
index 7362ed9bde68..8f59ec574e4e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
@@ -16,10 +16,17 @@ struct xe_gt;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
+void xe_eudebug_hw_init(struct xe_eudebug *d);
 void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable);
 
+long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg);
+
+struct xe_exec_queue *xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx);
+
 #else /* CONFIG_DRM_XE_EUDEBUG */
 
+static inline void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_HW_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 292e93c72a64..205777a851a3 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -17,7 +17,11 @@
 
 struct xe_device;
 struct task_struct;
+struct xe_eudebug;
+struct xe_hw_engine;
 struct workqueue_struct;
+struct xe_exec_queue;
+struct xe_lrc;
 
 /**
  * enum xe_eudebug_state - eudebug capability state
@@ -76,6 +80,24 @@ struct xe_eudebug_resources {
 	struct xe_eudebug_resource rt[XE_EUDEBUG_RES_TYPE_COUNT];
 };
 
+/**
+ * struct xe_eudebug_eu_control_ops - interface for eu thread
+ * state control backend
+ */
+struct xe_eudebug_eu_control_ops {
+	/** @interrupt_all: interrupts workload active on given hwe */
+	int (*interrupt_all)(struct xe_eudebug *e, struct xe_exec_queue *q,
+			     struct xe_lrc *lrc);
+
+	/** @resume: resumes threads reflected by bitmask active on given hwe */
+	int (*resume)(struct xe_eudebug *e, struct xe_exec_queue *q,
+		      struct xe_lrc *lrc, u8 *bitmap, unsigned int bitmap_size);
+
+	/** @stopped: returns bitmap reflecting threads which signal attention */
+	int (*stopped)(struct xe_eudebug *e, struct xe_exec_queue *q,
+		       struct xe_lrc *lrc, u8 *bitmap, unsigned int bitmap_size);
+};
+
 /**
  * struct xe_eudebug - Top level struct for eudebug: the connection
  */
@@ -144,6 +166,9 @@ struct xe_eudebug {
 		/** @lock: guards access to hw state */
 		struct mutex lock;
 	} hw;
+
+	/** @ops operations for eu_control */
+	struct xe_eudebug_eu_control_ops *ops;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 139926a0f38c..df6e028bcd9c 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -18,6 +18,7 @@ extern "C" {
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x1, struct drm_xe_eudebug_ack_event)
 #define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x2, struct drm_xe_eudebug_vm_open)
+#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x3, struct drm_xe_eudebug_eu_control)
 
 /**
  * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
@@ -179,6 +180,23 @@ struct drm_xe_eudebug_vm_open {
 	__u64 timeout_ns;
 };
 
+struct drm_xe_eudebug_eu_control {
+
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME		2
+	__u32 cmd;
+	__u32 flags;
+
+	__u64 seqno;
+
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 reserved;
+	__u32 bitmask_size;
+	__u64 bitmask_ptr;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

