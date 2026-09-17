Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94F3C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D4410E779;
	Thu, 17 Sep 2026 23:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqnQDI7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE48310E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789689573; x=1821225573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S9CPKuuK932LOVm+Tk98RSvduzuLaSeCUwmS3Zv5hIU=;
 b=PqnQDI7Y2XUlerq7ruPdWhfEiKShn8IpgCY9e8CWYqmHnaGbRIbitpZ1
 HIj+AhaKRSdpsE7Zy56chFYOUwaRqkgoUMLC0T86a5WQ+IGhfBfOMs5Ct
 stEygLhjPFFsxfZJuAqMTILGDG5UQ7fRUj4J59fAcg3fEH7t/1TtKO8tj
 WzHkfQukOzky9vptoGtJ2Lp9YIirsAWCklz9MNfjSusuj2br1tmFxdwxk
 6f/+xgh05D0UR69DmpGUt0peD1TTgR4HqWWtHIXivXPlN9LTBsiRGIPUY
 BYfqKCnxrKpT0wBZGU82nj00I3TOYWOBQ+smBJhztnPRiwFGtj7YwF1jX A==;
X-CSE-ConnectionGUID: 40L9ABtuQOauwhmaxMKk0g==
X-CSE-MsgGUID: Bo55ndhBT3y5CqRqJDLQDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77727913"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77727913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:32 -0700
X-CSE-ConnectionGUID: RvS71ASdSLeGVI55usIL1g==
X-CSE-MsgGUID: 0rHah/BkSjatKana4Q+b+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270788214"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v4 4/7] drm/xe/guc: Cleanup error codes and handling for CT
 errors
Date: Thu, 17 Sep 2026 16:59:28 -0700
Message-ID: <20260917235923.1521112-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
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

Instead of always returning -EPROTO for most errors, use different error
codes based on the error type. -EPROTO is retained for the cases that
are genuine protocol violations by the GuC.  The remaining cases now
report what actually went wrong.

receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
two error codes that dequeue_one_g2h() could return on a fatal error.
Invert the check to simplify reset handling.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
v2: (Michal)
- Sync order of errors in g2h_read and __guc_ct_send_locked
- For CT errors use EPIPE and for HXG errors use EPROTO
- Convert the non-fatal EPIPE to EPERM in the helper

v3: (Michal)
- s/EPIPE/EPERM/ in __guc_ct_send_locked
- Add ct_corrupted helper
- Add error documentation
- Remove "reset required" string from logs
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 190 ++++++++++++++++++++++++---------
 1 file changed, 141 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3353515aa874..31ecddab3057 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -37,6 +37,71 @@
 #include "xe_sriov_vf.h"
 #include "xe_trace_guc.h"
 
+/**
+ * DOC: GuC CT Error Codes
+ *
+ * Send path - xe_guc_ct_send(), xe_guc_ct_send_locked(), h2g_write()
+ * ------------------------------------------------------------------
+ *
+ * Channel-state rejections - the message was never queued, nothing is corrupt:
+ *
+ * ``-ENOTRECOVERABLE``: the device is wedged. No CT traffic can make progress
+ *   until the device is recovered.
+ * ``-ENODEV``: the CT channel is disabled. Don't retry until it is enabled.
+ * ``-ECANCELED``: the CT channel is stopped or a GT recovery is pending, so the
+ *   message was dropped. Often benign; retry after the reset/recovery completes.
+ * ``-EPERM``: the H2G CTB is flagged broken and stays unusable until the CT is
+ *   restarted, which clears the flag.
+ *
+ * Internal flow control - never seen by callers, handled by the send helpers:
+ *
+ * ``-EBUSY``: not enough H2G room or G2H credits. Triggers a flush, a wait and
+ *   a retry.
+ * ``-EAGAIN``: the message would wrap the H2G ring, so the tail was NOP-filled
+ *   and reset to 0. The write is reissued immediately.
+ *
+ * Hard failures:
+ *
+ * ``-EPIPE``: H2G descriptor corruption found before writing - non-zero status,
+ *   or head/tail out of range. Marks the CTB broken.
+ * ``-EDEADLK``: H2G credits never recovered after waiting ~1s. An async GT reset
+ *   is requested before this is returned.
+ * ``-EPROTO``: the MMIO CT enable/disable handshake got an unexpected reply.
+ * ``-ENOMEM``: internal allocation failure (fence lookup under GFP_ATOMIC, or the
+ *   G2H workqueue at init). The blocking path retries the allocation with
+ *   GFP_KERNEL.
+ *
+ * Blocking send only (xe_guc_ct_send_recv()) - the H2G went out, the reply is the
+ * problem:
+ *
+ * ``-ETIME``: no G2H response within 1s, even after flushing the G2H worker.
+ * ``-EIO``: the GuC replied RESPONSE_FAILURE; error and hint codes are logged.
+ * ``-ELOOP``: the GuC kept replying NO_RESPONSE_RETRY until the request hit
+ *   GUC_SEND_RETRY_LIMIT. (NO_RESPONSE_BUSY is not an error - the waiter re-arms.)
+ *
+ * Receive path - g2h_read(), parse_g2h_msg(), dequeue_one_g2h()
+ * -------------------------------------------------------------
+ *
+ * Channel-state rejections - the same four codes as the send path, checked against
+ * the G2H CTB. g2h_err_is_fatal() treats exactly these as benign; anything else
+ * declares the CT dead and kicks a reset:
+ *
+ * ``-ENOTRECOVERABLE``: device wedged.
+ * ``-ENODEV``: CT disabled.
+ * ``-ECANCELED``: CT stopped.
+ * ``-EPERM``: G2H CTB already flagged broken.
+ *
+ * Hard failures:
+ *
+ * ``-EPIPE``: G2H descriptor corruption - non-zero status, head/tail out of
+ *   range, or a declared message length larger than the data actually available.
+ * ``-EPROTO``: HXG protocol violation. Either the G2H origin field is not the
+ *   GuC, or a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences aren't
+ *   tracked, so there is no caller to report to and the failure is escalated to a
+ *   reset instead.
+ * ``-EOPNOTSUPP``: G2H carried an HXG type this driver does not handle.
+ */
+
 static void receive_g2h(struct xe_guc_ct *ct);
 static void g2h_worker_func(struct work_struct *w);
 static void safe_mode_worker_func(struct work_struct *w);
@@ -929,6 +994,23 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
 		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
 }
 
+static int ct_corrupted(struct xe_guc_ct *ct, struct guc_ctb *ctb,
+			u32 reason_code, const char *msg, ...)
+{
+	struct va_format vaf;
+	va_list va_args;
+	int err = -EPIPE;
+
+	va_start(va_args, msg);
+	vaf.fmt = msg;
+	vaf.va  = &va_args;
+	xe_gt_err(ct_to_gt(ct), "GUC: CT: %pV", &vaf);
+	va_end(va_args);
+
+	ct_dead_capture(ct, ctb, reason_code);
+	return err;
+}
+
 #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
 
 static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -953,23 +1035,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		u32 desc_status;
 
 		desc_status = desc_read(xe, h2g, status);
-		if (desc_status) {
-			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
-			goto corrupted;
-		}
+		if (desc_status)
+			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
+					    "write: non-zero status: %u\n", desc_status);
 
 		if (tail > h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
-				  tail, h2g->info.size);
-			goto corrupted;
+			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
+					    "write: tail out of range: %u vs %u\n",
+					    tail, h2g->info.size);
 		}
 
 		if (desc_head >= h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
-				  desc_head, h2g->info.size);
-			goto corrupted;
+			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
+					    "write: invalid head offset %u >= %u)\n",
+					    desc_head, h2g->info.size);
 		}
 	}
 
@@ -1034,10 +1115,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 				     desc_read(xe, h2g, head), h2g->info.tail);
 
 	return 0;
-
-corrupted:
-	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
-	return -EPIPE;
 }
 
 static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
@@ -1060,11 +1137,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (unlikely(ct->ctbs.h2g.info.broken)) {
-		ret = -EPIPE;
-		goto out;
-	}
-
 	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
 		ret = -ENODEV;
 		goto out;
@@ -1075,6 +1147,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
+	if (unlikely(ct->ctbs.h2g.info.broken)) {
+		ret = -EPERM;
+		goto out;
+	}
+
 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
 
 	if (g2h_fence) {
@@ -1213,7 +1290,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 
 broken:
-	xe_gt_err(gt, "No forward process on H2G, reset required\n");
+	xe_gt_err(gt, "No forward progress on H2G\n");
 	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
 
 	return -EDEADLK;
@@ -1667,8 +1744,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
-		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
-			  origin);
+		xe_gt_err(gt, "Invalid G2H origin=%u\n", origin);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
 
 		return -EPROTO;
@@ -1686,8 +1762,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
-			  type);
+		xe_gt_err(gt, "Unexpected G2H message type=%u\n", type);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
 
 		ret = -EOPNOTSUPP;
@@ -1808,6 +1883,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
+	/* Keep in sync with g2h_err_is_fatal() */
 	if (xe_device_wedged(xe))
 		return -ENOTRECOVERABLE;
 
@@ -1818,7 +1894,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		return -ECANCELED;
 
 	if (g2h->info.broken)
-		return -EPIPE;
+		return -EPERM;
 
 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
 
@@ -1834,10 +1910,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			desc_status &= ~GUC_CTB_STATUS_DISABLED;
 		}
 
-		if (desc_status) {
-			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
-			goto corrupted;
-		}
+		if (desc_status)
+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
+					    "read: non-zero status: %u\n", desc_status);
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -1858,24 +1933,24 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		 *
 		if (g2h->info.head != desc_head) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
-			xe_gt_err(gt, "CT read: head was modified %u != %u\n",
-				  desc_head, g2h->info.head);
-			goto corrupted;
+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
+					    "read: head was modified %u != %u\n",
+					    desc_head, g2h->info.head);
 		}
 		 */
 
 		if (g2h->info.head > g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
-				  g2h->info.head, g2h->info.size);
-			goto corrupted;
+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
+					    "read: head out of range: %u vs %u\n",
+					    g2h->info.head, g2h->info.size);
 		}
 
 		if (desc_tail >= g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
-				  desc_tail, g2h->info.size);
-			goto corrupted;
+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
+					    "read: invalid tail offset %u >= %u)\n",
+					    desc_tail, g2h->info.size);
 		}
 	}
 
@@ -1892,11 +1967,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
 			   sizeof(u32));
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
-	if (len > avail) {
-		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
-			  avail, len);
-		goto corrupted;
-	}
+	if (len > avail)
+		return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
+				    "G2H channel broken on read, avail=%d, len=%d\n",
+				    avail, len);
 
 	head = (g2h->info.head + 1) % g2h->info.size;
 	avail = len - 1;
@@ -1942,10 +2016,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			     action, len, g2h->info.head, tail);
 
 	return len;
-
-corrupted:
-	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
-	return -EPROTO;
 }
 
 static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
@@ -2037,6 +2107,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 	return 1;
 }
 
+/*
+ * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
+ * is simply not available right now, which is expected and handled gracefully,
+ * or the channel state or the message itself is inconsistent, in which case the
+ * only way forward is to declare the CT dead and reset the GuC. Since the
+ * former is a short and well known list, check against that and treat anything
+ * else as fatal, so that new error codes don't silently escape the escalation.
+ */
+static bool g2h_err_is_fatal(int err)
+{
+	switch (err) {
+	case -ENOTRECOVERABLE:	/* device wedged */
+	case -ENODEV:		/* CT disabled */
+	case -ECANCELED:	/* CT stopped */
+	case -EPERM:		/* CT already declared broken */
+		return false;
+	default:
+		return true;
+	}
+}
+
 static void receive_g2h(struct xe_guc_ct *ct)
 {
 	bool ongoing;
@@ -2074,8 +2165,9 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		ret = dequeue_one_g2h(ct);
 		mutex_unlock(&ct->lock);
 
-		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
+		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT reset(%pe)\n",
+				  ERR_PTR(ret));
 			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
-- 
2.55.0

