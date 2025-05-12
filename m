Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77581C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E94310E45D;
	Mon, 12 May 2025 16:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQWW+aaC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF25910E456
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066956; x=1778602956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+JBIi45/ZdXdYE2zNwKRsRjhhgHGIOQbncqNQJgsY8=;
 b=eQWW+aaCyKIgEqwOWCx9ButcZfjjC9VkqrvJAyKZnQC4PvbW/R8vsY1A
 Do4IV+quq+c/SAZ2KbxOarXLn/EeF/DzPqgsq5nQobboCgaQUL7WObn19
 ZjxP+C29TMmRlRW0D1vixAwzytBImNjztjCvzqSfDTdJLdXmhIoH3M5+Y
 kE7E9ED78iUIo8X1IRI8OMWmlqdpde2qeyeTJPSDak9JdyztPOt/Jv/gH
 /GEWdXdsKsY8sI1+wZWetsavS7PJuJnM9BZM7Uls8tQTPqc6eQpyHBk9Y
 bl5NghfAclnjSOCEdikegDNB14WchnwiKzSy5sTk0IFcOKOKH0//WSJdI Q==;
X-CSE-ConnectionGUID: HC/qeGuoTTyULC5uq07RhQ==
X-CSE-MsgGUID: R+2AsFUXTZSQb7sboA3sgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508105"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508105"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:36 -0700
X-CSE-ConnectionGUID: zeteBe4HQtyIAeslIpOXgQ==
X-CSE-MsgGUID: bvmnKiMJTHKlkB2PO95vDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532744"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 10/20] drm/xe/svm: Make xe_svm_range_* end/start/size public
Date: Mon, 12 May 2025 22:17:30 +0530
Message-Id: <20250512164740.466852-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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
index 77740730e821..6cfe92b8adbe 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -45,21 +45,6 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
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
index e9257f0b3ffc..a69bbdc73608 100644
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
 
@@ -199,6 +232,21 @@ static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
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

