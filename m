Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAF7D2ECF9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 06:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AA410E559;
	Tue, 20 Jan 2026 06:14:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0AA10E559;
 Tue, 20 Jan 2026 06:14:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/madvise=3A_Add_sup?=
 =?utf-8?q?port_for_purgeable_buffer_objects_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Jan 2026 06:14:57 -0000
Message-ID: <176888969772.170466.13639567374352736117@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
In-Reply-To: <20260120060900.3137984-1-arvind.yadav@intel.com>
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

Series: drm/xe/madvise: Add support for purgeable buffer objects (rev5)
URL   : https://patchwork.freedesktop.org/series/156651/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b8e43aa90f01e0196366622cb23da4c031bb10bb
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Tue Jan 20 11:38:54 2026 +0530

    drm/xe/bo: Add purgeable shrinker state helpers
    
    Encapsulate TTM purgeable flag updates and shrinker page accounting
    into helper functions. This prevents desynchronization between the
    TTM tt->purgeable flag and the shrinker's page bucket counters.
    
    Without these helpers, direct manipulation of xe_ttm_tt->purgeable
    risks forgetting to update the corresponding shrinker counters,
    leading to incorrect memory pressure calculations.
    
    Add xe_bo_set_purgeable_shrinker() and xe_bo_clear_purgeable_shrinker()
    which atomically update both the TTM flag and transfer pages between
    the shrinkable and purgeable buckets.
    
    v4:
      - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 3319a649c1a1d4389f48c561537b9915b1789800 drm-intel
6540a04e9e19 drm/xe/uapi: Add UAPI support for purgeable buffer objects
bd39a2b12369 drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
-:37: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#37: 
  - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)

total: 0 errors, 1 warnings, 0 checks, 77 lines checked
aa339e71bdc8 drm/xe/madvise: Implement purgeable buffer object support
-:23: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#23: 
  - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)

total: 0 errors, 1 warnings, 0 checks, 304 lines checked
1b71ab7b8171 drm/xe/bo: Handle CPU faults on purged buffer objects
eb146765e124 drm/xe/vm: Prevent binding of purged buffer objects
277c31862829 drm/xe/madvise: Implement per-VMA purgeable state tracking
-:29: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#29: 
  - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)

total: 0 errors, 1 warnings, 0 checks, 172 lines checked
37e2d276b275 drm/xe/madvise: Block imported and exported dma-bufs
b8e43aa90f01 drm/xe/bo: Add purgeable shrinker state helpers
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
  - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)

total: 0 errors, 1 warnings, 0 checks, 110 lines checked


