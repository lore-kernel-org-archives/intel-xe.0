Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D678C369D3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5BE10E3A8;
	Mon, 28 Apr 2025 10:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfRF0PDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F4D10E1E6
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745834854; x=1777370854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JsSPzPKKzOSjCDnEhZ9uMBM4ySNeqkGZBQaGj/IJabE=;
 b=bfRF0PDpgzLmNUpBie8evIPhJZFYznC7gEmup2ROF1dP+JmKxnSwfArP
 MbRKFG5dVkIcuK/pfS/M5Baq8ETOzeny8rHW/b5Y13zilfbmtDui0klPW
 knkbV1v183Nive7iqNTfCkqjyQyH7bRWNxi3Wo+x5EWX0QSrx+63HJUrg
 D8UiMexuHoXVYvGyfY3agxuzs1FTE18X9HKkn15Je+rOyHQJfRI8wpyfP
 elf5+zM0ixJHYvNkkKQRTqGmU+vy1k6NEvCoCNbk5hm/y/gvlgb8UxnNj
 Umr0ha39aiFDP142UwT71exJbkcPf2FgMpF1DFqINlSkn4zim3yq9rzcL A==;
X-CSE-ConnectionGUID: W/Zg69BAQwu6iYZ0nNqRlg==
X-CSE-MsgGUID: hLsz6VcpRl6jA69dd65K6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58783963"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58783963"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:07:34 -0700
X-CSE-ConnectionGUID: M0YnbvWpQhyG/QG5CdTczg==
X-CSE-MsgGUID: bawRDFS4Sr+unyYOqy+2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="138291497"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 28 Apr 2025 03:07:32 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 10/18] drm/xe/svm: Make xe_svm_range_* end/start/size public
Date: Mon, 28 Apr 2025 16:02:16 +0530
Message-Id: <20250428103224.69534-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
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

These functions will be used in prefetch too, therefore make them public.

v2
  - Fix kernel doc

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 15 ------------
 drivers/gpu/drm/xe/xe_svm.h | 48 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 1dae6ed00fa8..df1d31d8f639 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -36,21 +36,6 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
-static unsigned long xe_svm_range_start(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_start(&range->base);
-}
-
-static unsigned long xe_svm_range_end(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_end(&range->base);
-}
-
-static unsigned long xe_svm_range_size(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_size(&range->base);
-}
-
 #define range_debug(r__, operaton__)					\
 	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
 	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 2b52bc20ad46..642da7acf986 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -99,6 +99,39 @@ static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
 	return container_of(r, struct xe_svm_range, base);
 }
 
+/**
+ * xe_svm_range_start() - SVM range start address
+ * @range: SVM range
+ *
+ * Return: start address of range.
+ */
+static inline unsigned long xe_svm_range_start(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_start(&range->base);
+}
+
+/**
+ * xe_svm_range_end() - SVM range end address
+ * @range: SVM range
+ *
+ * Return: end address of range.
+ */
+static inline unsigned long xe_svm_range_end(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_end(&range->base);
+}
+
+/**
+ * xe_svm_range_size() - SVM range size
+ * @range: SVM range
+ *
+ * Return: Size of range.
+ */
+static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_size(&range->base);
+}
+
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
@@ -197,6 +230,21 @@ static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
 	return NULL;
 }
 
+static inline unsigned long xe_svm_range_start(struct xe_svm_range *range)
+{
+	return 0;
+}
+
+static inline unsigned long xe_svm_range_end(struct xe_svm_range *range)
+{
+	return 0;
+}
+
+static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return 0;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

