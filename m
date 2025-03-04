Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD0C282C6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 06:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AB610E519;
	Tue,  4 Mar 2025 06:01:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B62E10E50A;
 Tue,  4 Mar 2025 06:01:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Allow_scratch_page_under_?=
 =?utf-8?q?fault_mode_for_certain_platform_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 06:01:12 -0000
Message-ID: <174106807250.451780.10438518887899365372@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228153058.1039188-1-oak.zeng@intel.com>
In-Reply-To: <20250228153058.1039188-1-oak.zeng@intel.com>
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

Series: Allow scratch page under fault mode for certain platform (rev3)
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
commit 66ef8ea9cbd527df3100a12f91e1c15d53dea693
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Fri Feb 28 10:30:58 2025 -0500

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
+ /mt/dim checkpatch 1cf56e26a93292ca26fbf891368b75a67e8700dc drm-intel
f236b799a76f drm/xe: Introduced needs_scratch bit in device descriptor
2064667ee3f4 drm/xe: Clear scratch page on vm_bind
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
v7: No need to check platform needs_scratch deciding invalidate_on_bind (Matt)

total: 0 errors, 1 warnings, 0 checks, 290 lines checked
66ef8ea9cbd5 drm/xe: Allow scratch page under fault mode for certain platform


