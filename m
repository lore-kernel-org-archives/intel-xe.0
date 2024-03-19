Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FAAC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF9D10E8C8;
	Tue, 19 Mar 2024 17:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqJmYYVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF9510E8C8
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710871190; x=1742407190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kQHCKU4c6qwPR6OjSqV0WLiOXr83lkeeTTtkSjmCeHw=;
 b=jqJmYYVderX1rM766u+4Mgol9ZH+xCwiitGYF7BI/9Wuj0bOeKopnzkI
 urLwTo2XPMhdScT/fPBoAZS0TKv95F33oZT6Y1s9TkSA3Zm2DhdfloXuz
 s6aDXz6LolWEeYCj/zK2rE6AY47WdCWev6FKZtt0nPgpiBe+gfY1gCV/3
 lN0u/yvp50kJqfLvngaC61NtAQcA5wJ3G0P+sdQ/zXBcz0FoyrTgfdw1w
 qwnL4wqVIFpYCTFj8KgPQHJuM6xLrWze3isjXRnms9U+HSkE23rMNU6hJ
 5HgmhoKc5vIEJf9/IXI3eyB/vRODJsaPoL6tVMxZ6/hAhELxWmPL1M9wd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5638091"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5638091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="14554625"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:59:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	stuart.summers@intel.com
Subject: [PATCH] drm/xe: Streamline exec queue freeing path
Date: Tue, 19 Mar 2024 10:59:46 -0700
Message-ID: <20240319175947.15890-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Ensure exec queue freeing happens at one place, that is in
__xe_exec_queue_free(). It releases q->vm reference also. Set
q->vm before handling extensions as they can potentially reference it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2016c1af9633..a1b3c7144977 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -33,6 +33,13 @@ enum xe_exec_queue_sched_prop {
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
 
+static void __xe_exec_queue_free(struct xe_exec_queue *q)
+{
+	if (q->vm)
+		xe_vm_put(q->vm);
+	kfree(q);
+}
+
 static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 						   struct xe_vm *vm,
 						   u32 logical_mask,
@@ -74,6 +81,9 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	else
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
+	if (vm)
+		q->vm = xe_vm_get(vm);
+
 	if (extensions) {
 		/*
 		 * may set q->usm, must come before xe_lrc_init(),
@@ -81,14 +91,11 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		 */
 		err = exec_queue_user_extensions(xe, q, extensions, 0);
 		if (err) {
-			kfree(q);
+			__xe_exec_queue_free(q);
 			return ERR_PTR(err);
 		}
 	}
 
-	if (vm)
-		q->vm = xe_vm_get(vm);
-
 	if (xe_exec_queue_is_parallel(q)) {
 		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
 		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
@@ -97,13 +104,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static void __xe_exec_queue_free(struct xe_exec_queue *q)
-{
-	if (q->vm)
-		xe_vm_put(q->vm);
-	kfree(q);
-}
-
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_device *xe = gt_to_xe(q->gt);
-- 
2.43.0

