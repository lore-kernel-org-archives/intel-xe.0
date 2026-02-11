Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86E6ECD6C6
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 16:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AC110E0B9;
	Wed, 11 Feb 2026 16:21:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DE810E0B9;
 Wed, 11 Feb 2026 16:21:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/madvise=3A_Add_sup?=
 =?utf-8?q?port_for_purgeable_buffer_objects_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Feb 2026 16:21:24 -0000
Message-ID: <177082688401.246446.17712956643388778090@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
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

Series: drm/xe/madvise: Add support for purgeable buffer objects (rev6)
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
commit ce4667c9197a132c8023c1c37754f01c64e822d7
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Wed Feb 11 20:56:38 2026 +0530

    drm/xe/madvise: Enable purgeable buffer object IOCTL support
    
    Hook the madvise_purgeable() handler into the madvise IOCTL now that all
    supporting infrastructure is complete:
    
     - Core purge implementation (patch 3)
     - BO state tracking and helpers (patches 1-2)
     - Per-VMA purgeable state tracking (patch 6)
     - Shrinker integration for memory reclamation (patch 8)
    
    This final patch enables userspace to use the DRM_XE_VMA_ATTR_PURGEABLE_STATE
    madvise type to mark buffers as WILLNEED/DONTNEED and receive the retained
    status indicating whether buffers were purged.
    
    The feature was kept disabled in earlier patches to maintain bisectability
    and ensure all components are in place before exposing to userspace.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2938ce73d01357a5816ed7dbd041154b58635a37 drm-intel
92c37c0e8bbd drm/xe/uapi: Add UAPI support for purgeable buffer objects
2bdaec330f0c drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
1a9fcc98d3bc drm/xe/madvise: Implement purgeable buffer object support
-:23: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#23: 
  - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)

-:117: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#117: FILE: drivers/gpu/drm/xe/xe_bo.c:856:
+	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
+		      new_state == XE_MADV_PURGEABLE_DONTNEED ||

total: 0 errors, 1 warnings, 1 checks, 479 lines checked
6b2717ab1896 drm/xe/bo: Handle CPU faults on purged buffer objects
f851c2bce37c drm/xe/vm: Prevent binding of purged buffer objects
-:37: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#37: 
  - Replace three boolean parameters with struct xe_vma_lock_and_validate_flags

total: 0 errors, 1 warnings, 0 checks, 112 lines checked
f3a8b35bb75b drm/xe/madvise: Implement per-VMA purgeable state tracking
f8dfbd848476 drm/xe/madvise: Block imported and exported dma-bufs
b7c1dcbfb2d9 drm/xe/bo: Add purgeable shrinker state helpers
ce4667c9197a drm/xe/madvise: Enable purgeable buffer object IOCTL support
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
This final patch enables userspace to use the DRM_XE_VMA_ATTR_PURGEABLE_STATE

total: 0 errors, 1 warnings, 0 checks, 35 lines checked


