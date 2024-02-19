Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE5C54788
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 21:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C844410E157;
	Mon, 19 Feb 2024 21:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kX2R8owm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A9D10E066
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708377337; x=1739913337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLc2iHthpj7pJZe/nz47O9hq7UJK92ZbBqGZ6GsYMi4=;
 b=kX2R8owmFupFIeW0pvTwXKcVRqkyJDfOuWKxbdnI17JkHZ/IvxaAjH7k
 sMVUdXt4B1VuhegXwHbH2gomBgRFUsjdiqRV6Z/ACrpJb9A/LTC62lnxi
 LRk1+tDc/dRmxhSRbcVrtf0bahe84qPjfwFSLW+BgGcM1U8bck682goWq
 ZkN4typddro2u22wVWQAn4MH1CdP0xs12ZezIiU8bM/aURPNyyxNA5Yf8
 FtbuQfwTMx46Tk5I2uUdJP7tIZm1CDovHhsf4gYJV3W+NAad6EXj7xF9X
 iJIIgLPvWEGfZhUJ0zvSzLhoQvD9tJ2UAtI2CWTxDRGvWZkc+8+lbGUcv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2610039"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2610039"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9218674"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix xe_vma_set_pte_size
Date: Mon, 19 Feb 2024 13:16:14 -0800
Message-Id: <20240219211616.3633630-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219211616.3633630-1-matthew.brost@intel.com>
References: <20240219211616.3633630-1-matthew.brost@intel.com>
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

xe_vma_set_pte_size had a return value and did not set the 4k VMA flag.
Both of these were incorrect. Fix these.

Fixes: c47794bdd63d ("drm/xe: Set max pte size when skipping rebinds")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda..2b0c76c663e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2198,7 +2198,7 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
 	return SZ_1G;	/* Uninitialized, used max size */
 }
 
-static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
+static void xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
 {
 	switch (size) {
 	case SZ_1G:
@@ -2207,9 +2207,10 @@ static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
 	case SZ_2M:
 		vma->gpuva.flags |= XE_VMA_PTE_2M;
 		break;
+	case SZ_4K:
+		vma->gpuva.flags |= XE_VMA_PTE_4K;
+		break;
 	}
-
-	return SZ_4K;
 }
 
 static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
-- 
2.34.1

