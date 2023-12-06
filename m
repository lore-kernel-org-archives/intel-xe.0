Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E9C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 21:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4AA10E7AD;
	Wed,  6 Dec 2023 21:14:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2278E10E7AD
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701897285; x=1733433285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cmhL88NuVDInD2zVyW3Pq3cVtHpb7PXsr1OmkBmEFic=;
 b=NEr4yo+PLT5RbDJ8nYPjXfyT76DnE7QHPVlcWF/VtYOj9NhDgn/Invia
 myB5PRAqTlVol4jPmBlJML//kL7jVa0VZbzik33KiS+7augmjKb04ANVh
 WxIX6LA+mK+gMTBUBMBny615BK+4d3d4Xlsr6xSEz6IyJqMomuKt6H3/H
 YRH4qUyA+lcagMGZA+ySNKGRzYKuTFr7F+a4JyCZzvfhZn/rbxCv05K8G
 QHOIJ0Vy7kCSpCt03bbpfMBYoD4g0Le9GqVMfSYbsvo1EkbIlCxYqtuRG
 3N0BXYJ1H+DLc1P1bo/JyXG5HSvoqSXz7JzjgBwnIB1f/oPh6qw9mnin/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458453635"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="458453635"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805772112"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="805772112"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:14:44 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 13:14:41 -0800
Message-ID: <20231206211441.3092072-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc: Use FAST_REQUEST for non-blocking
 H2G messages
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

We're currently sending non-blocking H2G messages using the EVENT type,
which suppresses all CTB protocol replies from the GuC, including the
failure cases. This might cause errors to slip through and manifest as
unexpected behavior (e.g. a context state might not be what the driver
thinks it is because the state change command was silently rejected by
the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
type instead, which suppresses the reply only on success; this way we
still get the advantage of not having to wait for an ack from the GuC
(i.e. the H2G is still non-blocking) while still detecting errors.
Since we can't escalate to the caller when a non-blocking message
fails, we need to escalate to GT reset instead.

Note that FAST_REQUEST failures are NOT expected and are usually a sign
that the H2G was either malformed or requested an illegal operation.

v2: assign fence values to FAST_REQUEST messages, fix abi doc, use xe_gt
printers (Michal).

v3: fix doc alignment, fix and improve prints (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2
---
 drivers/gpu/drm/xe/abi/guc_messages_abi.h |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 58 ++++++++++++++++++++---
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
index 3d199016cf88..ff888d16bd4f 100644
--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
@@ -24,6 +24,7 @@
  *  |   | 30:28 | **TYPE** - message type                                      |
  *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
  *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
+ *  |   |       |   - _`GUC_HXG_TYPE_FAST_REQUEST` = 2                         |
  *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
  *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
  *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
@@ -46,6 +47,7 @@
 #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
 #define   GUC_HXG_TYPE_REQUEST			0u
 #define   GUC_HXG_TYPE_EVENT			1u
+#define   GUC_HXG_TYPE_FAST_REQUEST		2u
 #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
 #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
 #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 24a33fa36496..2fb9be5ea132 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -17,6 +17,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_submit.h"
@@ -448,7 +449,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
 	} else {
 		cmd[1] =
-			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
+			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
 			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
 				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
 	}
@@ -475,11 +476,31 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return 0;
 }
 
+/*
+ * The CT protocol accepts a 16 bits fence. This field is fully owned by the
+ * driver, the GuC will just copy it to the reply message. Since we need to
+ * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
+ * we use one bit of the seqno as an indicator for that and a rolling counter
+ * for the remaining 15 bits.
+ */
+#define CT_SEQNO_MASK GENMASK(14, 0)
+#define CT_SEQNO_IS_UNTRACKED BIT(15)
+static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
+{
+	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
+
+	if (!is_g2h_fence)
+		seqno |= CT_SEQNO_IS_UNTRACKED;
+
+	return seqno;
+}
+
 static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence)
 {
 	struct xe_device *xe = ct_to_xe(ct);
+	u16 seqno;
 	int ret;
 
 	xe_assert(xe, !g2h_len || !g2h_fence);
@@ -505,7 +526,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		if (g2h_fence_needs_alloc(g2h_fence)) {
 			void *ptr;
 
-			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
+			g2h_fence->seqno = next_ct_seqno(ct, true);
 			ptr = xa_store(&ct->fence_lookup,
 				       g2h_fence->seqno,
 				       g2h_fence, GFP_ATOMIC);
@@ -514,6 +535,10 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				goto out;
 			}
 		}
+
+		seqno = g2h_fence->seqno;
+	} else {
+		seqno = next_ct_seqno(ct, false);
 	}
 
 	if (g2h_len)
@@ -523,8 +548,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	if (unlikely(ret))
 		goto out_unlock;
 
-	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
-			!!g2h_fence);
+	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
 	if (unlikely(ret)) {
 		if (ret == -EAGAIN)
 			goto retry;
@@ -786,7 +810,8 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
-	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt =  ct_to_gt(ct);
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
 	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
 	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
@@ -794,10 +819,31 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	lockdep_assert_held(&ct->lock);
 
+	/*
+	 * Fences for FAST_REQUEST messages are not tracked in ct->fence_lookup.
+	 * Those messages should never fail, so if we do get an error back it
+	 * means we're likely doing an illegal operation and the GuC is
+	 * rejecting it. We have no way to inform the code that submitted the
+	 * H2G that the message was rejected, so we need to escalate the
+	 * failure to trigger a reset.
+	 */
+	if (fence & CT_SEQNO_IS_UNTRACKED) {
+		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
+			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
+				  fence,
+				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
+				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
+		else
+			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
+				  type, fence);
+
+		return -EPROTO;
+	}
+
 	g2h_fence = xa_erase(&ct->fence_lookup, fence);
 	if (unlikely(!g2h_fence)) {
 		/* Don't tear down channel, as send could've timed out */
-		drm_warn(&xe->drm, "G2H fence (%u) not found!\n", fence);
+		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
 		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 		return 0;
 	}
-- 
2.43.0

