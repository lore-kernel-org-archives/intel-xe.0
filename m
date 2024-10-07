Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEF8CFB43C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 17:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38DE10E0E7;
	Mon,  7 Oct 2024 17:37:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160910E0E7;
 Mon,  7 Oct 2024 17:37:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_improve_cac?=
 =?utf-8?q?he_flushing_behaviour_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Oct 2024 17:37:48 -0000
Message-ID: <172832266832.1199567.3405632798974700367@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007074541.33937-2-matthew.auld@intel.com>
In-Reply-To: <20241007074541.33937-2-matthew.auld@intel.com>
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

Series: drm/xe/bmg: improve cache flushing behaviour (rev2)
URL   : https://patchwork.freedesktop.org/series/138102/
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
commit 50f3d3f337199662a45494f07f1118f9cc372d4c
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Oct 7 08:45:42 2024 +0100

    drm/xe/bmg: improve cache flushing behaviour
    
    The BSpec says that EN_L3_RW_CCS_CACHE_FLUSH must be toggled
    on for manual global invalidation to take effect and actually flush
    device cache, however this also turns on flushing for things like
    pipecontrol, which occurs between submissions for compute/render. This
    sounds like massive overkill for our needs, where we already have the
    manual flushing on the display side with the global invalidation. Some
    observations on BMG:
    
    1. Disabling l2 caching for host writes and stubbing out the driver
       global invalidation but keeping EN_L3_RW_CCS_CACHE_FLUSH enabled, has
       no impact on wb-transient-vs-display IGT, which makes sense since the
       pipecontrol is now flushing the device cache after the render copy.
       Without EN_L3_RW_CCS_CACHE_FLUSH the test then fails, which is also
       expected since device cache is now dirty and display engine can't see
       the writes.
    
    2. Disabling EN_L3_RW_CCS_CACHE_FLUSH, but keeping the driver global
       invalidation also has no impact on wb-transient-vs-display. This
       suggests that the global invalidation still works as expected and is
       flushing the device cache without EN_L3_RW_CCS_CACHE_FLUSH turned on.
    
    With that drop EN_L3_RW_CCS_CACHE_FLUSH. This helps some workloads since
    we no longer flush the device cache between submissions as part of
    pipecontrol.
    
    Edit: We now also have clarification from HW side that BSpec was indeed
    wrong here.
    
    v2:
      - Rebase and update commit message.
    
    BSpec: 71718
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Vitasta Wattal <vitasta.wattal@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 39a016b276ce8adac629cc6c31892d0b7d2af634 drm-intel
50f3d3f33719 drm/xe/bmg: improve cache flushing behaviour


