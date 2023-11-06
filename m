Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140BC001B2
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFE510E2DE;
	Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FFA10E2CE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269755; x=1730805755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5iLrxcWr2fX60P7TzY6Xsf8v1FPTpny+Pc0VrhoK9rk=;
 b=IHH+B/CdsEApiql8oDFH6VfLRAkeHjko45mVprq0DZfYhVKlf+dOiJa9
 4ssYZmf6y8s/iql/Sdl26/VjLVI5/HVa8l0X4p01Vge0BzApnVKkWAGWQ
 Vl7j6IilVMkUB3CGS1EM7aYO3r9/zYD7w3YkMCsPuJmZzUwys9UCaIa7X
 yufeGm+ojj43DxTyRkN4pE1iXWqNMuVbsXlLrakO7zXExvt7qmpMlTLwl
 0OOt4GsGROZaVIxsqhJphA7O5v8shJ1E7RxOplDtXJ8ndPQbsQ8RjMaWn
 DvgCsDfyRfQcwbX6zqpoyDRY3bHWT7GXIfwDIGL/BFYDJJEvf3i3u/w9a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646805"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411617"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411617"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:25 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:31 +0200
Message-Id: <20231106111845.2333093-12-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 11/25] drm/xe/eudebug: Introduce EU control
 interface
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

Based on implementation created by authors and other folks within i915 driver.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   2 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 400 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug_types.h |  21 ++
 drivers/gpu/drm/xe/xe_gt_debug.c      |  12 +-
 drivers/gpu/drm/xe/xe_gt_debug.h      |   6 +
 include/uapi/drm/xe_drm_tmp.h         |  17 +-
 6 files changed, 443 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index ca33731dd442..8c4163004074 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -362,6 +362,8 @@
 #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
 #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
+#define TD_CLR(i)				XE_REG_MCR(0xe490 + (i) * 4)
+
 #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index b54d5135938d..e110ba7aa860 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -19,6 +19,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
 #include "xe_lrc.h"
 #include "xe_hw_engine.h"
 #include "xe_exec_queue.h"
@@ -496,6 +497,33 @@ static int find_handle(struct xe_eudebug_resources *res,
 	return id;
 }
 
+static struct xe_eudebug_handle *find_resource(struct xe_eudebug_resources *res,
+					       const int type,
+					       const u32 id)
+{
+	struct xe_eudebug_resource *r;
+	struct xe_eudebug_handle *h;
+
+	r = resource_from_type(res, type);
+
+	mutex_lock(&res->lock);
+	h = xa_load(&r->xa, id);
+	mutex_unlock(&res->lock);
+
+	return h;
+}
+
+static struct xe_file *find_client(struct xe_eudebug *d, const u32 id)
+{
+	struct xe_eudebug_handle *h;
+
+	h = find_resource(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, id);
+	if (h)
+		return (void *)h->key;
+
+	return NULL;
+}
+
 static int xe_eudebug_add_handle(struct xe_eudebug *d,
 				 int type,
 				 void *p)
@@ -672,6 +700,149 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 	return ret;
 }
 
+static int do_eu_control(struct xe_eudebug *d,
+			 const struct drm_xe_eudebug_eu_control * const arg,
+			 struct drm_xe_eudebug_eu_control __user * const user_ptr)
+{
+	void __user * const bitmask_ptr = u64_to_user_ptr(arg->bitmask_ptr);
+	struct xe_device *xe = d->xe;
+	u8 *bits = NULL;
+	unsigned int hw_attn_size, attn_size;
+	struct xe_hw_engine *hwe;
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
+	hwe = xe_hw_engine_lookup(xe, arg->ci);
+	if (XE_IOCTL_DBG(xe, !hwe))
+		return -EINVAL;
+
+	hw_attn_size = xe_gt_eu_attention_bitmap_size(hwe->gt);
+	attn_size = arg->bitmask_size;
+
+	if (attn_size > hw_attn_size)
+		attn_size = hw_attn_size;
+
+	if (attn_size > 0) {
+		bits = kmalloc(attn_size, GFP_KERNEL);
+		if (!bits)
+			return -ENOMEM;
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
+	ret = 0;
+	mutex_lock(&d->eu_lock);
+
+	switch (arg->cmd) {
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
+		/* Make sure we dont promise anything but interrupting all */
+		if (attn_size)
+			ret = -EINVAL;
+		else
+			ret = d->ops->interrupt_all(d, hwe, arg->client_handle);
+		break;
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED:
+		ret = d->ops->stopped(d, hwe, bits, attn_size);
+		break;
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME:
+		ret = d->ops->resume(d, hwe, bits, attn_size);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret == 0)
+		seqno = atomic_long_inc_return(&d->events.seqno);
+
+	mutex_unlock(&d->eu_lock);
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
+
+	return ret;
+}
+
+static long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg)
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
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size);
+
+	if (XE_IOCTL_DBG(xe, IS_ERR(find_client(d, user_arg.client_handle))))
+		return -EINVAL; /* As this is user input */
+
+	ret = do_eu_control(d, &user_arg, user_ptr);
+
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u, ret=%d\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size, ret);
+
+	return ret;
+}
+
 static long xe_eudebug_ioctl(struct file *file,
 			     unsigned int cmd,
 			     unsigned long arg)
@@ -686,6 +857,11 @@ static long xe_eudebug_ioctl(struct file *file,
 		eu_dbg(d, "ioctl cmd=READ_EVENT ret=%ld\n", ret);
 		break;
 
+	case DRM_XE_EUDEBUG_IOCTL_EU_CONTROL:
+		ret = xe_eudebug_eu_control(d, arg);
+		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
+		break;
+
 	default:
 		ret = -EINVAL;
 	}
@@ -724,19 +900,12 @@ static bool queue_has_active_job(struct xe_exec_queue *q)
 	return false;
 }
 
-static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
+static int __current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
 {
 	u32 lrc_reg;
-	int err;
-
-	err = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
-	if (err)
-		return err;
 
 	lrc_reg = hw_engine_mmio_read32(hwe, RING_CURRENT_LRCA(0));
 
-	xe_force_wake_put(gt_to_fw(hwe->gt), hwe->domain);
-
 	if (!(lrc_reg & CURRENT_LRCA_VALID))
 		return -ENOENT;
 
@@ -745,6 +914,21 @@ static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
 	return 0;
 }
 
+static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
+{
+	int ret;
+
+	ret = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
+	if (ret)
+		return ret;
+
+	ret = __current_lrc(hwe, lrc_hw);
+
+	xe_force_wake_put(gt_to_fw(hwe->gt), hwe->domain);
+
+	return ret;
+}
+
 static int match_engine_lrc(struct xe_exec_queue *q, u32 lrc_hw)
 {
 	int i;
@@ -1026,6 +1210,205 @@ static void attention_scan_flush(struct xe_device *xe)
 	mod_delayed_work(system_wq, &xe->eudebug.attention_scan, 0);
 }
 
+static int xe_eu_control_interrupt_all(struct xe_eudebug *d,
+				       struct xe_hw_engine *hwe,
+				       u64 client_handle)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_file *xef;
+	struct xe_exec_queue *active;
+	int lrc_idx, ret;
+	u32 lrc_hw;
+	u32 td_ctl;
+
+	xef = find_client(d, client_handle);
+	if (IS_ERR(xef))
+		return PTR_ERR(xef);
+
+	active = runalone_active_queue_get(gt, &lrc_idx);
+	if (IS_ERR(active))
+		return PTR_ERR(active);
+
+	if (xef != active->persistent.xef) {
+		ret = -EINVAL;
+		goto put_exec_queue;
+	}
+
+	ret = xe_force_wake_get(gt_to_fw(gt), hwe->domain);
+	if (ret)
+		goto put_exec_queue;
+
+	/* Additional check just before issuing MMIO writes */
+	ret = __current_lrc(hwe, &lrc_hw);
+	if (ret)
+		goto put_fw;
+
+	if (match_engine_lrc(active, lrc_hw) != lrc_idx) {
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
+	udelay(100);
+
+	/* Halt regardless of thread dependencies */
+	if (!(td_ctl & TD_CTL_FORCE_EXCEPTION))
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXCEPTION);
+	else
+		eu_warn(d, "TD_CTL force exception bit already set!\n");
+
+	udelay(100);
+
+	xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &
+				  ~(TD_CTL_FORCE_EXTERNAL_HALT | TD_CTL_FORCE_EXCEPTION));
+
+	/*
+	 * In case of stopping wrong ctx emit warning.
+	 * Nothing else we can do for now.
+	 */
+	ret = __current_lrc(hwe, &lrc_hw);
+	if (ret || match_engine_lrc(active, lrc_hw) < 0)
+		eu_warn(d, "xe_eudebug: interrupted wrong context.");
+
+put_fw:
+	xe_force_wake_put(gt_to_fw(gt), hwe->domain);
+put_exec_queue:
+	xe_exec_queue_put(active);
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
+			  unsigned int group, unsigned int instance)
+{
+	struct ss_iter *iter = data;
+	struct xe_eudebug *d = iter->debugger;
+	unsigned int row;
+
+	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
+		u32 val, cur = 0;
+
+		if (iter->i >= iter->size)
+			return 0;
+
+		if (XE_WARN_ON((iter->i + sizeof(val)) >
+				(xe_gt_eu_attention_bitmap_size(gt))))
+			return -EIO;
+
+		memcpy(&val, &iter->bits[iter->i], sizeof(val));
+		iter->i += sizeof(val);
+
+		cur = xe_gt_mcr_unicast_read(gt, TD_ATT(row), group, instance);
+
+		if ((val | cur) != cur) {
+			eu_dbg(d,
+				"WRONG CLEAR (%u:%u:%u) TD_CRL: 0x%08x; TD_ATT: 0x%08x\n",
+				group, instance, row, val, cur);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int clear_attn_mcr(struct xe_gt *gt, void *data,
+			  unsigned int group, unsigned int instance)
+{
+	struct ss_iter *iter = data;
+	struct xe_eudebug *d = iter->debugger;
+	unsigned int row;
+
+	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
+		u32 val;
+
+		if (iter->i >= iter->size)
+			return 0;
+
+		if (XE_WARN_ON((iter->i + sizeof(val)) >
+				(xe_gt_eu_attention_bitmap_size(gt))))
+			return -EIO;
+
+		memcpy(&val, &iter->bits[iter->i], sizeof(val));
+		iter->i += sizeof(val);
+
+		if (!val)
+			continue;
+
+		xe_gt_mcr_unicast_write(gt, TD_CLR(row), val,
+					group, instance);
+
+		eu_dbg(d,
+		       "TD_CLR: (%u:%u:%u): 0x%08x\n",
+		       group, instance, row, val);
+	}
+
+	return 0;
+}
+
+static int xe_eu_control_resume(struct xe_eudebug *d,
+				struct xe_hw_engine *hwe,
+				u8 *bits, unsigned int bitmask_size)
+{
+	struct ss_iter iter = {
+		.debugger = d,
+		.i = 0,
+		.size = bitmask_size,
+		.bits = bits
+	};
+	int ret = 0;
+
+	/*
+	 * hsdes: 18021122357
+	 * We need to avoid clearing attention bits that are not set
+	 * in order to avoid the EOT hang on PVC.
+	 */
+	if (GRAPHICS_VERx100(d->xe) == 1260) {
+		ret = xe_gt_for_each_dss_group_instance(hwe->gt, check_attn_mcr, &iter);
+		if (ret)
+			return ret;
+
+		iter.i = 0;
+	}
+
+	xe_gt_for_each_dss_group_instance(hwe->gt, clear_attn_mcr, &iter);
+	return 0;
+}
+
+static int xe_eu_control_stopped(struct xe_eudebug *d,
+				 struct xe_hw_engine *hwe,
+				 u8 *bits, unsigned int bitmask_size)
+{
+	return xe_gt_eu_attention_bitmap(hwe->gt, bits, bitmask_size);
+}
+
+static struct xe_eudebug_eu_control_ops eu_control = {
+	.interrupt_all = xe_eu_control_interrupt_all,
+	.stopped = xe_eu_control_stopped,
+	.resume = xe_eu_control_resume,
+};
+
 static struct task_struct *find_get_target(const pid_t nr)
 {
 	struct task_struct *task;
@@ -1139,6 +1522,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	queue_work(d->discovery_wq, &d->discovery_work);
 	attention_scan_flush(xe);
+	d->ops = &eu_control;
 
 	return fd;
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 8d6fef74b91e..d5103ec4648e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -18,7 +18,9 @@
 
 struct xe_device;
 struct task_struct;
+struct xe_eudebug;
 struct xe_eudebug_event;
+struct xe_hw_engine;
 struct workqueue_struct;
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 32
@@ -169,6 +171,23 @@ struct xe_eudebug_resources {
 	struct xe_eudebug_resource rt[XE_EUDEBUG_RES_TYPE_COUNT];
 };
 
+/**
+ * struct xe_eudebug_eu_control_ops - interface for eu thread
+ * state control backend
+ */
+struct xe_eudebug_eu_control_ops {
+	/** @interrupt_all: interrupts workload active on given hwe */
+	int (*interrupt_all)(struct xe_eudebug *e, struct xe_hw_engine *hwe,
+			     u64 client_handle);
+
+	/** @resume: resumes threads reflected by bitmask active on given hwe */
+	int (*resume)(struct xe_eudebug *e, struct xe_hw_engine *hwe,
+		      u8 *bitmap, unsigned int bitmap_size);
+
+	/** @stopped: returns bitmap reflecting threads which signal attention */
+	int (*stopped)(struct xe_eudebug *e, struct xe_hw_engine *hwe,
+		       u8 *bitmap, unsigned int bitmap_size);
+};
 /**
  * struct xe_eudebug - Top level struct for eudebug: the connection
  */
@@ -232,6 +251,8 @@ struct xe_eudebug {
 		atomic_long_t seqno;
 	} events;
 
+	/** @ops operations for eu_control */
+	struct xe_eudebug_eu_control_ops *ops;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index 98297c24e401..5d10393c4cb4 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -12,12 +12,12 @@
 #include "xe_gt_mcr.h"
 #include "xe_pm.h"
 
-static int xe_gt_for_each_dss_group_instance(struct xe_gt *gt,
-					     int (*fn)(struct xe_gt *gt,
-						       void *data,
-						       unsigned int group,
-						       unsigned int instance),
-					     void *data)
+int xe_gt_for_each_dss_group_instance(struct xe_gt *gt,
+				      int (*fn)(struct xe_gt *gt,
+						void *data,
+						unsigned int group,
+						unsigned int instance),
+				      void *data)
 {
 	const enum xe_force_wake_domains fw_domains = XE_FW_GT | XE_FW_RENDER;
 	unsigned int dss, group, instance;
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
index 3f13dbb17a5f..0d2ecc11f3d8 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -13,6 +13,12 @@
 #define XE_GT_ATTENTION_TIMEOUT_MS 100
 
 int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
+int xe_gt_for_each_dss_group_instance(struct xe_gt *gt,
+				      int (*fn)(struct xe_gt *gt,
+						void *data,
+						unsigned int group,
+						unsigned int instance),
+				      void *data);
 
 int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
 int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
index c476ac0b0162..6b07f5a5c404 100644
--- a/include/uapi/drm/xe_drm_tmp.h
+++ b/include/uapi/drm/xe_drm_tmp.h
@@ -20,7 +20,8 @@ extern "C" {
  *
  * This ioctl is available in debug version 1.
  */
-#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT _IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -95,6 +96,20 @@ struct drm_xe_eudebug_connect {
 	__u32 version; /* output: current ABI (ioctl / events) version */
 };
 
+struct drm_xe_eudebug_eu_control {
+	__u64 client_handle;
+	__u32 cmd;
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME		2
+	__u32 flags;
+	__u64 seqno;
+
+	struct drm_xe_engine_class_instance ci;
+	__u32 bitmask_size;
+	__u64 bitmask_ptr;
+} __attribute__((packed));
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

