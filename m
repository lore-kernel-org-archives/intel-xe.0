Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3C2CE7A8E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 04:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D477F10E34B;
	Tue, 26 Sep 2023 04:10:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38F010E34D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 04:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695701449; x=1727237449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zMqp76MaabXSVH5rmAkCc4oOG5A/usIA3HekLM1Gnd4=;
 b=nCHfcD4w0kOiScaom33OFZvenGuou5kdpksxeCY3EvZibPo4vkWkeS29
 aI1SLRwvrQR1uz0zxiiEtdPIz0MAUo/WKlBlHyIXpVn04cqVe3bG3TDeU
 foHHtxH7SrS6vtvDFmYSVgmz+PwWcJv7F/06Zskp3/tkUkBOph1U+kqP+
 uh9n7FgN1KFNbidoziVkMdyWp56YokqYGEgOFs5hEECyqfIn9zNiLU9XV
 0wEmshozvCzHz0O+ZNjIDPRK4u0u/WNgFR0Lw1FyBYC720GDi+NfVnlc8
 OR5LoNpbijCPbNQU60C/fwzFQ+Iez2DM6rHvHTY+Cyb0Ynz/VOUssP3Ot w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371811041"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="371811041"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752002747"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="752002747"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:10:47 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 21:12:59 -0700
Message-Id: <20230926041259.1102823-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926041259.1102823-1-fei.yang@intel.com>
References: <20230926041259.1102823-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: timeout needs to be a signed value
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

In xe_wait_user_fence_ioctl, the timeout is currently defined as
unsigned long. That could potentially pass a negative value to
the schedule_timeout() call because nsecs_to_jiffies() returns an
unsigned long which gets used as signed long.

[ 187.732238] schedule_timeout: wrong timeout value fffffffffffffc18
[ 187.733180] CPU: 0 PID: 792 Comm: test_thread_dim Tainted: G U 6.4.0-xe #1
[ 187.735019] Call Trace:
[ 187.735373] <TASK>
[ 187.735687] dump_stack_lvl+0x92/0xb0
[ 187.736193] schedule_timeout+0x348/0x430
[ 187.736739] ? __might_fault+0x67/0xd0
[ 187.737255] ? check_chain_key+0x224/0x2d0
[ 187.737812] ? __pfx_schedule_timeout+0x10/0x10
[ 187.738429] ? __might_fault+0x6b/0xd0
[ 187.738946] ? __pfx_lock_release+0x10/0x10
[ 187.739512] ? __pfx_lock_release+0x10/0x10
[ 187.740080] wait_woken+0x86/0x100
[ 187.740556] xe_wait_user_fence_ioctl+0x34b/0xe00 [xe]
[ 187.741281] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
[ 187.742075] ? lock_acquire+0x169/0x3d0
[ 187.742601] ? check_chain_key+0x224/0x2d0
[ 187.743158] ? drm_dev_enter+0x9/0xe0 [drm]
[ 187.743740] ? __pfx_woken_wake_function+0x10/0x10
[ 187.744388] ? drm_dev_exit+0x11/0x50 [drm]
[ 187.744969] ? __pfx_lock_release+0x10/0x10
[ 187.745536] ? __might_fault+0x67/0xd0
[ 187.746052] ? check_chain_key+0x224/0x2d0
[ 187.746610] drm_ioctl_kernel+0x172/0x250 [drm]
[ 187.747242] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
[ 187.748037] ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
[ 187.748729] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
[ 187.749524] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
[ 187.750319] drm_ioctl+0x35e/0x620 [drm]
[ 187.750871] ? __pfx_drm_ioctl+0x10/0x10 [drm]
[ 187.751495] ? restore_fpregs_from_fpstate+0x99/0x140
[ 187.752172] ? __pfx_restore_fpregs_from_fpstate+0x10/0x10
[ 187.752901] ? mark_held_locks+0x24/0x90
[ 187.753438] __x64_sys_ioctl+0xb4/0xf0
[ 187.753954] do_syscall_64+0x3f/0x90
[ 187.754450] entry_SYSCALL_64_after_hwframe+0x72/0xdc
[ 187.755127] RIP: 0033:0x7f4e6651aaff
[ 187.755623] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[ 187.757995] RSP: 002b:00007fff05f37a50 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 187.758995] RAX: ffffffffffffffda RBX: 000055eca47c8130 RCX: 00007f4e6651aaff
[ 187.759935] RDX: 00007fff05f37b60 RSI: 00000000c050644b RDI: 0000000000000004
[ 187.760874] RBP: 0000000000000017 R08: 0000000000000017 R09: 7fffffffffffffff
[ 187.761814] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[ 187.762753] R13: 0000000000000000 R14: 0000000000000000 R15: 00007f4e65d19ce0
[ 187.763694] </TASK>

Fixes: 9f801f10c0d6 ("drm/xe: Use nanoseconds instead of jiffies in uapi for user fence")
Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 55 +++++++++++++++++--------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 761eed3a022f..3ac4cd24d5b4 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -85,17 +85,45 @@ static int check_hw_engines(struct xe_device *xe,
 			 DRM_XE_UFENCE_WAIT_VM_ERROR)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
 
-static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
+static long to_jiffies_timeout(struct xe_device *xe,
+			       struct drm_xe_wait_user_fence *args)
 {
-	unsigned long timeout;
+	unsigned long long t;
+	long timeout;
 
-	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
-		return drm_timeout_abs_to_jiffies(args->timeout);
+	/*
+	 * For negative timeout we want to wait "forever" by setting
+	 * MAX_SCHEDULE_TIMEOUT. But we have to assign this value also
+	 * to args->timeout to avoid being zeroed on the signal delivery
+	 * (see arithmetics after wait).
+	 */
+	if (args->timeout < 0) {
+		args->timeout = MAX_SCHEDULE_TIMEOUT;
+		return MAX_SCHEDULE_TIMEOUT;
+	}
 
-	if (args->timeout == MAX_SCHEDULE_TIMEOUT || args->timeout == 0)
-		return args->timeout;
+	if (args->timeout == 0)
+		return 0;
 
-	timeout = nsecs_to_jiffies(args->timeout);
+	/*
+	 * Save the timeout to an u64 variable because nsecs_to_jiffies
+	 * might return a value that overflows s32 variable.
+	 */
+	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
+		t = drm_timeout_abs_to_jiffies(args->timeout);
+	else
+		t = nsecs_to_jiffies(args->timeout);
+
+	/*
+	 * Anything greater then MAX_SCHEDULE_TIMEOUT is meaningless,
+	 * also we don't want to cap it at MAX_SCHEDULE_TIMEOUT because
+	 * apparently user doesn't mean to wait forever, otherwise the
+	 * args->timeout should have been set to a negative value.
+	 */
+	if (t > MAX_SCHEDULE_TIMEOUT)
+		timeout = MAX_SCHEDULE_TIMEOUT - 1;
+	else
+		timeout = t;
 
 	return timeout ?: 1;
 }
@@ -114,7 +142,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	int err;
 	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
-	unsigned long timeout;
+	long timeout;
 	ktime_t start;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
@@ -169,16 +197,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		addr = vm->async_ops.error_capture.addr;
 	}
 
-	/*
-	 * For negative timeout we want to wait "forever" by setting
-	 * MAX_SCHEDULE_TIMEOUT. But we have to assign this value also
-	 * to args->timeout to avoid being zeroed on the signal delivery
-	 * (see arithmetics after wait).
-	 */
-	if (args->timeout < 0)
-		args->timeout = MAX_SCHEDULE_TIMEOUT;
-
-	timeout = to_jiffies_timeout(args);
+	timeout = to_jiffies_timeout(xe, args);
 
 	start = ktime_get();
 
-- 
2.25.1

