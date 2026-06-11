Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC1CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 14:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F6C10E7BA;
	Thu, 11 Jun 2026 14:49:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DA110E7BA;
 Thu, 11 Jun 2026 14:49:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_reclaim_to_the_dmem_c?=
 =?utf-8?q?group_controller_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 14:49:53 -0000
Message-ID: <178118939375.70087.4577047617874359829@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611142242.2529-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260611142242.2529-1-thomas.hellstrom@linux.intel.com>
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

Series: Add reclaim to the dmem cgroup controller (rev5)
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
commit 9439fe7de4e3d3f46a4fe8a110666ade97248728
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Jun 11 16:22:42 2026 +0200

    drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
    
    Register the VRAM manager with the dmem cgroup reclaim infrastructure
    so that lowering dmem.max below current VRAM usage triggers TTM
    eviction rather than failing with -EBUSY.
    
    Guard place->flags in amdgpu_ttm_bo_eviction_valuable() against NULL,
    as the TTM reclaim path passes a NULL place in cgroup drain mode.
    
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
      amdgpu_vram_mgr.cg_region. Explicitly call
      dmem_cgroup_unregister_region() at the top of amdgpu_vram_mgr_fini()
      before any manager teardown, draining in-flight reclaim callbacks via
      the rwsem before the manager is destroyed. This is required because
      amdgpu's vram manager fini is called explicitly during driver unbind,
      which may precede the DRM device release and thus precede any
      drmm-based cleanup. (Sashiko-bot)
    
    Assisted-by: GitHub_Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch a472b6217138ef0942355824543a5cce12f43343 drm-intel
e1a5560d6708 drm/amdgpu: Fix init ordering in amdgpu_vram_mgr_init()
52d9204760ae cgroup/dmem: Introduce struct dmem_cgroup_init for region initialization
d0cf7b3f76b6 cgroup/dmem: Add reclaim callback for lowering max below current usage
6a1fc281b4e3 drm/ttm: Hook up a cgroup-aware reclaim callback for the dmem controller
-:147: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#147: FILE: drivers/gpu/drm/ttm/ttm_bo.c:679:
+	evict_walk.try_low = evict_walk.hit_low = false;

total: 0 errors, 0 warnings, 1 checks, 224 lines checked
f29ea644bf65 drm/xe: Wire up dmem cgroup reclaim for VRAM manager
-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:282:
+static int xe_ttm_vram_mgr_dmem_reclaim(struct dmem_cgroup_pool_state *pool,
+					 u64 target_bytes, void *priv)

total: 0 errors, 0 warnings, 1 checks, 75 lines checked
9439fe7de4e3 drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager


