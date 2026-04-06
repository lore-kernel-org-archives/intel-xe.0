Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C66DEF4EA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C5510E211;
	Mon,  6 Apr 2026 08:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJ5KRjRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E089110E211
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465935; x=1807001935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YH8cn1V4kXBLBtbW3iS+5MpuBvldCT0d/DkIpiEMEfo=;
 b=MJ5KRjRn5DIoF7KX9y1jLnFp7nWG38XV0kv2IhITFpZ17yNHs+qTIKG8
 n4zcDVCu622vgQgQ3jgB5fhvVTxW18nYNLWUrjwwN03CfWFyylEJiXidq
 on4cXd22dr1sMDzJlN1QJZA39KMeKUoe3YVhKMaZrAPNGYo7Dg0pZIAv9
 e+ZzwFjjJvEB6ohlW12Nyi2VeUyVIpQ2Z5zg/WpWM5DiWwFyKJOc5uAKh
 lYCjzLtnAYf4wC/9Vmh+p1eRTZRYvjUbVYw95RUYIt6SdDIOkxXNWtKve
 lq6pSq6ISH+EMuJQhFRqI54JdeHyIJrmv3tOr6DpRfEFVZUUpapVxCZ7u Q==;
X-CSE-ConnectionGUID: n/QjJJoASSeq8dBS24at9w==
X-CSE-MsgGUID: ZwafhoS7SRuX3zKl6F4iBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012897"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:55 -0700
X-CSE-ConnectionGUID: fwkDDTBOSDGptYji8dVYVA==
X-CSE-MsgGUID: 4rBlVZlIRqSSLBr8MzpcWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775226"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:53 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 7/7] drm/xe/svm: Correct memory attribute reset for partial
 unmap
Date: Mon,  6 Apr 2026 14:28:30 +0530
Message-ID: <20260406085830.1118431-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

When performing a partial unmap of an SVM range, the memory attributes
were being reset for the entire range instead of just the portion
being unmapped. This could lead to unintended side effects and behaviour.

Fix this by restricting the attribute reset to only the affected subrange
that is being unmapped.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 56 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_svm.h | 10 +++++++
 2 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 89668ada38ca..f533cddf4d2b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -58,6 +58,8 @@ void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
 	return force_smem ? NULL : vm->svm.peer.owner;
 }
 
+#define XE_SVM_ATTR_RETRY_MAX 3
+
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
 	/*
@@ -127,15 +129,23 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
 	kfree(range);
 }
 
+static void xe_svm_range_set_unmapped(struct xe_svm_range *range,
+				      const struct mmu_notifier_range *mmu_range)
+{
+	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
+	if (range->base.pages.flags.partial_unmap) {
+		range->partial_unmap.start = max(xe_svm_range_start(range), mmu_range->start);
+		range->partial_unmap.end = min(xe_svm_range_end(range), mmu_range->end);
+	}
+}
+
 static void
 xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 				   const struct mmu_notifier_range *mmu_range)
 {
 	struct xe_device *xe = vm->xe;
 
-	range_debug(range, "GARBAGE COLLECTOR ADD");
-
-	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
+	xe_svm_range_set_unmapped(range, mmu_range);
 
 	spin_lock(&vm->svm.garbage_collector.lock);
 	if (list_empty(&range->garbage_collector_link))
@@ -380,9 +390,10 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
 static int xe_svm_garbage_collector(struct xe_vm *vm)
 {
 	struct xe_svm_range *range;
-	u64 range_start;
-	u64 range_end;
+	u64 unmap_start;
+	u64 unmap_end;
 	int err, ret = 0;
+	int retry_count;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -397,8 +408,13 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		if (!range)
 			break;
 
-		range_start = xe_svm_range_start(range);
-		range_end = xe_svm_range_end(range);
+		if (range->base.pages.flags.partial_unmap) {
+			unmap_start = range->partial_unmap.start;
+			unmap_end = range->partial_unmap.end;
+		} else {
+			unmap_start = xe_svm_range_start(range);
+			unmap_end = xe_svm_range_end(range);
+		}
 
 		list_del(&range->garbage_collector_link);
 		spin_unlock(&vm->svm.garbage_collector.lock);
@@ -412,13 +428,25 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			return err;
 		}
 
-		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
-		if (err) {
-			if (err == -EAGAIN)
-				ret = -EAGAIN;
-			else
-				return err;
-		}
+		/*
+		 * Retry set_default_attr on -EAGAIN (VMA was recreated).
+		 * Limit retries to prevent infinite loop.
+		 */
+		retry_count = 0;
+
+		do {
+			err = xe_svm_range_set_default_attr(vm, unmap_start, unmap_end);
+			if (err == -EAGAIN && ++retry_count > XE_SVM_ATTR_RETRY_MAX) {
+				drm_err(&vm->xe->drm,
+					"SET_ATTR retry limit exceeded for [0x%llx-0x%llx]\n",
+					unmap_start, unmap_end);
+				xe_vm_kill(vm, true);
+				return -EIO;
+			}
+		} while (err == -EAGAIN);
+
+		if (err)
+			return err;
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b7b8eeacf196..4651e044cf53 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -46,6 +46,16 @@ struct xe_svm_range {
 	 * range. Protected by GPU SVM notifier lock.
 	 */
 	u8 tile_invalidated;
+	/**
+	 * @partial_unmap: Structure to hold partial unmap range info.
+	 * Valid only if partial unmap is in effect.
+	 */
+	struct {
+		/** @start: Start address of the partial unmap range */
+		u64 start;
+		/** @end: End address of the partial unmap range */
+		u64 end;
+	} partial_unmap;
 };
 
 /**
-- 
2.43.0

