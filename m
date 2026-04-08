Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4324810F996A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 18:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059F510E6BF;
	Wed,  8 Apr 2026 18:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcZHnXJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453CE10E6BF
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 18:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775672507; x=1807208507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z7//5ynE+BXX6mWHguUlYwC36YHZDOMF/6bS+Nya/nY=;
 b=GcZHnXJd+/0KVJthlu9K0a641/u4qkfI71qNqC+N124w2fejU0LqFBHz
 bCLYiP2Hjn9WPdvzabyZjnBhwE5nlmNh145GsI7x6R5nF5tJ51jbAqf3W
 Ah4v21DSOi3yLuKi3kkYmfdE/5AX7W3hmXztXsQEldUFyb3IiX9UuNoXj
 XwStY0nddwb3apxpgnma/sp5BwDjLYW/B+llXNPPd4uJ46rUPdCV7zRcO
 PBfDM61kzIfoclgQ2AP2tOKQteYHg1Zs+GMO7HSm8FmZCCLVyHDf4VtXR
 jrgN95SYMZYAnYw4LcKAeNOxh3XxrfkNBjegRKW9UVCeZnDGzaZ2dSyMn w==;
X-CSE-ConnectionGUID: FmW/80dLTb2SQ6+fO33IHA==
X-CSE-MsgGUID: hYCiiNCmQJ2OeEbtKbjzIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76547342"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76547342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 11:21:46 -0700
X-CSE-ConnectionGUID: +MBXsZOxR/OuFlnkbUsVKg==
X-CSE-MsgGUID: 1aGXTi0iSU2X9LN5jMe0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="228429139"
Received: from engyeong-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.6])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 11:21:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
Date: Wed,  8 Apr 2026 20:21:30 +0200
Message-ID: <20260408182130.9305-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

We only have support for G2H NO_RESPONSE_BUSY messages over MMIO,
but it turned out that GuC also uses that type of messages in CTB.

The following error was recently observed on BMG after adding VGT
policy updates to the GT restart sequence:

 [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required
 [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: CT dequeue failed: -95
 ...
 [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: Timed out wait for G2H, fence 21965, action 5502, done no
 [] xe 0000:03:00.0: [drm] PF: Tile0: GT1: Failed to push 1 policy KLV (-ETIME)
 [] xe 0000:03:00.0: [drm] Tile0: GT1: { key 0x8004 : no value } # engine_group_config

where type=3 was this unrecognized NO_RESPONSE_BUSY message.

Note that GuC might send the real RESPONSE message right after
the BUSY message, so we must be prepared to update our g2h_fence
data twice before sender actually wakes up and clears the flags.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/shard-bmg-9/igt@xe_exec_reset@gt-reset.html
---
v2: rename helper, add more in-code comments (Daniele)
    add and use g2h_fence.counter field (Michal)
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a11cff7a20be..ad8f28d255a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -186,13 +186,16 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
 struct g2h_fence {
 	u32 *response_buffer;
 	u32 seqno;
+	/* fields below this point are setup based on the response */
 	u32 response_data;
 	u16 response_len;
 	u16 error;
 	u16 hint;
 	u16 reason;
+	u32 counter;
 	bool cancel;
 	bool retry;
+	bool wait;
 	bool fail;
 	bool done;
 };
@@ -204,6 +207,11 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 	g2h_fence->seqno = ~0x0;
 }
 
+static void g2h_fence_reinit(struct g2h_fence *g2h_fence)
+{
+	memset_after(g2h_fence, 0, seqno);
+}
+
 static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
 {
 	g2h_fence->cancel = true;
@@ -1331,6 +1339,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
 	 * and g2h_fence_cancel.
 	 */
+wait_again:
 	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
@@ -1356,6 +1365,14 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		return -ETIME;
 	}
 
+	if (g2h_fence.wait) {
+		xe_gt_dbg(gt, "H2G action %#x busy: counter %u\n",
+			  action[0], g2h_fence.counter);
+		/* we can't leave any response data if we want to wait again */
+		g2h_fence_reinit(&g2h_fence);
+		mutex_unlock(&ct->lock);
+		goto wait_again;
+	}
 	if (g2h_fence.retry) {
 		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
 			  action[0], g2h_fence.reason);
@@ -1508,7 +1525,12 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		return -EPROTO;
 	}
 
-	g2h_fence = xa_erase(&ct->fence_lookup, fence);
+	/* don't erase as we still expect a final response with the same fence */
+	if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY)
+		g2h_fence = xa_load(&ct->fence_lookup, fence);
+	else
+		g2h_fence = xa_erase(&ct->fence_lookup, fence);
+
 	if (unlikely(!g2h_fence)) {
 		/* Don't tear down channel, as send could've timed out */
 		/* CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN); */
@@ -1519,6 +1541,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	xe_gt_assert(gt, fence == g2h_fence->seqno);
 
+	/* reinit as we might have already process this g2h_fence before */
+	g2h_fence_reinit(g2h_fence);
+
 	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 		g2h_fence->fail = true;
 		g2h_fence->error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]);
@@ -1526,6 +1551,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		g2h_fence->retry = true;
 		g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
+	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
+		g2h_fence->wait = true;
+		g2h_fence->counter = FIELD_GET(GUC_HXG_BUSY_MSG_0_COUNTER, hxg[0]);
 	} else if (g2h_fence->response_buffer) {
 		g2h_fence->response_len = hxg_len;
 		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
@@ -1533,7 +1561,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
 	}
 
-	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
+	/* don't release any space if it was an intermediate message */
+	if (!g2h_fence->wait)
+		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
 	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
 	WRITE_ONCE(g2h_fence->done, true);
@@ -1570,6 +1600,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
 	case GUC_HXG_TYPE_RESPONSE_FAILURE:
 	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
+	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-- 
2.47.1

