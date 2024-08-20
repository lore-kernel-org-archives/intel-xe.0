Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9010EC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292FA10E80B;
	Tue, 20 Aug 2024 17:41:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA8510E80B;
 Tue, 20 Aug 2024 17:41:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Invalidate_medi?=
 =?utf-8?q?a=5Fgt_TLBs_in_PT_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 17:41:55 -0000
Message-ID: <172417571569.716037.13223008609617292292@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820161632.987369-1-matthew.brost@intel.com>
In-Reply-To: <20240820161632.987369-1-matthew.brost@intel.com>
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

Series: drm/xe: Invalidate media_gt TLBs in PT code (rev2)
URL   : https://patchwork.freedesktop.org/series/137419/
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
commit cdb73ea2d568a95808d887e493426f63bd9648e8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Aug 20 09:16:32 2024 -0700

    drm/xe: Invalidate media_gt TLBs in PT code
    
    Testing on LNL has shown media GT's TLBs need to be invalidated via the
    GuC, update PT code appropriately.
    
    v2:
     - Do dma_fence_get before first call of invalidation_fence_init (Himal)
     - No need to check for valid chain fence (Himal)
    
    Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch aadc820a10ab50bd57179c0feb238bedde6a9d3b drm-intel
cdb73ea2d568 drm/xe: Invalidate media_gt TLBs in PT code


