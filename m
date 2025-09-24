Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A15CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 17:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FA010E79E;
	Wed, 24 Sep 2025 17:48:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229E910E79E;
 Wed, 24 Sep 2025 17:48:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/migrate=3A_Revamp_?=
 =?utf-8?q?PAT_index_selection_for_migrate_PTEs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 17:48:45 -0000
Message-ID: <175873612513.362993.1208964054037494116@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924174100.1551195-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20250924174100.1551195-2-sanjay.kumar.yadav@intel.com>
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

Series: drm/xe/migrate: Revamp PAT index selection for migrate PTEs (rev2)
URL   : https://patchwork.freedesktop.org/series/154629/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c02c542e6fcc4c15aab97443707e49df4a6bc658
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date:   Wed Sep 24 23:11:01 2025 +0530

    drm/xe/migrate: Revamp PAT index selection for migrate PTEs
    
    Improve PAT index selection logic in xe_migrate.c to avoid unnecessary
    coherency overhead when host-side memory is uncached. Previously,
    we defaulted to XE_CACHE_WB, which enforces 2-way coherency and may
    trigger cacheline pulls from CPU even when host-side memory is never
    dirty.
    
    This change introduces xe_migrate_pat_index() to choose the appropriate
    PAT index. For iGPUs with WC host mappings, we now prefer XE_CACHE_NONE
    to skip coherency snoops. For compressed PTEs on newer platforms, we
    select XE_CACHE_NONE_COMPRESSION.
    
    This avoids unnecessary cache traffic for uncached host mappings.
    
    Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch a4d9163251f4832a7d34d4b59449f9a68b9b7adf drm-intel
c02c542e6fcc drm/xe/migrate: Revamp PAT index selection for migrate PTEs
-:36: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#36: FILE: drivers/gpu/drm/xe/xe_migrate.c:113:
+	if (!bo) {
[...]
+	} else if (is_comp_pte) {
[...]
+	} else if (!xe_bo_is_vram(bo) && bo->ttm.ttm->caching == ttm_cached) {
[...]
+	} else {
[...]

total: 0 errors, 1 warnings, 0 checks, 76 lines checked


