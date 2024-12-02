Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ADED78332
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 15:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D36410E7BF;
	Mon,  2 Dec 2024 15:47:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6B910E7BA;
 Mon,  2 Dec 2024 15:47:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_fix_ttm?=
 =?utf-8?q?=5Fbo=5Faccess=28=29_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 15:47:24 -0000
Message-ID: <173315444410.1676965.16024263031172743985@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202154123.76887-2-matthew.auld@intel.com>
In-Reply-To: <20241202154123.76887-2-matthew.auld@intel.com>
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

Series: drm/xe/display: fix ttm_bo_access() usage
URL   : https://patchwork.freedesktop.org/series/141996/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 68bd881837acae2a14b017b5594036b6346daf78
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Dec 2 15:41:24 2024 +0000

    drm/xe/display: fix ttm_bo_access() usage
    
    ttm_bo_access() returns the size on success. Account for that otherwise
    the caller incorrectly thinks this is an error in
    intel_atomic_prepare_plane_clear_colors().
    
    Fixes: b6308aaa24a7 ("drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access")
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 77777471ae59ce2f0d0e74d55c60014cf02bd4df drm-intel
68bd881837ac drm/xe/display: fix ttm_bo_access() usage


