Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C39C27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 21:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C54110E103;
	Mon, 10 Jun 2024 21:27:38 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C5610E38C;
 Mon, 10 Jun 2024 21:27:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Fix_missing_workqueue_destroy_in_xe=5Fgt=5Fpagefa?=
 =?utf-8?q?ult?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jun 2024 21:27:36 -0000
Message-ID: <171805485672.64653.75547910568798688@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610203300.182615-1-stuart.summers@intel.com>
In-Reply-To: <20240610203300.182615-1-stuart.summers@intel.com>
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

Series: series starting with [1/2] drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
URL   : https://patchwork.freedesktop.org/series/134694/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d21ef5aeba498085dac72b8cc1aae4152dd5552
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Mon Jun 10 20:33:00 2024 +0000

    drm/xe: Use topology to determine page fault queue size
    
    Currently the page fault queue size is hard coded. However
    the hardware supports faulting for each EU and each CS.
    For some applications running on hardware with a large
    number of EUs and CSs, this can result in an overflow of
    the page fault queue.
    
    Add a small calculation to determine the page fault queue
    size based on the number of EUs and CSs in the platform as
    detmined by fuses.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch bf9d891af55d3785eb9438efb053c991bf2b4b10 drm-intel
f07469933636 drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
9d21ef5aeba4 drm/xe: Use topology to determine page fault queue size


