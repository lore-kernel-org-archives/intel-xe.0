Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345C0C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FCC10E4B3;
	Tue,  7 Nov 2023 05:29:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2F8710E4B2;
 Tue,  7 Nov 2023 05:29:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C896CA0169;
 Tue,  7 Nov 2023 05:29:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 07 Nov 2023 05:29:25 -0000
Message-ID: <169933496581.21166.13200920084087449755@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231107052603.124361-1-matthew.brost@intel.com>
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Refactor_VM_bind_code_=28rev2=29?=
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Refactor VM bind code (rev2)
URL   : https://patchwork.freedesktop.org/series/125608/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 5a3a6fdda drm/xe: Fix pagefault and access counter worker functions
=== git am output follows ===
Applying: drm/xe: Allow num_binds == 0 in VM bind IOCTL
Applying: drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
Applying: drm/xe: Take in-syncs into account when num_execs or num_binds == 0
Applying: drm/xe: Lock all gpuva ops during VM bind IOCTL
Applying: drm/xe: Add ops_execute function which returns a fence
Applying: drm/xe: Move migrate to prefetch to op_lock funtion
Applying: drm/xe: Add struct xe_vma_ops abstraction
Applying: drm/xe: Update xe_vm_rebind to use dummy VMA operations
Applying: drm/xe: Move drm exec loop to vm_bind_ioctl_ops_execute
Applying: drm/xe: Fixup error handling / ref counting in VM bind IOCTL
Applying: drm/xe: Convert pagefault rebind to use ops interface
Applying: drm/xe: Add some members to xe_vma_ops
Applying: drm/xe: Add vm_bind_ioctl_ops_install_fences helper
Applying: drm/xe: Drop rebind argument from xe_pt_prepare_bind
Applying: drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Applying: drm/xe: Move setting last fence and sync wait to vm_bind_ioctl_ops_install_fences
Applying: drm/xe: Fix vma_is_valid to use tile argument
Applying: drm/xe: Adjust tile mask in operations create
Applying: drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
Applying: drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Applying: drm/xe: Convert multiple bind ops into single job
Applying: drm/xe: Update clear / populate arguments
Applying: drm/xe: Add __xe_migrate_update_pgtables_cpu helper
Applying: drm/xe: Add xe_hw_fence_signal helper
Applying: drm/xe: CPU binds for jobs
Applying: drm/xe: Don't use migrate exec queue for page fault binds
Applying: drm/xe/uapi: Make sync vs async VM bind operations per IOCTL rather than queue


