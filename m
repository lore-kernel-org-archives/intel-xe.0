Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25041C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 03:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B8A10EA7A;
	Fri,  1 Mar 2024 03:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aw0lCGKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2CC10EA78
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 03:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709265312; x=1740801312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4EXixqqAM+DvQAh/pnsrfpjoMSr6IrUhUdKmRQ8BHr0=;
 b=aw0lCGKilDsq2/AmZZrOEHUg58WEQjlKRBlZw8n6V0bvC8U3/rSka+Yz
 CVZVgXwrCg+QXffd1g6y/SoSQXvU96K3NLCwrQ2TibFniXMZY+Y4dNa7R
 PK5qoTEvYq5a7enmyyngBTDy3/t216EKYQJrn3BipG91FPZbx5nAwwqZ1
 cYAJ80mNBl9DGxtJspPGv/L5e5fYVIsfs+/Y9Pv+Y9xbe2zIZbWHLh6/B
 qeI6VtBIuI/QJl7IHta4m15mNE1FsW/n23JEaYxRvfXsuPGOwz2XwoMT1
 f1w41EbUqMbs678307Pec1707VTEVUH38EyWDFOjITRVgc8yZk+UadEpZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14425068"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="14425068"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 19:55:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="45607205"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 19:55:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Get page on user fence creation
Date: Thu, 29 Feb 2024 19:55:22 -0800
Message-Id: <20240301035522.238307-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301035522.238307-1-matthew.brost@intel.com>
References: <20240301035522.238307-1-matthew.brost@intel.com>
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

Attempt to get page on user fence creation and kmap_local_page on
signaling. Should reduce latency and can ensure 64 bit atomicity
compared to copy_to_user.

v2:
 - Prefault page and drop ref (Thomas)
 - Use set_page_dirty_lock (Thomas)
 - try_cmpxchg64 loop (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 52 +++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c20e1f9ad267..bf7f22519cc5 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -6,6 +6,7 @@
 #include "xe_sync.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/highmem.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -28,6 +29,7 @@ struct xe_user_fence {
 	u64 __user *addr;
 	u64 value;
 	int signalled;
+	bool use_page;
 };
 
 static void user_fence_destroy(struct kref *kref)
@@ -53,7 +55,9 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
+	struct page *page;
 	u64 __user *ptr = u64_to_user_ptr(addr);
+	int ret;
 
 	if (!access_ok(ptr, sizeof(ptr)))
 		return ERR_PTR(-EFAULT);
@@ -69,19 +73,53 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
 
+	/* Prefault page */
+	ret = get_user_pages_fast(addr, 1, FOLL_WRITE, &page);
+	if (ret == 1) {
+		ufence->use_page = true;
+		put_page(page);
+	}
+
 	return ufence;
 }
 
 static void user_fence_worker(struct work_struct *w)
 {
 	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
-
-	if (mmget_not_zero(ufence->mm)) {
-		kthread_use_mm(ufence->mm);
-		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
-			XE_WARN_ON("Copy to user failed");
-		kthread_unuse_mm(ufence->mm);
-		mmput(ufence->mm);
+	struct mm_struct *mm = ufence->mm;
+
+	if (mmget_not_zero(mm)) {
+		kthread_use_mm(mm);
+		if (ufence->use_page) {
+			struct page *page;
+			int ret;
+
+			ret = get_user_pages_fast((unsigned long)ufence->addr,
+						  1, FOLL_WRITE, &page);
+			if (ret == 1) {
+				u64 *ptr;
+				u64 old = 0;
+				void *va;
+
+				va = kmap_local_page(page);
+				ptr = va + offset_in_page(ufence->addr);
+				while (!try_cmpxchg64(ptr, &old, ufence->value))
+					continue;
+				kunmap_local(va);
+
+				set_page_dirty_lock(page);
+				put_page(page);
+			} else {
+				ufence->use_page = false;
+			}
+		}
+		if (!ufence->use_page) {
+			if (copy_to_user(ufence->addr, &ufence->value,
+					 sizeof(ufence->value)))
+				drm_warn(&ufence->xe->drm, "Copy to user failed\n");
+		}
+		kthread_unuse_mm(mm);
+		mmput(mm);
 	}
 
 	wake_up_all(&ufence->xe->ufence_wq);
-- 
2.34.1

