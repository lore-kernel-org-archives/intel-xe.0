Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9E6C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 18:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D9E10E82A;
	Tue, 20 Aug 2024 18:25:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5BF10E82A;
 Tue, 20 Aug 2024 18:25:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_handle_HPD_polling_on_dis?=
 =?utf-8?q?play_pm_runtime_s/r?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 18:25:18 -0000
Message-ID: <172417831850.716037.9765900914619740728@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240820171408.192309-1-vinod.govindapillai@intel.com>
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

Series: handle HPD polling on display pm runtime s/r
URL   : https://patchwork.freedesktop.org/series/137527/
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
commit 443ecb22a2285cfa11b5b38fecb20f10cd5cb7e8
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Tue Aug 20 20:14:08 2024 +0300

    drm/xe/display: handle HPD polling in display runtime suspend/resume
    
    In XE, display runtime suspend / resume routines are called only
    if d3cold is allowed. This makes the driver unable to detect any
    HPDs once the device goes into runtime suspend state in platforms
    like LNL. Update the display runtime suspend / resume routines
    to include HPD polling regardless of d3cold status.
    
    While xe_display_pm_suspend/resume() performs steps during runtime
    suspend/resume that shouldn't happen, like suspending MST and they
    are missing other steps like enabling DC9, this patchset is meant
    to keep the current behavior wrt. these, leaving the corresponding
    updates for a follow-up
    
    v2: have a separate function for display runtime s/r (Rodrigo)
    
    v3: better streamlining of system s/r and runtime s/r calls (Imre)
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch aadc820a10ab50bd57179c0feb238bedde6a9d3b drm-intel
1be7d3c1ab96 drm/xe: Suspend/resume user access only during system s/r
8826ef12f081 drm/xe: Handle polling only for system s/r in xe_display_pm_suspend/resume()
443ecb22a228 drm/xe/display: handle HPD polling in display runtime suspend/resume


