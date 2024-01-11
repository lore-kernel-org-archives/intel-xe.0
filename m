Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69467C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 21:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351DA10E0C6;
	Thu, 11 Jan 2024 21:06:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF5B10E0C6
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 21:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705007211; x=1736543211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GevOneAd5CcmKqDPZQte3X+UTL00ySpXnJBuc2InfWg=;
 b=U9yT5QTWRihAkY4gGT0eIGHd3aip4sUeMgttQPd5IUoxRppJbcP8cHiE
 a9ng1TCwRkDqAWuzP/0S7QpXZ3ST88HTawv9ALZexyFZzsQY1d5BN30ep
 P584LF0iVRUZET3PQ64SS/mIMzS94lis6m5svdLskHMruHAntZejNajCx
 y4k8GgTQtL4BCIgwmJi4y/WFakjD4lSFPzCxf+DfznuQ9r/hGOP3oMyR0
 KMUO4G0In9Y0za1SEQ/VYazwcwwWCX/V8uQ39PdrqM8+Y6hJetkiqYhbH
 oEUh4jDpJ3XPXoxu6Ua6Avh91XsAsasez4szVXFVmeZb2gOTdkCzX0awp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12479351"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="12479351"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 13:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="816857637"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="816857637"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.229])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 13:06:47 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/guc: Use HXG definitions on HXG messages
Date: Thu, 11 Jan 2024 22:06:32 +0100
Message-Id: <20240111210632.717-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

While parsing and processing CTB G2H messages we should extract
underlying HXG message and use HXG definitions on such message.
Using outer CTB layer message in HXG definitions require use of
shifted dword index, which might be confusing:

	FIELD_GET(GUC_HXG_MSG_0_xxx, msg[1])

instead of:

	FIELD_GET(GUC_HXG_MSG_0_xxx, hxg[0])

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: s/msg_len_to_hxg/msg_len_to_hxg_len (Matt)
    be consistent on hxg constness (Matt)
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 72 +++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index d490a4d42c01..b2cc3f993eb6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -796,9 +796,20 @@ int xe_guc_ct_send_recv_no_fail(struct xe_guc_ct *ct, const u32 *action,
 	return guc_ct_send_recv(ct, action, len, response_buffer, true);
 }
 
+static u32 *msg_to_hxg(u32 *msg)
+{
+	return msg + GUC_CTB_MSG_MIN_LEN;
+}
+
+static u32 msg_len_to_hxg_len(u32 len)
+{
+	return len - GUC_CTB_MSG_MIN_LEN;
+}
+
 static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
-	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
+	u32 *hxg = msg_to_hxg(msg);
+	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
 
 	lockdep_assert_held(&ct->lock);
 
@@ -817,9 +828,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_gt *gt =  ct_to_gt(ct);
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
+	u32 *hxg = msg_to_hxg(msg);
+	u32 hxg_len = msg_len_to_hxg_len(len);
 	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
-	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
+	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
 	struct g2h_fence *g2h_fence;
 
 	lockdep_assert_held(&ct->lock);
@@ -836,8 +848,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
 			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
 				  fence,
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
+				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
+				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
 		else
 			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
 				  type, fence);
@@ -857,18 +869,14 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 		g2h_fence->fail = true;
-		g2h_fence->error =
-			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
-		g2h_fence->hint =
-			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
+		g2h_fence->error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]);
+		g2h_fence->hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]);
 	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		g2h_fence->retry = true;
-		g2h_fence->reason =
-			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
+		g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
 	} else if (g2h_fence->response_buffer) {
-		g2h_fence->response_len = response_len;
-		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
-		       response_len * sizeof(u32));
+		g2h_fence->response_len = hxg_len;
+		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
 	}
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
@@ -884,14 +892,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_device *xe = ct_to_xe(ct);
-	u32 hxg, origin, type;
+	u32 *hxg = msg_to_hxg(msg);
+	u32 origin, type;
 	int ret;
 
 	lockdep_assert_held(&ct->lock);
 
-	hxg = msg[1];
-
-	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
+	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
 		drm_err(&xe->drm,
 			"G2H channel broken on read, origin=%d, reset required\n",
@@ -901,7 +908,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		return -EPROTO;
 	}
 
-	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg);
+	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
 	switch (type) {
 	case GUC_HXG_TYPE_EVENT:
 		ret = parse_g2h_event(ct, msg, len);
@@ -927,14 +934,19 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
-	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
-	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
-	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
+	u32 hxg_len = msg_len_to_hxg_len(len);
+	u32 *hxg = msg_to_hxg(msg);
+	u32 action, adj_len;
+	u32 *payload;
 	int ret = 0;
 
-	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
 		return 0;
 
+	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
+	payload = hxg + GUC_HXG_EVENT_MSG_MIN_LEN;
+	adj_len = hxg_len - GUC_HXG_EVENT_MSG_MIN_LEN;
+
 	switch (action) {
 	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
 		ret = xe_guc_sched_done_handler(guc, payload, adj_len);
@@ -995,6 +1007,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	u32 tail, head, len;
 	s32 avail;
 	u32 action;
+	u32 *hxg;
 
 	lockdep_assert_held(&ct->fast_lock);
 
@@ -1045,10 +1058,11 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 				   avail * sizeof(u32));
 	}
 
-	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
+	hxg = msg_to_hxg(msg);
+	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
 
 	if (fast_path) {
-		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
+		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
 			return 0;
 
 		switch (action) {
@@ -1074,9 +1088,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
-	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
-	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
-	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
+	u32 hxg_len = msg_len_to_hxg_len(len);
+	u32 *hxg = msg_to_hxg(msg);
+	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
+	u32 *payload = hxg + GUC_HXG_MSG_MIN_LEN;
+	u32 adj_len = hxg_len - GUC_HXG_MSG_MIN_LEN;
 	int ret = 0;
 
 	switch (action) {

base-commit: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052
-- 
2.25.1

