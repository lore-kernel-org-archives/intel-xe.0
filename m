Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D32C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 00:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57610E1A9;
	Fri, 18 Apr 2025 00:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wbl5f0xX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568B910E1A9
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 00:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744934843; x=1776470843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+lvQ0Qq2diGtG2SPQJihj4BClTfNTGiIArps7ZRiuII=;
 b=Wbl5f0xXCs9/zy1PbJjO+je4IgN0+fpToIvQdezNaxH4JK4L17R+3JKC
 p2HOZuFHxrK5jGhYjnC2qvAdvBFQAMS6QwoSazoy1e2S/yxgaiEG9SlZS
 WuwGUYG579+nqMnAVCc+uvf2v0kFsEC6mW/Btj+PlpfqueqRngiWfwaFV
 Q4JD3SVJXNiwasZxiDhLxc5LTZq4EgdpBNCyYV0gI5KTYqzGVOefofoo9
 3Z9GvNHkvDUQhnDfnAKIP2DYLPN27RHgZ6rHS5WXK/nA7KM7vRlbh61gC
 FnLuphQx35T+YnZlm+5LL8EyivUpnHR0j9J/lVoT5OXfWjMAWj5skXmOK A==;
X-CSE-ConnectionGUID: MwsQWq1rSxCgDH+AbSNkJA==
X-CSE-MsgGUID: DNc3W4cxQrSQ2Etmh8Ro2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="34177990"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="34177990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 17:07:23 -0700
X-CSE-ConnectionGUID: 9Es/3mxhQ0iG4ANHFUGv7w==
X-CSE-MsgGUID: 8N+Zoj7nSyuN5LMVnDYIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135821751"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 17:07:23 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.auld@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Resolve a possible circular locking
 dependency
Date: Thu, 17 Apr 2025 17:07:17 -0700
Message-ID: <c896932fca84f79db2df5942911997ed77b2b9b6.1744934656.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Use a separate lock in the polling function eu_stall_data_buf_poll()
instead of eu_stall->stream_lock. This would prevent a possible
circular locking dependency leading to a deadlock as described below.
This would also require additional locking with the new lock in
the read function.

<4> [787.192986] ======================================================
<4> [787.192988] WARNING: possible circular locking dependency detected
<4> [787.192991] 6.14.0-rc7-xe+ #1 Tainted: G     U
<4> [787.192993] ------------------------------------------------------
<4> [787.192994] xe_eu_stall/20093 is trying to acquire lock:
<4> [787.192996] ffff88819847e2c0 ((work_completion)
(&(&stream->buf_poll_work)->work)), at: __flush_work+0x1f8/0x5e0
<4> [787.193005] but task is already holding lock:
<4> [787.193007] ffff88814ce83ba8 (&gt->eu_stall->stream_lock){3:3},
at: xe_eu_stall_stream_ioctl+0x41/0x6a0 [xe]
<4> [787.193090] which lock already depends on the new lock.
<4> [787.193093] the existing dependency chain (in reverse order) is:
<4> [787.193095]
-> #1 (&gt->eu_stall->stream_lock){+.+.}-{3:3}:
<4> [787.193099]        __mutex_lock+0xb4/0xe40
<4> [787.193104]        mutex_lock_nested+0x1b/0x30
<4> [787.193106]        eu_stall_data_buf_poll_work_fn+0x44/0x1d0 [xe]
<4> [787.193155]        process_one_work+0x21c/0x740
<4> [787.193159]        worker_thread+0x1db/0x3c0
<4> [787.193161]        kthread+0x10d/0x270
<4> [787.193164]        ret_from_fork+0x44/0x70
<4> [787.193168]        ret_from_fork_asm+0x1a/0x30
<4> [787.193172]
-> #0 ((work_completion)(&(&stream->buf_poll_work)->work)){+.+.}-{0:0}:
<4> [787.193176]        __lock_acquire+0x1637/0x2810
<4> [787.193180]        lock_acquire+0xc9/0x300
<4> [787.193183]        __flush_work+0x219/0x5e0
<4> [787.193186]        cancel_delayed_work_sync+0x87/0x90
<4> [787.193189]        xe_eu_stall_disable_locked+0x9a/0x260 [xe]
<4> [787.193237]        xe_eu_stall_stream_ioctl+0x5b/0x6a0 [xe]
<4> [787.193285]        __x64_sys_ioctl+0xa4/0xe0
<4> [787.193289]        x64_sys_call+0x131e/0x2650
<4> [787.193292]        do_syscall_64+0x91/0x180
<4> [787.193295]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [787.193299]
other info that might help us debug this:
<4> [787.193302]  Possible unsafe locking scenario:
<4> [787.193304]        CPU0                    CPU1
<4> [787.193305]        ----                    ----
<4> [787.193306]   lock(&gt->eu_stall->stream_lock);
<4> [787.193308]                        lock((work_completion)
					(&(&stream->buf_poll_work)->work));
<4> [787.193311]                        lock(&gt->eu_stall->stream_lock);
<4> [787.193313]   lock((work_completion)
			(&(&stream->buf_poll_work)->work));
<4> [787.193315]
 *** DEADLOCK ***

Fixes: 760edec939685 ("drm/xe/eustall: Add support to read() and poll() EU stall data")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4598
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index f2bb9168967c..78f28f3c5e5c 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -52,6 +52,8 @@ struct xe_eu_stall_data_stream {
 
 	struct xe_gt *gt;
 	struct xe_bo *bo;
+	/* Lock to protect data buffer pointers */
+	struct mutex xecore_buf_lock;
 	struct per_xecore_buf *xecore_buf;
 	struct {
 		bool reported_to_user;
@@ -378,7 +380,7 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 	u16 group, instance;
 	unsigned int xecore;
 
-	mutex_lock(&gt->eu_stall->stream_lock);
+	mutex_lock(&stream->xecore_buf_lock);
 	for_each_dss_steering(xecore, gt, group, instance) {
 		xecore_buf = &stream->xecore_buf[xecore];
 		read_ptr = xecore_buf->read;
@@ -396,7 +398,7 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 			set_bit(xecore, stream->data_drop.mask);
 		xecore_buf->write = write_ptr;
 	}
-	mutex_unlock(&gt->eu_stall->stream_lock);
+	mutex_unlock(&stream->xecore_buf_lock);
 
 	return min_data_present;
 }
@@ -511,11 +513,13 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 	unsigned int xecore;
 	int ret = 0;
 
+	mutex_lock(&stream->xecore_buf_lock);
 	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
 		if (!stream->data_drop.reported_to_user) {
 			stream->data_drop.reported_to_user = true;
 			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
 				  XE_MAX_DSS_FUSE_BITS, stream->data_drop.mask);
+			mutex_unlock(&stream->xecore_buf_lock);
 			return -EIO;
 		}
 		stream->data_drop.reported_to_user = false;
@@ -527,6 +531,7 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 		if (ret || count == total_size)
 			break;
 	}
+	mutex_unlock(&stream->xecore_buf_lock);
 	return total_size ?: (ret ?: -EAGAIN);
 }
 
@@ -583,6 +588,7 @@ static void xe_eu_stall_stream_free(struct xe_eu_stall_data_stream *stream)
 {
 	struct xe_gt *gt = stream->gt;
 
+	mutex_destroy(&stream->xecore_buf_lock);
 	gt->eu_stall->stream = NULL;
 	kfree(stream);
 }
@@ -718,6 +724,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 	}
 
 	init_waitqueue_head(&stream->poll_wq);
+	mutex_init(&stream->xecore_buf_lock);
 	INIT_DELAYED_WORK(&stream->buf_poll_work, eu_stall_data_buf_poll_work_fn);
 	stream->per_xecore_buf_size = per_xecore_buf_size;
 	stream->sampling_rate_mult = props->sampling_rate_mult;
-- 
2.48.1

