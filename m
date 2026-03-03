Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BFBEDA68D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 16:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF40410E83E;
	Tue,  3 Mar 2026 16:12:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0310E83E;
 Tue,  3 Mar 2026 16:12:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/madvise=3A_Add_sup?=
 =?utf-8?q?port_for_purgeable_buffer_objects_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 16:12:55 -0000
Message-ID: <177255437565.310842.9142138570935185293@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
In-Reply-To: <20260303152015.3499248-1-arvind.yadav@intel.com>
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

Series: drm/xe/madvise: Add support for purgeable buffer objects (rev7)
URL   : https://patchwork.freedesktop.org/series/156651/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 389b1060c1dfec0d57ee6d0159e325938d067263
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Tue Mar 3 20:50:08 2026 +0530

    drm/xe/bo: Skip zero-refcount BOs in shrinker
    
    Zero-refcount BOs are being destroyed. Skip them in the shrinker
    to avoid racing with cleanup by returning -EBUSY.
    
    Ghost BOs from ttm_bo_pipeline_gutting() still hold reclaimable
    pages, so continue processing them via xe_bo_shrink_purge().
    
    Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
    
    v6:
      - Split from patch 0010 (Thomas)
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 7f2495944abe599477bd1d891f6fbaf1d5dded3b drm-intel
2f4f3f3df02a drm/xe/uapi: Add UAPI support for purgeable buffer objects
780ecafc0c65 drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
f8010040b7b9 drm/xe/madvise: Implement purgeable buffer object support
-:23: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#23: 
  - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)

-:122: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#122: FILE: drivers/gpu/drm/xe/xe_bo.c:856:
+	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
+		      new_state == XE_MADV_PURGEABLE_DONTNEED ||

total: 0 errors, 1 warnings, 1 checks, 490 lines checked
0a629c8de4b7 drm/xe/bo: Block CPU faults to purgeable buffer objects
7d7ae8e22221 drm/xe/vm: Prevent binding of purged buffer objects
-:37: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#37: 
  - Replace three boolean parameters with struct xe_vma_lock_and_validate_flags

total: 0 errors, 1 warnings, 0 checks, 116 lines checked
837c3fe4cbc5 drm/xe/madvise: Implement per-VMA purgeable state tracking
e76ec44d9788 drm/xe/madvise: Block imported and exported dma-bufs
-:51: CHECK:LINE_SPACING: Please don't use multiple blank lines
#51: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:187:
 
+

total: 0 errors, 0 warnings, 1 checks, 56 lines checked
f1235a64fa31 drm/xe/bo: Block mmap of DONTNEED/purged BOs
2a4aaaf7d55e drm/xe/dma_buf: Block export of DONTNEED/purged BOs
2bb599c4a7be drm/xe/bo: Add purgeable shrinker state helpers
88639917c398 drm/xe/madvise: Enable purgeable buffer object IOCTL support
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
This final patch enables userspace to use the DRM_XE_VMA_ATTR_PURGEABLE_STATE

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
389b1060c1df drm/xe/bo: Skip zero-refcount BOs in shrinker


