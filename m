Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB30C3ABAD
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0827010E751;
	Wed, 30 Apr 2025 11:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miwEP3fB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019B610E747
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014070; x=1777550070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYQHmToN9qhTFZ1Chu8IuGc4Yi7JWKY0VhTybeVAjos=;
 b=miwEP3fBuLnbWUf0tq0gu78tbwCe0Y2M9F3Iul/p+kWf94oa/TGhGz60
 2k0uPy4cJPQnLK/5qEYKLwfr9pixY2apjzFX76TkjIidSpIPKEiwUJh5Y
 L4Yo14q37WcoUtfyR6SPkB8IcxpOUJICDA35siURMmUkM4YYiAjuwmRUW
 KiFZz1OQxZ3kkteTQ3YvmTgMxCCBtPLp5goBm+uH3S56XTJ3VAqcXS0ix
 2jkveYjI32o9xUqKDTVteYk0HouoqNMCZDPYXDlZi0CtUdxYGiIwg0Rui
 IlF3Wchmd+fSJkony3Jmz4n/GjuX1vFwO6WahdoFy+Z5h99jx4o3/fWh4 w==;
X-CSE-ConnectionGUID: Rci27XRaRByoX/0UA7ISbQ==
X-CSE-MsgGUID: SY8YhbyISgCwDVT+QiouiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759960"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759960"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:30 -0700
X-CSE-ConnectionGUID: 7u6h/YzbTbelVEjBgPij1w==
X-CSE-MsgGUID: XrmXulJ8QiOtW5yJPuvjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050736"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:28 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 17/20] drm/gpusvm: Introduce drm_gpusvm_find_vma_start()
 function
Date: Wed, 30 Apr 2025 17:49:09 +0530
Message-Id: <20250430121912.337601-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_gpusvm.h     |  5 +++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index c94a8d7a293d..48bb29b78b96 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -980,6 +980,38 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
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
+	mmget(mm);
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

