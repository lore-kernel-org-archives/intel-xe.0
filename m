Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEFBC3ABC6
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 01:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9B310E31A;
	Thu,  8 May 2025 01:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzZKgvTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721310E2C1
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746668079; x=1778204079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IXUYctRALhJ03co8QW+Fft8MB2ycH162MZH6ql/wlHs=;
 b=mzZKgvTFpG0IHFFJUTVg3NzzokbSRg2dxEcSWxkpHRvT4npgLf1WyZ1F
 UG79ojRVK8BOXaLJjMNzeW7pI0N/ogfYA7iwnR2d3OCY6zuR7dNoSNkX6
 9ccDmhdV8EN236owz6i0dXzTUP/1B5jxnsGvLcc5gbyflFjmeJe1SE/Ig
 Y1ihebf4jhNCj+YhlvzUXMLRcEeVsesWKSR5OCPmM3dciqY1gt0jhzilO
 EnteEd3/NOfL4nyAKCPNb0OXovDfPrIWB3U1Cbls7HDXHri+aPnfcv6Co
 /N1N6/Fo6NuUKSTHSfJONcwaRRtThbgE0WUFw8vbV9wl/uBsxi90MwM8b A==;
X-CSE-ConnectionGUID: GYV7ItB+QI6m8Xq+Uo5wtA==
X-CSE-MsgGUID: 8VImkO50T0C5MNLETnKVAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48538281"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48538281"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 18:34:38 -0700
X-CSE-ConnectionGUID: cUcAAt10RPmFMql3IagnOw==
X-CSE-MsgGUID: 34uGu6+8TlqR5YG946xPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136094253"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 18:34:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 4/4] drm/xe/guc: Track FAST_REQ H2Gs to report where errors
 came from
Date: Wed,  7 May 2025 18:34:37 -0700
Message-ID: <20250508013437.652982-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508013437.652982-1-John.C.Harrison@Intel.com>
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
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

Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug     |   5 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 116 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  15 ++++
 3 files changed, 116 insertions(+), 20 deletions(-)

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
index 9213fdc25950..2d38aea9c0a2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -625,6 +625,47 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
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
@@ -716,6 +757,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
 	xe_device_wmb(xe);
 
+	if (ct_fence_value & CT_SEQNO_UNTRACKED)
+		fast_req_track(ct, ct_fence_value,
+			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
+
 	/* Update local copies */
 	h2g->info.tail = (tail + full_len) % h2g->info.size;
 	h2g_reserve_space(ct, full_len);
@@ -733,25 +778,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
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
@@ -1143,6 +1169,55 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
+{
+	u16 fence_min = (u16)~0U, fence_max = 0;
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
+		xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped? [range = 0x%x -> 0x%x]\n",
+			   fence, fence_min, fence_max);
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
@@ -1171,6 +1246,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		else
 			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
 				  type, fence);
+
+		fast_req_report(ct, fence);
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 8e1b9d981d61..f58cea36c3c5 100644
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
+	/** @fast_req: history of FAST_REQ messages for matching with G2H error responses*/
+	struct xe_fast_req_fence fast_req[SZ_32];
 #endif
 };
 
-- 
2.49.0

