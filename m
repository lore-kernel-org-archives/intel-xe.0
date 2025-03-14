Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2676EC28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60FA10E97E;
	Fri, 14 Mar 2025 07:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MX6Iz7Su";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783CB10E97E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937901; x=1773473901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WbHcKP8Z06I+r4dpeMjVY9VrD8dbnVcVZZyNb+ACxww=;
 b=MX6Iz7SuAXV6pLPJE5LvV1t0+yqFrr/Oi2GkXK1na1PR/+rkc3EWAWBY
 Isoi6p23OT1qTZq5giRJNTEiC0W1WCG6DtwORsC/+mYEFoOn127fQNLSx
 uRUKOhi/+g5wYw3+QmWAyv3MJM0OQ1QFtP/Y1n6GyP9rwJHU/udhpWem2
 hbpf/TdUb8PmF9RJ1QnrVET+TuLfFnUhkhenucUGfZgP43vP90Pr+hL7p
 xFIkjMwz/8hnBp7Bel7jddKg5CsnJ9tBugNG9b3+qbHHlDsgSw0sJS4UF
 qSgTkDKOYlj15TvLCd3wGdAWKUfGB92azBIZRuaENw6M4EYfaU0ok8mUm w==;
X-CSE-ConnectionGUID: HtQR5rwQSdSQZgZSshnLhQ==
X-CSE-MsgGUID: bO9LsyT4TiKgv1GnDdX4Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68445975"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68445975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:20 -0700
X-CSE-ConnectionGUID: qyU2sgIZT2OgNv6728n6PA==
X-CSE-MsgGUID: zRakscgETTKPN5AxSmyjZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043705"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 05/29] drm/xe/svm: Make xe_svm_range_* end/start/size public
Date: Fri, 14 Mar 2025 13:32:02 +0530
Message-Id: <20250314080226.2059819-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 15 ---------------
 drivers/gpu/drm/xe/xe_svm.h | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 2b041f44730b..07511011aba6 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -35,21 +35,6 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
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
index 1af245400799..c8add37614ec 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -165,6 +165,38 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.flags.has_dma_mapping;
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
+ * xe_svm_range_start() - SVM range end address
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
+ * xe_svm_range_start() - SVM range size
+ * @range: SVM range
+ *
+ * Return: Size of range.
+ */
+static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_size(&range->base);
+}
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
-- 
2.34.1

