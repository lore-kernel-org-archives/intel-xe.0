Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD17EDEBF5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 23:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE4710E8F3;
	Tue,  3 Mar 2026 23:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuZlC6/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDD910E8F3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 23:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772582178; x=1804118178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=He0E7lljjVOjuHdnpx9ruVJlHur4PqVSllC/N6wRhAQ=;
 b=YuZlC6/1Z8ilv8Ff5wjGIeKU49zoW1rrQg9xrWXhAFZZQo6X66wUCK6q
 X9Gx2NoEWcuEX/u19tOqY919HpMgAwVeGQwZE027E9/Nb4SJgx+OJrKUe
 Q9n909lIblm9E6rlP108A3TbeIONuVFQu9T7EXcoyb8F7eS+9M44I6RQf
 i8LkQykxEJC+0saaERUJTjWTNtSSPU2G+LcsDUTgq0MIn8D+iqTpfZmLr
 T5cOUNVS233Dm5qftG+TgFadCTs+tU+9oDiMyrnKRZ3bCaAB4F8lqYvzV
 uuRHAA+h0+3PL8NFxsE5LJN1xWW39wz8i/gKJAFjtQFysoHZLS9F4BO64 Q==;
X-CSE-ConnectionGUID: xKai5mejRa6XeqwjaQ1Qfg==
X-CSE-MsgGUID: ckBrXBH7QzKJr0QTSuZ9Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="85102465"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="85102465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:56:18 -0800
X-CSE-ConnectionGUID: RghiLPbbQtqonPuI7hVJag==
X-CSE-MsgGUID: XUec9lZ/RIG74Kh7SmQ4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218132525"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 03 Mar 2026 15:56:17 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Fix exec queue unwind on hw engine group add
 failure
Date: Tue,  3 Mar 2026 23:52:20 +0000
Message-ID: <20260303235219.1035961-2-shuicheng.lin@intel.com>
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

When xe_hw_engine_group_add_exec_queue() fails in
xe_exec_queue_create_ioctl(), to undo xe_exec_queue_group_add()
and xe_vm_add_compute_exec_queue(), the code should unwind through
kill_exec_queue rather than directly dropping the queue reference.

Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

---
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

v2: correct the jump label from delete_queue_group to kill_exec_queue (Matt)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index bb273ca02d28..4dc59f448f2e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1297,7 +1297,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (q->vm && q->hwe->hw_engine_group) {
 			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
 			if (err)
-				goto put_exec_queue;
+				goto kill_exec_queue;
 		}
 	}
 
-- 
2.50.1

