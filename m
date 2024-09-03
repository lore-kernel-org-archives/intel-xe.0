Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAF3CD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 09:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619C410E460;
	Tue,  3 Sep 2024 09:57:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FE410E460;
 Tue,  3 Sep 2024 09:57:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_xe=5Fpm=5Fr?=
 =?utf-8?q?untime=5Fget_in_xe=5Fbo=5Fmove=28=29_if_reclaim-safe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 09:57:09 -0000
Message-ID: <172535742902.910691.2749931829608754670@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903094232.166342-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240903094232.166342-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
URL   : https://patchwork.freedesktop.org/series/138131/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dcbcce26ff1a48d407a3aac4ce70771a6c8348f6
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 3 11:42:32 2024 +0200

    drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
    
    xe_bo_move() might be called in the TTM swapout path from validation
    by another TTM device. If so, we are not likely to have a RPM
    reference. So iff xe_pm_runtime_get() is safe to call from reclaim,
    use it instead of xe_pm_runtime_get_noresume().
    
    Strictly this is currently needed only if handle_system_ccs is true,
    but use xe_pm_runtime_get() if possible anyway to increase test
    coverage.
    
    At the same time warn if handle_system_ccs is true and we can't
    call xe_pm_runtime_get() from reclaim context. This will likely trip
    if someone tries to enable SRIOV on LNL, without fixing Xe SRIOV
    runtime resume / suspend.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch dd987a9431a336ddbfc6bfe9720f4783a6bc94b0 drm-intel
dcbcce26ff1a drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.


