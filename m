Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998FBEB5969
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 05:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D4110E183;
	Wed, 11 Feb 2026 05:40:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2669410E187;
 Wed, 11 Feb 2026 05:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/buddy=3A_Documentatio?=
 =?utf-8?q?n_and_internal_helper_cleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Feb 2026 05:40:35 -0000
Message-ID: <177078843513.244838.17705389785120353144@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
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

Series: drm/buddy: Documentation and internal helper cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/161140/
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
commit 1e87ffefc6a654d2350128856d709af71c1a844d
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date:   Wed Feb 11 11:01:26 2026 +0530

    drm/buddy: Move internal helpers to buddy.c
    
    Move gpu_buddy_block_state(), gpu_buddy_block_is_allocated(),
    and gpu_buddy_block_is_split() from gpu_buddy.h to gpu_buddy.c
    as static functions since they have no external callers.
    
    Remove gpu_get_buddy() as it was an unused exported wrapper
    around the internal __get_buddy().
    
    No functional changes.
    
    v2:
    - Rebased after DRM buddy allocator moved to drivers/gpu/
    - Keep gpu_buddy_block_is_free() in header since it's now
      used by drm_buddy.c
    - Updated commit message
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
    Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch 8ef710cfb81579fbf4107d77134e6e8d2c864ef0 drm-intel
acb073b8e6ef drm/buddy: Add kernel-doc for allocator structures and flags
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
- Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index values (Arun)

total: 0 errors, 1 warnings, 0 checks, 170 lines checked
1e87ffefc6a6 drm/buddy: Move internal helpers to buddy.c


