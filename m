Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93045C41513
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 18:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D686A113D56;
	Wed, 24 Apr 2024 18:56:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3C3113D54;
 Wed, 24 Apr 2024 18:56:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prep_patches_for_1_job_pe?=
 =?utf-8?q?r_VM_bind_IOCTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 18:56:38 -0000
Message-ID: <171398499884.1632086.15102648879104024943@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424172352.1704851-1-matthew.brost@intel.com>
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
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

Series: Prep patches for 1 job per VM bind IOCTL (rev2)
URL   : https://patchwork.freedesktop.org/series/132246/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a495c1194c123748e85846e3ac0a83bce9a5d159
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Apr 24 10:23:52 2024 -0700

    drm/xe: Delete PT update selftest
    
    IGTs (e.g. xe_vm) can provide the exact same coverage as the PT update
    selftest. The PT update selftest is dependent on internal functions
    which can change thus maintaining this test is costly and provide no
    extra coverage. Delete this test.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch ad654139fd5a7773f0310b5f745c105cdba520e8 drm-intel
d3cfa1def3fa drm/xe: Lock all gpuva ops during VM bind IOCTL
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
 - Do not reserve slots in locking step (direction based on series from Thomas)

total: 0 errors, 1 warnings, 0 checks, 216 lines checked
e8bbe287ef42 drm/xe: Add ops_execute function which returns a fence
47978bf1b227 drm/xe: Move migrate to prefetch to op_lock_and_prep function
2ceda5d70891 drm/xe: Add struct xe_vma_ops abstraction
e68cbc641503 drm/xe: Use xe_vma_ops to implement xe_vm_rebind
64eb0f07c09a drm/xe: Simplify VM bind IOCTL error handling and cleanup
f19103b7e6fb drm/xe: Use xe_vma_ops to implement page fault rebinds
2451dc605036 drm/xe: Add some members to xe_vma_ops
fa986d0e737b drm/xe: Add vm_bind_ioctl_ops_fini helper
5cd99a98f213 drm/xe: Move ufence check to op_lock_and_prep
f27b304fd415 drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
dfce0bd0906c drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
a495c1194c12 drm/xe: Delete PT update selftest


