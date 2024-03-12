Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DF1C54E68
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4B811227B;
	Tue, 12 Mar 2024 14:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJxOKX+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D923010FD94
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252308; x=1741788308;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=isQYe8KKK5P/gOab3PE4jDJqjQgD23xawFufo/i5VMc=;
 b=aJxOKX+iPoceqwhPI1VPmyllWGtQfpuUimcmJxeM9Te9sWGKRa6lt4ZS
 3gVhuq/g82HeLxMZUuAqsN4Sk31P0VV5wkERs+ScPOi/gEt03SJ+3HzaJ
 ksmySuuY8tQwIdqyqshWwNp3fiLZBuSydpQu9h582mBIAC6EBDOtcJyVI
 JnLB+n0JoiKsXAR5yaXeq6YquJ56D+FWUmCZaqt7GnDWD8C9s059Vytb8
 VT3FnObI12iXu2z7KpOISkUfEE5i25lUbzOOn+YkG4Ojv2ofSB6gJqyal
 yCHUcJWBIT4rImeYQ1E9BKIqN+QXkgQROr6+G2aNJfGcpEhgWzqOGMSad w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22415995"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22415995"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12148460"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/7] drm/xe: Move vma rebinding to the drm_exec locking loop
Date: Tue, 12 Mar 2024 15:04:44 +0100
Message-ID: <20240312140447.50437-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
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

Rebinding might allocate page-table bos, causing evictions.
To support blocking locking during these evictions,
perform the rebinding in the drm_exec locking loop.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_vm.c   | 16 +++++++++-------
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 13d1fba2c9d7..f36fb22a7861 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -96,13 +96,20 @@
 
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
+	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
 	struct drm_gem_object *obj;
 	unsigned long index;
 	int ret;
 
-	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
-	if (ret)
-		return ret;
+	do {
+		ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
+		if (ret)
+			return ret;
+
+		ret = xe_vm_rebind(vm, false);
+		if (ret)
+			return ret;
+	} while (!list_empty(&vm->gpuvm.evict.list));
 
 	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
 		ret = dma_resv_reserve_fences(obj->resv, 1);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index faad7f52b3ca..fad5b1ae7f2d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -513,9 +513,15 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	err = drm_gpuvm_validate(&vm->gpuvm, exec);
-	if (err)
-		return err;
+	do {
+		err = drm_gpuvm_validate(&vm->gpuvm, exec);
+		if (err)
+			return err;
+
+		err = xe_vm_rebind(vm, true);
+		if (err)
+			return err;
+	} while (!list_empty(&vm->gpuvm.evict.list));
 
 	drm_exec_for_each_locked_object(exec, index, obj) {
 		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);
@@ -575,10 +581,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	err = xe_vm_rebind(vm, true);
-	if (err)
-		goto out_unlock;
-
 	if (vm->rebind_fence) {
 		dma_fence_wait(vm->rebind_fence, false);
 		dma_fence_put(vm->rebind_fence);
-- 
2.44.0

