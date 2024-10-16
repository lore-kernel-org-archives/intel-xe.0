Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55665D1AD4F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213A110E115;
	Wed, 16 Oct 2024 12:04:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B1210E5A5;
 Wed, 16 Oct 2024 12:04:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_ufence_addr_valid?=
 =?utf-8?q?ation_and_error_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 12:04:38 -0000
Message-ID: <172908027841.1273632.12962331812617969757@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016082304.66009-1-nirmoy.das@intel.com>
In-Reply-To: <20241016082304.66009-1-nirmoy.das@intel.com>
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

Series: Improve ufence addr validation and error handling (rev3)
URL   : https://patchwork.freedesktop.org/series/139991/
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
commit 8488beac69a944ed0061a36dfe06999bf02ac3e0
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Oct 16 10:23:04 2024 +0200

    drm/xe/ufence: Warn if mmget_not_zero() fails
    
    This shouldn't happen but seen this while debugging ufence timeout
    issue time to time so log it to isolate this particular case.
    
    v2: s/XE_WARN_ON/drm_dbg(Maarten)
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 drm-intel
3f048b3e5fc4 drm/xe/ufence: Prefetch ufence addr to catch bogus address
8488beac69a9 drm/xe/ufence: Warn if mmget_not_zero() fails


