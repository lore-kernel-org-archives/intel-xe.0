Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2942BC02198
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 15:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA17310E897;
	Thu,  6 Feb 2025 15:25:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A15610E88B;
 Thu,  6 Feb 2025 15:25:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_stats_for_v?=
 =?utf-8?q?ma_page_faults_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 15:25:06 -0000
Message-ID: <173885550656.2096055.1044457420069364577@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206134551.1321265-1-francois.dugast@intel.com>
In-Reply-To: <20250206134551.1321265-1-francois.dugast@intel.com>
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

Series: drm/xe: Add stats for vma page faults (rev2)
URL   : https://patchwork.freedesktop.org/series/144412/
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
commit a64eaf1cf211227edbd4a94fbe650e1617b88652
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Feb 6 14:45:50 2025 +0100

    drm/xe: Add stats for vma page faults
    
    Add new entries in stats for vma page faults. If CONFIG_DEBUG_FS is
    enabled, the count and number of bytes can be viewed per GT in the
    stat debugfs file. This helps when testing, to confirm page faults
    have been triggered as expected. It also helps when looking at the
    performance impact of page faults. Data is simply collected when
    entering the page fault handler so there is no indication whether
    it completed successfully, with or without retries, etc.
    
    Example output:
    
        cat /sys/kernel/debug/dri/0/gt0/stats
        tlb_inval_count: 129
        vma_pagefault_count: 12
        vma_pagefault_bytes: 98304
    
    v2: Rebase
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 21c9114d96b8329f08fc4bfb21e57b43cb190878 drm-intel
a64eaf1cf211 drm/xe: Add stats for vma page faults


