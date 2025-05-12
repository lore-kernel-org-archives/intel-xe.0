Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4200FC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0790010E45F;
	Mon, 12 May 2025 21:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2bsfS8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CE210E45F
 for <Intel-Xe@lists.freedesktop.org>; Mon, 12 May 2025 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747086811; x=1778622811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kdj8KZp02C8JnPQQ/O6OL1qphYkoRTuzlOpobBHp37I=;
 b=f2bsfS8RBj49KohQHikBJP1UTPVtAuJPz4CiMHqZCJcfVo74drwKMZ2L
 bepgfFJ5Yy727vuMURnACOPd7dEJtzHpfiD0a2ZStMXYaTEjwSP8Et12q
 gTOOQCiTHbeAhAUi35Lcoa/GnTY+T3eD7fLvl+oRj2WwPTC5wargXrXOc
 AVGeHwQyitnRbWxldOqePv6pfc1xHz+WLkjUXfbAsOUZ29LfxAXmV8zWd
 uEqtqsVbHbpiNZoLzzM8Cf7rOFYzKxvWGrC2wAygF+Bg59iuHU0NqT13L
 jfow+SHmjsbWYJZeYH7NmF43EWdyv6S8Yw3oXil0lII1YH76LoZm2SAmw Q==;
X-CSE-ConnectionGUID: Ag6QLlwlSz2hUJuS21grlQ==
X-CSE-MsgGUID: g5R5AHHlQNm+bze2CXI12Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48156820"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48156820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:53:26 -0700
X-CSE-ConnectionGUID: flxWbOF2QoCWKKGEof/k5w==
X-CSE-MsgGUID: ShCqmWujS6CKj1Xz/FGm1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142375175"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 14:53:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 4/4] drm/xe/guc: Track FAST_REQ H2Gs to report where errors
 came from
Date: Mon, 12 May 2025 14:53:24 -0700
Message-ID: <20250512215324.1457009-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Most H2G messages are FAST_REQ which means no synchronous response is
expected. The messages are sent as fire-and-forget with no tracking.
However, errors can still be returned when something goes unexpectedly
wrong. That leads to confusion due to not being able to match up the
error response to the originating H2G.

So add support for tracking the FAST_REQ H2Gs and matching up an error
response to its originator. This is only enabled in XE_DEBUG builds
given that such errors should never happen in a working system and
there is an overhead for the tracking.

Further, if XE_DEBUG_GUC is enabled then even more memory and time is
used to record the call stack of each H2G and report that with the
error. That makes it much easier to work out where a specific H2G came
from if there are multiple code paths that can send it.

v2: Some re-wording of comments and prints, more consistent use of #if
vs stub functions - review feedback from Daniele & Michal).
v3: Split config change to separate patch, improve a debug print
(review feedback from Michal).
v4: Bunch of minor tweaks (review feedback from Michal).

Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug     |   5 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 115 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  15 ++++
 3 files changed, 115 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index db063a513b1e..01735c6ece8b 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -90,10 +90,13 @@ config DRM_XE_DEBUG_GUC
         bool "Enable extra GuC related debug options"
         depends on DRM_XE_DEBUG
         default n
+        select STACKDEPOT
         help
           Choose this option when debugging guc issues.
           The GuC log buffer is increased to the maximum allowed, which should
-          be large enough for complex issues.
+          be large enough for complex issues. The tracking of FAST_REQ messages
+          is extended to include a record of the calling stack, which is then
+          dumped on a FAST_REQ error notification.
 
           Recommended for driver developers only.
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b09dd5788a27..822f4c33f730 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -628,6 +628,47 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 	spin_unlock_irq(&ct->fast_lock);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
+{
+	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	unsigned long entries[SZ_32];
+	unsigned int n;
+
+	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
+
+	/* May be called under spinlock, so avoid sleeping */
+	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
+#endif
+	ct->fast_req[slot].fence = fence;
+	ct->fast_req[slot].action = action;
+}
+#else
+static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
+{
+}
+#endif
+
+/*
+ * The CT protocol accepts a 16 bits fence. This field is fully owned by the
+ * driver, the GuC will just copy it to the reply message. Since we need to
+ * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
+ * we use one bit of the seqno as an indicator for that and a rolling counter
+ * for the remaining 15 bits.
+ */
+#define CT_SEQNO_MASK GENMASK(14, 0)
+#define CT_SEQNO_UNTRACKED BIT(15)
+static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
+{
+	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
+
+	if (!is_g2h_fence)
+		seqno |= CT_SEQNO_UNTRACKED;
+
+	return seqno;
+}
+
 #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
 
 static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -704,6 +745,9 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
 				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
 	} else {
+		fast_req_track(ct, ct_fence_value,
+			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
+
 		cmd[1] =
 			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
 			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
@@ -736,25 +780,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return -EPIPE;
 }
 
-/*
- * The CT protocol accepts a 16 bits fence. This field is fully owned by the
- * driver, the GuC will just copy it to the reply message. Since we need to
- * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
- * we use one bit of the seqno as an indicator for that and a rolling counter
- * for the remaining 15 bits.
- */
-#define CT_SEQNO_MASK GENMASK(14, 0)
-#define CT_SEQNO_UNTRACKED BIT(15)
-static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
-{
-	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
-
-	if (!is_g2h_fence)
-		seqno |= CT_SEQNO_UNTRACKED;
-
-	return seqno;
-}
-
 static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence)
@@ -1146,6 +1171,55 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
+{
+	u16 fence_min = U16_MAX, fence_max = 0;
+	struct xe_gt *gt = ct_to_gt(ct);
+	bool found = false;
+	unsigned int n;
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	char *buf;
+#endif
+
+	lockdep_assert_held(&ct->lock);
+
+	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
+		if (ct->fast_req[n].fence < fence_min)
+			fence_min = ct->fast_req[n].fence;
+		if (ct->fast_req[n].fence > fence_max)
+			fence_max = ct->fast_req[n].fence;
+
+		if (ct->fast_req[n].fence != fence)
+			continue;
+		found = true;
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+		buf = kmalloc(SZ_4K, GFP_NOWAIT);
+		if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf, SZ_4K, 0))
+			xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s",
+				  fence, ct->fast_req[n].action, buf);
+		else
+			xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
+				  fence, ct->fast_req[n].action);
+		kfree(buf);
+#else
+		xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
+			  fence, ct->fast_req[n].action);
+#endif
+		break;
+	}
+
+	if (!found)
+		xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped? [range = 0x%x -> 0x%x, next = 0x%X]\n",
+			   fence, fence_min, fence_max, ct->fence_seqno);
+}
+#else
+static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
+{
+}
+#endif
+
 static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_gt *gt =  ct_to_gt(ct);
@@ -1174,6 +1248,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		else
 			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
 				  type, fence);
+
+		fast_req_report(ct, fence);
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 8e1b9d981d61..8b03b50313d9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/iosys-map.h>
 #include <linux/spinlock_types.h>
+#include <linux/stackdepot.h>
 #include <linux/wait.h>
 #include <linux/xarray.h>
 
@@ -104,6 +105,18 @@ struct xe_dead_ct {
 	/** snapshot_log: copy of GuC log at point of error */
 	struct xe_guc_log_snapshot *snapshot_log;
 };
+
+/** struct xe_fast_req_fence - Used to track FAST_REQ messages by fence to match error responses */
+struct xe_fast_req_fence {
+	/** @fence: sequence number sent in H2G and return in G2H error */
+	u16 fence;
+	/** @action: H2G action code */
+	u16 action;
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	/** @stack: call stack from when the H2G was sent */
+	depot_stack_handle_t stack;
+#endif
+};
 #endif
 
 /**
@@ -152,6 +165,8 @@ struct xe_guc_ct {
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	/** @dead: information for debugging dead CTs */
 	struct xe_dead_ct dead;
+	/** @fast_req: history of FAST_REQ messages for matching with G2H error responses */
+	struct xe_fast_req_fence fast_req[SZ_32];
 #endif
 };
 
-- 
2.49.0

