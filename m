Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B65D3E79C
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 07:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89E810E29C;
	Thu, 11 Dec 2025 07:22:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA39310E29C;
 Thu, 11 Dec 2025 07:22:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/madvise=3A_Add_sup?=
 =?utf-8?q?port_for_purgeable_buffer_objects_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 07:22:50 -0000
Message-ID: <176543777088.75954.4816127969247049697@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
In-Reply-To: <20251210043112.3267620-1-arvind.yadav@intel.com>
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

Series: drm/xe/madvise: Add support for purgeable buffer objects (rev4)
URL   : https://patchwork.freedesktop.org/series/156651/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ba26a8e203683832061dd7bd9bc38c4593a7870
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Wed Dec 10 10:00:52 2025 +0530

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
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b drm-intel
ef59c3b12022 drm/xe/uapi: Add UAPI support for purgeable buffer objects
8710cd9c15bc drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
7decbda5c7e5 drm/xe/madvise: Implement purgeable buffer object support
-:23: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#23: 
  - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)

-:357: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED'
#357: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:340:
+		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
+				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))

-:357: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED'
#357: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:340:
+		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
+				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))

total: 0 errors, 1 warnings, 2 checks, 315 lines checked
080a00ece6b3 drm/xe/bo: Handle CPU faults on purged buffer objects
e7e44cbd9d8b drm/xe/vm: Prevent binding of purged buffer objects
53b6df4572c0 drm/xe/madvise: Implement per-VMA purgeable state tracking
f7d70b95ee78 drm/xe/madvise: Block imported and exported dma-bufs
4ba26a8e2036 drm/xe/bo: Add purgeable shrinker state helpers


