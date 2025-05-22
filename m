Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DA9C54ED0
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 01:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B779411A64E;
	Thu, 22 May 2025 01:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/US92in";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2966C11A631
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 01:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747877133; x=1779413133;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=udVexidonQ6qM/FBCW/O7fvDveS00o0W+4hb5u8HQ0Y=;
 b=c/US92invke+qJPhrcsTUTU+CqX4pxpB9NB6tU4dmCNCtU6UFt7dcfgI
 8yJHONuL2hNC3e1m94l1Kl16FZNCTnQq5PVo7JxsAm5SimbKvzICQj01a
 nz3GgQLwbNfgPh7AaUW803zgu8qacaGd3VUEDAiVOw4whIued7nTkatzd
 cKQo4SzvDOkNMJD+/KOB9COZQNfzFaxpOWVZdLB8vcACbIryxm1qt3HDE
 uinf40OuiD2hSnqGXhPlj4VRagZD4rBdHll9QbZMxYSeNTjUhBc0hc3he
 J2bYADFHFGLauLWulJgM6zl4TsKeuWF+RBHUntI71/RBo4a3Am64GnOM8 A==;
X-CSE-ConnectionGUID: 8Cw19dopS/SrHWi+RTugmQ==
X-CSE-MsgGUID: QsYp7a4FQb2rdwCGAhfIdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49138375"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49138375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 18:25:33 -0700
X-CSE-ConnectionGUID: Lwp7aG2pQH+yRq3qYpzUOw==
X-CSE-MsgGUID: BSq+HFChT8y2oB1LnJ0niA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140771038"
Received: from nvishwa1-desk1.sc.intel.com ([172.25.29.28])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 18:25:33 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Have LRC hold VM reference
Date: Wed, 21 May 2025 18:22:53 -0700
Message-ID: <20250522012252.2175683-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

LRC's BO uses VM's dma_resv object. Have LRC hold
VM reference.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 61a2e87990a9..efdf4ef35b35 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -908,12 +908,17 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 
 static void xe_lrc_finish(struct xe_lrc *lrc)
 {
+	struct xe_vm *vm = lrc->bo->vm;
+
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
 	xe_bo_lock(lrc->bo, false);
 	xe_bo_unpin(lrc->bo);
 	xe_bo_unlock(lrc->bo);
 	xe_bo_put(lrc->bo);
 	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
+
+	if (vm)
+		xe_vm_put(vm);
 }
 
 /*
@@ -1013,6 +1018,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
+	/* The lrc->bo uses VM's dma_resv object, take VM reference */
+	if (vm)
+		xe_vm_get(vm);
+
 	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
 						  ttm_bo_type_kernel,
 						  bo_flags);
-- 
2.43.0

