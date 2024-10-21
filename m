Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE91FD0E6DA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CF110E47A;
	Mon, 21 Oct 2024 09:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBECtOQk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB6310E472
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504776; x=1761040776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UtSg4BX9aUOYploLvp5XWGLQLHAOghKbXU+jZ8IQI/A=;
 b=RBECtOQkccv/Spv7uBSmaHSCaVZ1i/EYs+Ikl3EybVS1M73qA7UJwGLj
 UKWvdu3mudK/cmHjV8BEUw+IHp+Z2PJisso3YCjch9Z1UXayz8X6uXz6G
 H8fxLyM33VzR2ODYvgJCGRlmL3LL4jjdBFlcYNEMh+VTCkIvkjYof4HCm
 TwxSbslLTgm2/fDRb3FGRp0I7NIYHcd83+b3UG/kh5wXK3xSasa6qQUaG
 nh+J64RGQPBhjK9d//3Col4ZoDLWifCGteR4F6dasY7q2RuUOf21FTXRA
 42fD8XLWEWPCerbshTjahiHrFrqOWWZ8XdAIrmN8szH3qFscvuc0PJxlS Q==;
X-CSE-ConnectionGUID: 2y9HS3kwRGmRSDv0Q4sCMw==
X-CSE-MsgGUID: 6G+jyFtsTrGXSzdXYCQ26A==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350803"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:36 -0700
X-CSE-ConnectionGUID: c9por6FtSYK9zFWP6vnDzw==
X-CSE-MsgGUID: 8VdkeLL6QGuoI4FHIAwe6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84546089"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:32 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 08/19] drm/xe/eudebug: Introduce EU control interface
Date: Mon, 21 Oct 2024 12:58:47 +0300
Message-ID: <20241021095904.439555-9-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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

v3: - update to use changed xe_force_wake_get() failure handling (G.G.)
    - fix to avoid calling xe_force_wake_put() on xe_force_wake_get()
      failure (G.G.)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   2 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 515 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug_types.h |  24 ++
 drivers/gpu/drm/xe/xe_gt_debug.c      |  12 +-
 drivers/gpu/drm/xe/xe_gt_debug.h      |   6 +
 include/uapi/drm/xe_drm_eudebug.h     |  21 +-
 6 files changed, 560 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4a6c9837da03..20fbb13ddf7a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -476,6 +476,8 @@
 #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
 #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
+#define TD_CLR(i)				XE_REG_MCR(0xe490 + (i) * 4)
+
 #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
 #define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 0809603d892f..5211a3c21a31 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -23,6 +23,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -587,6 +588,64 @@ static int find_handle(struct xe_eudebug_resources *res,
 	return id;
 }
 
+static void *find_resource__unlocked(struct xe_eudebug_resources *res,
+				     const int type,
+				     const u32 id)
+{
+	struct xe_eudebug_resource *r;
+	struct xe_eudebug_handle *h;
+
+	r = resource_from_type(res, type);
+	h = xa_load(&r->xa, id);
+
+	return h ? (void *)(uintptr_t)h->key : NULL;
+}
+
+static void *find_resource(struct xe_eudebug_resources *res,
+			   const int type,
+			   const u32 id)
+{
+	void *p;
+
+	mutex_lock(&res->lock);
+	p =  find_resource__unlocked(res, type, id);
+	mutex_unlock(&res->lock);
+
+	return p;
+}
+
+static struct xe_file *find_client_get(struct xe_eudebug *d, const u32 id)
+{
+	struct xe_file *xef;
+
+	mutex_lock(&d->res->lock);
+	xef = find_resource__unlocked(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, id);
+	if (xef)
+		xe_file_get(xef);
+	mutex_unlock(&d->res->lock);
+
+	return xef;
+}
+
+static struct xe_exec_queue *find_exec_queue_get(struct xe_eudebug *d,
+						 u32 id)
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
+static struct xe_lrc *find_lrc(struct xe_eudebug *d, const u32 id)
+{
+	return find_resource(d->res, XE_EUDEBUG_RES_TYPE_LRC, id);
+}
+
 static int _xe_eudebug_add_handle(struct xe_eudebug *d,
 				  int type,
 				  void *p,
@@ -840,6 +899,177 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
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
+	xef = find_client_get(d, arg->client_handle);
+	if (XE_IOCTL_DBG(xe, !xef))
+		return -EINVAL;
+
+	q = find_exec_queue_get(d, arg->exec_queue_handle);
+	if (XE_IOCTL_DBG(xe, !q)) {
+		xe_file_put(xef);
+		return -EINVAL;
+	}
+
+	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_debuggable(q))) {
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
+	xe_file_put(xef);
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
+	struct xe_file *xef;
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
+	xef = find_client_get(d, user_arg.client_handle);
+	if (XE_IOCTL_DBG(xe, !xef))
+		return -EINVAL; /* As this is user input */
+
+	ret = do_eu_control(d, &user_arg, user_ptr);
+
+	xe_file_put(xef);
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
@@ -856,6 +1086,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_read_event(d, arg,
 					    !(file->f_flags & O_NONBLOCK));
 		break;
+	case DRM_XE_EUDEBUG_IOCTL_EU_CONTROL:
+		ret = xe_eudebug_eu_control(d, arg);
+		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
+		break;
 
 	default:
 		ret = -EINVAL;
@@ -1016,23 +1250,17 @@ static struct xe_hw_engine *get_runalone_active_hw_engine(struct xe_gt *gt)
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
 	struct xe_file *xef;
 	unsigned long i;
 	int idx, err;
 	u32 lrc_hw;
 
-	active = get_runalone_active_hw_engine(gt);
-	if (!active) {
-		drm_dbg(&gt_to_xe(gt)->drm, "Runalone engine not found!");
-		return ERR_PTR(-ENOENT);
-	}
-
-	err = current_lrca(active, &lrc_hw);
+	err = current_lrca(hwe, &lrc_hw);
 	if (err)
 		return ERR_PTR(err);
 
@@ -1043,7 +1271,7 @@ static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lr
 			if (q->gt != gt)
 				continue;
 
-			if (q->class != active->class)
+			if (q->class != hwe->class)
 				continue;
 
 			if (xe_exec_queue_is_idle(q))
@@ -1069,7 +1297,7 @@ static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lr
 	if (!found)
 		return ERR_PTR(-ENOENT);
 
-	if (XE_WARN_ON(current_lrca(active, &lrc_hw)) &&
+	if (XE_WARN_ON(current_lrca(hwe, &lrc_hw)) &&
 	    XE_WARN_ON(match_exec_queue_lrca(found, lrc_hw) < 0)) {
 		xe_exec_queue_put(found);
 		return ERR_PTR(-ENOENT);
@@ -1078,6 +1306,19 @@ static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lr
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
@@ -1126,7 +1367,6 @@ static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, i
 	return xe_eudebug_queue_event(d, event);
 }
 
-
 static int xe_send_gt_attention(struct xe_gt *gt)
 {
 	struct xe_eudebug *d;
@@ -1234,6 +1474,254 @@ static void attention_scan_flush(struct xe_device *xe)
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
+			       "WRONG CLEAR (%u:%u:%u) TD_CRL: 0x%08x; TD_ATT: 0x%08x\n",
+			       group, instance, row, val, cur);
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
@@ -1293,6 +1781,7 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_detach;
 	}
 
+	d->ops = &eu_control;
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
 	attention_scan_flush(xe);
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index b885296fddbb..73b3f906da66 100644
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
 
@@ -65,6 +69,24 @@ struct xe_eudebug_resources {
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
@@ -128,6 +150,8 @@ struct xe_eudebug {
 		atomic_long_t seqno;
 	} events;
 
+	/** @ops operations for eu_control */
+	struct xe_eudebug_eu_control_ops *ops;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index 6117f211d85d..25013e902cbe 100644
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
 	unsigned int dss, fw_ref;
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
index 1e63bdede5f2..3c43aefefedd 100644
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
@@ -74,6 +75,24 @@ struct drm_xe_eudebug_event_eu_attention {
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
2.46.1

