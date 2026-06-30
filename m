Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C9C43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 15:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAEB10E8A5;
	Tue, 30 Jun 2026 15:11:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CC310E8A5;
 Tue, 30 Jun 2026 15:11:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_fixes_for_purged_BOs?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jun 2026 15:11:21 -0000
Message-ID: <178283228187.133065.12678724717065803240@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625152054.450125-5-matthew.auld@intel.com>
In-Reply-To: <20260625152054.450125-5-matthew.auld@intel.com>
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

Series: Some fixes for purged BOs (rev2)
URL   : https://patchwork.freedesktop.org/series/169208/
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
commit 32976ffdee2e5efab767071baa55492dde2a94e1
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Jun 25 16:20:58 2026 +0100

    drm/xe/pt: prevent invalid cursor access for purged BOs
    
    During a page table walk for binding, xe_pt_stage_bind() explicitly
    skips initializing the xe_res_cursor for purged BOs, treating them
    similarly to NULL VMAs by only setting the cursor size.
    
    However, xe_pt_hugepte_possible() and xe_pt_scan_64K() did not check
    if the BO was purged before attempting to walk the cursor using
    xe_res_dma() and xe_res_next(). Because the cursor was left
    uninitialized for purged BOs, this falls through and triggers
    warnings like:
    
      WARNING: drivers/gpu/drm/xe/xe_res_cursor.h:274 at xe_res_next
    
    Fix this by explicitly checking if the BO is purged in both
    xe_pt_hugepte_possible() and xe_pt_scan_64K(), returning early just
    as we do for NULL VMAs, avoiding the invalid cursor accesses entirely.
    
    As a precaution, also zero-initialize the cursor in xe_pt_stage_bind()
    to ensure we don't pass garbage data into the page table walkers
    if we ever hit a similar edge case in the future.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8418
    Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
    Assisted-by: Copilot:gemini-3.1-pro-preview
    Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Arvind Yadav <arvind.yadav@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 301cc1e80ce8295b82803e3f64a323572c3050e5 drm-intel
eb0ba2c923a6 drm/xe: fix NPD in bo_meminfo()
-:31: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#31: 
Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 21 lines checked
c94bcf640189 drm/xe: account for dontneed in fdinfo purgeable
32976ffdee2e drm/xe/pt: prevent invalid cursor access for purged BOs
-:32: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#32: 
Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 42 lines checked


