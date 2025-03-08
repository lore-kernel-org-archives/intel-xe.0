Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1B6C282DE
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 01:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AFD10E2D2;
	Sat,  8 Mar 2025 01:39:19 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91EB10E2D2;
 Sat,  8 Mar 2025 01:39:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Allow_scratch_page_under_?=
 =?utf-8?q?fault_mode_for_certain_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Mar 2025 01:39:18 -0000
Message-ID: <174139795888.4957.16238521593754287993@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250308001829.1459320-1-oak.zeng@intel.com>
In-Reply-To: <20250308001829.1459320-1-oak.zeng@intel.com>
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

Series: Allow scratch page under fault mode for certain platform
URL   : https://patchwork.freedesktop.org/series/146026/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit abf7cff5355361bd682f580820ad83140f7aa6dd
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Fri Mar 7 19:18:29 2025 -0500

    drm/xe: Allow scratch page under fault mode for certain platform
    
    Normally scratch page is not allowed when a vm is operate under page
    fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
    and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
    is fault mode relies on recoverable page to work, while scratch page
    can mute recoverable page fault.
    
    On xe2 and xe3, out of bound prefetch can cause page fault and further
    system hang because xekmd can't resolve such page fault. SYCL and OCL
    language runtime requires out of bound prefetch to be silently dropped
    without causing any functional problem, thus the existing behavior
    doesn't meet language runtime requirement.
    
    At the same time, HW prefetching can cause page fault interrupt. Due to
    page fault interrupt overhead (i.e., need Guc and KMD involved to fix
    the page fault), HW prefetching can be slowed by many orders of magnitude.
    
    Fix those problems by allowing scratch page under fault mode for xe2 and
    xe3. With scratch page in place, HW prefetching could always hit scratch
    page instead of causing interrupt.
    
    A side effect is, scratch page could hide application program error.
    Application out of bound accesses are hided by scratch page mapping,
    instead of get reported to user.
    
    v2: Refine commit message (Thomas)
    
    v3: Move the scratch page flag check to after scratch page wa (Thomas)
    
    v4: drop NEEDS_SCRATCH macro (matt)
        Add a comment to DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
3d3c66e21d35 drm/xe: Introduced needs_scratch bit in device descriptor
64dd4400af85 drm/xe: Clear scratch page on vm_bind
-:232: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#232: FILE: drivers/gpu/drm/xe/xe_pt.c:2011:
+		if ((!op->map.immediate && xe_vm_in_fault_mode(vm) &&
+		    !op->map.invalidate_on_bind) ||

-:356: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#356: FILE: drivers/gpu/drm/xe/xe_vm.c:2495:
+			if (((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
+			    !op->map.is_cpu_addr_mirror) ||

total: 0 errors, 0 warnings, 2 checks, 300 lines checked
abf7cff53553 drm/xe: Allow scratch page under fault mode for certain platform


