Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F9BD3E18E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 22:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C4110E9DB;
	Fri, 18 Oct 2024 22:49:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3F910E9DB;
 Fri, 18 Oct 2024 22:49:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_non-contiguous_VRAM_B?=
 =?utf-8?q?O_access_in_Xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 22:49:47 -0000
Message-ID: <172929178717.1301514.943784754278448725@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018211623.1367891-1-matthew.brost@intel.com>
In-Reply-To: <20241018211623.1367891-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev2)
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
commit 332351490107941d8a1ec7e190921b778b0667e3
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Oct 18 14:16:23 2024 -0700

    drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
    
    Non-contiguous mapping of BO in VRAM doesn't work, use ttm_bo_access
    instead.
    
    v2:
     - Fix error handling
    
    Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403 drm-intel
1c581c5cc170 drm/ttm: Add ttm_bo_access
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:28: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#28: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:925:
+			      uint8_t *buf, int len, int write)

-:64: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#64: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:961:
+}
+/**

-:99: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#99: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:996:
+			ret = bo->bdev->funcs->access_memory(

total: 0 errors, 1 warnings, 3 checks, 174 lines checked
805ed2c866e3 drm/xe: Add xe_ttm_access_memory
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 83 lines checked
332351490107 drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
-:55: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#55: FILE: drivers/gpu/drm/xe/xe_vm.c:3373:
+			printk("%s:%d: j=%d", __func__, __LINE__, (int)j);

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


