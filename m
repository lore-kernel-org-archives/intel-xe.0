Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944BCE9A769
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 11:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F37E10E5E2;
	Tue, 24 Mar 2026 11:15:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081A610E5E0;
 Tue, 24 Mar 2026 11:15:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/syncobj=3A_Fix_xa=5Fa?=
 =?utf-8?q?lloc_allocation_flags?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Mar 2026 11:15:49 -0000
Message-ID: <177435094901.389820.6046880090197577143@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260324111019.22467-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260324111019.22467-1-tvrtko.ursulin@igalia.com>
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

Series: drm/syncobj: Fix xa_alloc allocation flags
URL   : https://patchwork.freedesktop.org/series/163772/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d1c81dfffbfa50c44fb9c8e09350070b776e3c1
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Tue Mar 24 11:10:19 2026 +0000

    drm/syncobj: Fix xa_alloc allocation flags
    
    The xarray conversion blindly and wrongly replaced idr_alloc with xa_alloc
    and kept the GFP_NOWAIT. It should have been GFP_KERNEL to account for
    idr_preload it removed. Fix it.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Fixes: fec2c3c01f1c ("drm/syncobj: Convert syncobj idr to xarray")
    Reported-by: Himanshu Girotra <himanshu.girotra@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 4b7edcc15b85ee23b9928da304c47cc1cdb30e87 drm-intel
9d1c81dfffbf drm/syncobj: Fix xa_alloc allocation flags
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


