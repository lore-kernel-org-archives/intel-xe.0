Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAF6C531DF
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 14:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F022910EAC8;
	Thu, 22 Aug 2024 14:03:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CCA10EAC8;
 Thu, 22 Aug 2024 14:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/lnl=3A_Implement_c?=
 =?utf-8?q?lear-on-free_for_pooled_BOs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 14:03:24 -0000
Message-ID: <172433540415.725702.18056282742230533623@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822124244.10554-1-nirmoy.das@intel.com>
In-Reply-To: <20240822124244.10554-1-nirmoy.das@intel.com>
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

Series: drm/xe/lnl: Implement clear-on-free for pooled BOs
URL   : https://patchwork.freedesktop.org/series/137644/
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
commit 109189cf6aee988d0e79e128abfe48bc350a8ba2
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Aug 22 14:42:44 2024 +0200

    drm/xe/lnl: Implement clear-on-free for pooled BOs
    
    Implement GPU clear-on-free for pooled system pages in Xe.
    
    Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
    ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU clear
    fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
    
    Clear-on-free is only relevant for pooled pages as driver needs to give
    back those pages. So do clear-on-free only for such BOs and keep doing
    clear-on-alloc for ttm_cached type BOs
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 057ceac2376d13c4e02998cfb46ce6938ddd3a41 drm-intel
109189cf6aee drm/xe/lnl: Implement clear-on-free for pooled BOs


