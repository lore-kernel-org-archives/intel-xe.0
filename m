Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E56EC7114A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 21:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CF610E9BA;
	Fri, 13 Jun 2025 21:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTSxQCGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FD110E9AE
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749848470; x=1781384470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8QtcLyH+sInD8+DQDEiktDYTpYXZj8Kxp4R0mEqBYcM=;
 b=QTSxQCGAujvLX8zes6L3XYQa8actLPmfwnH54ArsOqJ9PTz9JluQX+LW
 G8aSKQGoPGuPbEDrWU4doDl8EzR10ZNxwK/WYf2cgVQrjQ1SSpdNbD01h
 9D8VsiYhe5J50zdTgLmiOv+81nVrTEoSvSfOoPLYUvPp4zOXmZevCnT16
 GspkvKuuJvu9OhYiqfihf4nxW4cySEHR0RvnqIqO3JY/iHw4Q2/Itxt05
 ppX0bPkhao3YW1Lyg9OX3NPmAJYzF10H7pdbSnQbo1PHIk7MxCw8rmjTo
 xHc86Uynnm2HNon+twReIGY+SEg6oHy8D3Cl5HJ5UPYyotLgkuScIwjb6 A==;
X-CSE-ConnectionGUID: UHoGY578Roa5gOVwP6MwwA==
X-CSE-MsgGUID: wDP8s2GASey81eU73k8+kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55750680"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="55750680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:01:09 -0700
X-CSE-ConnectionGUID: ZLMJcL/9QSuBkJZqJTrZ/g==
X-CSE-MsgGUID: wSF4tt3DQCyQKHoOlxOv1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="171108145"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:01:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
Date: Fri, 13 Jun 2025 14:02:42 -0700
Message-Id: <20250613210242.718441-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613210242.718441-1-matthew.brost@intel.com>
References: <20250613210242.718441-1-matthew.brost@intel.com>
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
or VMA to be invalidated after this check is performed.

This should improve performance of the SVM garbage collector, for
example, xe_exec_system_allocator --r many-stride-new-prefetch, went
~20s to ~9.5s on a BMG.

v2:
 - Use helper for valid check (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>>
---
 drivers/gpu/drm/xe/xe_pt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 59496c1a1e77..39947fd5c3a2 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1988,7 +1988,9 @@ static int unbind_op_prepare(struct xe_tile *tile,
 					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
-	pt_update_ops->needs_invalidation = true;
+	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(xe_vma_vm(vma)) ||
+		xe_vm_has_valid_gpu_pages(tile, vma->tile_present,
+					  vma->tile_invalidated);
 
 	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
 
@@ -2023,7 +2025,9 @@ static int unbind_range_prepare(struct xe_vm *vm,
 					 range->base.itree.last + 1);
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_svm_lock = true;
-	pt_update_ops->needs_invalidation = true;
+	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
+		xe_vm_has_valid_gpu_pages(tile, range->tile_present,
+					  range->tile_invalidated);
 
 	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
 				    pt_op->num_entries);
-- 
2.34.1

