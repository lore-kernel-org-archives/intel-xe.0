Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E7C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 05:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071F510E9B1;
	Fri,  9 May 2025 05:27:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD4110E9AD;
 Fri,  9 May 2025 05:27:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Modify_drm_helpers_to_use?=
 =?utf-8?q?_luminance_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 May 2025 05:27:02 -0000
Message-ID: <174676842257.61934.3143514619604863229@c664b1dc75d1>
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
commit 0abf2d6a8c1969daf0f0af47ee2536cd585ed516
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri May 9 10:48:16 2025 +0530

    drm/i915/backlight: Use drm_edp_backlight_enable
    
    Use drm dp helper to enable backlight now that it has been modified
    to set PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability
    supports it and the driver wants it. Remove the dead code.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 0a4534e5a7d58144a24c64c722c771ec80b1fe32 drm-intel
0a5b2a04948e drm/dp: Introduce new member in drm_backlight_info
0683196d6542 drm/dp: Add argument in drm_edp_backlight_init
582de18799c6 drm/dp: Add argument for luminance range info in drm_edp_backlight_init
b4e97382903c drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
ea2b4810054f drm/dp: Change current_level argument type to u32
57ce29303be8 drm/dp: Modify drm_edp_probe_state
f89503343719 drm/dp: Change argument type for drm_edp_backlight_set_level
f4b4695e790a drm/dp: Modify drm_edp_backlight_set_level
3c125ee9565e drm/dp: Change argument type of drm_edp_backlight_enable
1b518ae7dd08 drm/dp: Enable backlight control using luminance
c9ecf8355352 drm/i915/backlight: Use drm helper to initialize edp backlight
2a4f8cfe6f0f drm/i915/backlight: Use drm helper to set edp backlight
0abf2d6a8c19 drm/i915/backlight: Use drm_edp_backlight_enable


