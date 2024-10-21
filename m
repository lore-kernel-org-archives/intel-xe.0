Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD845D17141
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 21:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9240C10E5AC;
	Mon, 21 Oct 2024 21:39:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66C10E5AC;
 Mon, 21 Oct 2024 21:39:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_non-contiguous_VRAM_B?=
 =?utf-8?q?O_access_in_Xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 21:39:41 -0000
Message-ID: <172954678143.1306981.2102818817968673402@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021211835.1675640-1-matthew.brost@intel.com>
In-Reply-To: <20241021211835.1675640-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/140200/
State : warning

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
commit e930b32e27493c46067e365cbeb0c5690fb334d5
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Oct 21 14:18:35 2024 -0700

    drm/xe: Only allow contiguous BOs to use xe_bo_vmap
    
    xe_bo_vmap only works on contiguous BOs, disallow xe_bo_vmap on BO
    unless we are certain the BO is contiguous.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch aa0898115bcff3eda6d021cc66eb8a1c3b264c56 drm-intel
7b79e15fc687 drm/xe: Add xe_bo_vm_access
f1e5f3a0cc74 drm/ttm: Add ttm_bo_access
-:18: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#18: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 175 lines checked
8e0ee3d5b2f6 drm/xe: Add xe_ttm_access_memory
-:17: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#17: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
a974245d5b97 drm/xe: Take PM ref in delayed snapshot capture worker
0cc53d022927 drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
4b2cc3c15ea3 drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
ae6d12a7682c drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
6e27162490c1 drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
e930b32e2749 drm/xe: Only allow contiguous BOs to use xe_bo_vmap


