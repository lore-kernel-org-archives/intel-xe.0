Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B889D10A88F1
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 18:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F82210E066;
	Thu, 26 Mar 2026 18:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAjE0qyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B4A10E066
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774548620; x=1806084620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kDjOJKWa7kUl2Antscd2RCymP59rSf2GgEC34cMjHo8=;
 b=bAjE0qyAAbI+j4hgnnEhPag9gbJfvXZ8le7AbCjvHmkYq5/NiuAAcANU
 Q9UquX8bboxv0cpsehGWLaY0H8k8YGxzMwDbTKA0xQqMRqYH2eyiuzzT1
 v4EvfZgyoNvCaLXLj4wkBbUS1ccq1mfCWzJQ0lDLrZovzcEkEGtKC3dg1
 xD3ElEmmPg+2iKQK0KuMAIe4SZ9ezTrm3l4lXd7vCBHLYvjG41f20RIq7
 EhkeULLMYqLPebD6rdrAt89+uKzBZ0uSzJqngXSID2ne/7oQ+kAssxUS4
 gD5sR1d6dUXDDxAfF2gHNFIClgzEa35XWMIDuswIfqvIKjL7HONdrWAE1 A==;
X-CSE-ConnectionGUID: aPVuNEflScGg2tq6GsiGDQ==
X-CSE-MsgGUID: zVgIj03zQJCj6zd7Qf9eSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74801656"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="74801656"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 11:10:19 -0700
X-CSE-ConnectionGUID: PlcABxPkQDiWYFjXl9U/1g==
X-CSE-MsgGUID: GNhSLb/NTHa95wbT0YBrQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="225010202"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa009.jf.intel.com with ESMTP; 26 Mar 2026 11:10:19 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1 1/1] drm/xe: Fix null pointer dereference in devcoredump
 cleanup
Date: Thu, 26 Mar 2026 14:10:17 -0400
Message-Id: <20260326181017.2060209-1-zhanjun.dong@intel.com>
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

In xe_devcoredump_snapshot_free(), ss->gt may be NULL when the snapshot
was never fully populated (e.g., when cleanup is triggered without a
prior capture). Guard the xe_guc_capture_put_matched_nodes() call with
IS_ERR_OR_NULL() to prevent a null dereference.

In xe_devcoredump_free(), the deferred work is only queued when a
coredump is captured, so guard cancel_work_sync() with a check on
coredump->captured.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 558a1a9841a0..ec206f512795 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -149,7 +149,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_guc_ct_snapshot_free(ss->guc.ct);
 	ss->guc.ct = NULL;
 
-	xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
+	if (!IS_ERR_OR_NULL(ss->gt))
+		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
 
 	xe_guc_exec_queue_snapshot_free(ss->ge);
@@ -254,7 +255,8 @@ static void xe_devcoredump_free(void *data)
 	if (!data || !coredump_to_xe(coredump))
 		return;
 
-	cancel_work_sync(&coredump->snapshot.work);
+	if (coredump->captured)
+		cancel_work_sync(&coredump->snapshot.work);
 
 	mutex_lock(&coredump->lock);
 
-- 
2.34.1

