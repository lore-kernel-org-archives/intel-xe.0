Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEC7C76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 21:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8658F10EE4A;
	Fri,  7 Apr 2023 21:12:41 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA9310EE4A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680901959; x=1712437959;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2uYKht5uENaxHOIg+JCkYjd57CO0Qat5qDKA52IMZVc=;
 b=kD8egFL4DaNk30sU9qrrb0PJyX7+njFQtaOadD33U73KzJZSz511Fq5h
 kRTYAWZsXSZT6P2Mm+O4E8bytOnJx+oarP5j2oodq+UhQiiJpJjG/MvTG
 eMCHIdAFRwWYPbvW58pDuogfgPYpdscgr+UFbVlKzNQ1WqcnTLIZGjZNR
 d0Q2i8iCWxPGbx1SU6J6Xm1K3mV8AiktgbuXPTGAjifqNXDcrMj9YC+fl
 k4PYhANoJQZFTVjGZuV5FMIWA+QnjrfMK957WJpohL1Eqzgi8cD0zfe1K
 /9kVp+v+/4A2kXr3dxMrMiYgu3GCiPmIdcK+k/3/Wjccfi0gDBnsWpXra A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="322705554"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="322705554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 14:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717956136"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="717956136"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 14:12:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  7 Apr 2023 14:12:31 -0700
Message-Id: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The wait_event_timeout() on g2h_fence.wq which is declared on
stack can return before the wake_up() gets called, resulting in a
stack out of bound access when wake_up() accesses the g2h_fene.wq.

Do not declare g2h_fence related wait_queue_head_t on stack.

Fixes the below KASAN BUG and associated kernel crashes.

BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0
Read of size 4 at addr ffff88826252f4ac by task kworker/u128:5/467

CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
Workqueue: events_unbound g2h_worker_func [xe]
Call Trace:
 <TASK>
 dump_stack_lvl+0x64/0xb0
 print_report+0xc2/0x600
 kasan_report+0x96/0xc0
 do_raw_spin_lock+0x6f/0x1e0
 _raw_spin_lock_irqsave+0x47/0x60
 __wake_up_common_lock+0xc0/0x150
 dequeue_one_g2h+0x20f/0x6a0 [xe]
 g2h_worker_func+0xa9/0x180 [xe]
 process_one_work+0x527/0x990
 worker_thread+0x2d1/0x640
 kthread+0x174/0x1b0
 ret_from_fork+0x29/0x50
 </TASK>

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 7 +++----
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5e00b75d3ca2..9055ff133a7c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -23,7 +23,6 @@
 
 /* Used when a CT send wants to block and / or receive data */
 struct g2h_fence {
-	wait_queue_head_t wq;
 	u32 *response_buffer;
 	u32 seqno;
 	u16 response_len;
@@ -142,6 +141,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	ct->fence_context = dma_fence_context_alloc(1);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
 	init_waitqueue_head(&ct->wq);
+	init_waitqueue_head(&ct->g2h_fence_wq);
 
 	primelockdep(ct);
 
@@ -484,7 +484,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 			void *ptr;
 
 			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
-			init_waitqueue_head(&g2h_fence->wq);
 			ptr = xa_store(&ct->fence_lookup,
 				       g2h_fence->seqno,
 				       g2h_fence, GFP_ATOMIC);
@@ -709,7 +708,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		return ret;
 	}
 
-	ret = wait_event_timeout(g2h_fence.wq, g2h_fence.done, HZ);
+	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
 	if (!ret) {
 		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
 			g2h_fence.seqno, action[0]);
@@ -801,7 +800,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	g2h_fence->done = true;
 	smp_mb();
 
-	wake_up(&g2h_fence->wq);
+	wake_up_all(&ct->g2h_fence_wq);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index e0f9063e9b65..fd27dacf00c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -74,6 +74,8 @@ struct xe_guc_ct {
 	struct xarray fence_lookup;
 	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
 	wait_queue_head_t wq;
+	/** @g2h_fence_wq: wait queue used for G2H fencing */
+	wait_queue_head_t g2h_fence_wq;
 #ifdef XE_GUC_CT_SELFTEST
 	/** @suppress_irq_handler: force flow control to sender */
 	bool suppress_irq_handler;
-- 
2.21.0.rc0.32.g243a4c7e27

