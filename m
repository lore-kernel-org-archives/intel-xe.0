Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8A8C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F30710EB36;
	Thu, 11 Jul 2024 17:44:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E3910EB42;
 Thu, 11 Jul 2024 17:44:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Update_page_fault_queue_s?=
 =?utf-8?q?ize_calculation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 17:44:05 -0000
Message-ID: <172071984599.144075.12299893794871637847@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720718987.git.stuart.summers@intel.com>
In-Reply-To: <cover.1720718987.git.stuart.summers@intel.com>
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

Series: Update page fault queue size calculation (rev2)
URL   : https://patchwork.freedesktop.org/series/135915/
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
commit 95df31fec2695e9e839db798f102732617d4b2b9
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Thu Jul 11 17:36:29 2024 +0000

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
+ /mt/dim checkpatch 3bcdb3f9a5370e29bc971883307487527c3e6a65 drm-intel
a395c6a05b2c drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
95df31fec269 drm/xe: Use topology to determine page fault queue size


