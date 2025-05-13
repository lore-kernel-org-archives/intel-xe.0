Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963ABC3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9CA10E4DF;
	Tue, 13 May 2025 03:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJr2sHn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A1A10E4DE
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 03:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747107442; x=1778643442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZwO/qHfVSIC2kLvcoOdhZKQFY7/qWWhFoTVsycMWcE=;
 b=CJr2sHn/UScw88mgNVoEtpdCeXBG5Il2mgPJgm6pizqfAObJs0KvIJUJ
 muOpIOv0dpNkBUrhr1ulMaRbje037GXxOjKLHQeaMUF2QPZFAk6zWkbab
 gwsdLHmdsH4j0T/IMaFf5VecnC0kuZxrfXSG080grAPMAhhSQNaH8TA/n
 MW/qnUJZNpQpAS0jY3PlrP0TQ/E8f7fv8ZGfZOVxpQk/SdYHp2sN80Mj6
 c2bMIleXbHAh+qIFP4ezV1Uvmn+fAsZ4IE5ISqIU+GU0vqWsAqABmXnqQ
 dlNT5IuC7GGQtbCJz3rKtPt7fERtqmss8O8sCzSOSr6kYKWeng3uWiDT8 w==;
X-CSE-ConnectionGUID: Mj34KwndQnC0DCQi4i1+tQ==
X-CSE-MsgGUID: 7eTm/9wKSVODrzTxUfLxGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48858852"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48858852"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:37:22 -0700
X-CSE-ConnectionGUID: UQEV1ih/TM6dMkyWXUyTeg==
X-CSE-MsgGUID: uniSKcCSRTOHE/MTgXOpzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142690295"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 20:37:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 12/15] drm/gpusvm: Introduce drm_gpusvm_find_vma_start()
 function
Date: Tue, 13 May 2025 09:32:25 +0530
Message-Id: <20250513040228.470682-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

The drm_gpusvm_find_vma_start() function is used to determine the starting
address of a CPU VMA within a specified user range. If the range does not
contain any VMA, the function returns ULONG_MAX.

v2
- Rename function as drm_gpusvm_find_vma_start() (Matthew Brost)
- mmget/mmput

v3
- s/mmget/mmget_not_zero/

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_gpusvm.h     |  5 +++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 4b2f32889f00..7bb9eb71c9aa 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -980,6 +980,40 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
 }
 #endif
 
+/**
+ * drm_gpusvm_find_vma_start() - Find start address for first VMA in range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @start: The inclusive start user address.
+ * @end: The exclusive end user address.
+ *
+ * Returns: The start address of first VMA within the provided range,
+ * ULONG_MAX otherwise. Assumes start_addr < end_addr.
+ */
+unsigned long
+drm_gpusvm_find_vma_start(struct drm_gpusvm *gpusvm,
+			  unsigned long start,
+			  unsigned long end)
+{
+	struct mm_struct *mm = gpusvm->mm;
+	struct vm_area_struct *vma;
+	unsigned long addr = ULONG_MAX;
+
+	if (!mmget_not_zero(mm))
+		return addr;
+
+	mmap_read_lock(mm);
+
+	vma = find_vma_intersection(mm, start, end);
+	if (vma)
+		addr =  vma->vm_start;
+
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return addr;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_find_vma_start);
+
 /**
  * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index eaf704d3d05e..6a5156476bf4 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -327,6 +327,11 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
 
 void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
 
+unsigned long
+drm_gpusvm_find_vma_start(struct drm_gpusvm *gpusvm,
+			  unsigned long start,
+			  unsigned long end);
+
 struct drm_gpusvm_range *
 drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 				unsigned long fault_addr,
-- 
2.34.1

