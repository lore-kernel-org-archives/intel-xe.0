Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745F8CDE005
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 02:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19610E14C;
	Thu, 25 Jun 2026 02:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c47xT4pw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C37910E149
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782356035; x=1813892035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B3CjfpjhytA/Z3n6UCB5r53um7cqezJNVSP7lkAvkWQ=;
 b=c47xT4pwxIAyCn42nfWMlZwSOFPDqTqkpENh75P439IuQ/zYwjutn/M+
 mYYTWYcp6O17y0rB7zXN5MmTvh5fUIEfUjLHq9vWNge/7tKbLgJBjdgCS
 GQyzR7asjXNSDPvR964fXcbDlT3TdLaMG0+ixc1supyRODmhozH7QFMwN
 kfHg+Y1MhIBqNNK/5bGZbb3DNYTM6koH8BTwzes//8ufgrZW2UF9tq4x1
 LWzJZmO27E7n3wRO/vGLxSHYQGPH8DFAYVQHp9DxpfPElVjCr8U5nCWqz
 2v9lJkN5iUo8DcNb/aMHFyvFuAaz4RZMOmMJt1Tl+p3FSUeaB01k+XgI4 w==;
X-CSE-ConnectionGUID: T9QXnbawTj63L0BtbUkKGw==
X-CSE-MsgGUID: vrdC7YaKSUGo7kwG4fLLCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93781081"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="93781081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
X-CSE-ConnectionGUID: Mcv8Qy9DR2GkSOcRpp+prw==
X-CSE-MsgGUID: jCZ/v0aGSFCL8YNE5BXwGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="254118539"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 3/5] drm/xe/guc: wait killably for suspend and ban queue on
 timeout
Date: Wed, 24 Jun 2026 19:53:52 -0700
Message-ID: <20260625025348.1620469-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
References: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
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

Harden guc_exec_queue_suspend_wait():

 - Wait killably rather than interruptibly. Once a suspend has been
   issued it must be waited to completion (or timeout); an arbitrary
   non-fatal signal must not abandon an in-flight suspend, otherwise the
   wait reports a spurious failure while the suspend is still pending.
   Only a fatal signal aborts, in which case the dying task tears the
   queue down (clearing suspend_pending), so no stuck state persists.

 - On timeout, ban the queue and trigger cleanup rather than leaving it
   suspended forever. Clearing suspend_pending via __suspend_fence_signal()
   lets a subsequent resume() proceed without tripping the
   !suspend_pending assert.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 33 +++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9458bf477fa6..7363b8d1301b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2195,22 +2195,41 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 xe_guc_read_stopped(guc))
 
 retry:
+	/*
+	 * Wait killably rather than interruptibly: once a suspend has been
+	 * issued it must be waited to completion (or timeout), otherwise an
+	 * arbitrary (non-fatal) signal would abandon an in-flight suspend and
+	 * the wait would report a spurious failure while suspend_pending is
+	 * still set. Only a fatal signal aborts here; in that case the dying
+	 * task tears the queue down (clearing suspend_pending), so no stuck
+	 * state persists.
+	 */
 	if (IS_SRIOV_VF(xe))
-		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
-						       vf_recovery(guc),
-						       HZ * 5);
+		ret = wait_event_killable_timeout(guc->ct.wq, WAIT_COND ||
+						  vf_recovery(guc), HZ * 5);
 	else
-		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
-						       WAIT_COND, HZ * 5);
+		ret = wait_event_killable_timeout(q->guc->suspend_wait,
+						  WAIT_COND, HZ * 5);
 
 	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
 		return -EAGAIN;
 
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
-			   "Suspend fence, guc_id=%d, failed to respond",
+			   "Suspend fence, guc_id=%d, failed to respond, banning queue",
 			   q->guc->id);
-		/* XXX: Trigger GT reset? */
+		/*
+		 * The GuC failed to respond to the suspend within the timeout.
+		 * This is not recoverable for this context, so ban it rather
+		 * than leave it suspended forever (unmarked). Clearing
+		 * suspend_pending lets a subsequent resume() proceed without
+		 * tripping the !suspend_pending assert (the RESUME message is
+		 * dropped for a banned queue), and triggering cleanup tears the
+		 * context down.
+		 */
+		set_exec_queue_banned(q);
+		__suspend_fence_signal(q);
+		xe_guc_exec_queue_trigger_cleanup(q);
 		return -ETIME;
 	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
 		/* Corner case on RESFIX DONE where vf_recovery() changes */
-- 
2.43.0

