Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B3FC54E51
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 02:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3692110F29C;
	Tue, 27 Feb 2024 02:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjXfmKzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A3810F298
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 02:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709001809; x=1740537809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Il9dGaA1nNAhzTjASs7ejbS6vqvOoOb7s2pxLAJy8fk=;
 b=FjXfmKzJj1VgkOYOyGefTnKBKzlRD5MRrieg7QemUX79tOeh7FAPFx7s
 xoYZna290x+vnc+0m0/IBsDQSRBzEIspFzrBzPmO6Hk2IRBVy/JIarpQy
 2Ug82OnRGcFwRiBhxoR3cfyWxK9ow6WqXl3chJxvDtNwjK/CCtGrWOCrU
 1XqYd2J5mq2lZ7wibrP6fS39Xb0orKwv86lT3uI8nvMjC7rFvINNjLiO4
 Iw+w8GWPY+Dx9WMgroDvBaSd6341OLvRDnp3gB/MYF23SXXDeBAJCiJh0
 eiBDIF/VjM5qVpHUNKPNvbN6kvAp9t2PhrusbK60hE8UHsTaeLqmrW7o0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6275539"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6275539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7094017"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe: Get page on user fence creation
Date: Mon, 26 Feb 2024 18:43:37 -0800
Message-Id: <20240227024337.141585-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227024337.141585-1-matthew.brost@intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 45 ++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 022e158d28d9..2f3e062c0101 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -6,6 +6,7 @@
 #include "xe_sync.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/highmem.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -25,6 +26,7 @@ struct user_fence {
 	struct dma_fence_cb cb;
 	struct work_struct worker;
 	struct mm_struct *mm;
+	struct page *page;
 	u64 __user *addr;
 	u64 value;
 };
@@ -34,7 +36,10 @@ static void user_fence_destroy(struct kref *kref)
 	struct user_fence *ufence = container_of(kref, struct user_fence,
 						 refcount);
 
-	mmdrop(ufence->mm);
+	if (ufence->page)
+		put_page(ufence->page);
+	else if (ufence->mm)
+		mmdrop(ufence->mm);
 	kfree(ufence);
 }
 
@@ -53,6 +58,7 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 {
 	struct user_fence *ufence;
 	u64 __user *ptr = u64_to_user_ptr(addr);
+	int ret;
 
 	if (!access_ok(ptr, sizeof(ptr)))
 		return ERR_PTR(-EFAULT);
@@ -66,7 +72,11 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	ufence->addr = ptr;
 	ufence->value = value;
 	ufence->mm = current->mm;
-	mmgrab(ufence->mm);
+	ret = get_user_pages_fast(addr, 1, FOLL_WRITE, &ufence->page);
+	if (ret != 1) {
+		mmgrab(ufence->mm);
+		ufence->page = NULL;
+	}
 
 	return ufence;
 }
@@ -74,13 +84,30 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 static void user_fence_worker(struct work_struct *w)
 {
 	struct user_fence *ufence = container_of(w, struct user_fence, worker);
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
+		if (ufence->page) {
+			u64 *ptr;
+			void *va;
+
+			va = kmap_local_page(ufence->page);
+			ptr = va + offset_in_page(ufence->addr);
+			xchg(ptr, ufence->value);
+			kunmap_local(va);
+
+			set_page_dirty(ufence->page);
+			put_page(ufence->page);
+			ufence->page = NULL;
+			ufence->mm = NULL;
+		} else {
+			kthread_use_mm(mm);
+			if (copy_to_user(ufence->addr, &ufence->value,
+					 sizeof(ufence->value)))
+				drm_warn(&ufence->xe->drm, "Copy to user failed\n");
+			kthread_unuse_mm(mm);
+		}
+		mmput(mm);
 	}
 
 	wake_up_all(&ufence->xe->ufence_wq);
-- 
2.34.1

