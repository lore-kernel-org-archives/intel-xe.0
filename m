Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99E3105D993
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 02:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3646E10E039;
	Wed,  8 Apr 2026 02:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zjhc0BAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F21B10E039
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775614265; x=1807150265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bwDFbBe30Q6FNp2RyNUdK3ZzrdxhTRMF1Nd7mnYidDE=;
 b=Zjhc0BAnZY8+mg30Did2VaCL+kSjYFjCgGeCg7beqaDRXk4UxDSzutn0
 M9+GLkPDefwmuFdxZHo0kiWl578VlE6h5FJsDzQs6F77f4xCEc0zzRa+8
 QFpXomwb9DQN/RO9wPl5KUdL2LL96p/QbXZd+G/AYIbpvBrHQP5a0o6hL
 ON7MnlIToV5UI82Qy/Hvp97MOMqNtOOHELR3Vnpfds0pIKK4GKxmtpGRs
 M0FUPSzrv2+nlB/7lHuuDMQNX2dNJDZXeiI5rnpS3Hq4+Vg+JRVXt/ZNm
 tVPnU9lIBht61WVzjNdsO/FHztkhG/gxodR3AGYCei5THINh7WNulRs7Q w==;
X-CSE-ConnectionGUID: LTehSyVqSHuGe4mal7Nerg==
X-CSE-MsgGUID: djJxe14wTh2l0A4xcEvvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76469429"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76469429"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 19:11:05 -0700
X-CSE-ConnectionGUID: KndP1Mg8RT2s7kzFrn7Dog==
X-CSE-MsgGUID: hPCnF71JStGp/phpXxar6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="221788804"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2026 19:11:01 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 1/1] drm/xe: Fix error cleanup in xe_exec_queue_create_ioctl()
Date: Wed,  8 Apr 2026 02:06:47 +0000
Message-ID: <20260408020647.3397933-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Two error handling issues exist in xe_exec_queue_create_ioctl():

1. When xe_hw_engine_group_add_exec_queue() fails, the error path jumps
   to put_exec_queue which skips xe_exec_queue_kill(). If the VM is in
   preempt fence mode, xe_vm_add_compute_exec_queue() has already added
   the queue to the VM's compute exec queue list. Skipping the kill
   leaves the queue on that list, leading to a dangling pointer after
   the queue is freed.

2. When xa_alloc() fails after xe_hw_engine_group_add_exec_queue() has
   succeeded, the error path does not call
   xe_hw_engine_group_del_exec_queue() to remove the queue from the hw
   engine group list. The queue is then freed while still linked into
   the hw engine group, causing a use-after-free.

Fix both by:
- Changing the xe_hw_engine_group_add_exec_queue() failure path to jump
  to kill_exec_queue so that xe_exec_queue_kill() properly removes the
  queue from the VM's compute list.
- Adding a del_hw_engine_group label before kill_exec_queue for the
  xa_alloc() failure path, which removes the queue from the hw engine
  group before proceeding with the rest of the cleanup.

Fixes: 7970cb36966c ("'drm/xe/hw_engine_group: Register hw engine group's exec queues")
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
This is a reimplementation of https://patchwork.freedesktop.org/series/162714/
Same logic, with improved labeling and a corrected Fixes tag.
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b287d0e0e60a..4603ff08d860 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1405,7 +1405,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (q->vm && q->hwe->hw_engine_group) {
 			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
 			if (err)
-				goto put_exec_queue;
+				goto kill_exec_queue;
 		}
 	}
 
@@ -1416,12 +1416,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	if (err)
-		goto kill_exec_queue;
+		goto del_hw_engine_group;
 
 	args->exec_queue_id = id;
 
 	return 0;
 
+del_hw_engine_group:
+	if (q->vm && q->hwe && q->hwe->hw_engine_group)
+		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 kill_exec_queue:
 	xe_exec_queue_kill(q);
 delete_queue_group:
-- 
2.43.0

