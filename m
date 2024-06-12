Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FB5C27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AB410E75D;
	Wed, 12 Jun 2024 02:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Queo2X+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FBE10E753
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158541; x=1749694541;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IXRKw4+pfXuQUuJqiBreM31A0jufZNZeZVQNeXWcb8I=;
 b=Queo2X+cuNEWrEoz9Lh3Lkt6v8Z3qi0kgIK/zb7R7sP/NE0WMywIeP/0
 XceW3R70yw2rrC5ZyVGB8YHW+CymMWfwhDOzP2YOdMJxBAwRxUHchDdB0
 DD5oMg2OFhUx2gDxWckiGWZqQduT4z9vTmD5qXJcPoPgmTFy2NGCVIXbU
 aieekU97t7G0w308Q9zNNKnnm0tmkGEh2EUEreNyJELMePLmBpFzV9V4F
 9Y8M65SzgOwOjdHnFERcPHFy0IHGH/uahAC05T0yIgCGk03gjy81G53uv
 9BRv6xXZNU1x8oCEgcblzpfiWESgwvxFbHoP+85PWT5UKhTjaRYkejvnX A==;
X-CSE-ConnectionGUID: OfpeRd8CSBOdmGrzOEuRKw==
X-CSE-MsgGUID: S+QMvj6NSOWtXJrsWsJYSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427825"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: q+1v5RhfTMmhlDn/BMhZQQ==
X-CSE-MsgGUID: pG4c2bDKTmiTo1PGMj4FmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763660"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 41/43] drm/xe/svm: Determine a vma is backed by device memory
Date: Tue, 11 Jun 2024 22:26:03 -0400
Message-Id: <20240612022605.385062-41-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 91b61fa80acb..fa35c01cbfa2 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -578,6 +578,28 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
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
@@ -604,8 +626,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end,
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

