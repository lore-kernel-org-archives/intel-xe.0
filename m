Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698AAC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A2F10E2A1;
	Mon,  5 Aug 2024 20:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nra6i0rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D52A10E2A1
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722888105; x=1754424105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h60h1qeW8dRSF5QLgHFnkwmOHlgP6WdDj3vuvKIOS50=;
 b=Nra6i0rwSw+BTLtIsB/mrnlST1uZQND241vHritjaZZG2qaEFed7jNqM
 OXehEkN5PyOdR3ZfwidkdPUVrvyaQ0wale1XwgmW2Wnxbbsg1ryxGfTjp
 yAZ6wVryZwSo51sAfDjZYOWN+QWXbzmIeQbOpvDwCt4MAH3WgeG9ZzgoU
 fWk7/5gPHwOPhX1wLm5rfyRadX8UWE5fUe5BJ6ERwzEfIKrUwCO4Oyn3/
 jxMqdWl4iaUeYMBdo1tn2CtoGPGN7PIOF1jjMh5XFBQPfRmzVI3iz1WfS
 mmRXC2BJFD0BmI23LqZRFC7/FFxO9ICNySqQWP/W6igAY07ydQI73YNL3 Q==;
X-CSE-ConnectionGUID: rHy1ejOtQGaweKpEusS5Xw==
X-CSE-MsgGUID: NOjFevs0Qn6blXwN3UD2qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21023294"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="21023294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:01:44 -0700
X-CSE-ConnectionGUID: k/SiLUSyT9yp0U+lFvTRLQ==
X-CSE-MsgGUID: aY/zBG8RTniq2Q7aGa9wiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56189853"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:01:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH] drm/xe: Only check last fence on user binds
Date: Mon,  5 Aug 2024 13:02:33 -0700
Message-Id: <20240805200233.3050325-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

We only set the last fence on user binds, so no need to check last fence
kernel issued binds. Will avoid blowing up last fence lockdep asserts.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 97a6a0b0b8ba..579ed31b46db 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1149,10 +1149,12 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 			return err;
 	}
 
-	if (job)
-		err = xe_sched_job_last_fence_add_dep(job, vm);
-	else
-		err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
+	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
+		if (job)
+			err = xe_sched_job_last_fence_add_dep(job, vm);
+		else
+			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
+	}
 
 	for (i = 0; job && !err && i < vops->num_syncs; i++)
 		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
-- 
2.34.1

