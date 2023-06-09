Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF8FC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AAD10E0AE;
	Fri,  9 Jun 2023 18:26:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA9010E0AE
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686335182; x=1717871182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dTTdKbgiyRpTRu0oBX+dQhWcdfGA0aob7iL42/4/B+8=;
 b=eJ3IbZ8pLTCFOzb1vNKZhuX5Q+tmEup+aE/yrn/UjC+l/kaDCpkguhCb
 qZAYG57SnbBlLNeg7s2QssIYBUGNNWyCy0zFASZDRlMaqKu3WLS5pQgTF
 e/wln7Fhhf6sbiwRqfvm7aex0h0f+2EPoT1noQQO8aebnQZf+peDcTmcF
 auf7yxyKFa7appmtW0tcgZguxRhNpWW6k6OyXOknfYiWZ4fjt55xB+5DT
 6D/QbrdVfgTUsOri2xH+/s6IM0dYwjnL/SjgUZYTSHWIWB7zeQyg7JWQR
 cu+5n4zuLTgGJOaZoMY4G+0aBpS1fflLOGOmKu8HaQAF8blsnULUxHJgn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361019681"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="361019681"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800305010"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="800305010"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:26:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri,  9 Jun 2023 11:26:27 -0700
Message-Id: <20230609182627.143150-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609182627.143150-1-matthew.brost@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Use Xe ordered workqueue for rebind
 worker
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

A mix of the system unbound wq and Xe ordered wq was used for the
rebind, only use the Xe ordered wq. This will ensure only 1 rebind is
occuring at a time providing a somewhat clunky work around for short
comings in TTM wrt to memory contention. Once the TTM memory contention
is resolved we should be able to use a dedicated non-ordered workqueue.

Also add helper to queue rebind worker to avoid using wrong workqueue
going forward.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_preempt_fence.c | 2 +-
 drivers/gpu/drm/xe/xe_vm.c            | 3 +--
 drivers/gpu/drm/xe/xe_vm.h            | 6 ++++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 78ad8c209873..219eefeb90ff 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -25,7 +25,7 @@ static void preempt_fence_work_func(struct work_struct *w)
 	dma_fence_signal(&pfence->base);
 	dma_fence_end_signalling(cookie);
 
-	queue_work(system_unbound_wq, &e->vm->preempt.rebind_work);
+	xe_vm_queue_rebind_worker(e->vm);
 
 	xe_engine_put(e);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1966a583b761..208e2f0bf41d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3103,8 +3103,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 			/* Rebinds may have been blocked, give worker a kick */
 			if (xe_vm_in_compute_mode(vm))
-				queue_work(vm->xe->ordered_wq,
-					   &vm->preempt.rebind_work);
+				xe_vm_queue_rebind_worker(vm);
 		}
 
 		goto put_engine;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 858207a20017..6086c455a51d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -134,6 +134,12 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
+static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
+{
+	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
+	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+}
+
 /*
  * XE_ONSTACK_TV is used to size the tv_onstack array that is input
  * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
-- 
2.34.1

