Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00137EC1104
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 16:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B836B10E3EB;
	Mon, 23 Feb 2026 16:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CawIuejW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E24310E3EB
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771864125; x=1803400125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqyhGAdZ1w6L9tkg8yso1eXH5MnZ+Q6fpAHEoa3LM7g=;
 b=CawIuejW4Vh/7i30MoM0tFgTrrYrmZVXR7wZnqujvmOfKaCjaPPF6gDj
 pPw4mqMMZEaxaAmj8CRUWVShXTxpXDryefmQFDl8Pc1OkFZoK+viQrTE/
 GrsDvr5v8bYvtIShNQ/JcQw8ylydB4d4BUOxW39QF2HDytmY7MdIJNdcB
 PER32tl8F+2NVHgLu8+b5wL8DA/yQ3r+dci1Ke/1dyfcnI816QkBZfkYm
 Ng8jgqqUP5i/LANVPfR1opKKB6YUVw3qleDIiwfzv8cHsnOZq9pXWN0C7
 VwWINAJGM/ej24SzanSVfA6t2Sfj0KBDWv/lKBZBHd5CdbAKX5+Xr3rfl A==;
X-CSE-ConnectionGUID: dfU3GYA6R3m6j2EaqkO2sQ==
X-CSE-MsgGUID: d7oE0hlyTjK8DJlSqz3C3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72073330"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72073330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:28:45 -0800
X-CSE-ConnectionGUID: /JOcF9Y8Q/iSwzuMzkRZoA==
X-CSE-MsgGUID: uglHwVQpTpqTdRkGGOitNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220609637"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 08:28:43 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Refine CT queue checks and log formatting
Date: Mon, 23 Feb 2026 16:23:53 +0000
Message-ID: <20260223162350.3205364-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223162350.3205364-4-shuicheng.lin@intel.com>
References: <20260223162350.3205364-4-shuicheng.lin@intel.com>
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

Fix three code-level cleanups in xe_guc_ct.c:

- Use SZ_4K for the queue size alignment assertion in
  xe_guc_ct_queue_proc_time_jiffies().
- Drop an unused local variable in guc_ct_send_wait_for_retry().
- Add missing trailing newlines in CT error/warn log messages.

These changes keep behavior unchanged while improving correctness checks
and log formatting.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 1c37813d2ccd..d0f0586121bc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -275,7 +275,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
  */
 long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
 {
-	BUILD_BUG_ON(!IS_ALIGNED(CTB_H2G_BUFFER_SIZE, SZ_4));
+	BUILD_BUG_ON(!IS_ALIGNED(CTB_H2G_BUFFER_SIZE, SZ_4K));
 	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
 }
 
@@ -1126,7 +1126,6 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
 						 len + GUC_CTB_HDR_LEN);
 		*sleep_total_ms += xe_sleep_exponential_ms(sleep_period_ms, 64);
 	} else {
-		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
 		int ret;
 
@@ -1148,7 +1147,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
 		ret = dequeue_one_g2h(ct);
 		if (ret < 0) {
 			if (ret != -ECANCELED)
-				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
+				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)\n",
 					  ERR_PTR(ret));
 			return false;
 		}
@@ -1324,7 +1323,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	 */
 	mutex_lock(&ct->lock);
 	if (!ret) {
-		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s",
+		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s\n",
 			  g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
 		xa_erase(&ct->fence_lookup, g2h_fence.seqno);
 		mutex_unlock(&ct->lock);
@@ -1834,7 +1833,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
 	default:
-		xe_gt_warn(gt, "NOT_POSSIBLE");
+		xe_gt_warn(gt, "NOT_POSSIBLE\n");
 	}
 
 	if (ret) {
@@ -1937,7 +1936,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		mutex_unlock(&ct->lock);
 
 		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d", ret);
+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
 			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
-- 
2.50.1

