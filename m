Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68908C3601E
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 04:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A81110E48A;
	Mon, 14 Apr 2025 04:53:52 +0000 (UTC)
Received: from f7756006eef8 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC29A10E48A;
 Mon, 14 Apr 2025 04:53:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Modify_drm_helpers_to_use?=
 =?utf-8?q?_luminance_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 04:53:50 -0000
Message-ID: <174460643096.17.9653588074850764185@f7756006eef8>
X-Patchwork-Hint: ignore
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-1-suraj.kandpal@intel.com>
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

Series: Modify drm helpers to use luminance (rev2)
URL   : https://patchwork.freedesktop.org/series/147565/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ca0287b05eae0c4bcdd7868080f25b020a180b6e
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Apr 14 09:46:37 2025 +0530

    drm/i915/backlight: Use drm_edp_backlight_enable
    
    Use drm dp helper to enable backlight now that it has been modified
    to set PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability
    supports it and the driver wants it. Remove the dead code.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch a2c9cfa67f8b676a78d18d572daebb04b38a8dc5 drm-intel
77e6537a6102 drm/dp: Introduce new member in drm_backlight_info
f30d09138a5e drm/dp: Add argument in drm_edp_backlight_init
a53955aef481 drm/dp: Add argument for luminance range info in drm_edp_backlight_init
22dbb6cc25cc drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
867f8519febe drm/dp: Change current_level argument type to u32
e40991a6beb6 drm/dp: Modify drm_edp_probe_state
ad2b907f21d5 drm/dp: Change argument type for drm_edp_backlight_set_level
6f75e64efb5f drm/dp: Modify drm_edp_backlight_set_level
dc0a9f924d73 drm/dp: Change argument type of drm_edp_backlight_enable
af5843882e9b drm/dp: Enable backlight control using luminance
05cee1a36671 drm/i915/backlight: Use drm helper to initialize edp backlight
a3eb237c7714 drm/i915/backlight: Use drm helper to set edp backlight
ca0287b05eae drm/i915/backlight: Use drm_edp_backlight_enable


