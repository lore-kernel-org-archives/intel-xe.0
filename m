Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135CC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 09:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD8B10E214;
	Mon, 27 Nov 2023 09:45:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBFA10E214
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 09:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701078339; x=1732614339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e50vItlL+6deG2I6fvaS46Oh0ja5sM5/4zoC4DXnzvc=;
 b=B7hj9efeVMW73D1YUQV11qvaq9Q5KSCRZkrLFZ5j/V1tZp4ZCh3UmmbA
 TxaSDTm6gtluHWE1ISAGRO4T7d5vcJ0scUSmcx9qkh8OL1zK4rtnWwHll
 7FLaYyDCMGVOhA84arTPF6S2uienY4e6XQY6JJqcN3W5rQKG/vgDzWkjn
 tiCN7fPCnaUOXHvCF5UgYYh8+ZLLGghFME7BcF7WPW62QNOKC37vO3fJr
 ZGjYtXJa5hSaCZghVF8cPMZ9CeD4bYYVCZRzfo5ISPIAFKjWCFDbOtYEJ
 5ZEooMzYhIaJ38o1rc4DPPBNNBIS9TTFl+wlX76DxgW7t04x4ZH6O9azR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5855184"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5855184"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 01:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885967275"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="885967275"
Received: from akoukoun-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.7.175])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 01:45:37 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 09:44:59 +0000
Message-ID: <20231127094458.18130-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: fix mem_access for early lrc
 generation
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We spawn some hw queues during device probe to generate the default LRC
for every engine type, however the queue destruction step is typically
async. Queue destruction needs to do stuff like GuC context deregister
which requires GuC CT, which in turn requires an active mem_access ref.
The caller during probe is meant to hold the mem_access token, however
due to the async destruction it might have already been dropped if we
are unlucky.

Similar to how we already handle migrate VMs for which there is no
mem_access ref, fix this by keeping the callers token alive, releasing
it only when destroying the queue. We can treat a NULL vm as indication
that we need to grab our own extra ref.

Fixes the following splat sometimes during load:

[ 1682.899930] WARNING: CPU: 1 PID: 8642 at drivers/gpu/drm/xe/xe_device.c:537 xe_device_assert_mem_access+0x27/0x30 [xe]
[ 1682.900209] CPU: 1 PID: 8642 Comm: kworker/u24:97 Tainted: G     U  W   E    N 6.6.0-rc3+ #6
[ 1682.900214] Workqueue: submit_wq xe_sched_process_msg_work [xe]
[ 1682.900303] RIP: 0010:xe_device_assert_mem_access+0x27/0x30 [xe]
[ 1682.900388] Code: 90 90 90 66 0f 1f 00 0f 1f 44 00 00 53 48 89 fb e8 1e 6c 03 00 48 85 c0 74 06 5b c3 cc cc cc cc 8b 83 28 23 00 00 85 c0 75 f0 <0f> 0b 5b c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90
[ 1682.900390] RSP: 0018:ffffc900021cfb68 EFLAGS: 00010246
[ 1682.900394] RAX: 0000000000000000 RBX: ffff8886a96d8000 RCX: 0000000000000000
[ 1682.900396] RDX: 0000000000000001 RSI: ffff8886a6311a00 RDI: ffff8886a96d8000
[ 1682.900398] RBP: ffffc900021cfcc0 R08: 0000000000000001 R09: 0000000000000000
[ 1682.900400] R10: ffffc900021cfcd0 R11: 0000000000000002 R12: 0000000000000004
[ 1682.900402] R13: 0000000000000000 R14: ffff8886a6311990 R15: ffffc900021cfd74
[ 1682.900405] FS:  0000000000000000(0000) GS:ffff888829880000(0000) knlGS:0000000000000000
[ 1682.900407] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1682.900409] CR2: 000055f70bad3fb0 CR3: 000000025243a004 CR4: 00000000003706e0
[ 1682.900412] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 1682.900413] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[ 1682.900415] Call Trace:
[ 1682.900418]  <TASK>
[ 1682.900420]  ? xe_device_assert_mem_access+0x27/0x30 [xe]
[ 1682.900504]  ? __warn+0x85/0x170
[ 1682.900510]  ? xe_device_assert_mem_access+0x27/0x30 [xe]
[ 1682.900596]  ? report_bug+0x171/0x1a0
[ 1682.900604]  ? handle_bug+0x3c/0x80
[ 1682.900608]  ? exc_invalid_op+0x17/0x70
[ 1682.900612]  ? asm_exc_invalid_op+0x1a/0x20
[ 1682.900621]  ? xe_device_assert_mem_access+0x27/0x30 [xe]
[ 1682.900706]  ? xe_device_assert_mem_access+0x12/0x30 [xe]
[ 1682.900790]  guc_ct_send_locked+0xb9/0x1550 [xe]
[ 1682.900882]  ? lock_acquire+0xca/0x2b0
[ 1682.900885]  ? guc_ct_send+0x3c/0x1a0 [xe]
[ 1682.900977]  ? lock_is_held_type+0x9b/0x110
[ 1682.900984]  ? __mutex_lock+0xc0/0xb90
[ 1682.900989]  ? __pfx___drm_printfn_info+0x10/0x10
[ 1682.900999]  guc_ct_send+0x53/0x1a0 [xe]
[ 1682.901090]  ? __lock_acquire+0xf22/0x21b0
[ 1682.901097]  ? process_one_work+0x1a0/0x500
[ 1682.901109]  xe_guc_ct_send+0x19/0x50 [xe]
[ 1682.901202]  set_min_preemption_timeout+0x75/0xa0 [xe]
[ 1682.901294]  disable_scheduling_deregister+0x55/0x250 [xe]
[ 1682.901383]  ? xe_sched_process_msg_work+0x76/0xd0 [xe]
[ 1682.901467]  ? lock_release+0xc9/0x260
[ 1682.901474]  xe_sched_process_msg_work+0x82/0xd0 [xe]
[ 1682.901559]  process_one_work+0x20a/0x500

v2: Add the splat

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 62d0237e724e..7a9186cea5a6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -90,12 +90,12 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	/*
 	 * Normally the user vm holds an rpm ref to keep the device
 	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which
-	 * offers no such rpm ref. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to
-	 * have already grabbed the rpm ref outside any sensitive locks.
+	 * some engines we use the kernels migrate vm underneath which offers no
+	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
+	 * can perform GuC CT actions when needed. Caller is expected to have
+	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
+	if (q->flags & EXEC_QUEUE_FLAG_VM || !vm)
 		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
 
 	return q;
@@ -172,10 +172,10 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
+	if (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm)
+		xe_device_mem_access_put(gt_to_xe(q->gt));
 	if (q->vm)
 		xe_vm_put(q->vm);
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
-		xe_device_mem_access_put(gt_to_xe(q->gt));
 
 	kfree(q);
 }
-- 
2.43.0

