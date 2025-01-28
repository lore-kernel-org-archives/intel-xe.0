Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A29C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD15B10E17E;
	Tue, 28 Jan 2025 23:12:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4355B88F94;
 Tue, 28 Jan 2025 23:12:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Add_a_function_to_zap_page_table_by_address_range?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 23:12:38 -0000
Message-ID: <173810595826.2133681.3309151840142732008@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128222145.3849874-1-oak.zeng@intel.com>
In-Reply-To: <20250128222145.3849874-1-oak.zeng@intel.com>
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

Series: series starting with [1/3] drm/xe: Add a function to zap page table by address range
URL   : https://patchwork.freedesktop.org/series/144072/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cb0f1cdb1d31379f15c7b5e96e66a8c4d48691ee
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Tue Jan 28 17:21:45 2025 -0500

    drm/xe: Allow scratch page under fault mode for certain platform
    
    Normally scratch page is not allowed when a vm is operate under page
    fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
    and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
    is fault mode relies on recoverable page to work, while scratch page
    can mute recoverable page fault.
    
    On xe2 and xe3, HW prefetching can cause page fault interrupt. Due to
    page fault interrupt overhead (i.e., need Guc and KMD involved to fix
    the page fault), HW prefetching can be slowed by many orders of magnitude.
    
    Fix this problem by allowing scratch page under fault mode for xe2 and xe3.
    With scratch page in place, HW prefetching could always hit scratch page
    instead of causing interrupt.
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 8f3ba847175bfd495cbfe5b51d3cdfd8d32d24db drm-intel
fc3c14dbb3cb drm/xe: Add a function to zap page table by address range
108d849b4e71 drm/xe: Clear scratch page before vm_bind
cb0f1cdb1d31 drm/xe: Allow scratch page under fault mode for certain platform


