Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918F9CD342B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 17:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0D110E355;
	Mon,  2 Sep 2024 17:01:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B4110E355;
 Mon,  2 Sep 2024 17:01:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_improve_cac?=
 =?utf-8?q?he_flushing_behaviour?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 17:01:39 -0000
Message-ID: <172529649954.907653.14374762550876733420@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902153744.63456-2-matthew.auld@intel.com>
In-Reply-To: <20240902153744.63456-2-matthew.auld@intel.com>
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

Series: drm/xe/bmg: improve cache flushing behaviour
URL   : https://patchwork.freedesktop.org/series/138102/
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
commit 80c659a1eeb075865c7769d58ecf77116f988692
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Sep 2 16:37:45 2024 +0100

    drm/xe/bmg: improve cache flushing behaviour
    
    The BSpec seems to suggest that EN_L3_RW_CCS_CACHE_FLUSH must be toggled
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
    
    With that drop EN_L3_RW_CCS_CACHE_FLUSH.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e drm-intel
80c659a1eeb0 drm/xe/bmg: improve cache flushing behaviour


