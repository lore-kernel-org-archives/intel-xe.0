Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A83BCD6E6B
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 10:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6794113F0D;
	Thu,  4 Jun 2026 10:32:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34FD113F0D;
 Thu,  4 Jun 2026 10:32:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/svm=3A_Add_MMU_not?=
 =?utf-8?q?ifier-based_madvise_autoreset_on_munmap_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 10:32:42 -0000
Message-ID: <178056916298.43085.8921261708533162094@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604095012.367231-1-arvind.yadav@intel.com>
In-Reply-To: <20260604095012.367231-1-arvind.yadav@intel.com>
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

Series: drm/xe/svm: Add MMU notifier-based madvise autoreset on munmap (rev3)
URL   : https://patchwork.freedesktop.org/series/161815/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b896a89fd0c92f4b48c8953bed8abaedfcad63a1
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Jun 4 15:20:12 2026 +0530

    drm/xe/svm: Correct memory attribute reset for partial unmap
    
    When performing a partial unmap of an SVM range, the memory attributes
    were being reset for the entire range instead of just the portion
    being unmapped. This could lead to unintended side effects and behaviour.
    
    Fix this by restricting the attribute reset to only the affected subrange
    that is being unmapped.
    
    v3:
      - Coalesce partial_unmap range via min/max instead of blind overwrite (Matt)
      - Restore range_debug() in xe_svm_garbage_collector_add_range() (Matt)
      - Update partial_unmap under garbage_collector.lock to avoid races with
        the worker.
      - Clear consumed partial_unmap state before dropping the GC lock.
      - Continue processing remaining queued ranges on non-fatal set_default_attr
        failure instead of stranding them.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 70c7b363fab8198549bb9b82134bda0f6bda9452 drm-intel
76568c4603b0 drm/xe/vm: Track CPU_AUTORESET state in xe_vma
38b7fb1e6539 drm/xe/vm: Preserve cpu_autoreset_active across GPUVA operations
-:28: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#28: 
  - Guard cpu_autoreset_active assignment to CPU_ADDR_MIRROR VMAs only (Matt)

total: 0 errors, 1 warnings, 0 checks, 103 lines checked
5b4cd11bc093 drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU fault
f9f659d075d9 drm/xe/vm: Add madvise autoreset notifier worker
-:32: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#32: 
  - Widen pending ranges in the callback and reset only CPU holes in the worker.

total: 0 errors, 1 warnings, 0 checks, 617 lines checked
f5710d0bc501 drm/xe/vm: Disable madvise notifier on GPU touch
-:142: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#142: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:1281:
+	xe_vm_deactivate_madvise_notifier_for_range(vm,
+						xe_vma_start(vma),

total: 0 errors, 0 warnings, 1 checks, 112 lines checked
931ebcf6f5c9 drm/xe/vm: Wire MADVISE_AUTORESET notifiers into VM lifecycle
b896a89fd0c9 drm/xe/svm: Correct memory attribute reset for partial unmap
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
  - Coalesce partial_unmap range via min/max instead of blind overwrite (Matt)

total: 0 errors, 1 warnings, 0 checks, 146 lines checked


