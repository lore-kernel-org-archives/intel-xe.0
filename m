Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E404C02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 06:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AA110E444;
	Thu,  6 Feb 2025 06:47:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2520110E444;
 Thu,  6 Feb 2025 06:46:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_Aux_based_Nits_bri?=
 =?utf-8?q?ghtness_control_for_eDP_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 06:46:54 -0000
Message-ID: <173882441414.1878514.16394968625226933544@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
In-Reply-To: <20250206063253.2827017-1-suraj.kandpal@intel.com>
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

Series: Enable Aux based Nits brightness control for eDP (rev3)
URL   : https://patchwork.freedesktop.org/series/143910/
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
commit 11e57bfc8d34d922528cfc694b273a9b1b2a7655
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Feb 6 12:02:53 2025 +0530

    drm/i915/backlight: Enable nits based luminance
    
    Enable nits based luminance by writing the PANEL_LUMINANCE_CONTROL
    bit and set the correct register to change brightness.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Tested-by: Ben Kao <ben.kao@intel.com>
    Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 7a632b6798b6a05b63725249e3209afea13ea499 drm-intel
990021044ef7 drm/dp: Add eDP 1.5 bit definition
e1575c43d49f drm/dp: Increase eDP display control capability size
0d6fa428b897 drm/i915/backlight: Use proper interface based on eDP version
5927d01e99f6 drm/i915/backlight: Check Luminance based brightness control for VESA
9b10d17e1053 drm/i915/backlight: Modify function to get VESA brightness in Nits
f7db972015a7 drm/i915/backlight: Add function to change brightness in nits for VESA
6ccc6855d973 drm/i915/backlight: Setup nits based luminance via VESA
11e57bfc8d34 drm/i915/backlight: Enable nits based luminance


