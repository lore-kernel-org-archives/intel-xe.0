Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6324FC47DB7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 01:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BCC10E1E9;
	Sat, 20 Jan 2024 01:50:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD8510E1E9
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 01:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705715400; x=1737251400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=90PGJcNkALCeayZSVtvfI21ZDokK7CJxr5orxWHzFgA=;
 b=Saus9kfaKprLSD7vyVeMptyx1y220o99qOi3ju5cBsnPYjgLEOkGbZA3
 cLsTEBs+gNREHyas9qE58a5/h+7PH5E45PNw2kRhrrXQL6Di2ULeM6Nbv
 S4s/hNmU5y42LfRiC7EPzxoJKtvE8gP7QMRnC+swxHSijya8nb/V7/Cvt
 jPNwVVdxD64bS7YwtYUW10eHRxH3EM9YBYORZfxuI0P4ugHQiqbpPFMzi
 7niOBWJTZJLV0cIuhjuqribdaD157vfnngHpC/OiECr3GXZlJaAkjVtZt
 3D3OC2SRxSaKgOeTVyHAU35TV+GApR/X9Jjx0ZVelOkH9VOfNH62LaWdj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404665931"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="404665931"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 17:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="785200614"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="785200614"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 17:50:00 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v7 and v8
Date: Fri, 19 Jan 2024 17:49:53 -0800
Message-ID: <20240120014953.1241724-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120014953.1241724-1-ashutosh.dixit@intel.com>
References: <20240120014953.1241724-1-ashutosh.dixit@intel.com>
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
to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

This patch will not compile, it's purpose is to just provide the diff.

Changes between v7 and v8 include:

uAPI changes:
-------------

Perf layer

* Add DRM_XE_PERF_IOCTL_STATUS at perf layer

OA

* Drop report headers for read()
* Drop 'struct drm_xe_oa_open_param'
* Drop DRM_XE_OA_PROPERTY_OPEN_FLAGS, add DRM_XE_OA_PROPERTY_OA_DISABLED
* Drop DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US
* Drop "oa_max_sample_rate" sysctl
* Clean up 'struct drm_xe_query_oa_units'

Other changes:
--------------

* Minor changes to xe_oa_mmap
* Rename xe_oa_modify_self
* Drop XE_OA_UNIT_OAM_SAMEDIA_0
* And other minor changes

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |   9 +-
 drivers/gpu/drm/xe/xe_device.c       |   7 +-
 drivers/gpu/drm/xe/xe_module.c       |   4 -
 drivers/gpu/drm/xe/xe_oa.c           | 420 +++++++--------------------
 drivers/gpu/drm/xe/xe_oa.h           |   3 -
 drivers/gpu/drm/xe/xe_oa_types.h     |   5 +-
 include/uapi/drm/xe_drm.h            | 162 ++++-------
 7 files changed, 174 insertions(+), 436 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 1ce27a72079ad..4c9eee27b5c48 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -70,17 +70,10 @@
 #define  OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL	REG_BIT(7)
 #define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
 #define  OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS		REG_BIT(5)
-#define  OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS		REG_BIT(2)
 #define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
 
-#define OAG_OASTATUS XE_REG(0xdafc)
-#define  OAG_OASTATUS_MMIO_TRG_Q_FULL	REG_BIT(6)
-#define  OAG_OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
-#define  OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
-#define  OAG_OASTATUS_REPORT_LOST	REG_BIT(0)
-
+#define OAG_OASTATUS			XE_REG(0xdafc)
 #define OAG_MMIOTRIGGER			XE_REG(0xdb1c)
-
 /* OAC unit */
 #define OAC_OACONTROL			XE_REG(0x15114)
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 80a7f367ec4f5..46e781983125e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -537,11 +537,11 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_oa_init(xe);
 	if (err)
-		goto err_irq_shutdown;
+		goto err_fini_gt;
 
 	err = xe_display_init(xe);
 	if (err)
-		goto err_fini_gt;
+		goto err_oa_fini;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
@@ -564,6 +564,9 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_display:
 	xe_display_driver_remove(xe);
 
+err_oa_fini:
+	xe_oa_fini(xe);
+
 err_fini_gt:
 	for_each_gt(gt, xe, id) {
 		if (id < last_gt)
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4fdec789b4503..b5108e66dd1ee 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -72,10 +72,6 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_perf_sysctl_register,
 		.exit = xe_perf_sysctl_unregister,
 	},
-	{
-		.init = xe_oa_sysctl_register,
-		.exit = xe_oa_sysctl_unregister,
-	},
 };
 
 static int __init xe_init(void)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f9e634e03dc11..560b6a3189e42 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -6,7 +6,6 @@
 #include <linux/anon_inodes.h>
 #include <linux/nospec.h>
 #include <linux/poll.h>
-#include <linux/sysctl.h>
 
 #include <drm/drm_drv.h>
 #include <drm/xe_drm.h>
@@ -32,18 +31,7 @@
 #define OA_TAKEN(tail, head)	(((tail) - (head)) & (XE_OA_BUFFER_SIZE - 1))
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
-
-static int xe_oa_sample_rate_hard_limit;
-static u32 xe_oa_max_sample_rate = 100000;
-
-static struct ctl_table_header *sysctl_header;
-
-enum {
-	XE_OA_UNIT_OAG = 0,
-	XE_OA_UNIT_OAM_SAMEDIA_0 = 0,
-	XE_OA_UNIT_MAX,
-	XE_OA_UNIT_INVALID = U32_MAX,
-};
+#define XE_OA_UNIT_INVALID U32_MAX
 
 struct xe_oa_reg {
 	struct xe_reg addr;
@@ -79,8 +67,7 @@ struct xe_oa_open_param {
 	u32 metric_set;
 	enum xe_oa_format_name oa_format;
 	int period_exponent;
-	u32 poll_period_us;
-	u32 open_flags;
+	bool disabled;
 	int exec_queue_id;
 	int engine_instance;
 	struct xe_exec_queue *exec_q;
@@ -97,12 +84,12 @@ struct xe_oa_config_bo {
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
-	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
-	[XE_OA_FORMAT_A12]			= { 0, 64 },
-	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
-	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
+	[XE_OA_FORMAT_C4_B8]			= { 7, 64,  DRM_FMT(OAG) },
+	[XE_OA_FORMAT_A12]			= { 0, 64,  DRM_FMT(OAG) },
+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128, DRM_FMT(OAG) },
+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
 	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAR) },
-	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
 	[XE_OAC_FORMAT_A24u64_B8_C8]		= { 1, 320, DRM_FMT(OAC), HDR_64_BIT },
 	[XE_OAC_FORMAT_A22u32_R2u32_B8_C8]	= { 2, 192, DRM_FMT(OAC), HDR_64_BIT },
 	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, DRM_FMT(OAM_MPEC), HDR_64_BIT },
@@ -277,42 +264,17 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }
 
-static int xe_oa_append_status(struct xe_oa_stream *stream, char __user *buf,
-			       size_t count, size_t *offset,
-			       enum drm_xe_oa_record_type type)
-{
-	struct drm_xe_oa_record_header header = { type, 0, sizeof(header) };
-
-	if ((count - *offset) < header.size)
-		return -ENOSPC;
-
-	if (copy_to_user(buf + *offset, &header, sizeof(header)))
-		return -EFAULT;
-
-	*offset += header.size;
-
-	return 0;
-}
-
-static int xe_oa_append_sample(struct xe_oa_stream *stream, char __user *buf,
+static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
 			       size_t count, size_t *offset, const u8 *report)
 {
 	int report_size = stream->oa_buffer.format->size;
-	struct drm_xe_oa_record_header header;
 	int report_size_partial;
 	u8 *oa_buf_end;
 
-	header.type = DRM_XE_OA_RECORD_SAMPLE;
-	header.pad = 0;
-	header.size = stream->sample_size;
-
-	if ((count - *offset) < header.size)
+	if ((count - *offset) < report_size)
 		return -ENOSPC;
 
 	buf += *offset;
-	if (copy_to_user(buf, &header, sizeof(header)))
-		return -EFAULT;
-	buf += sizeof(header);
 
 	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
 	report_size_partial = oa_buf_end - report;
@@ -329,7 +291,7 @@ static int xe_oa_append_sample(struct xe_oa_stream *stream, char __user *buf,
 		return -EFAULT;
 	}
 
-	*offset += header.size;
+	*offset += report_size;
 
 	return 0;
 }
@@ -356,18 +318,13 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
-	/* An out of bounds or misaligned head or tail pointer implies a driver bug */
-	if (drm_WARN_ONCE(&stream->oa->xe->drm,
-			  head > XE_OA_BUFFER_SIZE || tail > XE_OA_BUFFER_SIZE,
-			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
-			  head, tail))
-		return -EIO;
+	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
 
 	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
 		u8 *report = oa_buf_base + head;
 		u32 *report32 = (void *)report;
 
-		ret = xe_oa_append_sample(stream, buf, count, offset, report);
+		ret = xe_oa_append_report(stream, buf, count, offset, report);
 		if (ret)
 			break;
 
@@ -496,60 +453,6 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 			"wait for OA tlb invalidate timed out\n");
 }
 
-static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
-			size_t count, size_t *offset)
-{
-	struct xe_reg oastatus_reg = __oa_regs(stream)->oa_status;
-	u32 oastatus;
-	int ret;
-
-	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->oa_buffer.vaddr))
-		return -EIO;
-
-	oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
-
-	/* We treat OABUFFER_OVERFLOW as a significant error */
-	if (oastatus & OAG_OASTATUS_BUFFER_OVERFLOW) {
-		ret = xe_oa_append_status(stream, buf, count, offset,
-					  DRM_XE_OA_RECORD_OA_BUFFER_LOST);
-		if (ret)
-			return ret;
-
-		drm_dbg(&stream->oa->xe->drm,
-			"OA buffer overflow (exponent = %d): force restart\n",
-			stream->period_exponent);
-
-		xe_oa_disable(stream);
-		xe_oa_enable(stream);
-
-		/* oa_enable will re-init oabuffer and reset oastatus_reg */
-		oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
-	}
-
-	if (oastatus & OAG_OASTATUS_MMIO_TRG_Q_FULL) {
-		ret = xe_oa_append_status(stream, buf, count, offset,
-					  DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL);
-		if (ret)
-			return ret;
-
-		xe_mmio_rmw32(stream->gt, oastatus_reg,
-			      OAG_OASTATUS_MMIO_TRG_Q_FULL, 0);
-	}
-
-	if (oastatus & OAG_OASTATUS_REPORT_LOST) {
-		ret = xe_oa_append_status(stream, buf, count, offset,
-					  DRM_XE_OA_RECORD_OA_REPORT_LOST);
-		if (ret)
-			return ret;
-
-		xe_mmio_rmw32(stream->gt, oastatus_reg,
-			      OAG_OASTATUS_COUNTER_OVERFLOW |
-			      OAG_OASTATUS_REPORT_LOST, 0);
-	}
-
-	return xe_oa_append_reports(stream, buf, count, offset);
-}
-
 static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
 {
 	/* We might wait indefinitely if periodic sampling is not enabled */
@@ -578,12 +481,12 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 				return ret;
 
 			mutex_lock(&stream->stream_lock);
-			ret = __xe_oa_read(stream, buf, count, &offset);
+			ret = xe_oa_append_reports(stream, buf, count, &offset);
 			mutex_unlock(&stream->stream_lock);
 		} while (!offset && !ret);
 	} else {
 		mutex_lock(&stream->stream_lock);
-		ret = __xe_oa_read(stream, buf, count, &offset);
+		ret = xe_oa_append_reports(stream, buf, count, &offset);
 		mutex_unlock(&stream->stream_lock);
 	}
 
@@ -659,6 +562,36 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 	return err;
 }
 
+static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
+{
+	u32 i;
+
+#define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
+
+	for (i = 0; i < n_regs; i++) {
+		if ((i % MI_LOAD_REGISTER_IMM_MAX_REGS) == 0) {
+			u32 n_lri = min_t(u32, n_regs - i,
+					  MI_LOAD_REGISTER_IMM_MAX_REGS);
+
+			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(n_lri);
+		}
+		bb->cs[bb->len++] = reg_data[i].addr.addr;
+		bb->cs[bb->len++] = reg_data[i].value;
+	}
+}
+
+static int num_lri_dwords(int num_regs)
+{
+	int count = 0;
+
+	if (num_regs > 0) {
+		count += DIV_ROUND_UP(num_regs, MI_LOAD_REGISTER_IMM_MAX_REGS);
+		count += num_regs * 2;
+	}
+
+	return count;
+}
+
 static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
 {
 	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
@@ -687,13 +620,13 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 	} while (flex++, --count);
 }
 
-static int xe_oa_modify_context(struct xe_oa_stream *stream, struct xe_lrc *lrc,
-				const struct flex *flex, u32 count)
+static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
+				  const struct flex *flex, u32 count)
 {
 	struct xe_bb *bb;
 	int err;
 
-	bb = xe_bb_new(stream->gt, 4 * count + 1, false);
+	bb = xe_bb_new(stream->gt, 4 * count, false);
 	if (IS_ERR(bb)) {
 		err = PTR_ERR(bb);
 		goto exit;
@@ -707,35 +640,18 @@ static int xe_oa_modify_context(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 	return err;
 }
 
-static void xe_oa_load_flex(struct xe_oa_stream *stream, struct xe_bb *bb,
-			    const struct flex *flex, u32 count)
-{
-	XE_WARN_ON(!count || count > 63);
-
-	bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
-
-	do {
-		bb->cs[bb->len++] = flex->reg.addr;
-		bb->cs[bb->len++] = flex->value;
-
-	} while (flex++, --count);
-
-	bb->cs[bb->len++] = MI_NOOP;
-}
-
-static int xe_oa_modify_self(struct xe_oa_stream *stream,
-			     const struct flex *flex, u32 count)
+static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
 {
 	struct xe_bb *bb;
 	int err;
 
-	bb = xe_bb_new(stream->gt, 2 * count + 3, false);
+	bb = xe_bb_new(stream->gt, 3, false);
 	if (IS_ERR(bb)) {
 		err = PTR_ERR(bb);
 		goto exit;
 	}
 
-	xe_oa_load_flex(stream, bb, flex, count);
+	write_cs_mi_lri(bb, reg_lri, 1);
 
 	err = xe_oa_submit_bb(stream, bb);
 	xe_bb_free(bb, NULL);
@@ -743,8 +659,6 @@ static int xe_oa_modify_self(struct xe_oa_stream *stream,
 	return err;
 }
 
-#define OAR_OAC_OACONTROL_OFFSET 0x5B0
-
 static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
@@ -766,24 +680,17 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0)
 		},
 	};
-	/* Offsets in regs_lri are not used since this configuration is applied using LRI */
-	struct flex regs_lri[] = {
-		{
-			OAR_OACONTROL,
-			OAR_OAC_OACONTROL_OFFSET + 1,
-			oacontrol,
-		},
-	};
+	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
 	int err;
 
 	/* Modify stream hwe context image with regs_context */
-	err = xe_oa_modify_context(stream, &stream->exec_q->lrc[0],
-				   regs_context, ARRAY_SIZE(regs_context));
+	err = xe_oa_modify_ctx_image(stream, &stream->exec_q->lrc[0],
+				     regs_context, ARRAY_SIZE(regs_context));
 	if (err)
 		return err;
 
-	/* Apply regs_lri using LRI */
-	return xe_oa_modify_self(stream, regs_lri, ARRAY_SIZE(regs_lri));
+	/* Apply reg_lri using LRI */
+	return xe_oa_load_with_lri(stream, &reg_lri);
 }
 
 static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
@@ -808,27 +715,20 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 				      enable ? CTX_CTRL_RUN_ALONE : 0),
 		},
 	};
-	/* Offsets in regs_lri are not used since this configuration is applied using LRI */
-	struct flex regs_lri[] = {
-		{
-			OAC_OACONTROL,
-			OAR_OAC_OACONTROL_OFFSET + 1,
-			oacontrol,
-		},
-	};
+	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
 	int err;
 
 	/* Set ccs select to enable programming of OAC_OACONTROL */
 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, __oa_ccs_select(stream));
 
 	/* Modify stream hwe context image with regs_context */
-	err = xe_oa_modify_context(stream, &stream->exec_q->lrc[0],
-				   regs_context, ARRAY_SIZE(regs_context));
+	err = xe_oa_modify_ctx_image(stream, &stream->exec_q->lrc[0],
+				     regs_context, ARRAY_SIZE(regs_context));
 	if (err)
 		return err;
 
-	/* Apply regs_lri using LRI */
-	return xe_oa_modify_self(stream, regs_lri, ARRAY_SIZE(regs_lri));
+	/* Apply reg_lri using LRI */
+	return xe_oa_load_with_lri(stream, &reg_lri);
 }
 
 static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
@@ -929,36 +829,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 	return 0;
 }
 
-static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
-{
-	u32 i;
-
-#define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
-
-	for (i = 0; i < n_regs; i++) {
-		if ((i % MI_LOAD_REGISTER_IMM_MAX_REGS) == 0) {
-			u32 n_lri = min_t(u32, n_regs - i,
-					  MI_LOAD_REGISTER_IMM_MAX_REGS);
-
-			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(n_lri);
-		}
-		bb->cs[bb->len++] = reg_data[i].addr.addr;
-		bb->cs[bb->len++] = reg_data[i].value;
-	}
-}
-
-static int num_lri_dwords(int num_regs)
-{
-	int count = 0;
-
-	if (num_regs > 0) {
-		count += DIV_ROUND_UP(num_regs, MI_LOAD_REGISTER_IMM_MAX_REGS);
-		count += num_regs * 2;
-	}
-
-	return count;
-}
-
 static struct xe_oa_config_bo *
 __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
 {
@@ -1159,6 +1029,14 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream,
 	return ret;
 }
 
+static long xe_oa_status_locked(struct xe_oa_stream *stream)
+{
+	u32 ret = xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_status);
+
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
+	return ret;
+}
+
 static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
@@ -1172,6 +1050,8 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 		return 0;
 	case DRM_XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
+	case DRM_XE_PERF_IOCTL_STATUS:
+		return xe_oa_status_locked(stream);
 	}
 
 	return -EINVAL;
@@ -1209,9 +1089,6 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
-	/* Zap mmap's */
-	unmap_mapping_range(file->f_mapping, 0, -1, 1);
-
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
@@ -1240,20 +1117,16 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EINVAL;
 	}
 
-	/* Only support VM_READ, enforce MAP_PRIVATE by checking for VM_MAYSHARE */
+	/*
+	 * Only support VM_READ, enforce MAP_PRIVATE by checking for
+	 * VM_MAYSHARE, don't copy the vma on fork
+	 */
 	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
 		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
 		return -EINVAL;
 	}
-
-	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
-
-	/*
-	 * If the privileged parent forks and child drops root privilege, we do not want
-	 * the child to retain access to the mapped OA buffer. Explicitly set VM_DONTCOPY
-	 * to avoid such cases.
-	 */
-	vm_flags_set(vma, vma->vm_flags | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY);
+	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
+		     VM_MAYWRITE | VM_MAYEXEC);
 
 	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
 		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
@@ -1359,15 +1232,12 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	int ret;
 
 	stream->exec_q = param->exec_q;
-	stream->poll_period_ns = param->poll_period_us ?
-		param->poll_period_us * NSEC_PER_USEC : DEFAULT_POLL_PERIOD_NS;
+	stream->poll_period_ns = DEFAULT_POLL_PERIOD_NS;
 	stream->hwe = param->hwe;
 	stream->gt = stream->hwe->gt;
-	stream->sample_size = sizeof(struct drm_xe_oa_record_header);
 	stream->oa_buffer.format = &stream->oa->oa_formats[param->oa_format];
 
 	stream->sample = param->sample;
-	stream->sample_size += stream->oa_buffer.format->size;
 	stream->periodic = param->period_exponent > 0;
 	stream->period_exponent = param->period_exponent;
 
@@ -1414,7 +1284,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
 						BIT(stream->hwe->logical_instance), 1,
-						stream->hwe, EXEC_QUEUE_FLAG_KERNEL);
+						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
 	if (IS_ERR(stream->k_exec_q)) {
 		ret = PTR_ERR(stream->k_exec_q);
 		drm_err(&stream->oa->xe->drm, "gt%d, hwe %s, xe_exec_queue_create failed=%d",
@@ -1462,7 +1332,6 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 					  struct xe_oa_open_param *param)
 {
 	struct xe_oa_stream *stream;
-	unsigned long f_flags = 0;
 	int stream_fd;
 	int ret;
 
@@ -1484,18 +1353,13 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	if (ret)
 		goto err_free;
 
-	if (param->open_flags & DRM_XE_OA_FLAG_FD_CLOEXEC)
-		f_flags |= O_CLOEXEC;
-	if (param->open_flags & DRM_XE_OA_FLAG_FD_NONBLOCK)
-		f_flags |= O_NONBLOCK;
-
-	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, f_flags);
+	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
 	if (stream_fd < 0) {
 		ret = stream_fd;
 		goto err_destroy;
 	}
 
-	if (!(param->open_flags & DRM_XE_OA_FLAG_DISABLED))
+	if (!param->disabled)
 		xe_oa_enable_locked(stream);
 
 	/* Hold a reference on the drm device till stream_fd is released */
@@ -1595,16 +1459,8 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 
 	if (param->exec_q) {
 		/* When we have an exec_q, get hwe from the exec_q */
-		for_each_gt(gt, oa->xe, i) {
-			param->hwe = xe_gt_hw_engine(gt, param->exec_q->class,
-						     param->engine_instance, true);
-			if (param->hwe)
-				break;
-		}
-		if (param->hwe && (xe_oa_unit_id(param->hwe) != param->oa_unit_id)) {
-			drm_dbg(&oa->xe->drm, "OA unit ID mismatch for exec_q\n");
-			ret = -EINVAL;
-		}
+		param->hwe = xe_gt_hw_engine(param->exec_q->gt, param->exec_q->class,
+					     param->engine_instance, true);
 	} else {
 		struct xe_hw_engine *hwe;
 		enum xe_hw_engine_id id;
@@ -1620,9 +1476,10 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 		}
 	}
 out:
-	if (!param->hwe) {
-		drm_dbg(&oa->xe->drm, "Unable to find hwe for OA unit ID %d\n",
-			param->oa_unit_id);
+	if (!param->hwe || xe_oa_unit_id(param->hwe) != param->oa_unit_id) {
+		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
+			param->exec_q ? param->exec_q->class : -1,
+			param->engine_instance, param->oa_unit_id);
 		ret = -EINVAL;
 	}
 
@@ -1679,28 +1536,10 @@ static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
-static int xe_oa_set_prop_poll_oa_period(struct xe_oa *oa, u64 value,
-					 struct xe_oa_open_param *param)
-{
-	if (value < 100) {
-		drm_dbg(&oa->xe->drm, "OA timer too small (%lldus < 100us)\n", value);
-		return -EINVAL;
-	}
-	param->poll_period_us = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_open_flags(struct xe_oa *oa, u64 value,
-				     struct xe_oa_open_param *param)
+static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
+				   struct xe_oa_open_param *param)
 {
-	u32 known_open_flags =
-		DRM_XE_OA_FLAG_FD_CLOEXEC | DRM_XE_OA_FLAG_FD_NONBLOCK | DRM_XE_OA_FLAG_DISABLED;
-
-	if (value & ~known_open_flags) {
-		drm_dbg(&oa->xe->drm, "Unknown open_flag %#llx\n", value);
-		return -EINVAL;
-	}
-	param->open_flags = value;
+	param->disabled = value;
 	return 0;
 }
 
@@ -1726,8 +1565,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
 	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
 	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_oa_format,
 	[DRM_XE_OA_PROPERTY_OA_EXPONENT] = xe_oa_set_prop_oa_exponent,
-	[DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US] = xe_oa_set_prop_poll_oa_period,
-	[DRM_XE_OA_PROPERTY_OPEN_FLAGS] = xe_oa_set_prop_open_flags,
+	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
 	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
 	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
 };
@@ -1758,7 +1596,7 @@ static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
 	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
 };
 
-static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension,
+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
 				 struct xe_oa_open_param *param)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
@@ -1766,6 +1604,9 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension,
 	int err;
 	u32 idx;
 
+	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
+		return -E2BIG;
+
 	err = __copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
@@ -1780,7 +1621,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension,
 		return err;
 
 	if (ext.next_extension)
-		return xe_oa_user_extensions(oa, ext.next_extension, param);
+		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, param);
 
 	return 0;
 }
@@ -1789,7 +1630,6 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
 	struct xe_file *xef = to_xe_file(file);
-	struct drm_xe_oa_open_param dparam;
 	struct xe_oa_open_param param = {};
 	const struct xe_oa_format *f;
 	bool privileged_op = true;
@@ -1800,11 +1640,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
 		return -ENODEV;
 	}
 
-	ret = __copy_from_user(&dparam, data, sizeof(dparam));
-	if (XE_IOCTL_DBG(oa->xe, ret))
-		return -EFAULT;
-
-	ret = xe_oa_user_extensions(oa, dparam.extensions, &param);
+	ret = xe_oa_user_extensions(oa, (u64)data, 0, &param);
 	if (ret)
 		return ret;
 
@@ -1852,15 +1688,15 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
 	if (param.period_exponent > 0) {
 		u64 oa_period, oa_freq_hz;
 
-		oa_period = oa_exponent_to_ns(param.hwe->gt, param.period_exponent);
-		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
-		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
-			drm_dbg(&oa->xe->drm,
-				"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
-				xe_oa_max_sample_rate);
-			ret = -EACCES;
+		/* Requesting samples from OAG buffer is a privileged operation */
+		if (!param.sample) {
+			drm_dbg(&oa->xe->drm, "OA_EXPONENT specified without SAMPLE_OA\n");
+			ret = -EINVAL;
 			goto err_exec_q;
 		}
+		oa_period = oa_exponent_to_ns(param.hwe->gt, param.period_exponent);
+		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
+		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
 	}
 
 	mutex_lock(&param.hwe->gt->oa.gt_lock);
@@ -1894,7 +1730,7 @@ static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
 
 static bool xe_oa_reg_in_range_table(u32 addr, const struct xe_mmio_range *table)
 {
-	while (table->start || table->end) {
+	while (table->start && table->end) {
 		if (addr >= table->start && addr <= table->end)
 			return true;
 
@@ -2079,10 +1915,10 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
 
-	if (!arg->regs_ptr || !arg->n_regs) {
-		drm_dbg(&oa->xe->drm, "No OA registers given\n");
+	if (XE_IOCTL_DBG(oa->xe, arg->extensions) ||
+	    XE_IOCTL_DBG(oa->xe, !arg->regs_ptr) ||
+	    XE_IOCTL_DBG(oa->xe, !arg->n_regs))
 		return -EINVAL;
-	}
 
 	oa_config = kzalloc(sizeof(*oa_config), GFP_KERNEL);
 	if (!oa_config)
@@ -2130,8 +1966,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 		goto sysfs_err;
 	}
 
-	/* Config id 0 is invalid, id 1 for kernel stored test config */
-	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 2, 0, GFP_KERNEL);
+	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 1, 0, GFP_KERNEL);
 	if (oa_config->id < 0) {
 		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
 		err = oa_config->id;
@@ -2240,7 +2075,7 @@ static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
 		drm_WARN_ON(&gt_to_xe(hwe->gt)->drm,
 			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
 
-		return XE_OA_UNIT_OAM_SAMEDIA_0;
+		return 0;
 	}
 
 	return XE_OA_UNIT_INVALID;
@@ -2251,7 +2086,7 @@ static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
 	switch (hwe->class) {
 	case XE_ENGINE_CLASS_RENDER:
 	case XE_ENGINE_CLASS_COMPUTE:
-		return XE_OA_UNIT_OAG;
+		return 0;
 
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
@@ -2294,15 +2129,13 @@ static struct xe_oa_regs __oag_regs(void)
 
 static void __xe_oa_init_oa_units(struct xe_gt *gt)
 {
-	const u32 mtl_oa_base[] = {
-		[XE_OA_UNIT_OAM_SAMEDIA_0] = 0x393000,
-	};
+	const u32 mtl_oa_base[] = { 0x13000 };
 	int i, num_units = gt->oa.num_oa_units;
 
 	for (i = 0; i < num_units; i++) {
 		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
 
-		if (i == XE_OA_UNIT_OAG && gt->info.type != XE_GT_TYPE_MEDIA) {
+		if (gt->info.type != XE_GT_TYPE_MEDIA) {
 			u->regs = __oag_regs();
 			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
 		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
@@ -2310,7 +2143,7 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
-		/* Ensure MMIO triggers remain disabled till there is a stream */
+		/* Ensure MMIO trigger remains disabled till there is a stream */
 		xe_mmio_write32(gt, u->regs.oa_debug,
 				oag_configure_mmio_trigger(NULL, false));
 
@@ -2438,9 +2271,6 @@ int xe_oa_init(struct xe_device *xe)
 	for_each_gt(gt, xe, i)
 		mutex_init(&gt->oa.gt_lock);
 
-	/* Choose a representative limit */
-	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.reference_clock / 2;
-
 	mutex_init(&oa->metrics_lock);
 	idr_init_base(&oa->metrics_idr, 1);
 
@@ -2480,27 +2310,3 @@ void xe_oa_fini(struct xe_device *xe)
 
 	oa->xe = NULL;
 }
-
-static struct ctl_table oa_ctl_table[] = {
-	{
-	 .procname = "oa_max_sample_rate",
-	 .data = &xe_oa_max_sample_rate,
-	 .maxlen = sizeof(xe_oa_max_sample_rate),
-	 .mode = 0644,
-	 .proc_handler = proc_dointvec_minmax,
-	 .extra1 = SYSCTL_ZERO,
-	 .extra2 = &xe_oa_sample_rate_hard_limit,
-	 },
-	{}
-};
-
-int xe_oa_sysctl_register(void)
-{
-	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
-	return 0;
-}
-
-void xe_oa_sysctl_unregister(void)
-{
-	unregister_sysctl_table(sysctl_header);
-}
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 044440300c88f..6308aa1829bd7 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -18,9 +18,6 @@ int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
-int xe_oa_sysctl_register(void);
-void xe_oa_sysctl_unregister(void);
-
 int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file);
 int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index e11555bac7c79..bee49977ee3d4 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -23,7 +23,7 @@ enum xe_oa_report_header {
 };
 
 enum xe_oa_format_name {
-	XE_OA_FORMAT_C4_B8 = 7,
+	XE_OA_FORMAT_C4_B8,
 
 	/* Gen8+ */
 	XE_OA_FORMAT_A12,
@@ -188,9 +188,6 @@ struct xe_oa_stream {
 	/** @sample: true if DRM_XE_OA_PROP_SAMPLE_OA is provided */
 	bool sample;
 
-	/** @sample_size: Size of an OA record/packet plus the header */
-	int sample_size;
-
 	/** @exec_q: Exec queue corresponding to DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID */
 	struct xe_exec_queue *exec_q;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8aa5d4b0d40ea..2c0949b248d9a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -100,7 +100,7 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
-#define DRM_XE_PERF			0x0f
+#define DRM_XE_PERF			0x0e
 
 /* Must be kept compact -- no holes */
 
@@ -1395,6 +1395,9 @@ enum drm_xe_perf_ioctls {
 
 	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
 	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
+
+	/** @DRM_XE_PERF_IOCTL_STATUS: Stream status */
+	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
 };
 
 /** enum drm_xe_oa_unit_type - OA unit types */
@@ -1403,6 +1406,41 @@ enum drm_xe_oa_unit_type {
 	DRM_XE_OA_UNIT_TYPE_OAM,
 };
 
+/**
+ * struct drm_xe_oa_unit - describe OA unit
+ */
+struct drm_xe_oa_unit {
+	/** @oa_unit_id: OA unit ID */
+	__u16 oa_unit_id;
+
+	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
+	__u16 oa_unit_type;
+
+	/** @gt_id: GT ID for this OA unit */
+	__u16 gt_id;
+
+	/** @open_stream: True if a stream is open on the OA unit */
+	__u16 open_stream;
+
+	/** @capabilities: OA capabilities bit-mask */
+	__u64 capabilities;
+
+	/** @oa_timestamp_freq: OA timestamp freq */
+	__u64 oa_timestamp_freq;
+
+	/** @oa_buf_size: OA buffer size */
+	__u64 oa_buf_size;
+
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+
+	/** @num_engines: number of engines in @eci array */
+	__u64 num_engines;
+
+	/** @eci: engines attached to this OA unit */
+	struct drm_xe_engine_class_instance eci[];
+};
+
 /**
  * struct drm_xe_query_oa_units - describe OA units
  *
@@ -1414,56 +1452,12 @@ enum drm_xe_oa_unit_type {
  * that @open_stream. Else default properties are returned.
  */
 struct drm_xe_query_oa_units {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
 	/** @num_oa_units: number of OA units returned in oau[] */
 	__u32 num_oa_units;
-
 	/** @pad: MBZ */
 	__u32 pad;
-
-	/** @reserved: MBZ */
-	__u64 reserved[4];
-
 	/** @oa_units: OA units returned for this device */
-	struct drm_xe_oa_unit {
-		/** @oa_unit_id: OA unit ID */
-		__u16 oa_unit_id;
-
-		/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
-		__u16 oa_unit_type;
-
-		/** @gt_id: GT ID for this OA unit */
-		__u16 gt_id;
-
-		/** @open_stream: True if a stream is open on the OA unit */
-		__u16 open_stream;
-
-		/** @internal_events: True if internal events are available */
-		__u16 internal_events;
-
-		/** @pad: MBZ */
-		__u16 pad;
-
-		/** @capabilities: OA capabilities bit-mask */
-		__u64 capabilities;
-
-		/** @oa_timestamp_freq: OA timestamp freq */
-		__u64 oa_timestamp_freq;
-
-		/** @oa_buf_size: OA buffer size */
-		__u64 oa_buf_size;
-
-		/** @reserved: MBZ */
-		__u64 reserved[4];
-
-		/** @num_engines: number of engines in @eci array */
-		__u64 num_engines;
-
-		/** @eci: engines attached to this OA unit */
-		struct drm_xe_engine_class_instance eci[];
-	} oa_units[];
+	struct drm_xe_oa_unit oa_units[];
 };
 
 /** enum drm_xe_oa_format_type - OA format types */
@@ -1476,8 +1470,17 @@ enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_PEC,
 };
 
-/** enum drm_xe_oa_property_id - OA stream property id's */
+/**
+ * enum drm_xe_oa_property_id - OA stream property id's
+ *
+ * Stream params are specified as a chain of @drm_xe_ext_set_property
+ * struct's, with @property values from enum @drm_xe_oa_property_id and
+ * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
+ * @param field in struct @drm_xe_perf_param points to the first
+ * @drm_xe_ext_set_property struct.
+ */
 enum drm_xe_oa_property_id {
+#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
 	 * the OA stream, see @oa_unit_id in 'struct
@@ -1493,7 +1496,7 @@ enum drm_xe_oa_property_id {
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
-	 * reportst, previously added via @@DRM_XE_PERF_OP_ADD_CONFIG.
+	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
 	 */
 	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
 
@@ -1516,24 +1519,10 @@ enum drm_xe_oa_property_id {
 	DRM_XE_OA_PROPERTY_OA_EXPONENT,
 
 	/**
-	 * @DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US: Timer interval in microseconds
-	 * to check OA buffer for available data. Minimum allowed value is 100
-	 * microseconds. A default value is used by the driver if this parameter
-	 * is skipped. Larger timer values will reduce cpu consumption during OA
-	 * perf captures, but excessively large values could result in data loss
-	 * due to OA buffer overwrites.
+	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
+	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
 	 */
-	DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US,
-
-	/**
-	 * @DRM_XE_OA_PROPERTY_OPEN_FLAGS: CLOEXEC and NONBLOCK flags are
-	 * directly applied to returned OA fd. DISABLED opens the OA stream in a
-	 * DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
-	 */
-	DRM_XE_OA_PROPERTY_OPEN_FLAGS,
-#define DRM_XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
-#define DRM_XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
-#define DRM_XE_OA_FLAG_DISABLED		(1 << 2)
+	DRM_XE_OA_PROPERTY_OA_DISABLED,
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
@@ -1550,49 +1539,6 @@ enum drm_xe_oa_property_id {
 	DRM_XE_OA_PROPERTY_MAX /* non-ABI */
 };
 
-/**
- * struct drm_xe_oa_open_param - Params for opening an OA stream
- *
- * Stream params are specified as a chain of @drm_xe_ext_set_property
- * struct's, with @property values from enum @drm_xe_oa_property_id and
- * @xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY
- */
-struct drm_xe_oa_open_param {
-#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
-	/** @extensions: Pointer to the first extension struct */
-	__u64 extensions;
-};
-
-/** enum drm_xe_oa_record_type - Type of OA packet read from OA fd */
-enum drm_xe_oa_record_type {
-	/** @DRM_XE_OA_RECORD_SAMPLE: Regular OA data sample */
-	DRM_XE_OA_RECORD_SAMPLE = 1,
-
-	/** @DRM_XE_OA_RECORD_OA_REPORT_LOST: Status indicating lost OA reports */
-	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
-
-	/**
-	 * @DRM_XE_OA_RECORD_OA_BUFFER_LOST: Status indicating lost OA
-	 * reports and OA buffer reset in the process
-	 */
-	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
-
-	/** @DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL: Status indicating MMIO trigger queue full */
-	DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL = 4,
-
-	DRM_XE_OA_RECORD_MAX /* non-ABI */
-};
-
-/** struct drm_xe_oa_record_header - Header for OA packets read from OA fd */
-struct drm_xe_oa_record_header {
-	/** @type: Of enum @drm_xe_oa_record_type */
-	__u16 type;
-	/** @pad: MBZ */
-	__u16 pad;
-	/** @size: size in bytes */
-	__u32 size;
-};
-
 /**
  * struct drm_xe_oa_config - OA metric configuration
  *
-- 
2.41.0

