Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9672C021B8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 02:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA49F10E1C5;
	Thu, 27 Feb 2025 02:52:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A841E10E1C5;
 Thu, 27 Feb 2025 02:52:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Allow_scratch_page_under_?=
 =?utf-8?q?fault_mode_for_certain_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 02:52:02 -0000
Message-ID: <174062472268.2544824.6552107867158164933@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227030205.793478-1-oak.zeng@intel.com>
In-Reply-To: <20250227030205.793478-1-oak.zeng@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/145539/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 693e2a036ce880d39a3e3f6e1d8d5551bfc3ccf0
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed Feb 26 22:02:05 2025 -0500

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
+ /mt/dim checkpatch 8541a64154cd8b9c07977dedc1d22883f43279a0 drm-intel
cacc404dc7e1 drm/xe: Introduced needs_scratch bit in device descriptor
2f4aa1aaa1ae drm/xe: Clear scratch page on vm_bind
-:73: CHECK:BRACES: braces {} should be used on all arms of this statement
#73: FILE: drivers/gpu/drm/xe/xe_pt.c:506:
+		if (xe_walk->clear_pt)
[...]
-		/*
[...]

-:86: CHECK:BRACES: Unbalanced braces around else statement
#86: FILE: drivers/gpu/drm/xe/xe_pt.c:509:
+		else {

total: 0 errors, 0 warnings, 2 checks, 294 lines checked
693e2a036ce8 drm/xe: Allow scratch page under fault mode for certain platform


