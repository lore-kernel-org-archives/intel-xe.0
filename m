Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31217C25B7D
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 18:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE42F10E0FB;
	Fri, 24 May 2024 18:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUSOw4Yy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D860E10EB19
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 18:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716575052; x=1748111052;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MhKqUbcv4y9e//kH8VjLV5kVQVf0GqXqqPP63hOn+/Y=;
 b=RUSOw4YyUPADTkdfPbDfLegMX6Ki01ZcSLYb+mas+Y5Q7wRJs1l0fout
 aKX1XGrgUN5abFYKx0h9w+OL0ozmk55G52R4pZ85/fpSVXkRguUedXk26
 xuwjhgQFEWoy6TbD2glL8FMh9KbVKP8yoNOSB+oS9cZ1M1RfH5g7YW64A
 fsJQzqdFlPOR+0LkKfBSLLuCRgNJlJg/6tSlhg+5uj2w6EKFAlbjRh1Q9
 k/2LEbUoRLOCvJoHMRQdXKTCvoEYyODD36GCzwli916ixoK4NtqzHNYBl
 lxV+l3vyN6H5yPdLMnNkk+92zD9/KjKaeLQuCKV+fttEBdtx8R10x8nd5 g==;
X-CSE-ConnectionGUID: TS/grnWGRxy3JrcT8JotRg==
X-CSE-MsgGUID: jZfv0z56QuCPTju70vBm8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12749822"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="12749822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 11:24:10 -0700
X-CSE-ConnectionGUID: OVy1yBlnTzWg0bkToM8g3Q==
X-CSE-MsgGUID: WYl4q08cSkavigjTbxIw3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="65333067"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 11:24:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v13 and v14
Date: Fri, 24 May 2024 11:24:04 -0700
Message-ID: <20240524182404.133725-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524182404.133725-1-ashutosh.dixit@intel.com>
References: <20240524182404.133725-1-ashutosh.dixit@intel.com>
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, provide a combined diff of all changes in a single patch
to help with code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

This patch will not compile, it's purpose is to just provide the diff.

* Change oa_units[] array to __u64 in query_oa_units to avoid MSVC compile
  error
* xe_device_mem_access_get/put -> xe_pm_runtime_get/put
* Hold runtime_pm references across OA buffer alloc/free
* Reorder #includes in xe_oa.c
* Fix platforms for which OA_TLB_INV_CR is valid
* Use -EIO to signal to userspace to read OASTATUS using
  DRM_XE_PERF_IOCTL_STATUS, change previous sites returning -EIO to
  return -EINVAL
* Make drm_xe_oa_stream_status bits contiguous
* s/DRM_XE_OA_PROPERTY_OA_EXPONENT/DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT/
* rmw oa_status bits

Note: Last published consolidated diff was for v11. Between v11 and v13 was
just the addition of the patch "Enable Xe2+ overrun mode".

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +--
 drivers/gpu/drm/xe/xe_oa.c           | 98 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_oa_types.h     |  3 +
 include/uapi/drm/xe_drm.h            | 21 +++---
 5 files changed, 93 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 6ad3304c4d19..d9fcb08f500d 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -72,6 +72,10 @@
 #define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
 
 #define OAG_OASTATUS			XE_REG(0xdafc)
+#define  OASTATUS_MMIO_TRG_Q_FULL	REG_BIT(6)
+#define  OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
+#define  OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
+#define  OASTATUS_REPORT_LOST		REG_BIT(0)
 #define OAG_MMIOTRIGGER			XE_REG(0xdb1c)
 /* OAC unit */
 #define OAC_OACONTROL			XE_REG(0x15114)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 1c582d786c30..da701cf5325d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -24,6 +24,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
+#include "xe_pm.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -805,9 +806,9 @@ int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mod
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
+	xe_pm_runtime_get(pc_to_xe(pc));
 	ret = pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
-	xe_device_mem_access_put(pc_to_xe(pc));
+	xe_pm_runtime_put(pc_to_xe(pc));
 
 	return ret;
 }
@@ -822,9 +823,9 @@ int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
+	xe_pm_runtime_get(pc_to_xe(pc));
 	ret = pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
-	xe_device_mem_access_put(pc_to_xe(pc));
+	xe_pm_runtime_put(pc_to_xe(pc));
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index bde25e195577..38e6364a60b1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/anon_inodes.h>
+#include <linux/delay.h>
 #include <linux/nospec.h>
 #include <linux/poll.h>
 
@@ -15,18 +16,22 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
 #include "regs/xe_oa_regs.h"
-#include "xe_device.h"
-#include "xe_exec_queue.h"
+#include "xe_assert.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_guc_pc.h"
 #include "xe_lrc.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
-#include "xe_sched_job.h"
 #include "xe_perf.h"
+#include "xe_pm.h"
+#include "xe_sched_job.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -441,22 +446,44 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 		drm_err(&stream->oa->xe->drm,
 			"wait for OA to be disabled timed out\n");
 
-	xe_mmio_write32(stream->gt, OA_TLB_INV_CR, 1);
-	if (xe_mmio_wait32(stream->gt, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
-		drm_err(&stream->oa->xe->drm,
-			"wait for OA tlb invalidate timed out\n");
+	if (GRAPHICS_VERx100(stream->oa->xe) <= 1270 && GRAPHICS_VERx100(stream->oa->xe) != 1260) {
+		/* <= XE_METEORLAKE except XE_PVC */
+		xe_mmio_write32(stream->gt, OA_TLB_INV_CR, 1);
+		if (xe_mmio_wait32(stream->gt, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
+			drm_err(&stream->oa->xe->drm,
+				"wait for OA tlb invalidate timed out\n");
+	}
 }
 
 static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
 {
 	/* We might wait indefinitely if periodic sampling is not enabled */
 	if (!stream->periodic)
-		return -EIO;
+		return -EINVAL;
 
 	return wait_event_interruptible(stream->poll_wq,
 					xe_oa_buffer_check_unlocked(stream));
 }
 
+#define OASTATUS_RELEVANT_BITS (OASTATUS_MMIO_TRG_Q_FULL | OASTATUS_COUNTER_OVERFLOW | \
+				OASTATUS_BUFFER_OVERFLOW | OASTATUS_REPORT_LOST)
+
+static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
+			size_t count, size_t *offset)
+{
+	/* Only clear our bits to avoid side-effects */
+	stream->oa_status = xe_mmio_rmw32(stream->gt, __oa_regs(stream)->oa_status,
+					  OASTATUS_RELEVANT_BITS, 0);
+	/*
+	 * Signal to userspace that there is non-zero OA status to read via
+	 * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
+	 */
+	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
+		return -EIO;
+
+	return xe_oa_append_reports(stream, buf, count, offset);
+}
+
 static ssize_t xe_oa_read(struct file *file, char __user *buf,
 			  size_t count, loff_t *ppos)
 {
@@ -466,7 +493,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 
 	/* Can't read from disabled streams */
 	if (!stream->enabled || !stream->sample)
-		return -EIO;
+		return -EINVAL;
 
 	if (!(file->f_flags & O_NONBLOCK)) {
 		do {
@@ -475,12 +502,12 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 				return ret;
 
 			mutex_lock(&stream->stream_lock);
-			ret = xe_oa_append_reports(stream, buf, count, &offset);
+			ret = __xe_oa_read(stream, buf, count, &offset);
 			mutex_unlock(&stream->stream_lock);
 		} while (!offset && !ret);
 	} else {
 		mutex_lock(&stream->stream_lock);
-		ret = xe_oa_append_reports(stream, buf, count, &offset);
+		ret = __xe_oa_read(stream, buf, count, &offset);
 		mutex_unlock(&stream->stream_lock);
 	}
 
@@ -489,11 +516,14 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	 * before unblocking. The exception to this is if __xe_oa_read returns -ENOSPC,
 	 * which means that more OA data is available than could fit in the user provided
 	 * buffer. In this case we want the next poll() call to not block.
+	 *
+	 * Also in case of -EIO, we have already waited for data before returning
+	 * -EIO, so need to wait again
 	 */
-	if (ret != -ENOSPC)
+	if (ret != -ENOSPC && ret != -EIO)
 		stream->pollin = false;
 
-	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, ... */
+	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, -EINVAL, ... */
 	return offset ?: (ret ?: -EAGAIN);
 }
 
@@ -792,10 +822,11 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_oa_disable_metric_set(stream);
 	xe_exec_queue_put(stream->k_exec_q);
 
+	xe_oa_free_oa_buffer(stream);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(stream->oa->xe);
+	xe_pm_runtime_put(stream->oa->xe);
 
-	xe_oa_free_oa_buffer(stream);
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
 	if (stream->override_gucrc)
 		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
@@ -1037,12 +1068,19 @@ static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
 	struct drm_xe_oa_stream_status status = {};
 	void __user *uaddr = (void __user *)arg;
 
-	status.oa_status = xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_status);
+	/* Map from register to uapi bits */
+	if (stream->oa_status & OASTATUS_REPORT_LOST)
+		status.oa_status |= DRM_XE_OASTATUS_REPORT_LOST;
+	if (stream->oa_status & OASTATUS_BUFFER_OVERFLOW)
+		status.oa_status |= DRM_XE_OASTATUS_BUFFER_OVERFLOW;
+	if (stream->oa_status & OASTATUS_COUNTER_OVERFLOW)
+		status.oa_status |= DRM_XE_OASTATUS_COUNTER_OVERFLOW;
+	if (stream->oa_status & OASTATUS_MMIO_TRG_Q_FULL)
+		status.oa_status |= DRM_XE_OASTATUS_MMIO_TRG_Q_FULL;
 
 	if (copy_to_user(uaddr, &status, sizeof(status)))
 		return -EFAULT;
 
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
 	return 0;
 }
 
@@ -1201,7 +1239,7 @@ static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 end)
 static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
 {
 	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
-	u32 len = (xe_lrc_size(stream->oa->xe, stream->hwe->class) +
+	u32 len = (xe_gt_lrc_size(stream->gt, stream->hwe->class) +
 		   lrc->ring.size) / sizeof(u32);
 	u32 offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 *state = (u32 *)lrc->bo->vmap.vaddr;
@@ -1308,14 +1346,14 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		stream->override_gucrc = true;
 	}
 
-	ret = xe_oa_alloc_oa_buffer(stream);
-	if (ret)
-		goto err_unset_gucrc;
-
 	/* Take runtime pm ref and forcewake to disable RC6 */
-	xe_device_mem_access_get(stream->oa->xe);
+	xe_pm_runtime_get(stream->oa->xe);
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
+	ret = xe_oa_alloc_oa_buffer(stream);
+	if (ret)
+		goto err_fw_put;
+
 	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
 						BIT(stream->hwe->logical_instance), 1,
 						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
@@ -1323,7 +1361,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		ret = PTR_ERR(stream->k_exec_q);
 		drm_err(&stream->oa->xe->drm, "gt%d, hwe %s, xe_exec_queue_create failed=%d",
 			stream->gt->info.id, stream->hwe->name, ret);
-		goto err_fw_put;
+		goto err_free_oa_buf;
 	}
 
 	ret = xe_oa_enable_metric_set(stream);
@@ -1349,11 +1387,11 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_put_k_exec_q:
 	xe_oa_disable_metric_set(stream);
 	xe_exec_queue_put(stream->k_exec_q);
+err_free_oa_buf:
+	xe_oa_free_oa_buffer(stream);
 err_fw_put:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(stream->oa->xe);
-	xe_oa_free_oa_buffer(stream);
-err_unset_gucrc:
+	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
 err_free_configs:
@@ -1426,9 +1464,9 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
 	case XE_DG2:
 	case XE_PVC:
 	case XE_METEORLAKE:
-		xe_device_mem_access_get(gt_to_xe(gt));
+		xe_pm_runtime_get(gt_to_xe(gt));
 		reg = xe_mmio_read32(gt, RPM_CONFIG0);
-		xe_device_mem_access_put(gt_to_xe(gt));
+		xe_pm_runtime_put(gt_to_xe(gt));
 
 		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
 		return gt->info.reference_clock << (3 - shift);
@@ -1598,7 +1636,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
 	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_sample_oa,
 	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
 	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_oa_format,
-	[DRM_XE_OA_PROPERTY_OA_EXPONENT] = xe_oa_set_prop_oa_exponent,
+	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] = xe_oa_set_prop_oa_exponent,
 	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
 	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
 	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index d8d5c9d8c22e..c62811482934 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -225,5 +225,8 @@ struct xe_oa_stream {
 
 	/** @override_gucrc: GuC RC has been overridden for the OA stream */
 	bool override_gucrc;
+
+	/** @oa_status: temporary storage for oa_status register value */
+	u32 oa_status;
 };
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index dc17e1fad025..8378e5a51d37 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1508,8 +1508,12 @@ struct drm_xe_query_oa_units {
 	__u32 num_oa_units;
 	/** @pad: MBZ */
 	__u32 pad;
-	/** @oa_units: OA units returned for this device */
-	struct drm_xe_oa_unit oa_units[];
+	/**
+	 * @oa_units: struct @drm_xe_oa_unit array returned for this device.
+	 * Written below as a u64 array to avoid problems with nested flexible
+	 * arrays with some compilers
+	 */
+	__u64 oa_units[];
 };
 
 /** enum drm_xe_oa_format_type - OA format types */
@@ -1571,10 +1575,10 @@ enum drm_xe_oa_property_id {
 #define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
 
 	/**
-	 * @DRM_XE_OA_PROPERTY_OA_EXPONENT: Requests periodic OA unit sampling
-	 * with sampling frequency proportional to 2^(period_exponent + 1)
+	 * @DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT: Requests periodic OA unit
+	 * sampling with sampling frequency proportional to 2^(period_exponent + 1)
 	 */
-	DRM_XE_OA_PROPERTY_OA_EXPONENT,
+	DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT,
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
@@ -1624,15 +1628,16 @@ struct drm_xe_oa_config {
 
 /**
  * struct drm_xe_oa_stream_status - OA stream status returned from
- * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
+ * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
+ * query stream status in response to EIO errno from perf fd read().
  */
 struct drm_xe_oa_stream_status {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @oa_status: OA status register as specified in PRM/Bspec 46717/61226 */
+	/** @oa_status: OA stream status (see Bspec 46717/61226) */
 	__u64 oa_status;
-#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 6)
+#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 3)
 #define DRM_XE_OASTATUS_COUNTER_OVERFLOW	(1 << 2)
 #define DRM_XE_OASTATUS_BUFFER_OVERFLOW		(1 << 1)
 #define DRM_XE_OASTATUS_REPORT_LOST		(1 << 0)
-- 
2.41.0

