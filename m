Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AC6C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 11:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B839210E56F;
	Fri, 23 Aug 2024 11:28:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D8110E542;
 Fri, 23 Aug 2024 11:28:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_handle_HPD_polling_on_dis?=
 =?utf-8?q?play_pm_runtime_s/r_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 11:28:55 -0000
Message-ID: <172441253579.745445.4641774034064100739@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823112148.327015-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240823112148.327015-1-vinod.govindapillai@intel.com>
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

Series: handle HPD polling on display pm runtime s/r (rev2)
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
commit c195a57775be5532bf5dd6a990c717b6bcc5ab24
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Fri Aug 23 14:21:48 2024 +0300

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
    
    v4: rebased
    
    Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch bb53a030e951749b4e919a5a8b17e6d8bedc5597 drm-intel
d4d74f3ef2d8 drm/xe: Suspend/resume user access only during system s/r
632cfa2f318f drm/xe: Handle polling only for system s/r in xe_display_pm_suspend/resume()
c195a57775be drm/xe/display: handle HPD polling in display runtime suspend/resume


