Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AC0C3DA42
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 18:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433E110E63B;
	Tue,  9 Jul 2024 18:48:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9807410E63B;
 Tue,  9 Jul 2024 18:48:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Update_page_fault_queue_s?=
 =?utf-8?q?ize_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jul 2024 18:48:29 -0000
Message-ID: <172055090961.87462.9914431449640845851@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720550129.git.stuart.summers@intel.com>
In-Reply-To: <cover.1720550129.git.stuart.summers@intel.com>
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

Series: Update page fault queue size calculation
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
commit da23c510a1cc9dad7909ccc0769413e6efda7dfe
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Tue Jul 9 18:41:00 2024 +0000

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
+ /mt/dim checkpatch 4f91773d8b48f4a5a016f4449a1cf1ff8d02d855 drm-intel
22b80ee3f58c drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
da23c510a1cc drm/xe: Use topology to determine page fault queue size


