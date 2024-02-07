Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15E1C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 22:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4B10E8D7;
	Wed,  7 Feb 2024 22:12:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8687510E8D7;
 Wed,  7 Feb 2024 22:12:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_VM_bind_code_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Feb 2024 22:12:34 -0000
Message-ID: <170734395455.1088348.10958564588049613327@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206233729.3173206-1-matthew.brost@intel.com>
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
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

Series: Refactor VM bind code (rev4)
URL   : https://patchwork.freedesktop.org/series/125608/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 819cd1163cc0ed5bd7b8f428abf8e64ee023e3c8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Feb 6 15:37:29 2024 -0800

    drm/xe: Add VM bind IOCTL error injection
    
    Add VM bind IOCTL error injection which steals MSB of the bind flags
    field which if set injects errors at various points in the VM bind
    IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch eb1e13ab1374d4785d5f2b2584d88e6e05311229 drm-intel
8ba74fe16 drm/xe: Lock all gpuva ops during VM bind IOCTL
87653de6b drm/xe: Add ops_execute function which returns a fence
883439553 drm/xe: Move migrate to prefetch to op_lock funtion
-:4: WARNING:TYPO_SPELLING: 'funtion' may be misspelled - perhaps 'function'?
#4: 
Subject: [PATCH] drm/xe: Move migrate to prefetch to op_lock funtion
                                                             ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 49 lines checked
456930f69 drm/xe: Add struct xe_vma_ops abstraction
6200a4c05 drm/xe: Update xe_vm_rebind to use dummy VMA operations
5080c77b5 drm/xe: Simplify VM bind IOCTL error handling and cleanup
76fbc63eb drm/xe: Update pagefaults to use dummy VMA operations
dacb99ec3 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
4d1c00496 drm/xe: Add vm_bind_ioctl_ops_install_fences helper
-:9: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Brost <matthew.brost@intel.com'
#9: 
Signed-off-by: Matthew Brost <matthew.brost@intel.com

-:134: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 2 errors, 0 warnings, 0 checks, 111 lines checked
af253508d drm/xe: Move setting last fence to vm_bind_ioctl_ops_install_fences
4f783081a drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
-:107: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#107: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:306:
+
+}

total: 0 errors, 0 warnings, 1 checks, 186 lines checked
75c69c5e8 drm/xe: Add some members to xe_vma_ops
645be5ccb drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
06c167151 drm/xe: Convert multiple bind ops into single job
-:1501: WARNING:TYPO_SPELLING: 'commiting' may be misspelled - perhaps 'committing'?
#1501: FILE: drivers/gpu/drm/xe/xe_pt.c:1769:
+ * Run PT update operations which includes commiting internal PT state changes,
                                            ^^^^^^^^^

-:1684: WARNING:TYPO_SPELLING: 'commiting' may be misspelled - perhaps 'committing'?
#1684: FILE: drivers/gpu/drm/xe/xe_pt.c:1863:
+ * Finish PT update operations by commiting to destroy page table memory
                                   ^^^^^^^^^

total: 0 errors, 2 warnings, 0 checks, 2435 lines checked
a3d3d269d drm/xe: Remove old functions defs in xe_pt.h
f2b277f1e drm/xe: Update PT layer with better error handling
5b5bab2d6 drm/xe: Update VM trace events
-:61: ERROR:SPACING: space prohibited after that open parenthesis '('
#61: FILE: drivers/gpu/drm/xe/xe_vm.c:2414:
+		trace_xe_vma_unbind( gpuva_to_vma(op->base.unmap.va));

total: 1 errors, 0 warnings, 0 checks, 88 lines checked
79ef9178a drm/xe: Update clear / populate arguments
7d9dc94ff drm/xe: Add __xe_migrate_update_pgtables_cpu helper
0e0adaf83 drm/xe: CPU binds for jobs
-:672: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#672: FILE: drivers/gpu/drm/xe/xe_sched_job.c:38:
+				  max_t(size_t,
 				  sizeof(u64) *

-:766: ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#766: FILE: drivers/gpu/drm/xe/xe_sched_job_types.h:70:
+		struct pt_update_args pt_update[0];
+	};

total: 1 errors, 0 warnings, 1 checks, 838 lines checked
63fa61f34 drm/xe: Don't use migrate exec queue for page fault binds
819cd1163 drm/xe: Add VM bind IOCTL error injection
-:51: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#51: FILE: drivers/gpu/drm/xe/xe_pt.c:1752:
+	if (vops->inject_error &&
[...]
+	       return -ENOSPC;

-:53: WARNING:TABSTOP: Statements should start on a tabstop
#53: FILE: drivers/gpu/drm/xe/xe_pt.c:1754:
+	       return -ENOSPC;

-:64: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#64: FILE: drivers/gpu/drm/xe/xe_pt.c:1886:
+	if (vops->inject_error &&
[...]
+	       return ERR_PTR(-ENOSPC);

-:66: WARNING:TABSTOP: Statements should start on a tabstop
#66: FILE: drivers/gpu/drm/xe/xe_pt.c:1888:
+	       return ERR_PTR(-ENOSPC);

-:81: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#81: FILE: drivers/gpu/drm/xe/xe_vm.c:2398:
+	if (vops->inject_error &&
[...]
+	       return -ENOSPC;

-:83: WARNING:TABSTOP: Statements should start on a tabstop
#83: FILE: drivers/gpu/drm/xe/xe_vm.c:2400:
+	       return -ENOSPC;

total: 0 errors, 6 warnings, 0 checks, 116 lines checked


