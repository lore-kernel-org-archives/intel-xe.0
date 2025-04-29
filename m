Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C484CC3ABAD
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8659B10E42B;
	Tue, 29 Apr 2025 10:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7vcD7Lq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365FD10E42B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921879; x=1777457879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M4kcQKmIXAMrCJBb7IInZqJ6BQEyvk+MwJMngffA1Bo=;
 b=G7vcD7LqdTv+JAAiU1Z+C2wTe+tre0zX3L7u0FO8CMS8IQvQkXs/K6bo
 DePP57KouD4MgtGqGKq8z2pGgzDgEhnon66Df41n7DHCHpkTnF5wJDG3Q
 +lbMtyAExrXF3YpnaQCe6dLXAZ+iXl7b8eY3dpU/p0kqaDpu9KM4+Lu/Y
 iQn/3d8GIHxR1cSSXs/zd8QP879nlV3zixy2dTeBcSlE5ulwVYkTxdT7W
 5RiMuMW/r821ILkbzmiohlCvSaMxkeEZvo4yyWeEqEZjo6nIpxsPO9gfK
 LA8Co3mB2MfLCUWFBYwrChNWrPGC1iCVXpxu0siffviTl/+G11Bbk0d6C Q==;
X-CSE-ConnectionGUID: l7rnICoMQhSeUVKdrw6EQg==
X-CSE-MsgGUID: gCNY/zmDSWCss8mBl3O9nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243207"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:17:58 -0700
X-CSE-ConnectionGUID: 8V+/rwOKQfCuqVdQwM3H/g==
X-CSE-MsgGUID: zEMcebwYQ4WYob6guU71Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287610"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:17:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 17/20] drm/gpusvm: Introduce
 drm_gpusvm_range_find_or_insert_start() function
Date: Tue, 29 Apr 2025 16:12:30 +0530
Message-Id: <20250429104233.215602-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
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

The drm_gpusvm_range_find_or_insert_start() function is used to
determine the starting address of a CPU VMA within a specified user
range. If the range does not contain any VMA, the function returns
ULONG_MAX.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_gpusvm.h     |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 40a56f38ff8e..bb7c589b8d15 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -980,6 +980,35 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
 }
 #endif
 
+/**
+ * drm_gpusvm_range_find_or_insert_start() - Find or insert start address for range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @start: The inclusive start user address.
+ * @end: The exclusive end user address.
+ *
+ * Returns: The start address of first VMA within the provided range,
+ * ULONG_MAX otherwise. Assumes start_addr < end_addr.
+ */
+unsigned long
+drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
+				      unsigned long start,
+				      unsigned long end)
+{
+	struct mm_struct *mm = gpusvm->mm;
+	struct vm_area_struct *vma;
+	unsigned long addr = ULONG_MAX;
+
+	mmap_read_lock(mm);
+
+	vma = find_vma_intersection(mm, start, end);
+	if (vma)
+		addr =  vma->vm_start;
+
+	mmap_read_unlock(mm);
+	return addr;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert_start);
+
 /**
  * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index cce217bc136f..b0e9ee5c6226 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -315,6 +315,11 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
 
 void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
 
+unsigned long
+drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
+				      unsigned long start,
+				      unsigned long end);
+
 struct drm_gpusvm_range *
 drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 				unsigned long fault_addr,
-- 
2.34.1

