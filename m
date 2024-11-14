Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA4ED68B18
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 13:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DE810E2AE;
	Thu, 14 Nov 2024 13:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbpwJlrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB40A10E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731591476; x=1763127476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K0hLlOpaGR4TqMicMVOwJyQw6Zq+BSFDXfdfzjldPzs=;
 b=HbpwJlrHs3bgnXFJJmAAFivt+i685VB7ZdGESqFlwzd4fysmF2x6Hmc8
 oQ0/3OOIRxFcbVQBbVm0uunVx8HnhgUFO43IG/Djgggd7Qy4MahSXmOeT
 hMIJG1C3kel/pLfaVNgX+T+aNd0gGFBICp5TfhN0gt48WkXFzLlneCbQK
 wv9Rk6wJAzj68qFN9R0qV1WpiKgWyOsKx+iRIe9G6gC7MY6GVnRVBejWk
 XUbz4qoU5SvrYS/O9FOSJcWOVII6aZZc0KO9MsEjppqISb38lb55osvKl
 ROJyuaRR5dqbUE08ImAVtWjw+eU481lUGNoCCLFxk/6lNA5mvynpedJDa Q==;
X-CSE-ConnectionGUID: BdesYGeIQZC8bG/tP/UXPQ==
X-CSE-MsgGUID: sNpN0rrxRMiBRkVyOWLpXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56926754"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56926754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:37:55 -0800
X-CSE-ConnectionGUID: B+NKelT/SAGMI2tnB0kknw==
X-CSE-MsgGUID: Y6aVd68HT7GVcM+nkrUyuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93155508"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:37:53 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 1/2] drm/xe/gt: Add a synchronous GT reset function
Date: Thu, 14 Nov 2024 19:07:37 +0530
Message-Id: <20241114133738.2125717-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
References: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
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

There are multiples places in the driver where a GT reset is initiated
and then the driver waits for the GT reset to complete by waiting for
the GT reset worker to complete. Wrap these two steps into a single
function which the driver can use whenever it needs the reset the GT
synchronously.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c   | 3 +--
 drivers/gpu/drm/xe/tests/xe_mocs.c | 3 +--
 drivers/gpu/drm/xe/xe_gt.c         | 6 ++++++
 drivers/gpu/drm/xe/xe_gt.h         | 1 +
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index cd811aa2b227..396a11260d57 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -258,8 +258,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		 * to do that here by triggering a GT reset.
 		 */
 		for_each_gt(__gt, xe, id) {
-			xe_gt_reset_async(__gt);
-			flush_work(&__gt->reset.worker);
+			xe_gt_reset_sync(__gt);
 		}
 		if (err) {
 			KUNIT_FAIL(test, "restore kernel err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 6f9b7a266b41..9de0e27b5a32 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -162,8 +162,7 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 		if (flags & HAS_LNCF_MOCS)
 			read_l3cc_table(gt, &mocs.table);
 
-		xe_gt_reset_async(gt);
-		flush_work(&gt->reset.worker);
+		xe_gt_reset_sync(gt);
 
 		kunit_info(test, "mocs_reset_test after reset\n");
 		if (flags & HAS_GLOBAL_MOCS)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d6744be01a68..72030cc9f030 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -848,6 +848,12 @@ void xe_gt_reset_async(struct xe_gt *gt)
 	queue_work(gt->ordered_wq, &gt->reset.worker);
 }
 
+void xe_gt_reset_sync(struct xe_gt *gt)
+{
+	xe_gt_reset_async(gt);
+	flush_work(&gt->reset.worker);
+}
+
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 82b9b7f82fca..aafc1b0057d9 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -52,6 +52,7 @@ int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
+void xe_gt_reset_sync(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
 void xe_gt_remove(struct xe_gt *gt);
-- 
2.34.1

