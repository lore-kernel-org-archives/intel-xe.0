Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802D2C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 20:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE6D10E05D;
	Tue, 25 Feb 2025 20:05:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DD210E05D;
 Tue, 25 Feb 2025 20:05:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Minor_improvements_to_GT_?=
 =?utf-8?q?stats_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 20:05:14 -0000
Message-ID: <174051391415.2070441.3512020251055904856@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225195902.1247100-1-francois.dugast@intel.com>
In-Reply-To: <20250225195902.1247100-1-francois.dugast@intel.com>
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

Series: Minor improvements to GT stats (rev2)
URL   : https://patchwork.freedesktop.org/series/145405/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9127759e365351cb6e4bb1bf04c7a7eb27f0fbfc
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Feb 25 20:57:34 2025 +0100

    drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte
    
    Increase the amount of bytes that can be counted before the counter
    overflows, while not losing information as the VMA is not expected
    to have sub-kilobyte size.
    
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 533a24b8fa29455518aed9ac72209c834d814238 drm-intel
e33acb2b0677 drm/xe/gt_stats: Use atomic64_t for counters
9127759e3653 drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte


