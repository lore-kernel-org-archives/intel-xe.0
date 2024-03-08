Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E14C54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AE8112339;
	Fri,  8 Mar 2024 05:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clSHVCXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37B112339
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874475; x=1741410475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h8dT9CUxfCt00BrANa6Z/WacOamlPMevv5Dnw96EiNs=;
 b=clSHVCXkMe7caaMxfMq6Gdo6WyMSN+gZlz5RQ9W7di+fm2aJvHTcTuWf
 LcbXAdyAsqLbGYknUzmNr5bbMVvBG0iDlY65TS8IZwcMRmR8f2H/YQbDF
 UCNj0dGWyzJKeqocrwJzwXMzlzMCOsJETt5DTboztxdn0gzLg7ILEs8Gl
 TPicJRkCu6FTNIZ/5MeGPzyt6cO40VrNFjl3INI9cxYbqd5gHhAbViovy
 FAsTV5VJwP2CLhh2n3eNAZqryBiXV9p3qOeOljoKCNV98/zoWj0bv1lPy
 43bYhQ/z7TWkl9YHJ1JxibrCj8TONL7I2NTJtkWY4gZViPPxFdoDGypMu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761979"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761979"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403034"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 22/30] drm/xe: Move vma rebinding to the drm_exec locking
 loop
Date: Thu,  7 Mar 2024 21:07:58 -0800
Message-Id: <20240308050806.577176-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Rebinding might allocate page-table bos, causing evictions.
To support blocking locking during these evictions,
perform the rebinding in the drm_exec locking loop.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 12 ++++--------
 drivers/gpu/drm/xe/xe_vm.c   | 12 +++++++-----
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7d676e3610fa..7f91b4b13634 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -106,6 +106,10 @@ static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 	if (ret)
 		return ret;
 
+	ret = xe_vm_rebind(vm, false);
+	if (ret)
+		return ret;
+
 	/*
 	 * 1 fence slot for the final submit, and 1 more for every per-tile for
 	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
@@ -284,14 +288,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
-	/*
-	 * Rebind any invalidated userptr or evicted BOs in the VM, non-compute
-	 * VM mode only.
-	 */
-	err = xe_vm_rebind(vm, false);
-	if (err)
-		goto err_put_job;
-
 	/* Wait for rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 47a0d3a6cda5..e7bc9c3a8a83 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -519,7 +519,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	return drm_gpuvm_validate(&vm->gpuvm, exec);
+	err = drm_gpuvm_validate(&vm->gpuvm, exec);
+	if (err)
+		return err;
+
+	err = xe_vm_rebind(vm, true);
+
+	return err;
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
@@ -571,10 +577,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	err = xe_vm_rebind(vm, true);
-	if (err)
-		goto out_unlock;
-
 	/* Wait on rebinds */
 	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
-- 
2.34.1

