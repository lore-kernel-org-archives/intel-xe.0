Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE429C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 20:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F94010E9BD;
	Wed,  4 Jun 2025 20:47:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5630710E9B7;
 Wed,  4 Jun 2025 20:47:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/bmg=3A_fix_compres?=
 =?utf-8?q?sed_VRAM_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 20:47:47 -0000
Message-ID: <174907006734.49691.10361159142517412180@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604181511.1629551-2-matthew.auld@intel.com>
In-Reply-To: <20250604181511.1629551-2-matthew.auld@intel.com>
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

Series: drm/xe/bmg: fix compressed VRAM handling
URL   : https://patchwork.freedesktop.org/series/149847/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec77d8afe8e63686a1a292c13ae384fc0d06c095
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Jun 4 19:15:12 2025 +0100

    drm/xe/bmg: fix compressed VRAM handling
    
    There looks to be an issue in our compression handling when the BO pages
    are very fragmented, where we choose to skip the identity map and
    instead fall back to emitting the PTEs by hand when migrating memory,
    such that we can hopefully do more work per blit operation. However in
    such a case we need to ensure the src PTEs are correctly tagged with a
    compression enabled PAT index on dgpu xe2+, otherwise the copy will
    simply treat the src memory as uncompressed, leading to corruption if
    the memory was compressed by the user.
    
    To fix this it looks like we can pass use_comp_pat into emit_pte() on
    the src side.
    
    There are reports of VRAM corruption in some heavy user workloads, which
    might be related: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4495
    
    Fixes: 523f191cc0c7 ("drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Cc: <stable@vger.kernel.org> # v6.12+
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 573b98ac3ff9ff95c3316789e97980277e4ffe2b drm-intel
ec77d8afe8e6 drm/xe/bmg: fix compressed VRAM handling
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
might be related: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4495

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


