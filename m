Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7593BD41C17
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 08:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4131210E694;
	Wed, 13 Nov 2024 08:34:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E3810E694;
 Wed, 13 Nov 2024 08:34:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Ignore_GGTT_TLB?=
 =?utf-8?q?_inval_errors_during_GT_reset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 08:34:34 -0000
Message-ID: <173148687420.3431792.10267321409018632686@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112170123.1236443-1-nirmoy.das@intel.com>
In-Reply-To: <20241112170123.1236443-1-nirmoy.das@intel.com>
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

Series: drm/xe: Ignore GGTT TLB inval errors during GT reset (rev2)
URL   : https://patchwork.freedesktop.org/series/141228/
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
commit 81faa64436c69e1e081988f281137dda0cbc7fba
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Nov 12 18:01:23 2024 +0100

    drm/xe: Ignore GGTT TLB inval errors during GT reset
    
    During GT reset, GGTT TLB invalidations may fail. This is acceptable
    as the reset will clear GGTT caches. Suppress only -ECANCELED other
    return codes are still unexpected error.
    
    v2: Add code comment(Matt).
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3389
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch cf3872e462498611b17e5f80f0b1d0900580da20 drm-intel
81faa64436c6 drm/xe: Ignore GGTT TLB inval errors during GT reset


