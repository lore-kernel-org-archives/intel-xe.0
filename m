Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E041CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E07410E14A;
	Mon, 18 May 2026 19:22:29 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC8710E14A;
 Mon, 18 May 2026 19:22:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/multi=5Fqueue=3A_F?=
 =?utf-8?q?ix_secondary_queue_error_case_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 May 2026 19:22:27 -0000
Message-ID: <177913214745.82277.8424535260306105277@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260518191639.320890-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260518191639.320890-2-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe/multi_queue: Fix secondary queue error case (rev2)
URL   : https://patchwork.freedesktop.org/series/166679/
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
commit e44f69b8029f2a9d95da70c129e2d0fd4a490f0c
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Mon May 18 12:16:40 2026 -0700

    drm/xe/multi_queue: Fix secondary queue error case
    
    If xe_lrc_create() fails, the secondary queue added to the
    multi-queue group list is not removed before freeing the
    queue. Fix error path handling for secondary queues by
    removing it from the multi-queue group list at the right
    place.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7979
    Fixes: d716a5088c88 ("drm/xe/multi_queue: Handle tearing down of a multi queue")
    Reported-by: Sebastian Österlund <sebastian.osterlund@intel.com>
    Cc: stable@vger.kernel.org # v7.0+
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 7161a1ce9e045da82f90b1b4c184ab84b7f54900 drm-intel
e44f69b8029f drm/xe/multi_queue: Fix secondary queue error case
-:17: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#17: 
Reported-by: Sebastian Österlund <sebastian.osterlund@intel.com>
Cc: stable@vger.kernel.org # v7.0+

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


