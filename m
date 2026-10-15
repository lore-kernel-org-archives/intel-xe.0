Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040E6CC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 16:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20231123EF;
	Thu, 15 Oct 2026 16:27:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009FF112401
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792081622; x=1823617622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5nVZin+jZQ3Du3fyM6FgmSSUU+xhgE0Vg6quG54Pucc=;
 b=nzTCPMeqQdIFqb/23emtHxJHr4FVtEcql2zhkQlQDSlkHWgOVuUvtgPt
 CGvxGtgkycE6/IqN52s5hvCiwWsO7UCUY3ucHwutbsiVmM84M0zyRfnq0
 YrllK9aFZxnAGVQpJWh1au/R73+awsptGsy3ZAZ2TsaVKqiPzRS56bFlO
 sxnRqSOhT5fXXnuxHdNuZ+ed3Tn6o10sAMS9BL1Td5hWW30CMssQDXa8S
 FR8Xq6SdbsOH3GMAUqyHXA6pm46Ihoany8JfxJ7mNbFBPxSwqg6YMqQOw
 gmmgYNcXwGLpDPzReJMV0yEc9RUY/cPJ22WGb+cR/Et+sCjKwOEzbQgcW Q==;
X-CSE-ConnectionGUID: MwjvnEAiT5SijGpLmQeiNA==
X-CSE-MsgGUID: DLrxN4PMTCiV2tl12Yha4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="727809"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="727809"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 09:27:01 -0700
X-CSE-ConnectionGUID: JTIHkQgmSVGJwurHTCI/Ag==
X-CSE-MsgGUID: 0L4GoBEfSoqqSdkgPuYn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3513217"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 09:26:59 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v2] drm/xe: Rebind BOs evicted before the first LR queue
Date: Thu, 15 Oct 2026 21:56:39 +0530
Message-ID: <20261015162639.3528278-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

A VM bind can evict BOs before the first LR exec queue is added.
There is no preempt fence to trigger at that point.

When the queue is added later, its new preempt fence is not triggered.
The exec IOCTL does not validate or rebind BOs in preempt fence mode,
and the rebind worker skips that work because no preempt fence is
waiting. The first exec can then use stale mappings.

Trigger the new preempt fence in xe_vm_add_compute_exec_queue() when
the VM has evicted BOs or pending rebinds. This keeps the queue
suspended until the rebind worker validates the BOs and restores
their mappings.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 095f762bbb6f..cbe60e876a45 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -272,8 +272,15 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	 * Check to see if a preemption on VM is in flight or userptr
 	 * invalidation, if so trigger this preempt fence to sync state with
 	 * other preempt fences on the VM.
+	 *
+	 * Also trigger it if eviction or rebinding is pending. BOs evicted
+	 * before the first exec queue was added had no preempt fence to
+	 * trigger. Suspend this queue until the rebind worker restores
+	 * the mappings.
 	 */
-	wait = __xe_vm_userptr_needs_repin(vm) || preempt_fences_waiting(vm);
+	wait = __xe_vm_userptr_needs_repin(vm) || preempt_fences_waiting(vm) ||
+		!list_empty(&vm->gpuvm.evict.list) ||
+		!list_empty(&vm->rebind_list);
 	if (wait)
 		dma_fence_enable_signaling(pfence);
 
-- 
2.43.0

