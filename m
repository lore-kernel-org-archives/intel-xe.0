Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1736C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEECD10E75B;
	Thu, 26 Oct 2023 04:51:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F01C10E75B;
 Thu, 26 Oct 2023 04:51:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7F138A0BA8;
 Thu, 26 Oct 2023 04:51:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 26 Oct 2023 04:51:46 -0000
Message-ID: <169829590651.20471.13240292287314309987@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231026040213.1272993-1-matthew.brost@intel.com>
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?factor_VM_bind_code?=
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

Series: Refactor VM bind code
URL   : https://patchwork.freedesktop.org/series/125608/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7b761f152371ab5b7e2f21f970d459e0c3778b82
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 25 21:02:13 2023 -0700

    drm/xe/uapi: Make sync vs async VM bind operations per IOCTL rather than queue
    
    Making sync vs async per IOCTL simplifies the uAPI while also making it
    more flexible. Adjust the uAPI accordingly.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df drm-intel
5e06ef0ef drm/xe: Allow num_binds == 0 in VM bind IOCTL
-:52: WARNING:ALLOC_WITH_MULTIPLY: Prefer kcalloc over kzalloc with multiply
#52: FILE: drivers/gpu/drm/xe/xe_vm.c:3020:
+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
c2e508592 drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
9b32c4be2 drm/xe: Lock all gpuva ops during VM bind IOCTL
7c2c36d6b drm/xe: Add ops_execute function which returns a fence
42d99b48a drm/xe: Move migrate to prefetch to op_lock funtion
-:4: WARNING:TYPO_SPELLING: 'funtion' may be misspelled - perhaps 'function'?
#4: 
Subject: [PATCH] drm/xe: Move migrate to prefetch to op_lock funtion
                                                             ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 57 lines checked
effe5583e drm/xe: Add struct xe_vma_ops abstraction
21d5f97cb drm/xe: Update xe_vm_rebind to use dummy VMA operations
6508a6399 drm/xe: Move drm exec loop to vm_bind_ioctl_ops_execute
c36aea3fa drm/xe: Fixup error handling / ref counting in VM bind IOCTL
4dc614ca6 drm/xe: Convert pagefault rebind to use ops interface
583508ab5 drm/xe: Add some members to xe_vma_ops
5d2dd52fe drm/xe: Add vm_bind_ioctl_ops_install_fences helper
81b301767 drm/xe: Drop rebind argument from xe_pt_prepare_bind
e83a5202b drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
278b05b89 drm/xe: Move setting last fence and sync wait to vm_bind_ioctl_ops_install_fences
80baec27d drm/xe: Fix vma_is_valid to use tile argument
3803fe843 drm/xe: Adjust tile mask in operations create
9730b8e16 drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
-:107: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#107: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:310:
+
+}

total: 0 errors, 0 warnings, 1 checks, 186 lines checked
212783cca drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
ba612daa9 drm/xe: Convert multiple bind ops into single job
309ba121d drm/xe: Update clear / populate arguments
9348726cb drm/xe: Add __xe_migrate_update_pgtables_cpu helper
d9565a0dd drm/xe: Add xe_hw_fence_signal helper
-:40: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Matthew Brost <matthew.brost@intel.com>' != 'Signed-off-by: Matthew Brost <matthw.brost@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
9e17ead37 drm/xe: CPU binds for jobs
-:467: CHECK:LINE_SPACING: Please don't use multiple blank lines
#467: FILE: drivers/gpu/drm/xe/xe_migrate.c:1155:
+
+

-:645: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#645: FILE: drivers/gpu/drm/xe/xe_sched_job.c:38:
+				  max_t(size_t,
 				  sizeof(u64) *

-:704: ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#704: FILE: drivers/gpu/drm/xe/xe_sched_job_types.h:70:
+		struct pt_update_args pt_update[0];
+	};

-:757: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#757: FILE: drivers/gpu/drm/xe/xe_vm.c:868:
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				 u8 tile_mask)

total: 1 errors, 0 warnings, 3 checks, 772 lines checked
575cfe921 drm/xe: Don't use migrate exec queue for page fault binds
7b761f152 drm/xe/uapi: Make sync vs async VM bind operations per IOCTL rather than queue


