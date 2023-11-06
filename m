Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B46C0032E
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A1210E2CB;
	Mon,  6 Nov 2023 11:22:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B961910E2D1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269754; x=1730805754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cAnTxzHYnzP1v9qCjJ6P433r5HgmmYsQBebkUKl4Ank=;
 b=j3E6PfNZ7ezf//EwFOwESZ+IeuMXYGHeRiaGCXqbJfNJ4Ww72Z3tjIk0
 j8ChATEWSCIP43OwPtGKmzHvtyltrsAz6tTNCCpl4gAfqGIE0u8zQdBWm
 WRQreVhsHX1tEpSN8g7hfTg+I90Y11TxP6vtRZO/GVqRcN/HiWtiNExTj
 Srv63dGUedgasP/kMFkIGJX7WEEPwT9xL8TtF/nAnpOf4wjd4QvFqM8p3
 rp7OdYz8/f62fSTQ+tQTDaoj6Jy4zwLFYnjGo9zE9JG/Qsw2wbfyNYRo5
 ONVilAt3W8U8DmCJv45s1gkJecrejRqI3dud+SA9SCND5leawRZgeFRhv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646793"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646793"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411580"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411580"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:22 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:28 +0200
Message-Id: <20231106111845.2333093-9-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 08/25] drm/xe: Add runalone engine property
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

Introduce runalone engine param, which is used to ensure that only
one hw engine of group [rcs0, ccs0-3] is active on a tile. User
can set property only on engine create.

Note: unlike the i915, xe allows user to set runalone
also on devices with single render/compute engine. It should not
make much difference, but leave control to the user.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.c              |  8 ++++++++
 drivers/gpu/drm/xe/xe_lrc.h              |  3 +++
 include/uapi/drm/xe_drm.h                |  1 +
 5 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 35dd4837dd75..662105137d38 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -72,6 +72,7 @@
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
+#define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8e4ee13f098f..bc21026a6083 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -402,6 +402,26 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
 	return 0;
 }
 
+static int engine_set_runalone(struct xe_device *xe, struct xe_exec_queue *q,
+			       u64 value, bool create)
+{
+	int i;
+
+	if (XE_IOCTL_DBG(xe, !create))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
+			      q->class != XE_ENGINE_CLASS_COMPUTE)))
+		return -EINVAL;
+
+	if (value) {
+		for (i = 0; i < q->width; i++)
+			xe_lrc_set_runalone(q->lrc + i);
+	}
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value, bool create);
@@ -415,6 +435,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
+	[XE_EXEC_QUEUE_SET_PROPERTY_RUNALONE] = engine_set_runalone,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f8754f061599..1f373a794f53 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1273,3 +1273,11 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 		bb->len += num_dw;
 	}
 }
+	
+void xe_lrc_set_runalone(struct xe_lrc *lrc)
+{
+	u32 ctl;
+
+	ctl = _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE);
+	xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL, ctl);
+}
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 28b1d3f404d4..5932cf079014 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -55,4 +55,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
 
 void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
 
+void xe_lrc_set_runalone(struct xe_lrc *lrc);
+
+
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9bd7092a7ea4..4ecdceb7a074 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -765,6 +765,7 @@ struct drm_xe_exec_queue_set_property {
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+#define XE_EXEC_QUEUE_SET_PROPERTY_RUNALONE		8
 	/** @property: property to set */
 	__u32 property;
 
-- 
2.34.1

