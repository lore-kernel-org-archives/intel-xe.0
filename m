Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B750C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96BB10E4B2;
	Tue,  7 Nov 2023 05:30:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 227B810E4B2;
 Tue,  7 Nov 2023 05:30:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 102B5AADDD;
 Tue,  7 Nov 2023 05:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 07 Nov 2023 05:30:08 -0000
Message-ID: <169933500806.21169.9945740460681936408@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231107052603.124361-1-matthew.brost@intel.com>
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?factor_VM_bind_code_=28rev2=29?=
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
commit 6f6401348a096a2ac1926c9de123cb085082eb3f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Nov 6 21:26:03 2023 -0800

    drm/xe/uapi: Make sync vs async VM bind operations per IOCTL rather than queue
    
    Making sync vs async per IOCTL simplifies the uAPI while also making it
    more flexible. Adjust the uAPI accordingly.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b drm-intel
cdad5aaa2 drm/xe: Allow num_binds == 0 in VM bind IOCTL
-:52: WARNING:ALLOC_WITH_MULTIPLY: Prefer kcalloc over kzalloc with multiply
#52: FILE: drivers/gpu/drm/xe/xe_vm.c:3031:
+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
14563afdc drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
1294f1135 drm/xe: Take in-syncs into account when num_execs or num_binds == 0
0295ad2c2 drm/xe: Lock all gpuva ops during VM bind IOCTL
878ff3224 drm/xe: Add ops_execute function which returns a fence
3ffe5d6f8 drm/xe: Move migrate to prefetch to op_lock funtion
-:4: WARNING:TYPO_SPELLING: 'funtion' may be misspelled - perhaps 'function'?
#4: 
Subject: [PATCH] drm/xe: Move migrate to prefetch to op_lock funtion
                                                             ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 57 lines checked
30616d336 drm/xe: Add struct xe_vma_ops abstraction
8d5e31aa3 drm/xe: Update xe_vm_rebind to use dummy VMA operations
956e9da16 drm/xe: Move drm exec loop to vm_bind_ioctl_ops_execute
44bfdfac6 drm/xe: Fixup error handling / ref counting in VM bind IOCTL
e981e197a drm/xe: Convert pagefault rebind to use ops interface
ec09ce4f3 drm/xe: Add some members to xe_vma_ops
ddab35b82 drm/xe: Add vm_bind_ioctl_ops_install_fences helper
52fec586d drm/xe: Drop rebind argument from xe_pt_prepare_bind
e35e30fc0 drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
d093f039e drm/xe: Move setting last fence and sync wait to vm_bind_ioctl_ops_install_fences
670bd09fa drm/xe: Fix vma_is_valid to use tile argument
cacd81368 drm/xe: Adjust tile mask in operations create
16927068f drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
-:107: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#107: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:310:
+
+}

total: 0 errors, 0 warnings, 1 checks, 186 lines checked
8268a260c drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
d47de46a8 drm/xe: Convert multiple bind ops into single job
8c824b6ff drm/xe: Update clear / populate arguments
8f3dfa745 drm/xe: Add __xe_migrate_update_pgtables_cpu helper
797a05132 drm/xe: Add xe_hw_fence_signal helper
-:40: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Matthew Brost <matthew.brost@intel.com>' != 'Signed-off-by: Matthew Brost <matthw.brost@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
1bea95d58 drm/xe: CPU binds for jobs
-:462: CHECK:LINE_SPACING: Please don't use multiple blank lines
#462: FILE: drivers/gpu/drm/xe/xe_migrate.c:1156:
+
+

-:640: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#640: FILE: drivers/gpu/drm/xe/xe_sched_job.c:38:
+				  max_t(size_t,
 				  sizeof(u64) *

-:699: ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#699: FILE: drivers/gpu/drm/xe/xe_sched_job_types.h:70:
+		struct pt_update_args pt_update[0];
+	};

-:752: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#752: FILE: drivers/gpu/drm/xe/xe_vm.c:868:
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				 u8 tile_mask)

total: 1 errors, 0 warnings, 3 checks, 767 lines checked
5e80b6708 drm/xe: Don't use migrate exec queue for page fault binds
6f6401348 drm/xe/uapi: Make sync vs async VM bind operations per IOCTL rather than queue


