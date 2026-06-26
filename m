Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76351CDE00E
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 06:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8D710F432;
	Fri, 26 Jun 2026 06:43:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168B310F432;
 Fri, 26 Jun 2026 06:42:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_add_generic_dr?=
 =?utf-8?q?vparam=5B=5D_alias_for_ttm=5Fplace=3A=3Afpfn/lpfn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jun 2026 06:42:58 -0000
Message-ID: <178245617808.119363.13182903234125166503@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: drm/ttm: add generic drvparam[] alias for ttm_place::fpfn/lpfn
URL   : https://patchwork.freedesktop.org/series/169236/
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
commit e389ec63cecd36e2cd6cc2142e6cd9cb7a306ecb
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Fri Jun 26 12:06:58 2026 +0530

    drm/ttm: add generic drvparam[] alias for ttm_place::fpfn/lpfn
    
    The fpfn/lpfn fields in struct ttm_place are named after page frame
    numbers, but they are really just placement parameters interpreted by
    the backend resource manager. Wrap them in a union with a generic
    drvparam[2] array so backends can access the same storage without the
    PFN-specific naming.
    
    drvparam[0]/drvparam[1] alias fpfn/lpfn, so existing users and the
    VRAM range manager are unchanged. This decouples the API from
    PFN/range-specific semantics so that these fields can be used more
    flexibly in the future (e.g. mask-based or segment-aware placement
    constraints). No functional change.
    
    v2: Use a union exposing a generic drvparam[2] array instead of
        renaming fpfn/lpfn to param1/param2, keeping existing users
        unchanged (Tvrtko Ursulin)
    
    Suggested-by: Christian König <christian.koenig@amd.com>
    Assisted-by: Claude:claude-opus-4-8
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch 5fe805765b01f6e3519421039c3ade7cff1074ca drm-intel
e389ec63cecd drm/ttm: add generic drvparam[] alias for ttm_place::fpfn/lpfn
-:55: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#55: FILE: include/drm/ttm/ttm_placement.h:89:
+			uint64_t	fpfn;

-:56: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#56: FILE: include/drm/ttm/ttm_placement.h:90:
+			uint64_t	lpfn;

-:58: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#58: FILE: include/drm/ttm/ttm_placement.h:92:
+		uint64_t	drvparam[2];

total: 0 errors, 0 warnings, 3 checks, 24 lines checked


