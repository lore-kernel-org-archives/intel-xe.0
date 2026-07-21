Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E5FC4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 20:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F2110E3CA;
	Tue, 21 Jul 2026 20:37:37 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04210E3CA;
 Tue, 21 Jul 2026 20:37:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/pagemap=3A_Clear_driv?=
 =?utf-8?q?er-provided_PFNs_from_migration_PFN_array?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jul 2026 20:37:37 -0000
Message-ID: <178466625705.212456.8847837446218733222@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721201959.1082266-1-matthew.brost@intel.com>
In-Reply-To: <20260721201959.1082266-1-matthew.brost@intel.com>
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

Series: drm/pagemap: Clear driver-provided PFNs from migration PFN array
URL   : https://patchwork.freedesktop.org/series/170848/
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
commit de24093bb77e8a53efde73190172bb14648514f1
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jul 21 13:19:59 2026 -0700

    drm/pagemap: Clear driver-provided PFNs from migration PFN array
    
    DRM pagemap overloads the migration PFN array to store driver-provided
    PFNs before calling migrate_vma_*() to finalize the migration. If an
    error occurs during the incremental copy phase, the migration PFN
    entries are reverted to their original state. After reverting the
    device-folio mutations, clear any remaining driver-provided PFNs to
    avoid confusing the migrate_vma_*() functions.
    
    Reported-by: Sashiko <sashiko-bot@kernel.org>
    Fixes: 3902846af36b ("drm/pagemap Fix error paths in drm_pagemap_migrate_to_devmem")
    Fixes: ec265e1f1cfc ("drm/pagemap: Support source migration over interconnect")
    Cc: stable@vger.kernel.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 047f635ffe2590e6ea4150a0f3470951f9fd0216 drm-intel
de24093bb77e drm/pagemap: Clear driver-provided PFNs from migration PFN array
-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#14: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 3902846af36b ("drm/pagemap Fix error paths in drm_pagemap_migrate_to_devmem")

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


