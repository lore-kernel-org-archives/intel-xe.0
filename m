Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E591C531CB
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 11:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1310E583;
	Thu, 23 Jul 2026 11:47:30 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCBD10E583;
 Thu, 23 Jul 2026 11:47:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_reclaim_to_the_dmem_c?=
 =?utf-8?q?group_controller_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jul 2026 11:47:28 -0000
Message-ID: <178480724864.220541.3823464903113425610@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723100350.16895-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260723100350.16895-1-thomas.hellstrom@linux.intel.com>
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

Series: Add reclaim to the dmem cgroup controller (rev8)
URL   : https://patchwork.freedesktop.org/series/163970/
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
commit ed4facacb54248512464d2c638759fc700e4bd35
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Jul 23 12:03:50 2026 +0200

    drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
    
    Register the VRAM manager with the dmem cgroup reclaim infrastructure
    so that lowering dmem.max below current VRAM usage triggers TTM
    eviction rather than failing with -EBUSY.
    
    Guard place->flags in amdgpu_ttm_bo_eviction_valuable() against NULL,
    as the TTM reclaim path passes a NULL place in cgroup drain mode.
    
    Use drmm_cgroup_register_region() so that the region is automatically
    unregistered at DRM device release, after drm_dev_unplug() has already
    made drm_dev_enter() return false.  The drm_dev_enter/exit guard in the
    reclaim callback ensures no reclaim work touches the TTM manager after
    driver unbind, closing the window between vram_mgr_fini() (called from
    drm_driver.release) and the drmm cleanup that unregisters the region.
    
    v3:
    - Rebased on fix for uninitialized list and buddy allocator on the
      drmm_cgroup_register_region() error path.
    
    v5:
    - Rebased on the introduction of struct dmem_cgroup_init.
    - Clear the reclaim callback in amdgpu_vram_mgr_fini() to prevent
      use-after-free if cgroup reclaim is triggered after driver unbind
      while userspace holds an open DRM file descriptor. (Sashiko-bot)
    - Switch from drmm_cgroup_register_region() to the raw
      dmem_cgroup_register_region() and store the region in
      amdgpu_vram_mgr.cg_region. Call dmem_cgroup_unregister_region()
      in amdgpu_vram_mgr_fini() after ttm_resource_manager_evict_all()
      to drain in-flight reclaim callbacks, and clear man->cg afterwards.
      This is required because amdgpu's vram manager fini is called
      explicitly during driver unbind, which may precede the DRM device
      release and thus precede any drmm-based cleanup. (Sashiko-bot)
    
    v6:
    - Fix mgr->cg_region never being assigned, so
      dmem_cgroup_unregister_region() in fini silently no-ops on NULL
      and leaks the region. (Sashiko-bot)
    - Reorder fini to call set_used(false) and evict_all() before
      dmem_cgroup_unregister_region(), so ttm_resource_free() can
      uncharge via man->cg during eviction; clear man->cg after
      unregister. (Sashiko-bot)
    
    v7:
    - Move dmem_cgroup_unregister_region() before the early return on
      evict_all() failure; not doing so leaves a dangling reclaim callback
      pointing to the partially-torn-down VRAM manager, causing a
      use-after-free when the cgroup later triggers reclaim. (Sashiko-bot)
    - Switch back to drmm_cgroup_register_region() with a drm_dev_enter/
      exit guard in the reclaim callback (matching xe), rather than manual
      register/unregister.  drm_dev_unplug() fires before vram_mgr_fini(),
      so drm_dev_enter() returning false prevents any reclaim from touching
      the manager during teardown.  This also fixes the "vram" name
      collision on multi-GPU systems, since drmm_cgroup_register_region()
      automatically prefixes with "drm/<pci-addr>/". (Sashiko-bot)
    
    v8:
    - Move the dmem cgroup region teardown back into
      amdgpu_vram_mgr_fini(): register the region with
      dmem_cgroup_register_region() (keeping the "drm/<unique>/vram"
      prefix), store it in amdgpu_vram_mgr.cg_region, and unregister it
      explicitly after ttm_resource_manager_evict_all(). The v7
      drmm-only approach left a use-after-free on the probe-error
      teardown path: drm_dev_unplug() is not called there, so the
      drm_dev_enter() guard stays open while drm_driver.release destroys
      the manager before the drmm action unregisters the region. The
      explicit unregister drains in-flight reclaim on every teardown
      path; the drm_dev_enter() guard is kept as defense against reclaim
      after unplug. (Sashiko-bot)
    
    Assisted-by: GitHub_Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 drm-intel
ed174c7e12a8 drm/amdgpu: Fix init ordering in amdgpu_vram_mgr_init()
f296621a568c cgroup/dmem: Introduce struct dmem_cgroup_init for region initialization
4f9361555a87 cgroup/dmem: Add reclaim callback for lowering max below current usage
eb3905d002d5 drm/ttm: Hook up a cgroup-aware reclaim callback for the dmem controller
-:154: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#154: FILE: drivers/gpu/drm/ttm/ttm_bo.c:679:
+	evict_walk.try_low = evict_walk.hit_low = false;

total: 0 errors, 0 warnings, 1 checks, 226 lines checked
0c9edfb67f63 drm/xe: Wire up dmem cgroup reclaim for VRAM manager
-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:282:
+static int xe_ttm_vram_mgr_dmem_reclaim(struct dmem_cgroup_pool_state *pool,
+					 u64 target_bytes, void *priv)

total: 0 errors, 0 warnings, 1 checks, 75 lines checked
ed4facacb542 drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager


