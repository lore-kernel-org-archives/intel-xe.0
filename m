Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9046D5B854
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 00:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568BB10E259;
	Tue, 29 Oct 2024 00:45:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA16910E259;
 Tue, 29 Oct 2024 00:45:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Suspend=2C_resume=2C_and_?=
 =?utf-8?q?d3cold_tweaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 00:45:17 -0000
Message-ID: <173016271775.1357055.14428553550050989207@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029003224.2257439-1-matthew.brost@intel.com>
In-Reply-To: <20241029003224.2257439-1-matthew.brost@intel.com>
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

Series: Suspend, resume, and d3cold tweaks
URL   : https://patchwork.freedesktop.org/series/140621/
State : warning

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
commit 1896169bf5138152dee8379b8ae78786afd32da1
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Oct 28 17:32:24 2024 -0700

    drm/xe: Add XE_BO_FLAG_PINNED_NEED_LOAD
    
    Not all pinned BOs need a memcpy to restored, rather just ones which are
    required for resume to complete. Add XE_BO_FLAG_PINNED_NEED_LOAD which
    indicates a BO needs to restored via a memcpy prior to loading GuC. This
    should speedup resume / d3cold exit slightly as the GPU can be used to
    copy some of the pinned BOs.
    
    Marking most kernel BOs and migration LRC with
    XE_BO_FLAG_PINNED_NEED_LOAD to be safe. This could be trimmed down in
    future.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 405e02c22d91503cc6c3d54f675ae25df62db9df drm-intel
e7de7169d389 drm/xe: Add XE_BO_FLAG_PINNED_WONTNEED
03b0164fe2fa drm/xe: Restore system memory GGTT mappings
-:31: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around bo->placements[0]
#31: FILE: drivers/gpu/drm/xe/xe_bo.c:949:
+	struct ttm_place *place = &(bo->placements[0]);

total: 0 errors, 0 warnings, 1 checks, 52 lines checked
1896169bf513 drm/xe: Add XE_BO_FLAG_PINNED_NEED_LOAD


