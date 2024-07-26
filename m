Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDFBC52D1E
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ADB10E9B3;
	Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+UhDtuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B220610E9AB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003453; x=1753539453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w80eXNwRq+vxmkwnhkB2hr8sq1gR/5iKdoL7fKAgD6Y=;
 b=d+UhDtuHuk/zH1PsHzUgEu31oPbOqcMfxVS2lqIvzt1/hB/Vew6OkR1v
 Kz4NVuzMRhwMYXp9tLmtEpQP+eTEEsaj9jz0sHKaXB9hC0D5Fheg/MPfy
 TofmVCfEbAEAS6yAlS3HYeB+LirVptTL/culaPKUUUDYp7v5nw8l5dffy
 EBtD2Bkmz4hI754B5ISpN2TZH7SvE+hbDID4ancY+htB1SmZKwwhDf2Dn
 sqIEBV0Lm481+kU1RKsbSkC9OFhjCr+QqePL15VxNrODVFVCfbXhriPfh
 sHVIDS+a8CKtC+5YRA98S9+8sj7ZRbVbvEYpEpN6sZ8t2JNA/aV6J6s7h A==;
X-CSE-ConnectionGUID: HtusJHUeRO2A2pXOELESCw==
X-CSE-MsgGUID: cqN0dynpTPaNlF/lA/5vag==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598762"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:32 -0700
X-CSE-ConnectionGUID: 7F+XEtYIRQOXiFkcvu/1yw==
X-CSE-MsgGUID: R5WTJI15SY+QlvecuxBUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861402"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:31 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 11/21] drm/xe/eudebug: Introduce EU control interface
Date: Fri, 26 Jul 2024 17:08:08 +0300
Message-Id: <20240726140818.54304-12-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

v2: checkpatch (Maciej)
v3: lrc index off by one fix (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   2 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 559 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_eudebug_types.h |  23 ++
 drivers/gpu/drm/xe/xe_gt_debug.c      |  12 +-
 drivers/gpu/drm/xe/xe_gt_debug.h      |   6 +
 include/uapi/drm/xe_drm_eudebug.h     |  21 +-
 6 files changed, 586 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 03e83ce3e35d..546bb7cc2337 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -448,6 +448,8 @@
 #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
 #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
+#define TD_CLR(i)				XE_REG_MCR(0xe490 + (i) * 4)
+
 #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
 #define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index c2de001cc33a..582805bebf26 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -18,6 +18,7 @@
 #include "xe_macros.h"
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
 #include "xe_lrc.h"
 #include "xe_hw_engine.h"
 #include "xe_exec_queue.h"
@@ -575,6 +576,70 @@ static int find_handle(struct xe_eudebug_resources *res,
 	return id;
 }
 
+static struct xe_eudebug_handle *__find_resource(struct xe_eudebug_resources *res,
+						 const int type,
+						 const u32 id)
+{
+	struct xe_eudebug_resource *r;
+
+	r = resource_from_type(res, type);
+
+	return xa_load(&r->xa, id);
+}
+
+static struct xe_eudebug_handle *find_resource(struct xe_eudebug_resources *res,
+					       const int type,
+					       const u32 id)
+{
+	struct xe_eudebug_handle *h;
+
+	mutex_lock(&res->lock);
+	h = __find_resource(res, type, id);
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
+static struct xe_exec_queue *find_exec_queue_get(struct xe_eudebug *d,
+						 u32 id)
+{
+	struct xe_exec_queue *q = NULL;
+	struct xe_eudebug_handle *h;
+
+	mutex_lock(&d->res->lock);
+	h = __find_resource(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, id);
+	if (h) {
+		q = (struct xe_exec_queue *)h->key;
+		xe_exec_queue_get(q);
+	}
+	mutex_unlock(&d->res->lock);
+
+	return q;
+}
+
+static struct xe_lrc *find_lrc(struct xe_eudebug *d, const u32 id)
+{
+	struct xe_lrc *l = NULL;
+	struct xe_eudebug_handle *h;
+
+	h = find_resource(d->res, XE_EUDEBUG_RES_TYPE_LRC, id);
+	if (h)
+		return (void *)h->key;
+
+	return l;
+}
+
 static int _xe_eudebug_add_handle(struct xe_eudebug *d,
 				  int type,
 				  void *p,
@@ -824,6 +889,171 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
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
+	struct xe_exec_queue *q;
+	struct xe_file *xef;
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
+	xef = find_client(d, arg->client_handle);
+	if (XE_IOCTL_DBG(xe, !xef))
+		return -EINVAL;
+
+	q = find_exec_queue_get(d, arg->exec_queue_handle);
+	if (XE_IOCTL_DBG(xe, !q))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe,
+			 !(q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE))) {
+		ret = -EINVAL;
+		goto queue_put;
+	}
+
+	if (XE_IOCTL_DBG(xe, xef != q->vm->xef)) {
+		ret = -EINVAL;
+		goto queue_put;
+	}
+
+	lrc = find_lrc(d, arg->lrc_handle);
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
+	mutex_lock(&d->eu_lock);
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
+queue_put:
+	xe_exec_queue_put(q);
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
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, exec_queue_handle=%llu, bitmask_size=%u\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.exec_queue_handle,
+	       user_arg.bitmask_size);
+
+	if (XE_IOCTL_DBG(xe, IS_ERR(find_client(d, user_arg.client_handle))))
+		return -EINVAL; /* As this is user input */
+
+	ret = do_eu_control(d, &user_arg, user_ptr);
+
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, exec_queue_handle=%llu, bitmask_size=%u ret=%d\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.exec_queue_handle,
+	       user_arg.bitmask_size, ret);
+
+	return ret;
+}
+
 static long xe_eudebug_ioctl(struct file *file,
 			     unsigned int cmd,
 			     unsigned long arg)
@@ -836,6 +1066,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_read_event(d, arg,
 					    !(file->f_flags & O_NONBLOCK));
 		break;
+	case DRM_XE_EUDEBUG_IOCTL_EU_CONTROL:
+		ret = xe_eudebug_eu_control(d, arg);
+		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
+		break;
 
 	default:
 		ret = -EINVAL;
@@ -878,19 +1112,12 @@ static bool queue_has_active_job(struct xe_exec_queue *q)
 	return false;
 }
 
-static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
+static int __current_lrca(struct xe_hw_engine *hwe, u32 *lrc_hw)
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
 
@@ -899,17 +1126,33 @@ static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
 	return 0;
 }
 
-static int match_engine_lrc(struct xe_exec_queue *q, u32 lrc_hw)
+static int current_lrca(struct xe_hw_engine *hwe, u32 *lrc_hw)
+{
+	int ret;
+
+	ret = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
+	if (ret)
+		return ret;
+
+	ret = __current_lrca(hwe, lrc_hw);
+
+	xe_force_wake_put(gt_to_fw(hwe->gt), hwe->domain);
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
 {
 	int i;
-	u32 lrc_ggtt;
 
-	for (i = 0; i < q->width; i++) {
-		lrc_ggtt = lower_32_bits(xe_lrc_descriptor(q->lrc[i]));
-		lrc_ggtt &= GENMASK(31, 12);
-		if (lrc_ggtt == lrc_hw)
+	for (i = 0; i < q->width; i++)
+		if (lrca_equals(lower_32_bits(xe_lrc_descriptor(q->lrc[i])), lrc_hw))
 			return i;
-	}
 
 	return -1;
 }
@@ -1010,23 +1253,17 @@ static struct xe_hw_engine *get_runalone_active_hw_engine(struct xe_gt *gt)
 	return first;
 }
 
-static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
+static struct xe_exec_queue *active_hwe_to_exec_queue(struct xe_hw_engine *hwe, int *lrc_idx)
 {
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_device *xe = gt_to_xe(hwe->gt);
+	struct xe_gt *gt = hwe->gt;
 	struct xe_exec_queue *q, *found = NULL;
-	struct xe_hw_engine *active;
 	struct xe_file *xef, *tmp;
 	unsigned long i;
 	int idx, err;
 	u32 lrc_hw;
 
-	active = get_runalone_active_hw_engine(gt);
-	if (!active) {
-		drm_dbg(&gt_to_xe(gt)->drm, "Runalone engine not found!");
-		return ERR_PTR(-ENOENT);
-	}
-
-	err = current_lrc(active, &lrc_hw);
+	err = current_lrca(hwe, &lrc_hw);
 	if (err)
 		return ERR_PTR(err);
 
@@ -1037,13 +1274,13 @@ static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lr
 			if (q->gt != gt)
 				continue;
 
-			if (q->class != active->class)
+			if (q->class != hwe->class)
 				continue;
 
 			if (!queue_has_active_job(q))
 				continue;
 
-			idx = match_engine_lrc(q, lrc_hw);
+			idx = match_exec_queue_lrca(q, lrc_hw);
 			if (idx < 0)
 				continue;
 
@@ -1065,8 +1302,8 @@ static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lr
 	if (!found)
 		return ERR_PTR(-ENOENT);
 
-	if (XE_WARN_ON(current_lrc(active, &lrc_hw)) &&
-	    XE_WARN_ON(match_engine_lrc(found, lrc_hw) < 0)) {
+	if (XE_WARN_ON(current_lrca(hwe, &lrc_hw)) &&
+	    XE_WARN_ON(match_exec_queue_lrca(found, lrc_hw) < 0)) {
 		xe_exec_queue_put(found);
 		return ERR_PTR(-ENOENT);
 	}
@@ -1074,6 +1311,19 @@ static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lr
 	return found;
 }
 
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
 static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, int lrc_idx)
 {
 	struct xe_eudebug_event_eu_attention *ea;
@@ -1120,7 +1370,6 @@ static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, i
 	return xe_eudebug_queue_event(d, event);
 }
 
-
 static int xe_send_gt_attention(struct xe_gt *gt)
 {
 	struct xe_eudebug *d;
@@ -1218,6 +1467,255 @@ static void attention_scan_flush(struct xe_device *xe)
 	mod_delayed_work(system_wq, &xe->eudebug.attention_scan, 0);
 }
 
+static int xe_eu_control_interrupt_all(struct xe_eudebug *d,
+				       struct xe_exec_queue *q,
+				       struct xe_lrc *lrc)
+{
+	struct xe_gt *gt = q->hwe->gt;
+	struct xe_device *xe = d->xe;
+	struct xe_exec_queue *active;
+	struct xe_hw_engine *hwe;
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
+	if (XE_IOCTL_DBG(xe, lrc_idx >= q->width || q->lrc[lrc_idx] != lrc)) {
+		ret = -EINVAL;
+		goto put_fw;
+	}
+
+	ret = xe_force_wake_get(gt_to_fw(gt), hwe->domain);
+	if (ret)
+		goto put_fw;
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
+	ret = __current_lrca(hwe, &lrc_hw);
+	if (ret || !lrca_equals(lower_32_bits(xe_lrc_descriptor(lrc)), lrc_hw))
+		eu_warn(d, "xe_eudebug: interrupted wrong context.");
+
+put_fw:
+	xe_force_wake_put(gt_to_fw(gt), q->hwe->domain);
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
+			  u16 group, u16 instance)
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
+			  u16 group, u16 instance)
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
 static void discovery_work_fn(struct work_struct *work);
 
 static int
@@ -1280,6 +1778,7 @@ xe_eudebug_connect(struct xe_device *xe,
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
 	attention_scan_flush(xe);
+	d->ops = &eu_control;
 
 	eu_dbg(d, "connected session %lld", d->session);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 16667b4dfe45..a75986180d71 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -18,8 +18,12 @@
 
 struct xe_device;
 struct task_struct;
+struct xe_eudebug;
 struct xe_eudebug_event;
+struct xe_hw_engine;
 struct workqueue_struct;
+struct xe_exec_queue;
+struct xe_lrc;
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
 
@@ -65,6 +69,23 @@ struct xe_eudebug_resources {
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
 /**
  * struct xe_eudebug - Top level struct for eudebug: the connection
  */
@@ -128,6 +149,8 @@ struct xe_eudebug {
 		atomic_long_t seqno;
 	} events;
 
+	/** @ops operations for eu_control */
+	struct xe_eudebug_eu_control_ops *ops;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index 04d2d43ce249..6716722cb4c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -13,12 +13,12 @@
 #include "xe_pm.h"
 #include "xe_macros.h"
 
-static int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
-					    int (*fn)(struct xe_gt *gt,
-						      void *data,
-						      u16 group,
-						      u16 instance),
-					    void *data)
+int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
+				     int (*fn)(struct xe_gt *gt,
+					       void *data,
+					       u16 group,
+					       u16 instance),
+				     void *data)
 {
 	const enum xe_force_wake_domains fw_domains = XE_FW_GT | XE_FW_RENDER;
 	unsigned int dss;
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
index 3f13dbb17a5f..342082699ff6 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -13,6 +13,12 @@
 #define XE_GT_ATTENTION_TIMEOUT_MS 100
 
 int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
+int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
+				     int (*fn)(struct xe_gt *gt,
+					       void *data,
+					       u16 group,
+					       u16 instance),
+				     void *data);
 
 int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
 int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 453269ac8307..c33c207ffd62 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -15,7 +15,8 @@ extern "C" {
  *
  * This ioctl is available in debug version 1.
  */
-#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT _IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -75,6 +76,24 @@ struct drm_xe_eudebug_event_eu_attention {
 	__u8 bitmask[];
 };
 
+struct drm_xe_eudebug_eu_control {
+	__u64 client_handle;
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
2.34.1

