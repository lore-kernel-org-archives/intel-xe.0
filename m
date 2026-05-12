Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A58FCD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 15:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074910E294;
	Tue, 12 May 2026 15:51:59 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6280510E27F;
 Tue, 12 May 2026 15:51:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_reclaim_to_the_dmem_c?=
 =?utf-8?q?group_controller_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 15:51:58 -0000
Message-ID: <177860111840.61708.14206737536497743369@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512082406.44470-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260512082406.44470-1-thomas.hellstrom@linux.intel.com>
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

Series: Add reclaim to the dmem cgroup controller (rev4)
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
commit 52d167804b9c139c1123408a3fd00f29d3beb8f7
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue May 12 10:24:06 2026 +0200

    drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
    
    Register the VRAM manager with the dmem cgroup reclaim infrastructure
    so that lowering dmem.max below current VRAM usage triggers TTM
    eviction rather than failing with -EBUSY.
    
    Guard place->flags in amdgpu_ttm_bo_eviction_valuable() against NULL,
    as the TTM reclaim path passes a NULL place in cgroup drain mode.
    
    v3:
    - Rebased on fix for uninitialized list and buddy allocator on the
      drmm_cgroup_register_region() error path.
    
    Assisted-by: GitHub_Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472 drm-intel
c0367e095797 drm/amdgpu: Fix init ordering in amdgpu_vram_mgr_init()
9fe917243fd7 cgroup/dmem: Add reclaim callback for lowering max below current usage
b06567a9867c drm/ttm: Hook up a cgroup-aware reclaim callback for the dmem controller
-:133: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#133: FILE: drivers/gpu/drm/ttm/ttm_bo.c:679:
+	evict_walk.try_low = evict_walk.hit_low = false;

total: 0 errors, 0 warnings, 1 checks, 208 lines checked
c4a70bc80572 drm/xe: Wire up dmem cgroup reclaim for VRAM manager
52d167804b9c drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager


