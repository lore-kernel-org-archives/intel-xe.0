Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A088CC0018A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB9910E2E7;
	Mon,  6 Nov 2023 11:22:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3068210E2E5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269763; x=1730805763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6CrjqMBExu0llhetYhKGnkSh5FQ4fhLCcMDhDQEycQ8=;
 b=LmsrriU+eSl9gZWcPWbBFls38RyRV//n2CyD/PsOxelPv3ruyKPXySPH
 oG7kp2yD5qApnbIYPDHps9PccrcltywWPsDIl5K4kbm6BaIw2vMbriAXC
 Dg9iodt6LtzNBb4mvBpHQpXBJo60MOtRdvt3y5WcsBcFnRadn7vzq5Iz3
 H1NaKHYoV2u3LWWv3uP3vBnu1o5A5c/czp/xbs8oUMrVCrJby/fMQeQdS
 NhlKSia0SUnHgg5oulDm7qUBKWFyRxt0rV6xBP/AKAGoU89MC4hw7DzFK
 t1Vsvw/5foKoUhiebhHiQSNbxsLIPa10HGhYG4xTN5EwiJcy5B//7VoBM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646875"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646875"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411733"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411733"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:39 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:41 +0200
Message-Id: <20231106111845.2333093-22-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 21/25] drm/xe/: Include attention in usercapture.
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

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c            |  24 +++-
 drivers/gpu/drm/xe/xe_usercoredump.c       | 140 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_usercoredump_types.h |  18 +++
 3 files changed, 180 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index a5cae53fe496..886da91ea0a4 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -16,6 +16,8 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_devcoredump.h"
+#include "xe_usercoredump.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
@@ -1031,7 +1033,9 @@ static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lr
 
 			xe_exec_queue_get(q);
 			found = q;
-			*lrc_idx = idx;
+
+			if (lrc_idx)
+				*lrc_idx = idx;
 
 			break;
 		}
@@ -1187,10 +1191,26 @@ static void attention_scan_fn(struct work_struct *work)
 			ret = xe_eudebug_handle_gt_attention(gt);
 
 			if (ret) {
-				// TODO: error capture
+				struct xe_exec_queue *eq;
+
 				drm_info(&gt_to_xe(gt)->drm,
 					 "gt:%d unable to handle eu attention ret=%d\n",
 					 gt_id, ret);
+
+				eq = runalone_active_queue_get(gt, NULL);
+				if (!IS_ERR(eq)) {
+					struct xe_user_state_snapshot *s;
+
+					s = xe_user_state_snapshot_capture(eq);
+					if (s)
+						xe_usercoredumps_add(xe, s);
+
+					xe_devcoredump(eq);
+				} else {
+					drm_info(&gt_to_xe(gt)->drm,
+						 "cannot determine active request, set runalone\n");
+				}
+
 				xe_gt_reset_async(gt);
 			}
 		}
diff --git a/drivers/gpu/drm/xe/xe_usercoredump.c b/drivers/gpu/drm/xe/xe_usercoredump.c
index 27b201641e4d..1b90fecb1472 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump.c
+++ b/drivers/gpu/drm/xe/xe_usercoredump.c
@@ -5,10 +5,13 @@
 
 #include "xe_usercoredump.h"
 
+#include <linux/delay.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_debug_metadata.h"
 #include "xe_device_types.h"
 #include "xe_exec_queue_types.h"
+#include "xe_gt_mcr.h"
 #include "xe_vm.h"
 #include "xe_bo.h"
 #include "xe_res_cursor.h"
@@ -239,6 +242,106 @@ static void capture_metadata(struct xe_user_state_snapshot *s,
 	xe_vm_put(vm);
 }
 
+static inline unsigned int
+xe_eu_attentions_count(const struct xe_eu_attentions_snapshot *a)
+{
+	return bitmap_weight((void *)a->att, a->size * BITS_PER_BYTE);
+}
+
+static void xe_eu_attentions_read(struct xe_exec_queue *eq,
+				  struct xe_eu_attentions_snapshot *a,
+				  const unsigned int settle_time_ms)
+{
+	struct xe_gt *gt = eq->gt;
+	unsigned int prev = 0;
+	ktime_t end, now;
+
+	now = ktime_get_raw();
+	end = ktime_add_ms(now, settle_time_ms);
+
+	a->ts = 0;
+	a->size = min_t(int,
+			xe_gt_eu_attention_bitmap_size(gt),
+			sizeof(a->att));
+
+	do {
+		unsigned int attn;
+
+		xe_gt_eu_attention_bitmap(gt, a->att, a->size);
+		attn = xe_eu_attentions_count(a);
+
+		now = ktime_get_raw();
+
+		if (a->ts == 0)
+			a->ts = now;
+		else if (attn && attn != prev)
+			a->ts = now;
+
+		prev = attn;
+
+		if (settle_time_ms)
+			udelay(5);
+
+		/*
+		 * XXX We are gathering data for production SIP to find
+		 * the upper limit of settle time. For now, we wait full
+		 * timeout value regardless.
+		 */
+	} while (ktime_before(now, end));
+}
+
+static void capture_attentions(struct xe_user_state_snapshot *s,
+			       struct xe_exec_queue *eq)
+{
+	struct xe_gt *gt = eq->gt;
+	u32 td_ctl;
+	int ret;
+
+	ret = xe_force_wake_get(gt_to_fw(gt), eq->hwe->domain);
+
+	if (ret)
+		return;
+
+	td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	s->attentions.td_ctl = td_ctl;
+
+	xe_eu_attentions_read(eq, &s->attentions.before, 0);
+
+	/* If there is no debug functionality, dont invoke sip */
+	if (!td_ctl)
+		goto put_fw;
+
+	/* Halt on next thread dispatch */
+	while (!(td_ctl & TD_CTL_FORCE_EXTERNAL_HALT)) {
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXTERNAL_HALT);
+		/*
+		 * The sleep is needed because some interrupts are ignored
+		 * by the HW, hence we allow the HW some time to acknowledge
+		 * that.
+		 */
+		udelay(200);
+
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	}
+
+	/* Halt regardless of thread dependencies */
+	while (!(td_ctl & TD_CTL_FORCE_EXCEPTION)) {
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXCEPTION);
+		udelay(200);
+
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	}
+
+	xe_eu_attentions_read(eq, &s->attentions.after,
+			      XE_GT_ATTENTION_TIMEOUT_MS);
+
+put_fw:
+	xe_force_wake_put(gt_to_fw(gt), eq->hwe->domain);
+
+}
+
 static void hexdump(struct drm_printer *m, const void *buf, size_t len)
 {
 	const size_t rowsize = 8 * sizeof(u32);
@@ -314,6 +417,40 @@ static const char *vm_metadata_type_to_str(const u64 type)
 	return "Unknown";
 }
 
+static void __print_attn(struct drm_printer *p,
+			 const char *name,
+			 const struct xe_eu_attentions_snapshot *a,
+			 ktime_t epoc)
+{
+	int max = a->size * BITS_PER_BYTE;
+	const u32 *bm = (const u32 *)a->att;
+	unsigned int count;
+
+	count = xe_eu_attentions_count(a);
+
+	drm_printf(p, "TD_ATT %s (%d):", name, count);
+
+	max /= BITS_PER_TYPE(*bm);
+	while (max--)
+		drm_printf(p, " %08x", *bm++);
+
+	if (count && epoc)
+		drm_printf(p, " %lldus after FEH\n",
+			   ktime_us_delta(a->ts, epoc));
+	else
+		drm_printf(p, "\n");
+}
+
+static void xe_attentions_snapshot_print(struct xe_user_state_snapshot *s,
+					 struct drm_printer *p)
+{
+	const ktime_t halt_ts = s->attentions.before.ts;
+
+	drm_printf(p, "TD_CTL: 0x%08x\n", s->attentions.td_ctl);
+	__print_attn(p, "before", &s->attentions.before, 0);
+	__print_attn(p, "after", &s->attentions.after, halt_ts);
+}
+
 void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 				  struct drm_printer *p)
 {
@@ -347,6 +484,8 @@ void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 				   upper_32_bits(s->vm_metadata[i].value),
 				   lower_32_bits(s->vm_metadata[i].value),
 				   s->vm_metadata[i].len);
+
+	xe_attentions_snapshot_print(s, p);
 }
 
 struct xe_user_state_snapshot *
@@ -377,6 +516,7 @@ xe_user_state_snapshot_capture(struct xe_exec_queue *q)
 		strcpy(s->comm, "");
 	}
 
+	capture_attentions(s, q);
 	capture_vmas(s, q);
 	capture_metadata(s, xef, q->vm);
 
diff --git a/drivers/gpu/drm/xe/xe_usercoredump_types.h b/drivers/gpu/drm/xe/xe_usercoredump_types.h
index 10950e127670..b3aa29f23096 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_usercoredump_types.h
@@ -12,6 +12,7 @@
 #include <linux/xarray.h>
 
 #include <drm/xe_drm.h>
+#include "xe_gt_debug.h"
 
 struct xe_device;
 struct xe_pidroot;
@@ -37,6 +38,16 @@ struct xe_debug_metadata_snapshot {
 	struct xe_debug_metadata *mdata;
 };
 
+struct xe_eu_attentions_snapshot {
+#define MAX_EUS_PER_ROW 4u
+#define MAX_THREADS 8u
+
+	u8 att[XE_MAX_DSS_FUSE_BITS * TD_EU_ATTENTION_MAX_ROWS *
+	       MAX_THREADS * MAX_EUS_PER_ROW / 8];
+	unsigned int size;
+	ktime_t ts;
+};
+
 /**
  * struct xe_user_state_snapshot - Crash snapshot
  *
@@ -59,6 +70,13 @@ struct xe_user_state_snapshot {
 		u64 len;
 	} vm_metadata[DRM_XE_VM_DEBUG_METADATA_NUM];
 
+	struct {
+		u32 td_ctl; /* can be in power ctx on newer gens */
+
+		struct xe_eu_attentions_snapshot before;
+		struct xe_eu_attentions_snapshot after;
+	} attentions;
+
 	struct pid *pid;
 	u64 client_id; /* drm client id */
 	char comm[TASK_COMM_LEN];
-- 
2.34.1

