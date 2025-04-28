Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8DBC369DC
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 07:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E5210E3B3;
	Mon, 28 Apr 2025 07:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/Z5asF3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A4610E399
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745825015; x=1777361015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UKfHinYNir3HSaGbS1c870v8Mzzf5RyBHy1teRssmqI=;
 b=h/Z5asF39k2PlqSKDc0o0iRKrNjJ6dFMs+dpxJTHcMAFNp+TGIagUB4U
 94Mmx/tefntfwcIdana4Q2+BBBNRowptmYWBsRvYCT1bDET6Z64dzr3C2
 N8fDI6tKnwRzEhxD2mEFbUt49VLiuvG2iRQxIGFB3rRK7ncJgIIkThgJg
 j1c1ddwG7yFcjx1s4UHNxylpSi5HKWNBE1WTxesBgRP2GqbDA3JKH+uw2
 SL2z7JKAH2A5j/Oya0fMdmb7Ghb1uO9Q8ixo4S/JCKfmOS8CyMsiFS2JF
 axdUvn2THvtMn5G3WoxneKzhM2qaed7VY3PF5Kbs0EtXqqa0/++DIEWvV Q==;
X-CSE-ConnectionGUID: U26zADGbQ7OmMGsD5Bj6Ag==
X-CSE-MsgGUID: j0nRoyLkR7Kt+x32MK51dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50056948"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50056948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:23:35 -0700
X-CSE-ConnectionGUID: aRNC+VLiToqsWoZv4Gk1BA==
X-CSE-MsgGUID: 3IfJ1hE+R3Gy3IdOM6P5Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133408738"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2025 00:23:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 09/18] drm/xe/svm: Make to_xe_range a public function
Date: Mon, 28 Apr 2025 13:18:20 +0530
Message-Id: <20250428074829.4125547-10-himal.prasad.ghimiray@intel.com>
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

The to_xe_range function will be used in other files. Therefore, make it
public and add kernel-doc documentation

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  5 -----
 drivers/gpu/drm/xe/xe_svm.h | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d30b36763240..1dae6ed00fa8 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -94,11 +94,6 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
 	kfree(range);
 }
 
-static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
-{
-	return container_of(r, struct xe_svm_range, base);
-}
-
 static void
 xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 				   const struct mmu_notifier_range *mmu_range)
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 55695097a8d1..2b52bc20ad46 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -85,6 +85,20 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.flags.has_dma_mapping;
 }
 
+/**
+ * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
+ * @r: Pointer to the drm_gpusvm_range structure
+ *
+ * This function takes a pointer to a drm_gpusvm_range structure and
+ * converts it to a pointer to the containing xe_svm_range structure.
+ *
+ * Return: Pointer to the xe_svm_range structure
+ */
+static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return container_of(r, struct xe_svm_range, base);
+}
+
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
@@ -99,6 +113,7 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 
 struct drm_pagemap_device_addr;
 struct drm_gpusvm_ctx;
+struct drm_gpusvm_range;
 struct xe_bo;
 struct xe_gt;
 struct xe_vm;
@@ -177,6 +192,11 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	return -EOPNOTSUPP;
 }
 
+static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return NULL;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

