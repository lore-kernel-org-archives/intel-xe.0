Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA34AC3ABA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 07:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8002F10E3BC;
	Mon, 28 Apr 2025 07:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGSclacr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4F10E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745825028; x=1777361028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XleTU1W4/6iDFjUkBqpcml6tu39eSKdkPUJJ8b/r0VU=;
 b=lGSclacrRWgw283aakg5IHb5ZbJ1ImksqZjVJRllhxsHS/eEO3Kn4I9F
 8t5c3zouVbsLv7k2q58pMqs4nenTyQwPB/OsKBO09NbWJp2TGxKQ2sT/c
 paWFMl5opPAQXmktsErsF6XWijf0Qz5UJXyktIFE5OVconChk9wCqRBt7
 DURzjaTPEsGOjGA5M/OFBTfayKUzoq0kJK9JKoVVsNvyuF68oyN7tS7eH
 Tp9ke0Oozs5ELHYEJWwaOLI/vodpx6HgvfsSajYvTsV+yQfFgxz303sIn
 Cp+fc5ipGWYJFaEZybuxvZetuW+RZpv27ZnymxnHEVPXVfE2qqqxF0YRS Q==;
X-CSE-ConnectionGUID: 9yergfuJQrKsPcwRk8/Eyg==
X-CSE-MsgGUID: s2ldi+1OQb+RcyABWAG8HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50057006"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50057006"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:23:48 -0700
X-CSE-ConnectionGUID: 3BWRNMe2QPKyp4XACS44yw==
X-CSE-MsgGUID: LOeU3Hq5TKmP0i+xzHlDqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133408763"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2025 00:23:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 16/18] drm/xe/svm: Add xe_svm_range_validate_and_evict()
 function
Date: Mon, 28 Apr 2025 13:18:27 +0530
Message-Id: <20250428074829.4125547-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
References: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
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

The xe_svm_range_validate_and_evict() function checks if a range is
valid and located in the desired memory region. Additionally, if the
range is valid in VRAM but the desired region is SMEM, it evicts the
ranges to SMEM.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 90fae13b77ae..172702a03077 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -637,6 +637,42 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 		&& (!devmem_only || range->base.flags.migrate_devmem);
 }
 
+/**
+ * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
+ * @range: Pointer to the SVM range structure
+ * @tile_mask: Mask representing the tiles to be checked
+ * @devmem_only: if true range needs to be in devmem
+ *
+ * The xe_svm_range_validate_and_evict() function checks if a range is
+ * valid and located in the desired memory region. Additionally, if the
+ * range is valid in VRAM but the desired region is SMEM, it evicts the
+ * ranges to SMEM.
+ *
+ * Return: true if the range is valid, false otherwise
+ */
+
+bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
+				     struct xe_svm_range *range,
+				     u8 tile_mask, bool devmem_only)
+{
+	bool range_evict = false;
+	bool ret;
+
+	xe_svm_notifier_lock(vm);
+
+	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
+	       (devmem_only == range->base.flags.has_devmem_pages);
+
+	if (!ret && !devmem_only && range->base.flags.has_devmem_pages)
+		range_evict = true;
+
+	xe_svm_notifier_unlock(vm);
+
+	if (range_evict)
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+	return ret;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 9be7bb25725c..d5bbfa376fc7 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					bool preferred_region_is_vram);
 
+bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
+				     struct xe_svm_range *range,
+				     u8 tile_mask, bool devmem_only);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -276,6 +280,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return false;
 }
 
+static inline
+bool xe_svm_range_is_valid_locked(struct xe_vm *vm,
+				  struct xe_svm_range *range,
+				  u8 tile_mask, bool devmem_only)
+{
+	return false;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

