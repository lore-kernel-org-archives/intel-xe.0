Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA37C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814CB10E060;
	Mon, 16 Jun 2025 06:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp+RVwlN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008F010E060
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750055332; x=1781591332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Buv3sVPTqS3wAJDQgM0s1vQ5kSEvglKjW9rvuklHyWs=;
 b=Kp+RVwlNUnnnWYwuL1xevfmnjOwsBwNtgUVLFCw93z7cta21styVHFK4
 0HiI43L8dapSu4EI0zkp9K9Ef64j4HHiCM06Hgk9qz3lMk1COcMI3ADCI
 iNEgIc2C3rWZV+7lVsY9hlIaUl6LjPuzKPnXg7RWpfYFWSYi5PtD8+vKe
 pIl8YIF9/J97JgUegXCXXWcAdhVJMFL7G7JFy7GmIJr0RWyJSguG/kPsX
 3g77SF9ZSREABPIlU9aMLXQOLyHECvgp8abvGTwRJCVrtSrY4DifkNrXF
 tNIwKCCQJKmqIDx+h4F6RcQIuM+TYxHVxlRMtCYAC/3L+Blb8lI2UJi/w Q==;
X-CSE-ConnectionGUID: H3c40pCYT+OKrVkRf8x5RA==
X-CSE-MsgGUID: 1svg+hW9SQWy/qSX/+Ib9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51298104"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="51298104"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:28:50 -0700
X-CSE-ConnectionGUID: zt2A/3CcRx+Pqu2WgTqhDA==
X-CSE-MsgGUID: opLRRsAaRM2GbYcCGCjOeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153257157"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:28:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
Date: Sun, 15 Jun 2025 23:30:24 -0700
Message-Id: <20250616063024.2059829-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616063024.2059829-1-matthew.brost@intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
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

If a range or VMA is invalidated and scratch page is disabled, there
is no reason to issue a TLB invalidation on unbind, skip TLB
innvalidation is this condition is true. This is an opportunistic check
as it is done without the notifier lock, thus it possible for the range
to be invalidated after this check is performed.

This should improve performance of the SVM garbage collector, for
example, xe_exec_system_allocator --r many-stride-new-prefetch, went
~20s to ~9.5s on a BMG.

v2:
 - Use helper for valid check (Thomas)
v3:
 - Avoid skipping TLB invalidation if PTEs are removed at a higher
   level than the range
 - Never skip TLB invalidations for VMA
 - Drop Himal's RB

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9c30111e8786..b6df8995e8c1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1995,6 +1995,32 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	return 0;
 }
 
+static bool
+xe_pt_op_check_range_skip_invalidation(struct xe_vm_pgtable_update_op *pt_op,
+				       struct xe_svm_range *range)
+{
+	struct xe_vm_pgtable_update *update = pt_op->entries;
+
+	XE_WARN_ON(!pt_op->num_entries);
+
+	/*
+	 * We can't skip the invalidation if we are removing PTEs that span more
+	 * than the range, do some checks to ensure we are removing PTEs that
+	 * are invalid.
+	 */
+
+	if (pt_op->num_entries > 1)
+		return false;
+
+	if (update->pt->level == 0)
+		return true;
+
+	if (update->pt->level == 1)
+		return xe_svm_range_size(range) >= SZ_2M;
+
+	return false;
+}
+
 static int unbind_range_prepare(struct xe_vm *vm,
 				struct xe_tile *tile,
 				struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -2023,7 +2049,10 @@ static int unbind_range_prepare(struct xe_vm *vm,
 					 range->base.itree.last + 1);
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_svm_lock = true;
-	pt_update_ops->needs_invalidation = true;
+	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
+		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
+					    range->tile_invalidated) ||
+		!xe_pt_op_check_range_skip_invalidation(pt_op, range);
 
 	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
 				    pt_op->num_entries);
-- 
2.34.1

