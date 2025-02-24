Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08735C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E1D10E440;
	Mon, 24 Feb 2025 13:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVi43jNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CA410E0C5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 04:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740369869; x=1771905869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CbZTKoFPJ+hHuaptQZd+fb5Ic6P/8TjkA4NtW0jdxa0=;
 b=PVi43jNTAGoDSehrD7BPnmZcuEdTrb+f4Yngmm1Bq6XEO0HkIUMVRH2p
 mfEuaHxOWPvrko3zm1BQ311edn965z6/jnwdZTy3/oGdIxTckq5D6kOFy
 MyG8vBy9Wm/OHNU2mOiMwDEfNrEBi3zKk2RZEOx3zf7y5REFuXHepEtLd
 NQOW4kONSPx0Nc8Ap8qUZhFy7ir5Glom0nF9h6gj3k3wAl4rppV2QugVF
 x148/zSHVkPkbxaS52LvZt7NeIW0hZbHI1Q3w5Lp30XObYHybCShm1dHu
 ZLyYgJFtCL3JM1UUVcTRojrhQHjrYx1mdmLAOoc9x5ahGKr77uAGbb7OX A==;
X-CSE-ConnectionGUID: tZ8Fxd+XQTynbGnZiwGpyw==
X-CSE-MsgGUID: VLY9EoRPRLyh5Bj0pkC/5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="51740515"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51740515"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:04:29 -0800
X-CSE-ConnectionGUID: qBq8s/96Rm2k2XQXLDL8rA==
X-CSE-MsgGUID: 8nNVnz3ITwuDhCDWEE+WCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115788475"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:04:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 1/3] drm/xe/userptr: fix EFAULT handling
Date: Sun, 23 Feb 2025 20:05:27 -0800
Message-Id: <20250224040529.3025963-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224040529.3025963-1-matthew.brost@intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

Currently we treat EFAULT from hmm_range_fault() as a non-fatal error
when called from xe_vm_userptr_pin() with the idea that we want to avoid
killing the entire vm and chucking an error, under the assumption that
the user just did an unmap or something, and has no intention of
actually touching that memory from the GPU.  At this point we have
already zapped the PTEs so any access should generate a page fault, and
if the pin fails there also it will then become fatal.

However it looks like it's possible for the userptr vma to still be on
the rebind list in preempt_rebind_work_func(), if we had to retry the
pin again due to something happening in the caller before we did the
rebind step, but in the meantime needing to re-validate the userptr and
this time hitting the EFAULT.

This might explain an internal user report of hitting:

[  191.738349] WARNING: CPU: 1 PID: 157 at drivers/gpu/drm/xe/xe_res_cursor.h:158 xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
[  191.738551] Workqueue: xe-ordered-wq preempt_rebind_work_func [xe]
[  191.738616] RIP: 0010:xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
[  191.738690] Call Trace:
[  191.738692]  <TASK>
[  191.738694]  ? show_regs+0x69/0x80
[  191.738698]  ? __warn+0x93/0x1a0
[  191.738703]  ? xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
[  191.738759]  ? report_bug+0x18f/0x1a0
[  191.738764]  ? handle_bug+0x63/0xa0
[  191.738767]  ? exc_invalid_op+0x19/0x70
[  191.738770]  ? asm_exc_invalid_op+0x1b/0x20
[  191.738777]  ? xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
[  191.738834]  ? ret_from_fork_asm+0x1a/0x30
[  191.738849]  bind_op_prepare+0x105/0x7b0 [xe]
[  191.738906]  ? dma_resv_reserve_fences+0x301/0x380
[  191.738912]  xe_pt_update_ops_prepare+0x28c/0x4b0 [xe]
[  191.738966]  ? kmemleak_alloc+0x4b/0x80
[  191.738973]  ops_execute+0x188/0x9d0 [xe]
[  191.739036]  xe_vm_rebind+0x4ce/0x5a0 [xe]
[  191.739098]  ? trace_hardirqs_on+0x4d/0x60
[  191.739112]  preempt_rebind_work_func+0x76f/0xd00 [xe]

Followed by NPD, when running some workload, since the sg was never
actually populated but the vma is still marked for rebind when it should
be skipped for this special EFAULT case. And from the logs it does seem
like we hit this special EFAULT case before the explosions.

v2 (MattB):
 - Move earlier

Fixes: 521db22a1d70 ("drm/xe: Invalidate userptr VMA on page pin fault")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d664f2e418b2..ea2e287e6526 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -681,6 +681,18 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 		err = xe_vma_userptr_pin_pages(uvma);
 		if (err == -EFAULT) {
 			list_del_init(&uvma->userptr.repin_link);
+			/*
+			 * We might have already done the pin once already, but
+			 * then had to retry before the re-bind happened, due
+			 * some other condition in the caller, but in the
+			 * meantime the userptr got dinged by the notifier such
+			 * that we need to revalidate here, but this time we hit
+			 * the EFAULT. In such a case make sure we remove
+			 * ourselves from the rebind list to avoid going down in
+			 * flames.
+			 */
+			if (!list_empty(&uvma->vma.combined_links.rebind))
+				list_del_init(&uvma->vma.combined_links.rebind);
 
 			/* Wait for pending binds */
 			xe_vm_lock(vm, false);
-- 
2.34.1

