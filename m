Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C701D65543
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 18:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AD610E166;
	Tue, 26 Nov 2024 18:19:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D2310E166;
 Tue, 26 Nov 2024 18:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_non-contiguous_VRAM_B?=
 =?utf-8?q?O_access_in_Xe_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 18:19:01 -0000
Message-ID: <173264514134.3447124.15075452461828990201@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126174615.2665852-1-matthew.brost@intel.com>
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev7)
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
commit fd110194576ace7e509d5dc09c063c5b73ec6ce4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Nov 26 09:46:15 2024 -0800

    drm/xe: Only allow contiguous BOs to use xe_bo_vmap
    
    xe_bo_vmap only works on contiguous BOs, disallow xe_bo_vmap on BO
    unless we are certain the BO is contiguous.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 739a2506c44a0be22cc842d2c625a05ed21c1198 drm-intel
af2fe213613f drm/xe: Add xe_bo_vm_access
c51bf4c86272 drm/ttm: Add ttm_bo_access
-:23: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#23: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 67 lines checked
8f34b190b33f drm/xe: Add xe_ttm_access_memory
-:17: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#17: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
cd983086524f drm/xe: Take PM ref in delayed snapshot capture worker
36e389e9c649 drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
6dab7f83f1a9 drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
89d4fd4e1502 drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
fd110194576a drm/xe: Only allow contiguous BOs to use xe_bo_vmap


