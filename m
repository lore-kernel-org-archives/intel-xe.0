Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4AECF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 15:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B63A10E709;
	Tue, 24 Sep 2024 15:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCJOzQh6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D7810E709
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727190608; x=1758726608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OCRURKKE3bpaNgFK04viFSJWVKeC0vHoEYMxrlub8Ns=;
 b=DCJOzQh6YDvYWPq4QULGI4bZCAQgaK9YyvW+X105gpXVA7Am4DMg0lAZ
 7EteNrMgEdOX4bgE0L4VgBPcazRUGBi7xS4J+3o5ANVkV+s1mUPtJszPm
 UQAfI6EpJ3IK3NbJcDhf1Wio7ZADNNyIbWkRWCkmhA7HGeetFnOMOAKHJ
 E9gC5wUODn08plDriah2NcNSX97kMcuMCa5Ia7rlIE3MfH/D0IQ/wrsbZ
 M5Kzc+TUK1UjO3mhvixyQjSYQGoT1ZSyTYNJmtuAgSsLkPK5QfBL/ehX0
 wGploe7rraJAmw8co2kk3vS+0SqSt6MlbcQQZC/TzaAdD7aPK9Qb1hMSK w==;
X-CSE-ConnectionGUID: fYZOE34NSv6EGoNeSMMbAA==
X-CSE-MsgGUID: jCEztiL0THOQqcjUqWck5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26310706"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26310706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 08:10:08 -0700
X-CSE-ConnectionGUID: IXVFG+NaQVmZa+ERr+bGZg==
X-CSE-MsgGUID: 2UehQDHXRr6DiBWLCj/IlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="71884414"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 mwauld-desk.intel.com) ([10.245.244.120])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 08:10:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc_submit: add missing locking in wedged_fini
Date: Tue, 24 Sep 2024 16:09:48 +0100
Message-ID: <20240924150947.118433-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.1
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

Any non-wedged queue can have a zero refcount here and can be running
concurrently with an async queue destroy, therefore dereferencing the
queue ptr to check wedge status after the lookup can trigger UAF if
queue is not wedged.  Fix this by keeping the submission_state lock held
around the check to postpone the free and make the check safe, before
dropping again around the put() to avoid the deadlock.

Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fbbe6a487bbb..715c761dc7d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -290,9 +290,15 @@ static void guc_submit_wedged_fini(void *arg)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		if (exec_queue_wedged(q))
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		if (exec_queue_wedged(q)) {
+			mutex_unlock(&guc->submission_state.lock);
 			xe_exec_queue_put(q);
+			mutex_lock(&guc->submission_state.lock);
+		}
+	}
+	mutex_unlock(&guc->submission_state.lock);
 }
 
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
-- 
2.46.1

