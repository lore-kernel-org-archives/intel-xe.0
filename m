Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45169CD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EE210E7D4;
	Thu, 21 Mar 2024 11:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oj3ZWmsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F81210E7E4
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711021068; x=1742557068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aPap9wwIdCgmLMRIKD8OVhLjrIJIzKStYCmfFlK0u5Y=;
 b=Oj3ZWmsqC/Cg3GnXQLREOoOeMD7VkEB7Hqbkc3eUmq33AvctBxT4v6KF
 GO0fI2Sfnzua7uY7DH8Nr6jGGeJBXADBc46SN05U0HJUeLKGknSQWNZwA
 eMXiVAuMAmSJ8SevOTCwgLkX5MpsaxOXof2TatMtC8w9nYcAJg2YCU/n9
 J2rhiQCSJeB5dyczsGjE3fYFNNZAwgOTRH3dDP9UpG53KhRRqN36w+p0k
 Ee+5Jn1xRkteXOc93LfkhAfi39DPin43qqcYBalLkREctY4Ub4tTiQePi
 eFY+9zSoC8cHZuXl0tZOdujfMZxHKzenZTFpiOzdNF9crOl/deNiLIz72 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6127361"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6127361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19053287"
Received: from dinieasx-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.100])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:37:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 5/7] drm/xe: Move vma rebinding to the drm_exec locking loop
Date: Thu, 21 Mar 2024 12:37:18 +0100
Message-ID: <20240321113720.120865-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
References: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
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

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_vm.c   | 12 +++++++++---
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 397a49b731f1..e00910246741 100644
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
index 33a85e702e2c..f9da055180b3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -512,9 +512,15 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
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
-- 
2.44.0

