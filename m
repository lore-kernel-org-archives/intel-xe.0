Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDFACD98F6
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 13:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E53F10E7CC;
	Thu, 18 Jun 2026 13:45:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899C710EBC3;
 Thu, 18 Jun 2026 13:45:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_rename_ttm=5Fp?=
 =?utf-8?q?lace=3A=3Afpfn/lpfn_to_param1/param2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jun 2026 13:45:19 -0000
Message-ID: <178179031955.93659.7850065324296833206@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618133908.2761908-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260618133908.2761908-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: drm/ttm: rename ttm_place::fpfn/lpfn to param1/param2
URL   : https://patchwork.freedesktop.org/series/168792/
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
commit 70ee50d9102834bbfe88e6dc704dc8f08a357675
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Thu Jun 18 19:09:08 2026 +0530

    drm/ttm: rename ttm_place::fpfn/lpfn to param1/param2
    
    The fpfn/lpfn fields in struct ttm_place were named after page frame
    numbers, but they are really just placement parameters passed to the
    backend resource manager. Rename them to the generic param1/param2
    and document that their interpretation is backend-defined. The VRAM
    range manager continues to treat them as the first and last valid
    page frame number, so behaviour is unchanged.
    
    This decouples the API from PFN/range-specific semantics so that
    these fields can be used more flexibly in the future (e.g.,
    mask-based or segment-aware placement constraints). No functional
    change.
    
    Suggested-by: Christian König <christian.koenig@amd.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch 042740faed137b53caa019b765fb327aaf703ca7 drm-intel
70ee50d91028 drm/ttm: rename ttm_place::fpfn/lpfn to param1/param2
-:94: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#94: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h:198:
+			uint32_t param1;

-:95: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#95: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h:199:
+			uint32_t param2;

-:394: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#394: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1801:
+	uint64_t tmp, end;

-:569: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#569: FILE: drivers/gpu/drm/i915/gem/i915_gem_ttm.c:152:
+			WARN_ON(overflows_type(resource_size(&mr->io) >> PAGE_SHIFT, place->param2));

-:651: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#651: FILE: drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:166:
+	GEM_BUG_ON(!place->param2);

-:687: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#687: FILE: drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:204:
+	GEM_BUG_ON(!place->param2);

-:760: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#760: FILE: drivers/gpu/drm/i915/intel_region_ttm.c:227:
+			if (WARN_ON(overflows_type(resource_size(&mem->io) >> PAGE_SHIFT, place.param2))) {

-:793: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#793: FILE: drivers/gpu/drm/nouveau/nouveau_bo.c:486:
+	unsigned i, start, end;

-:1010: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1010: FILE: drivers/gpu/drm/radeon/radeon_ttm.c:106:
+			unsigned start = rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT;

-:1534: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#1534: FILE: include/drm/ttm/ttm_placement.h:91:
+	uint64_t	param1;

-:1535: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#1535: FILE: include/drm/ttm/ttm_placement.h:92:
+	uint64_t	param2;

total: 0 errors, 6 warnings, 5 checks, 1290 lines checked


