Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03280C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 03:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E11F10E1FE;
	Fri, 21 Feb 2025 03:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNEI0a3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A6C10E1FE
 for <Intel-Xe@lists.freedesktop.org>; Fri, 21 Feb 2025 03:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740107687; x=1771643687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ctHXqcbkiHVQ00n2kSNB2/gbOWhd9MfTYAgq0Co9W+k=;
 b=eNEI0a3ZvHN9PhNFLBV9MdaNZWBvuQwUob9Hk4Fsb+k0RFCzKH+4ephK
 p9U/sEraC8ENacgzTs+ILxd+6AdQlimfS2dvpPnLKRy2tQ1UzQY78LB64
 7mzt8B9Xc4ZB0XrbtmY7flMDYdxHqoIwVM8fHAzIxFnXOmNn7K6Cvaqmw
 nPOzmS6FjtpJPedvCQy5nxZcaduE3Ds8X1f+UnOk7t7dZzhrBY8xfOJjj
 80yyhRQnpW1MdXSRiH2SgsstFBPWspfVcjOx/57BVbo37a8NQFJbpanx5
 XpMHHgIsjYYCAKJV47SpF3c8NVpI1fYs02KtTgpxfF5m1uG2DOdLBzQwP g==;
X-CSE-ConnectionGUID: XiBI/17vRMOZiFsz5JbfBQ==
X-CSE-MsgGUID: xPRFmbfaTs6BOsNXAJbisA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51132338"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="51132338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 19:14:46 -0800
X-CSE-ConnectionGUID: er5tV3geQaWJtFHXP4sbZA==
X-CSE-MsgGUID: DWbLCrU3TA+9YH+d2ngIMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115893693"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa009.fm.intel.com with ESMTP; 20 Feb 2025 19:14:45 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Track FAST_REQ H2Gs to report where errors came
 from
Date: Thu, 20 Feb 2025 19:14:44 -0800
Message-ID: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
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
used to record the call stack of each H2G and report that with an
error. That makes it much easier to work out where a specific H2G came
from if there are multiple code paths that can send it.

Note, rather than create an extra Kconfig define for just this
feature, the XE_LARGE_GUC_BUFFER option has been re-used and renamed
to XE_DEBUG_GUC and is now just a general purpose 'verbose GuC debug'
option.

Lastly, add a define to document FAST_REQ error 0x30C as being the
error most recently hit. Not sure why it was previously missing.

Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug        |  10 ++-
 drivers/gpu/drm/xe/abi/guc_errors_abi.h |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c          | 106 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct_types.h    |  15 ++++
 drivers/gpu/drm/xe/xe_guc_log.h         |   2 +-
 5 files changed, 111 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 0d749ed44878..ef2c456c3f2a 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -86,12 +86,16 @@ config DRM_XE_KUNIT_TEST
 
 	  If in doubt, say "N".
 
-config DRM_XE_LARGE_GUC_BUFFER
-        bool "Enable larger guc log buffer"
+config DRM_XE_DEBUG_GUC
+        bool "Enable extra GuC related debug options"
+        depends on DRM_XE_DEBUG
         default n
+        select STACKDEPOT
         help
           Choose this option when debugging guc issues.
-          Buffer should be large enough for complex issues.
+          The GuC log buffer is increased to the maximum allowed, which should
+          be large enough for complex issues. It also enables recording of the
+          stack when tracking FAST_REQ messages.
 
           Recommended for driver developers only.
 
diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
index 2c627a21648f..c25ea52a6e61 100644
--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
@@ -40,6 +40,7 @@ enum xe_guc_response_status {
 	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
 	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
 	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
+	XE_GUC_RESPONSE_STATUS_HW_TIMEOUT                   = 0x30C,
 	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
 	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
 	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..2d59934b87dc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -624,6 +624,43 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
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
@@ -715,6 +752,12 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
 	xe_device_wmb(xe);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	if (ct_fence_value & CT_SEQNO_UNTRACKED)
+		fast_req_track(ct, ct_fence_value,
+			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
+#endif
+
 	/* Update local copies */
 	h2g->info.tail = (tail + full_len) % h2g->info.size;
 	h2g_reserve_space(ct, full_len);
@@ -732,25 +775,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
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
@@ -1141,6 +1165,47 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
+{
+	unsigned int n;
+	bool found = false;
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	char *buf;
+#endif
+
+	lockdep_assert_held(&ct->lock);
+
+	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
+		if (ct->fast_req[n].fence != fence)
+			continue;
+		found = true;
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+		buf = kmalloc(SZ_4K, GFP_NOWAIT);
+		if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf, SZ_4K, 0))
+			xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x sent at\n%s",
+				  fence, ct->fast_req[n].action, buf);
+		else
+			xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
+				  fence, ct->fast_req[n].action);
+		kfree(buf);
+#else
+		xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x\n",
+			  fence, ct->fast_req[n].action);
+#endif
+		break;
+	}
+
+	if (!found)
+		xe_gt_warn(ct_to_gt(ct), "FAST_REQ G2H fence 0x%x not found!\n", fence);
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
@@ -1169,6 +1234,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		else
 			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
 				  type, fence);
+
+		fast_req_report(ct, fence);
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 8e1b9d981d61..c6b89b757a76 100644
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
+/** struct xe_fast_req_fence - Used to track FAST_REQ messages to match error responses */
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
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 5b896f5fafaf..f1e2b0be90a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -12,7 +12,7 @@
 struct drm_printer;
 struct xe_device;
 
-#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
 #define CRASH_BUFFER_SIZE       SZ_1M
 #define DEBUG_BUFFER_SIZE       SZ_8M
 #define CAPTURE_BUFFER_SIZE     SZ_2M
-- 
2.47.0

