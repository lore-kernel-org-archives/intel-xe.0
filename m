Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C07C54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 16:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995D410F4C9;
	Thu,  7 Mar 2024 16:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMLanAlN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A69F10ED64
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709829689; x=1741365689;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2SnuBs9DaxMRZI7HLsqoXLe3tMnemEc7516AQM1GJyc=;
 b=NMLanAlN8oUUw7/Y4XO4ErD+OiVdK7mXcVasRkvtT7XKgGD7nF9NPS+S
 Ku3JIfqGU1RRl4cymncK3DxMb3rvYj/MiblqBety+4jajJFo7znr83lj9
 I1f6SO4VdASlKbyOoiqioLM6jQidRE511x9vBBqv0NMIX5a8KIeogRhG1
 TfM+GQM3iRtFpE53w8wC0yFD+3t+7FErVy2kUivMFu1zuSfuuUSIJ7clj
 v07913299CA+P3BDPKLNB4Of0l7DRYKHKWQzmOC9VdJPeL6tSBX2WSNr+
 uq5GjER+DVC1i1lQ9QpX3Xco9M3PEhkUfO6XQkR/LQt+8qFwEbTYPDt2d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15154907"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="15154907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 08:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="14731500"
Received: from nbint65x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.43])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 08:41:29 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/3] drm/xe: Move vma rebinding to the drm_exec locking loop
Date: Thu,  7 Mar 2024 17:41:19 +0100
Message-ID: <20240307164119.14838-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307164119.14838-1-thomas.hellstrom@linux.intel.com>
References: <20240307164119.14838-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_exec.c |  4 ++++
 drivers/gpu/drm/xe/xe_vm.c   | 12 +++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 5124663a9694..b683ce415ef1 100644
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d9487b39778e..dbfdfd3ee39c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -516,7 +516,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
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
@@ -568,10 +574,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
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

