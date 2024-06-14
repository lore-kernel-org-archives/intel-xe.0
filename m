Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE3EC41513
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAC610EE64;
	Fri, 14 Jun 2024 21:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nqt8ldDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44D610EE73
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401660; x=1749937660;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9CDHJRysE6zBGvHr5aNCFZolwwwQtwePn12TpbOh+L8=;
 b=Nqt8ldDoxaIwj6mzab0KdGLaCwIUQSiIWlARi2xfiwAweNUtpcK08+ld
 6braJAwGa0lduIzkYopX1Md+M7GObqskhY9DN7T0rGou5oAiWp/P+65YG
 lXZ204AV0zpw+cDNW2TXdfXN84d0KSqR5Z9KG8xcVe+bIM7R8uF0y7DaC
 mzj2ICrHPACcGPQzJk/eAOYaxeSOcNrcph7XBChmp6R5ozbaMnH/b72GW
 qX12QedTkTJagaiL0ZP3I2AxqYp3N2HVwFRkXmLTip7hwPgMzRGqTr3yR
 mm7OtEQ9liRBJZJRJ1DWuubE/H/oi2jTj9AG+srjKhv5c2YBD3mnFIhnW w==;
X-CSE-ConnectionGUID: EQmgMeTJS7WCzY85Ewy6xg==
X-CSE-MsgGUID: rO1vBuNfTem1QPYtOncoLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886603"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886603"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: oucztHXhSDquRrNgR17z4w==
X-CSE-MsgGUID: xU/8jFWPTyyZuOq3GrTTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572436"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 42/44] drm/xe/svm: Determine a vma is backed by device memory
Date: Fri, 14 Jun 2024 17:58:15 -0400
Message-Id: <20240614215817.1097633-42-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3c89a32741f5..a576d5cb7727 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,6 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <linux/hmm.h>
 #include "xe_pt.h"
 
 #include "regs/xe_gtt_defs.h"
@@ -578,6 +579,29 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 	.pt_entry = xe_pt_stage_bind_entry,
 };
 
+static bool xe_vma_is_devmem(struct xe_vma *vma, u64 start)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+
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
+	}
+
+	return bo && (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
+}
+
 /**
  * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
  * range.
@@ -604,8 +628,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end,
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

