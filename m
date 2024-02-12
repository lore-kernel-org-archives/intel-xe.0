Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F352AC4829E
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 19:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241910E3C0;
	Mon, 12 Feb 2024 19:11:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6485610E3C0;
 Mon, 12 Feb 2024 19:11:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_VM_bind_refacto?=
 =?utf-8?q?r_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Feb 2024 19:11:35 -0000
Message-ID: <170776509541.1182955.13652934712054615849@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240210034504.3405797-1-matthew.brost@intel.com>
In-Reply-To: <20240210034504.3405797-1-matthew.brost@intel.com>
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

Series: drm/xe: VM bind refactor (rev2)
URL   : https://patchwork.freedesktop.org/series/129743/
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
commit b95a981dca6dfb798a2d32bc35ea02a5ca8027e3
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Feb 9 19:45:04 2024 -0800

    drm/xe: VM bind refactor
    
    Single squashed patch for CI
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce drm-intel
b95a981dc drm/xe: VM bind refactor
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:563: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#563: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:809:
+		return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
+	} else {

-:831: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#831: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:306:
+
+}

-:2641: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#2641: FILE: drivers/gpu/drm/xe/xe_pt.c:1755:
+	if (vops->inject_error &&
[...]
+	       return -ENOSPC;

-:2643: WARNING:TABSTOP: Statements should start on a tabstop
#2643: FILE: drivers/gpu/drm/xe/xe_pt.c:1757:
+	       return -ENOSPC;

-:2764: WARNING:TYPO_SPELLING: 'commiting' may be misspelled - perhaps 'committing'?
#2764: FILE: drivers/gpu/drm/xe/xe_pt.c:1860:
+ * Run PT update operations which includes commiting internal PT state changes,
                                            ^^^^^^^^^

-:2823: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#2823: FILE: drivers/gpu/drm/xe/xe_pt.c:1889:
+	if (vops->inject_error &&
[...]
+	       return ERR_PTR(-ENOSPC);

-:2825: WARNING:TABSTOP: Statements should start on a tabstop
#2825: FILE: drivers/gpu/drm/xe/xe_pt.c:1891:
+	       return ERR_PTR(-ENOSPC);

-:2981: WARNING:TYPO_SPELLING: 'commiting' may be misspelled - perhaps 'committing'?
#2981: FILE: drivers/gpu/drm/xe/xe_pt.c:1991:
+ * Finish PT update operations by commiting to destroy page table memory
                                   ^^^^^^^^^

-:3068: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#3068: 
new file mode 100644

-:3348: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3348: FILE: drivers/gpu/drm/xe/xe_sched_job.c:38:
+				  max_t(size_t,
 				  sizeof(u64) *

-:3506: ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#3506: FILE: drivers/gpu/drm/xe/xe_sched_job_types.h:70:
+		struct pt_update_args pt_update[0];
+	};

-:4534: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#4534: FILE: drivers/gpu/drm/xe/xe_vm.c:2386:
+	if (vops->inject_error &&
[...]
+	       return -ENOSPC;

-:4536: WARNING:TABSTOP: Statements should start on a tabstop
#4536: FILE: drivers/gpu/drm/xe/xe_vm.c:2388:
+	       return -ENOSPC;

-:4596: ERROR:SPACING: space prohibited after that open parenthesis '('
#4596: FILE: drivers/gpu/drm/xe/xe_vm.c:2408:
+		trace_xe_vma_unbind( gpuva_to_vma(op->base.unmap.va));

total: 2 errors, 10 warnings, 2 checks, 4932 lines checked


