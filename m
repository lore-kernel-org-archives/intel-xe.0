Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C64C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 04:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10F910EAC3;
	Fri, 11 Apr 2025 04:36:38 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04D210EAC3;
 Fri, 11 Apr 2025 04:36:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Modify_drm_helpers_to_use?=
 =?utf-8?q?_luminance?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 04:36:37 -0000
Message-ID: <174434619772.2540.9711039230078561165@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
In-Reply-To: <20250411042909.2626807-1-suraj.kandpal@intel.com>
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

Series: Modify drm helpers to use luminance
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
commit 7b90cc4d09526fdb742296d5665cc67be3001dfc
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Apr 11 09:59:09 2025 +0530

    drm/i915/backlight: Use drm_edp_backlight_enable
    
    Use drm dp helper to enable backlight now that it has been modified
    to set PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability
    supports it and the driver wants it. Remove the dead code.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 9337ad48531f5eff1b8eff235f667db490ac8c91 drm-intel
d92090aa07bd drm/dp: Introduce new member in drm_backlight_info
f1129dd2557f drm/dp: Add argument in drm_edp_backlight_init
9c2c4a058fc1 drm/dp: Add argument for luminance range info in drm_edp_backlight_init
d4401e46bea1 drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
44051aa9496f drm/dp: Change current_level argument type to u32
38bff81d56b2 drm/dp: Modify drm_edp_probe_state
7d81974d169e drm/dp: Change argument type for drm_edp_backlight_set_level
291d24eb3db2 drm/dp: Modify drm_edp_backlight_set_level
7f44c41d7a46 drm/dp: Change argument type of drm_edp_backlight_enable
b64cb4994e45 drm/dp: Enable backlight control using luminance
d91bdee8a31d drm/i915/backlight: Use drm helper to initialize edp backlight
9733c68f0c2f drm/i915/backlight: Use drm helper to set edp backlight
7b90cc4d0952 drm/i915/backlight: Use drm_edp_backlight_enable


