Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B22E7E368
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 20:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE60910E01F;
	Fri,  3 Apr 2026 20:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwEfvwFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1BF10E01F
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 20:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775249086; x=1806785086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H3gSFJZpWkuu415MPmxT5UPQsdCzSmRRUoRtaZJIdEw=;
 b=CwEfvwFgyJ+v5tdW/vmhhCXmvOL8TA8exA5Hq0aevdpo0js6zgHdcgsu
 COPib6o3l7wqdTo+tELZh591uk8i3DQmRktxmAxMTy8dPFKcqAprCc+LV
 thiUaRFVkvrdOcHbiYSak+2XDbRSksKdYNx+YUfYQN5NAb4THf4qnZeo6
 XHvwUfBM70SmLGR8LsYyUHjHic7awuM2tbXYf8hDYqd55s+MEdV0aa8l+
 7zlUs+hauuUcyRRB/HK+nXzIBD/D8XC/UHwDLFbsAhiPobPW6sjHyEGQX
 jea8SCxX9mgRHlY8za9ghrQOMmX+rGLBG1YX5LMz5s+B1N6Aj2SY4HzQo g==;
X-CSE-ConnectionGUID: pVNQLPJmRK+lBkNE6d7BKg==
X-CSE-MsgGUID: az78g8q8QrmSHsAHf9WUVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="75484020"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="75484020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 13:44:46 -0700
X-CSE-ConnectionGUID: +xsCfHmlRhmXJ5zahD/yAw==
X-CSE-MsgGUID: niYX++Y/QiWN8yyRn6rGpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="226492165"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 13:44:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
Date: Fri,  3 Apr 2026 22:44:32 +0200
Message-ID: <20260403204433.5765-1-michal.wajdeczko@intel.com>
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
---
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/shard-bmg-9/igt@xe_exec_reset@gt-reset.html
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a11cff7a20be..19305acb98e4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -186,6 +186,7 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
 struct g2h_fence {
 	u32 *response_buffer;
 	u32 seqno;
+	/* fields below this point are setup based on the response */
 	u32 response_data;
 	u16 response_len;
 	u16 error;
@@ -193,6 +194,7 @@ struct g2h_fence {
 	u16 reason;
 	bool cancel;
 	bool retry;
+	bool wait;
 	bool fail;
 	bool done;
 };
@@ -204,6 +206,11 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 	g2h_fence->seqno = ~0x0;
 }
 
+static void g2h_fence_void(struct g2h_fence *g2h_fence)
+{
+	memset_after(g2h_fence, 0, seqno);
+}
+
 static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
 {
 	g2h_fence->cancel = true;
@@ -1331,6 +1338,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
 	 * and g2h_fence_cancel.
 	 */
+wait_again:
 	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
@@ -1356,6 +1364,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		return -ETIME;
 	}
 
+	if (g2h_fence.wait) {
+		xe_gt_dbg(gt, "H2G action %#x busy...\n", action[0]);
+		g2h_fence_void(&g2h_fence);
+		mutex_unlock(&ct->lock);
+		goto wait_again;
+	}
 	if (g2h_fence.retry) {
 		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
 			  action[0], g2h_fence.reason);
@@ -1508,7 +1522,12 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
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
@@ -1518,6 +1537,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	xe_gt_assert(gt, fence == g2h_fence->seqno);
+	g2h_fence_void(g2h_fence);
 
 	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 		g2h_fence->fail = true;
@@ -1526,6 +1546,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		g2h_fence->retry = true;
 		g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
+	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
+		g2h_fence->wait = true;
+		g2h_fence->reason = FIELD_GET(GUC_HXG_BUSY_MSG_0_COUNTER, hxg[0]);
 	} else if (g2h_fence->response_buffer) {
 		g2h_fence->response_len = hxg_len;
 		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
@@ -1533,7 +1556,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
 	}
 
-	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
+	if (!g2h_fence->wait)
+		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
 	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
 	WRITE_ONCE(g2h_fence->done, true);
@@ -1570,6 +1594,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
 	case GUC_HXG_TYPE_RESPONSE_FAILURE:
 	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
+	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-- 
2.47.1

