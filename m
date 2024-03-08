Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C940C54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FC810F109;
	Fri,  8 Mar 2024 05:42:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CA610F109;
 Fri,  8 Mar 2024 05:42:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Refactor_VM_bind_cod?=
 =?utf-8?q?e_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 05:42:43 -0000
Message-ID: <170987656323.611088.12166758276629844358@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308050806.577176-1-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Refactor VM bind code (rev5)
URL   : https://patchwork.freedesktop.org/series/125608/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ee6e5c86f4d5 drm-tip: 2024y-03m-08d-03h-42m-43s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Lock all gpuva ops during VM bind IOCTL
Applying: drm/xe: Add ops_execute function which returns a fence
Applying: drm/xe: Move migrate to prefetch to op_lock function
Applying: drm/xe: Add struct xe_vma_ops abstraction
Applying: drm/xe: Update xe_vm_rebind to use dummy VMA operations
Applying: drm/xe: Simplify VM bind IOCTL error handling and cleanup
Applying: drm/xe: Update pagefaults to use dummy VMA operations
Applying: drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Applying: drm/xe: Add some members to xe_vma_ops
Applying: drm/xe: Add vm_bind_ioctl_ops_install_fences helper
Applying: drm/xe: Move setting last fence to vm_bind_ioctl_ops_install_fences
Applying: drm/xe: Move ufence check to op_lock
Applying: drm/xe: Move ufence add to vm_bind_ioctl_ops_install_fences
Applying: drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
Applying: drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Applying: drm/xe: Use ordered WQ for TLB invalidation fences
Applying: drm/xe: Delete PT update selftest
Applying: drm/xe: Convert multiple bind ops into single job
Applying: drm/xe: Remove old functions defs in xe_pt.h
Applying: drm/xe: Update PT layer with better error handling
Applying: drm/xe: Update xe_vm_rebind to return int
Applying: drm/xe: Move vma rebinding to the drm_exec locking loop
Applying: drm/xe: Update VM trace events
Applying: drm/xe: Update clear / populate arguments
Applying: drm/xe: Add __xe_migrate_update_pgtables_cpu helper
Applying: drm/xe: CPU binds for jobs
Applying: drm/xe: Don't use migrate exec queue for page fault binds
Applying: drm/xe: Add VM bind IOCTL error injection
Applying: drm/xe/guc: Assert time'd out jobs are not from a VM exec queue
Applying: drm/xe: Add PT exec queues


