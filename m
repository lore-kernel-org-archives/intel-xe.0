Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869A8C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 10:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389BF10FC06;
	Wed,  6 Mar 2024 10:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eA1VSGKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042D210EC52
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719304; x=1741255304;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mD5CdXPIFcHVbDcV7ysdbEhDSsuk/8z5MXdvzkUSZE4=;
 b=eA1VSGKtyc1KeGGXXZUsu6JDS8qZwLbuR5ZTy0jhJ3Y/wcNx728A5x2G
 5PRTwMBzXt8OtNAqlXbKoCJxOLwJ3BthwBl9AfMUZb5dxnmwXyLWPEcYV
 synl7tRtBVOewzz9a8b0A6RXmupUSt5APrNh+aVZV0lhfL4ozMZVIQ8CT
 jYEl9ZCijVXw1ArJJKDaYOtP5Uoudai0/psHAas+ajsdxVhpKrdqAfh3V
 /oSV41lIc9Iz6fzKZPl0KFQzhNmLqQdHHd0sV9Hjngvk3r4pUMCC3UR+w
 YBOgB6nfu2qUyJCcU+pZqNfvf7hNCKGKc+aHjcTCsvYvTDw/QPGOegy2t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4255154"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4255154"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9587652"
Received: from fatinf5x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:01:42 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe: Move vma rebinding to the drm_exec locking loop
Date: Wed,  6 Mar 2024 11:01:33 +0100
Message-ID: <20240306100133.4962-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306100133.4962-1-thomas.hellstrom@linux.intel.com>
References: <20240306100133.4962-1-thomas.hellstrom@linux.intel.com>
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
index 427b2063d876..732132bba537 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -515,7 +515,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
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
@@ -567,10 +573,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
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

