Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA68C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 13:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9576510EE34;
	Wed, 20 Mar 2024 13:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgtOFzyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7DD10E14E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710942252; x=1742478252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uQmp5ZxMJkTnu4TXeaIGthgcB3LBPzqXjZFj70aCWy8=;
 b=jgtOFzyxwqwT9OI8ERT3/OwtZI3JGonRhOc4pDCh5AWqQLR4kILxlF4X
 aKUZdnSFk5G9SKxtTVLhsiSLOBwLeCEvmFFfzxSWnzuUVbevITmmHMiFg
 dvBvJQ9bzU2KXe9rT4Fx2K8jY+KNNPEBsqQqUcWcPSdUl5WhIT4qyimdl
 diomg9zzH8hKI6MapFZjOHcImVnAckxlvvstz7R/I//wl8KhcvyF8xchO
 vRd/quU1HQ7KkZrcfigYYuXKTc/1eCxcNQzXGTsBbxSyJzC5XXckh/gay
 zR8WKoDvg25ybe8twmjkGuGBvMXpm2fOUdcVHyOX/1Qcs6AeTPR+1KvrI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="8811904"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="8811904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18810084"
Received: from prabaaax-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:44:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 5/8] drm/xe: Move vma rebinding to the drm_exec locking loop
Date: Wed, 20 Mar 2024 14:43:53 +0100
Message-ID: <20240320134356.73655-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320134356.73655-1-thomas.hellstrom@linux.intel.com>
References: <20240320134356.73655-1-thomas.hellstrom@linux.intel.com>
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

