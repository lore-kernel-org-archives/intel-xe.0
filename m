Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338E8D3C92D
	for <intel-xe@archiver.kernel.org>; Sat, 19 Oct 2024 19:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89BF10E3AA;
	Sat, 19 Oct 2024 19:25:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1EB10E3AA;
 Sat, 19 Oct 2024 19:25:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_non-contiguous_VRAM_B?=
 =?utf-8?q?O_access_in_Xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Oct 2024 19:25:57 -0000
Message-ID: <172936595717.1302363.14146690249492312792@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241019192030.1505020-1-matthew.brost@intel.com>
In-Reply-To: <20241019192030.1505020-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev3)
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
commit f4f6c518e72584c61b8b3f5dd671a41714ef221e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sat Oct 19 12:20:30 2024 -0700

    drm/xe: Only allow contiguous BOs to use xe_bo_vmap
    
    xe_bo_vmap only works on contiguous BOs, disallow xe_bo_vmap on BO
    unless we are certain the BO is contiguous.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 38b97dc95877282bd4ddd58864f2b5f29c6cd124 drm-intel
d4af82b2f082 drm/ttm: Add ttm_bo_access
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:28: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#28: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:925:
+			      uint8_t *buf, int len, int write)

-:100: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#100: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:997:
+			ret = bo->bdev->funcs->access_memory(

total: 0 errors, 1 warnings, 2 checks, 175 lines checked
ea15ccda22a3 drm/xe: Add xe_ttm_access_memory
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 88 lines checked
cd6cc9806026 drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
c240f1546022 drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
fb9c66153702 drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
f4f6c518e725 drm/xe: Only allow contiguous BOs to use xe_bo_vmap


