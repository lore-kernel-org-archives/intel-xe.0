Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9C7F513E9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 03:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC25810E2F6;
	Fri,  6 Mar 2026 03:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XH8kv1wV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A259A10E2F5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772766029; x=1804302029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1VNmKZmF5/pkXshy1JLXFlMbAUqsT6sHT2c6oQFTpq0=;
 b=XH8kv1wV088rXhJatY/0GDUhoeJ+ykjGRAY2DxrKy4ml3zJ+sQ5c3jdr
 qw302hQXrnLeLENaoj45u8kPL/lWoq9RYk/ij+geC1jKItmTJ5Hrc+z1w
 wZI+nfOnC1roqEK0UMihyGXCgYk2lmx5QVqQvVMWWo6JwU0alDEXofJlM
 BJ7tfUEjY1JMQWSKXjYMqgqaULa6njM45ZKmyf+Y30y5DRGbHjA3Uj/dc
 QrF+zpsG7cLkZV2mEuE4k+uKyhQeqg+UBody/G2WCXLcbqN0IwAvwyAZR
 3phj9hrwehOLifUh44oOAlvPuNqSawXflQEynHqY6yNMk+jn90B48sJib Q==;
X-CSE-ConnectionGUID: ZGrCAhSCTaSol2Rs22dMdQ==
X-CSE-MsgGUID: qQ/fCWOWTOygK20iVQLfVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73773775"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73773775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 19:00:28 -0800
X-CSE-ConnectionGUID: mHcqutpcTf6NBAEPD70hVg==
X-CSE-MsgGUID: 3/0WDHF9TTSzMVIP1gqIIQ==
X-ExtLoop1: 1
Received: from dut6079bmgfrd.fm.intel.com ([10.80.55.56])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 19:00:28 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 2/2] drm/xe: Fix exec queue unwind on hw engine group add
 failure
Date: Fri,  6 Mar 2026 03:00:10 +0000
Message-Id: <20260306030010.11041-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306030010.11041-1-shuicheng.lin@intel.com>
References: <20260306030010.11041-1-shuicheng.lin@intel.com>
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

v2: correct the jump label. (Matt)

Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index af915ccb4925..372fc17a2f46 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1390,7 +1390,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (q->vm && q->hwe->hw_engine_group) {
 			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
 			if (err)
-				goto put_exec_queue;
+				goto kill_exec_queue;
 		}
 	}
 
-- 
2.34.1

