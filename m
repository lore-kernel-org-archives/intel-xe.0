Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C5C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EAC10EABA;
	Thu, 13 Jun 2024 15:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e42Tv1yI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721010EAE6
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292047; x=1749828047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=H5onfj8FTWy1VIdntyfWue3WB0c808n1GvMLWFhgWB4=;
 b=e42Tv1yIlEy22jSDipii52lBBhXnGqEvgOkXNMPz+6R55fBNyazumRVu
 8+JlT/dHMHmO820TU9NNat66XXrMu0OsIDC2gW6krZjF3gBALsT9biKJ1
 0RtH7/uxusBfZKHD67/+L97YPExp4i0k7MrpuhtUIt+43uQqYdLc9A+16
 iSNsxk05jZz/Wym/J+Rg/I/eAi2phXyP40XQxQdY9+khN8pMAG6vwXyfw
 1D4dHIjKyUadb00H+ZmgSMQNtD6FcSwzoG4Pqv3IaojuNSPrgRP7F9YJc
 OpGka3IzykD2EzcA8NNnBunITxxgE8M8RQEXHy7LrZfQ9RtlrxWltl1rt A==;
X-CSE-ConnectionGUID: QLyeW1BXRkaqeRS/pWIYmg==
X-CSE-MsgGUID: OE1S9rQdTrWq9sa8C64ALw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348674"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:44 -0700
X-CSE-ConnectionGUID: s287oMftQOWJXxX3AYrdNw==
X-CSE-MsgGUID: xUM6rYPETw2h/8WTX3PRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135129"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:43 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 40/42] drm/xe/svm: Determine a vma is backed by device memory
Date: Thu, 13 Jun 2024 11:31:26 -0400
Message-Id: <20240613153128.681864-40-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With system allocator, a userptr can now be back by device
memory also. Introduce a helper function xe_vma_is_devmem
to determine whether a range of vma is backed by device memory.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f6fc2dcb3767..c68ff02a931e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,6 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <linux/hmm.h>
 #include "xe_pt.h"
 
 #include "regs/xe_gtt_defs.h"
@@ -578,6 +579,28 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 	.pt_entry = xe_pt_stage_bind_entry,
 };
 
+static bool xe_vma_is_devmem(struct xe_vma *vma, u64 start)
+{
+	if (xe_vma_is_userptr(vma)) {
+		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+		struct drm_hmmptr *hmmptr = &uvma->userptr.hmmptr;
+		u64 offset = start - xe_vma_start(vma);
+		u64 page_idx = offset >> PAGE_SHIFT;
+		u64 hmm_pfn = hmmptr->pfn[page_idx];
+		struct page *page = hmm_pfn_to_page(hmm_pfn);
+
+		/**
+		 * FIXME: Assume there is no mixture system memory and device
+		 * memory placement in the [start, end) range of vma. We might
+		 * need to relook at this in the future.
+		 */
+		return is_device_private_page(page);
+	} else {
+		struct xe_bo *bo = xe_vma_bo(vma);
+		return bo && (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
+	}
+}
+
 /**
  * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
  * range.
@@ -604,8 +627,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
-	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
-		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
+	bool is_devmem = xe_vma_is_devmem(vma, start);
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
 		.base = {
-- 
2.26.3

