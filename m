Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9607FC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A82610E2B5;
	Thu,  3 Sep 2026 15:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVkci26I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF9B10F66D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447692; x=1819983692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIPB8GunX5soxi4O/vOMrpETKUgB0Zv6o8LXY0e0leE=;
 b=FVkci26IfBbliL9lUr9C8JVv45B1CKC0ZMVrczz6W+nZt6IzwWeAaNjj
 1K2s3A+PQnPr5XdleJdvvkF3luDXgRXMttWk1Vv3Zs78D0H8ECcSDpadY
 ZOyKoiipKxFDr5EB55VL7mKQjvbqWbwlUE0zPx9bZcXeIs7OOLXE5aL6z
 w5xFS1KJ2Wb8mS9r+zcczAtEH2DVyNG0hMEXGNeY+A0bwsP0yTxTGX5S0
 BQ+iD30j1+TonkIKqlfuYAofVlpaNZy94THwo54JZVHQTp7xuXPVjIBk+
 +2Ce2HSKXXDZC5tWNdO8w6ni7uJJXk9JDJlBWDdQqQeU72PNF9wAcRA01 A==;
X-CSE-ConnectionGUID: 5VZwJj0FScyBHvJP2B2nmg==
X-CSE-MsgGUID: +OAJhB0/QWSpUurwoRDq9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486796"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486796"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:15 -0700
X-CSE-ConnectionGUID: ljeknK4jShm7sMtiZGnQ5w==
X-CSE-MsgGUID: ogP4PJYAQEW0rlHy6tOCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441050"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:10 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 15/27] drm/xe/eudebug: Introduce EU control interface
Date: Thu,  3 Sep 2026 17:59:39 +0300
Message-ID: <20260903145952.848051-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Introduce EU control functionality, which allows the EU debugger
to interrupt, resume, and inform about the current state of
EU threads during execution. Provide an abstraction layer,
so that in the future the GuC will only need to provide appropriate
callbacks.

Based on an implementation created by the authors and others in the
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
v5: - s/ioctl_lock/exec_queue.lock to avoid wrong lock order (Mika)
v6: - require seqno MBZ (Mika)
v7: - error return consistency (Mika)
v8: - consolidate boilerplate and lrc sanity check (Mika)
v9: - keep FEE when setting FEH, user_arg reserved (Sashiko)
v10: - take runtime pm for hw access (Sashiko)
     - gate sriov (Sashiko)
     - more careful logging (Sashiko)
     - proper teardown if no runtime active
     - don't warn on wrong context (Claude)
     - documentation fixes (Claude)
     - byte size iter size check for safety (Claude)

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst      |   6 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
 drivers/gpu/drm/xe/xe_eudebug.c          |  54 ++
 drivers/gpu/drm/xe/xe_eudebug.h          |   2 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c       | 646 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h       |   7 +
 drivers/gpu/drm/xe/xe_eudebug_types.h    |  25 +
 include/uapi/drm/xe_drm_eudebug.h        |  67 +++
 8 files changed, 808 insertions(+)

diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
index 466d366c1e83..76f255c7da73 100644
--- a/Documentation/gpu/xe/xe_eudebug.rst
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -72,3 +72,9 @@ VM Access
 
 .. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
    :identifiers: drm_xe_eudebug_vm_open
+
+EU/HW Control
+=============
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_eu_control
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 94033982e694..7987e05a78ae 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -156,6 +156,7 @@
 #define   IDLE_DELAY				REG_GENMASK(20, 0)
 
 #define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
+#define   CURRENT_LRCA_VALID			REG_BIT(0)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 188a4c60513c..ecd6d4c5d63c 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -17,11 +17,14 @@
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
 
@@ -738,6 +741,33 @@ struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 id)
 	return vm;
 }
 
+struct xe_exec_queue *xe_eudebug_exec_queue_get(struct xe_eudebug *d, u32 id)
+{
+	struct xe_eudebug_resource *r =
+		resource_from_type(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE);
+	struct xe_exec_queue *eq;
+
+	mutex_lock(&r->lock);
+	eq = find_resource__unlocked(r, id);
+	if (eq)
+		xe_exec_queue_get(eq);
+	mutex_unlock(&r->lock);
+
+	return eq;
+}
+
+struct xe_lrc *xe_eudebug_find_lrc(struct xe_eudebug *d, u32 id)
+{
+	struct xe_eudebug_resource *r = resource_from_type(d, XE_EUDEBUG_RES_TYPE_LRC);
+	struct xe_lrc *lrc;
+
+	mutex_lock(&r->lock);
+	lrc = find_resource__unlocked(r, id);
+	mutex_unlock(&r->lock);
+
+	return lrc;
+}
+
 static struct drm_xe_eudebug_event *
 xe_eudebug_prepare_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
 			 u32 len)
@@ -1879,6 +1909,10 @@ static long xe_eudebug_ioctl(struct file *file,
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
@@ -1979,6 +2013,8 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_fd;
 	}
 
+	xe_eudebug_hw_init(d);
+
 	kref_get(&d->ref); /* for discovery */
 	queue_work(xe->eudebug.discovery_wq, &d->discovery_work);
 
@@ -2022,6 +2058,10 @@ bool xe_eudebug_is_enabled(struct xe_device *xe)
 
 int xe_eudebug_enable(struct xe_device *xe, bool enable)
 {
+	struct xe_gt *gt;
+	int i;
+	u8 id;
+
 	guard(mutex)(&xe->eudebug.lock);
 
 	if (xe->eudebug.cap_state == XE_EUDEBUG_CAP_NOT_SUPPORTED)
@@ -2033,6 +2073,20 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	if (enable == xe_eudebug_is_enabled(xe))
 		return 0;
 
+	xe_pm_runtime_get(xe);
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
+	xe_pm_runtime_put(xe);
+
 	WRITE_ONCE(xe->eudebug.cap_state, enable ?
 		   XE_EUDEBUG_CAP_ENABLED : XE_EUDEBUG_CAP_DISABLED);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index ea370dbfc0aa..8a5a10bf7e8b 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -72,6 +72,8 @@ struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 vm_id);
 
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
+struct xe_exec_queue *xe_eudebug_exec_queue_get(struct xe_eudebug *d, u32 id);
+struct xe_lrc *xe_eudebug_find_lrc(struct xe_eudebug *d, u32 id);
 
 void xe_eudebug_vm_bind_execute(struct xe_vm *vm, struct xe_vma_ops *ops);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
index aa31b4c91713..d14e4e4775f2 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -24,6 +24,7 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 #include "xe_wa.h"
@@ -70,3 +71,648 @@ void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable)
 		add_sr_entry(hwe, TD_CTL,
 			     TD_CTL_GLOBAL_DEBUG_ENABLE, enable);
 }
+
+static int read_hw_lrca_fw(struct xe_hw_engine *hwe, u32 *lrc_hw)
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
+static int read_hw_lrca(struct xe_hw_engine *hwe, u32 *lrc_hw)
+{
+	unsigned int fw_ref;
+	int ret;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	ret = read_hw_lrca_fw(hwe, lrc_hw);
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
+				    u32 rcu_debug1)
+{
+	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_RUNALONE_ACTIVE;
+}
+
+static bool engine_has_context_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)
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
+		return ERR_PTR(-ETIMEDOUT);
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
+		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: engine %s: runalone=%s, context=%s\n",
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
+			drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone engine %s %s\n",
+				hwe->name, first ? "ignored" : "selected");
+			if (!first)
+				first = hwe;
+		}
+	}
+
+	if (num_active > 1)
+		drm_err(&gt_to_xe(gt)->drm, "eudbg: %u runalone engines active!\n",
+			num_active);
+
+	if (!first)
+		return ERR_PTR(-ENOENT);
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
+	err = read_hw_lrca(hwe, &lrc_hw);
+	if (err)
+		return ERR_PTR(err);
+
+	mutex_lock(&xe->eudebug.lock);
+	list_for_each_entry(xef, &xe->eudebug.targets, eudebug.target_link) {
+		mutex_lock(&xef->exec_queue.lock);
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
+		mutex_unlock(&xef->exec_queue.lock);
+
+		if (found)
+			break;
+	}
+	mutex_unlock(&xe->eudebug.lock);
+
+	if (!found)
+		return ERR_PTR(-ENOENT);
+
+	/*
+	 * The context can switch out while we walk the target list, so
+	 * both of these are ordinary outcomes rather than driver bugs.
+	 */
+	if (read_hw_lrca(hwe, &lrc_hw)) {
+		xe_exec_queue_put(found);
+		return ERR_PTR(-ENOENT);
+	}
+
+	if (match_exec_queue_lrca(found, lrc_hw) < 0) {
+		xe_exec_queue_put(found);
+		return ERR_PTR(-ENOENT);
+	}
+
+	return found;
+}
+
+struct xe_exec_queue *
+xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
+{
+	struct xe_hw_engine *active;
+
+	active = get_runalone_active_hw_engine(gt);
+	if (IS_ERR(active))
+		return ERR_CAST(active);
+
+	return active_hwe_to_exec_queue(active, lrc_idx);
+}
+
+static int check_lrc_sanity(const struct xe_exec_queue *q,
+			    const struct xe_lrc *lrc,
+			    const int lrc_idx)
+{
+	if (lrc_idx >= q->width)
+		return -EINVAL;
+
+	if (q->lrc[lrc_idx] != lrc)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int do_eu_control(struct xe_eudebug *d,
+			 const struct drm_xe_eudebug_eu_control * const arg,
+			 struct drm_xe_eudebug_eu_control __user * const user_ptr)
+{
+	void __user * const bitmask_ptr = u64_to_user_ptr(arg->bitmask_ptr);
+	struct xe_device *xe = d->xe;
+	struct xe_exec_queue *q, *active;
+	struct xe_lrc *lrc;
+	unsigned int hw_attn_size, attn_size;
+	u8 *bits = NULL;
+	u64 seqno;
+	int lrc_idx;
+	int ret;
+
+	if (xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	/* Accept only hardware reg granularity mask */
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(arg->bitmask_size, sizeof(u32))))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, arg->seqno))
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
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		ret = -EIO;
+		goto queue_put;
+	}
+
+	active = xe_gt_runalone_active_queue_get(q->gt, &lrc_idx);
+	if (XE_IOCTL_DBG(xe, IS_ERR(active))) {
+		ret = PTR_ERR(active);
+		goto out_pm;
+	}
+
+	if (XE_IOCTL_DBG(xe, q != active)) {
+		ret = -EBUSY;
+		goto active_put;
+	}
+
+	ret = check_lrc_sanity(q, lrc, lrc_idx);
+	if (XE_IOCTL_DBG(xe, ret))
+		goto active_put;
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
+			ret = -ENOMEM;
+			goto active_put;
+		}
+
+		if (copy_from_user(bits, bitmask_ptr, attn_size)) {
+			ret = -EFAULT;
+			goto out_free;
+		}
+	}
+
+	ret = -EINVAL;
+	mutex_lock(&xe->eudebug.lock);
+
+	switch (arg->cmd) {
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
+		/* Make sure we dont promise anything but interrupting all */
+		if (!attn_size)
+			ret = d->ops->interrupt_all(d, active, lrc);
+		else
+			ret = -EINVAL;
+		break;
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED:
+		ret = d->ops->stopped(d, active, lrc, bits, attn_size);
+		break;
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME:
+		ret = d->ops->resume(d, active, lrc, bits, attn_size);
+		break;
+	default:
+		break;
+	}
+
+	if (ret == 0)
+		seqno = atomic_long_inc_return(&d->events.seqno);
+
+	mutex_unlock(&xe->eudebug.lock);
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
+active_put:
+	xe_exec_queue_put(active);
+out_pm:
+	xe_pm_runtime_put(xe);
+queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+static int xe_eu_control_interrupt_all(struct xe_eudebug *d,
+				       struct xe_exec_queue *active,
+				       struct xe_lrc *lrc)
+{
+	unsigned int fw_ref = 0;
+	u32 lrc_hw, lrc_hw_post;
+	u32 td_ctl;
+	int err = -EINVAL;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(active->gt), active->hwe->domain);
+	if (!fw_ref) {
+		err = -ETIMEDOUT;
+		goto out;
+	}
+
+	/* Additional check just before issuing MMIO writes */
+	err = read_hw_lrca_fw(active->hwe, &lrc_hw);
+	if (err)
+		goto out;
+
+	if (!lrca_equals(lower_32_bits(xe_lrc_descriptor(lrc)), lrc_hw)) {
+		err = -EBUSY;
+		goto out;
+	}
+
+	td_ctl = xe_gt_mcr_unicast_read_any(active->gt, TD_CTL);
+
+	/* Halt on next thread dispatch */
+	if (!(td_ctl & TD_CTL_FORCE_EXTERNAL_HALT))
+		xe_gt_mcr_multicast_write(active->gt, TD_CTL,
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
+		xe_gt_mcr_multicast_write(active->gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXCEPTION |
+					  TD_CTL_FORCE_EXTERNAL_HALT);
+	else
+		eu_warn(d, "TD_CTL force exception bit already set!\n");
+
+	usleep_range(100, 110);
+
+	xe_gt_mcr_multicast_write(active->gt, TD_CTL, td_ctl &
+				  ~(TD_CTL_FORCE_EXTERNAL_HALT | TD_CTL_FORCE_EXCEPTION));
+
+	/*
+	 * In case of stopping wrong ctx emit warning.
+	 * Nothing else we can do for now.
+	 */
+	if (!read_hw_lrca_fw(active->hwe, &lrc_hw_post) &&
+	    !lrca_equals(lrc_hw, lrc_hw_post))
+		eu_warn(d, "interrupted wrong context 0x%08x, wanted 0x%08x\n",
+			lrc_hw_post, lrc_hw);
+
+out:
+	if (fw_ref)
+		xe_force_wake_put(gt_to_fw(active->gt), fw_ref);
+
+	return err;
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
+			if (iter->i + sizeof(val) > iter->size)
+				return 0;
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
+			if (iter->i + sizeof(val) > iter->size)
+				return 0;
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
+				eu_dbg(d,
+				       "EU_ATT_CLR: (%u:%u:%u:%u): 0x%08x to fused off dss\n",
+				       group, instance, reg, row, val);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int xe_eu_control_resume(struct xe_eudebug *d,
+				struct xe_exec_queue *active,
+				struct xe_lrc *lrc,
+				u8 *bits, unsigned int bitmask_size)
+{
+	struct ss_iter iter = {
+		.debugger = d,
+			.i = 0,
+			.size = bitmask_size,
+			.bits = bits
+			};
+
+	/*
+	 * hsdes: 18021122357
+	 * We need to avoid clearing attention bits that are not set
+	 * in order to avoid the EOT hang on PVC.
+	 */
+	if (GRAPHICS_VERx100(d->xe) == 1260) {
+		int err;
+
+		err = xe_gt_foreach_dss_group_instance(active->gt, check_attn_mcr, &iter);
+		if (err)
+			return err;
+
+		iter.i = 0;
+	}
+
+	return xe_gt_foreach_dss_group_instance(active->gt, clear_attn_mcr, &iter);
+}
+
+static int xe_eu_control_stopped(struct xe_eudebug *d,
+				 struct xe_exec_queue *active,
+				 struct xe_lrc *lrc,
+				 u8 *bits, unsigned int bitmask_size)
+{
+	return xe_gt_eu_attention_bitmap(active->gt, bits, bitmask_size);
+}
+
+static const struct xe_eudebug_eu_control_ops eu_control = {
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
+	if (XE_IOCTL_DBG(xe, user_arg.reserved))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, IS_SRIOV_VF(xe)))
+		return -EPERM;
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
index 23dd55fc7ad9..489ac99b1529 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
@@ -14,10 +14,17 @@ struct xe_gt;
 
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
index 12a4921c8400..2885882ae415 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -19,7 +19,11 @@
 #include <uapi/drm/xe_drm_eudebug.h>
 
 struct xe_device;
+struct xe_eudebug;
+struct xe_hw_engine;
 struct workqueue_struct;
+struct xe_exec_queue;
+struct xe_lrc;
 
 /**
  * enum xe_eudebug_cap_state - eudebug capability state
@@ -69,6 +73,24 @@ struct xe_eudebug_resource {
 #define XE_EUDEBUG_RES_TYPE_LRC		2
 #define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_LRC + 1)
 
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
 		/** @acks.tree: pending acks by seqnos */
 		struct rb_root tree;
 	} acks;
+
+	/** @ops: operations for eu_control */
+	const struct xe_eudebug_eu_control_ops *ops;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 12e6197230db..e000d41a5e02 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -34,6 +34,7 @@ extern "C" {
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x1, struct drm_xe_eudebug_ack)
 #define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x2, struct drm_xe_eudebug_vm_open)
+#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x3, struct drm_xe_eudebug_eu_control)
 
 /**
  * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
@@ -296,6 +297,72 @@ struct drm_xe_eudebug_vm_open {
 	__u64 timeout_ns;
 };
 
+/**
+ * struct drm_xe_eudebug_eu_control - Control EU states
+ *
+ * Issue commands to execution units in hardware.
+ *
+ * With DRM_XE_EUDEBUG_IOCTL_EU_CONTROL debugger can
+ * interrupt all threads on execution units, query thread
+ * state and resume execution.
+ *
+ * :c:member:`drm_xe_eudebug_eu_control.seqno`
+ * will be updated to the timeline point when
+ * the command was issued.
+ *
+ * :c:member:`drm_xe_eudebug_eu_control.cmd` can
+ * be following:
+ *
+ * *DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL*
+ *  will instruct hardware to stop all threads on EUs
+ *  for exec_queue:lrc. This command takes no bitmask, so
+ *  :c:member:`drm_xe_eudebug_eu_control.bitmask_size`
+ *  must be set to zero.
+ *
+ * *DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED*
+ *  returns the bitmask for threads that are
+ *  in so called attention state.
+ *
+ * *DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME*
+ *  resumes the threads whose bit is set in the bitmask.
+ *
+ */
+struct drm_xe_eudebug_eu_control {
+	/** @cmd: Command for execution units */
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME		2
+	__u32 cmd;
+
+	/** @flags: Flags, must be set to zero */
+	__u32 flags;
+
+	/** @seqno: Seqno, must be set to zero */
+	__u64 seqno;
+
+	/** @exec_queue_handle: Exec queue handle for the command */
+	__u64 exec_queue_handle;
+
+	/** @lrc_handle: LRC handle for the command */
+	__u64 lrc_handle;
+
+	/** @reserved: Reserved field, must be set to zero */
+	__u32 reserved;
+
+	/**
+	 * @bitmask_size: Bitmask size in bytes
+	 *
+	 * Only the leading bytes that fit are used. If this differs from
+	 * the size the hardware bitmask needs, it is overwritten with that
+	 * size on return, so a short buffer can be grown and the command
+	 * retried.
+	 */
+	__u32 bitmask_size;
+
+	/** @bitmask_ptr: Bitmask pointer, each bit is one thread */
+	__u64 bitmask_ptr;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.53.0

