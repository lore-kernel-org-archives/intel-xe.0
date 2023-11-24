Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ECDC61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 17:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED3010E206;
	Fri, 24 Nov 2023 17:08:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3060410E206
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700845728; x=1732381728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jxIOQK+VUg24y0gYjsuzP1o+psRI0mBMwhKztHXLveA=;
 b=fd0xbIGKNNGbO9RddyriDXIgOuhQIa0PFx3aZihAu14VlM+7CuwnPO9m
 gTQY8H1hZucJdEdJdu3V0AsPvk2NPEhLGQ1hmO3MjpQC3gNW5im6blVrk
 +Yvju0vbt6w29yuM5DlkcBichfwIx1pbJrfd+9b1uKDbXV1RiO6U491Ti
 MkRwk5TyhpdIxYET1kKV0t5OeVuNAP3rYfNGXP3S0EUr+FYOpmoKfd0dH
 8mJPP+2lcPUW81mAR+Zxk06E42IJ9o7rZerXBZBbE+uTTQ6BWfc0qv9h4
 YJpUpMumFELJRv+P+Kf4qspjU2h5aGgkmQYWp/6mb8h2uXmZmnnuWsfCv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11126822"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="11126822"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 09:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="796632473"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="796632473"
Received: from ochura-mobl1.ccr.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.24.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 09:08:45 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 17:08:31 +0000
Message-ID: <20231124170830.398517-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix mem_access for early lrc generation
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

We spawn some hw queues during device probe to generate the default LRC
for every engine type, however the queue destruction step is typically
async. Queue destruction needs to do stuff like GuC context deregister
which requires GuC CT, which in turn requires an active mem_access ref.
The caller during probe is meant to hold the mem_access token, however
due to the async destruction it might have already been dropped if we
are unlucky.

Similar to how we already handle migrate VMs for which there is no
mem_access ref, fix this by keeping the callers token alive, releasing
it only when destroying the queue. We can treat a NULL vm as indication
that we need to grab our own extra ref.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 62d0237e724e..53daeea41d68 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -90,12 +90,12 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	/*
 	 * Normally the user vm holds an rpm ref to keep the device
 	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which
-	 * offers no such rpm ref. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to
+	 * some engines we use the kernels migrate vm underneath which offers no
+	 * such rpm ref, or we lack a normal vm. Make sure we keep a ref here,
+	 * so we can perform GuC CT actions when needed. Caller is expected to
 	 * have already grabbed the rpm ref outside any sensitive locks.
 	 */
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
+	if (q->flags & EXEC_QUEUE_FLAG_VM || !vm)
 		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
 
 	return q;
@@ -172,10 +172,10 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
+	if (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm)
+		xe_device_mem_access_put(gt_to_xe(q->gt));
 	if (q->vm)
 		xe_vm_put(q->vm);
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
-		xe_device_mem_access_put(gt_to_xe(q->gt));
 
 	kfree(q);
 }
-- 
2.42.0

