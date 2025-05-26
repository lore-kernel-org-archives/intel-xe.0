Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6459FC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 19:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0E110E397;
	Mon, 26 May 2025 19:29:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22EA10E397;
 Mon, 26 May 2025 19:29:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Modify_drm_helpers_to_use?=
 =?utf-8?q?_luminance_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 19:29:16 -0000
Message-ID: <174828775685.21145.9384848997046337741@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250509051816.1244486-1-suraj.kandpal@intel.com>
In-Reply-To: <20250509051816.1244486-1-suraj.kandpal@intel.com>
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

Series: Modify drm helpers to use luminance (rev3)
URL   : https://patchwork.freedesktop.org/series/147565/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 80ab05f69e64824fd58a6b75618cfeb807d219b5
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri May 9 10:48:16 2025 +0530

    drm/i915/backlight: Use drm_edp_backlight_enable
    
    Use drm dp helper to enable backlight now that it has been modified
    to set PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability
    supports it and the driver wants it. Remove the dead code.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
53a24aeb0008 drm/dp: Introduce new member in drm_backlight_info
aa9ea9b8f761 drm/dp: Add argument in drm_edp_backlight_init
8d3a19d42ce2 drm/dp: Add argument for luminance range info in drm_edp_backlight_init
67b8ac46fb7e drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
e113996652ba drm/dp: Change current_level argument type to u32
473b1951adf7 drm/dp: Modify drm_edp_probe_state
a8581cd751be drm/dp: Change argument type for drm_edp_backlight_set_level
ca1852eaa3d8 drm/dp: Modify drm_edp_backlight_set_level
09bee892b485 drm/dp: Change argument type of drm_edp_backlight_enable
bfc4e38ecbe5 drm/dp: Enable backlight control using luminance
465937c0ff6f drm/i915/backlight: Use drm helper to initialize edp backlight
c03412f6115c drm/i915/backlight: Use drm helper to set edp backlight
80ab05f69e64 drm/i915/backlight: Use drm_edp_backlight_enable


