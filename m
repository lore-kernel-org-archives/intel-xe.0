Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75986C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 21:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEA910E052;
	Fri, 26 Jul 2024 21:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loEvOTHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5688910E052
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722030755; x=1753566755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=265juJzIQezHvjtGkRUOWhue23iP+s7l3I/QpiA/p0s=;
 b=loEvOTHFAQS8jyYRlytlt4QpvQX/tYtld8a6ke/nBtBIwWLZzsNDeCdC
 1m41c3aAfvwxoDfSJXuvbJBHGc/RrGZOfFb1sChe8WzMGa9TExH6dmkHc
 Wyi2NPvCcv1h3vWhmZ+mlTT3GdL0MtKhLVjDiEgtfHH1pPkQPqPMgIWcr
 OJOSM8nS1J3ZI6SuOifhxdWZklKfTkDmf9WH3xd3F9MQ1tUFw1dlF1hub
 TsPoQkGH1TWywmT2FGPyfpJPo8bSIzHL0GzBLEgy90Ul6VKFnSuEwVzvK
 W+XDpvzkoOTbcHxxt8IwIPaNIf+wBL6lCXKhDcDUiMh7jpbg4GEJ2locj g==;
X-CSE-ConnectionGUID: SnbsuakWQWW9h93xG3TS0A==
X-CSE-MsgGUID: lK7Gj3YLRdiBEPXJE0JjjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23694627"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="23694627"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 14:52:34 -0700
X-CSE-ConnectionGUID: T92HrvstQC+laPqKVyZeTA==
X-CSE-MsgGUID: lZbNzA+1SbCLorA2leUtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="57554474"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 14:52:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, paulo.r.zanoni@intel.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/xe: Prime userptr notifier lock with reclaim
Date: Fri, 26 Jul 2024 14:53:22 -0700
Message-Id: <20240726215322.2108865-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The userptr notifier lock is in the path of reclaim as it is taken in a
MMU notifier which is in the path of reclaim. Prime lockdep with this
annotation making it clear memory allocations are not allowed under the
userptr notifier lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12d43c35978c..b500cb862342 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1374,6 +1374,18 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
+static void xe_vm_userptr_notifier_lock_init(struct xe_vm *vm)
+{
+	init_rwsem(&vm->userptr.notifier_lock);
+
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&vm->userptr.notifier_lock);
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1399,7 +1411,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
-	init_rwsem(&vm->userptr.notifier_lock);
+	xe_vm_userptr_notifier_lock_init(vm);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
-- 
2.34.1

