Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5BFC61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E4410EF2C;
	Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dE1IljQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5A710EF2C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788297133; x=1819833133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Drk9JC5xzJUYUtwERpqJ1w7Pq800tvhGRoG8Thoscc=;
 b=dE1IljQJGPpZJVj2QGmbiVt+WzIbILQZwmGjXNLkfvmtm7jmb6IrZm/k
 T6jH9HwP47HrOVkpAbGl7DiL/00lBroM1+I/zeMhKd0feA2nTc/dDjROs
 CZX+NrXGhOSfpKlbmw6pUl9+Z4T4K17SAyH4/tRNhMfgKVJie18Z1GY/X
 P7ohEwhPbqZLyygp+wggSTcSN3PyXOvXCpTy1TSWHjmdZ4VaoUojnWlV3
 4ryPbwOXM09x9Wsgj2zT/y9xcqDb7yILbJEWdw3u33byqbiZ4hYQe8p7l
 Gtg+O4afPkTxoHHfls+Y+vrJs9pCtURlZbzoRgFVF55PqZOprg6FXFlIu Q==;
X-CSE-ConnectionGUID: gUf6QsfdTMmB046MprXGyw==
X-CSE-MsgGUID: 2J+BHqi6SuGLoxf+K9Cowg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92562329"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="92562329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
X-CSE-ConnectionGUID: zT8OkS3GRWSFVw7eyWuKtg==
X-CSE-MsgGUID: L84ImuMmRkmTZvkFQm4NWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="272988129"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v2 2/5] drm/xe/guc: Use different error codes for CT errors
Date: Tue,  1 Sep 2026 14:12:07 -0700
Message-ID: <20260901211204.131972-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 48 +++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..dcd457f38b89 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	u32 cmd[H2G_CT_HEADERS];
 	u32 tail = h2g->info.tail;
 	u32 full_len;
+	int err;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
 
@@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 		desc_status = desc_read(xe, h2g, status);
 		if (desc_status) {
+			err = -EPROTO;
 			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
 			goto corrupted;
 		}
 
 		if (tail > h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			err = -EPROTO;
 			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
 				  tail, h2g->info.size);
 			goto corrupted;
@@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 		if (desc_head >= h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			err = -EPIPE;
 			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
 				  desc_head, h2g->info.size);
 			goto corrupted;
@@ -1591,14 +1595,19 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	 * failure to trigger a reset.
 	 */
 	if (fence & CT_SEQNO_UNTRACKED) {
-		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
+		int err;
+
+		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
+			err = -EBADE;
 			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
 				  fence,
 				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
 				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
-		else
+		} else {
+			err = -EPROTO;
 			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
 				  type, fence);
+		}
 
 		fast_req_report(ct, fence);
 
@@ -1608,7 +1617,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
-		return -EPROTO;
+		return err;
 	}
 
 	/* don't erase as we still expect a final response with the same fence */
@@ -1809,10 +1818,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	s32 avail;
 	u32 action;
 	u32 *hxg;
+	int err;
 
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
+	/* Keep in sync with g2h_err_is_fatal() */
 	if (xe_device_wedged(xe))
 		return -ENOTRECOVERABLE;
 
@@ -1840,6 +1851,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		}
 
 		if (desc_status) {
+			err = -EIO;
 			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
 			goto corrupted;
 		}
@@ -1871,6 +1883,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 		if (g2h->info.head > g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			err = -ERANGE;
 			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
 				  g2h->info.head, g2h->info.size);
 			goto corrupted;
@@ -1878,6 +1891,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 		if (desc_tail >= g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			err = -ERANGE;
 			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
 				  desc_tail, g2h->info.size);
 			goto corrupted;
@@ -1898,6 +1912,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			   sizeof(u32));
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
+		err = -EBADMSG;
 		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
 			  avail, len);
 		goto corrupted;
@@ -1950,7 +1965,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 corrupted:
 	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
-	return -EPROTO;
+	return err;
 }
 
 static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
@@ -2042,6 +2057,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
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
+	case -EPIPE:		/* CT already declared broken */
+		return false;
+	default:
+		return true;
+	}
+}
+
 static void receive_g2h(struct xe_guc_ct *ct)
 {
 	bool ongoing;
@@ -2079,8 +2115,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		ret = dequeue_one_g2h(ct);
 		mutex_unlock(&ct->lock);
 
-		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
+		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
 			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
-- 
2.55.0

