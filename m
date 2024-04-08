Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F98C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 14:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35D4112447;
	Mon,  8 Apr 2024 14:14:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53ED11264D;
 Mon,  8 Apr 2024 14:14:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_debug_logging_impr?=
 =?utf-8?q?ovements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 14:14:46 -0000
Message-ID: <171258568674.1285472.7945677915524294472@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712568037.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712568037.git.jani.nikula@intel.com>
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

Series: drm: debug logging improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/130879/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fe4e0a0f95676fff47ba34cb2312e51337bcc05f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Apr 8 12:24:02 2024 +0300

    drm: prefer DRM_MODE_FMT/ARG over drm_mode_debug_printmodeline()
    
    We have DRM_MODE_FMT and DRM_MODE_ARG() macros to allow unified debug
    printing of modes in any printk-formatted logging. Prefer them over
    drm_mode_debug_printmodeline().
    
    This allows drm device specific logging of modes, in the right drm debug
    category, and inline with the rest of the logging instead of split to
    multiple lines.
    
    Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 5d058f536ececea21773ccaf527e2b74e5e99d01 drm-intel
9299ce0505ec drm/probe-helper: switch to drm device based logging
980f8580d8c1 drm/modes: switch to drm device based error logging
30d6c352449b drm/sysfs: switch to drm device based logging
2a521ebcff02 drm/client: switch to drm device based logging, and more
-:328: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#328: FILE: drivers/gpu/drm/drm_client_modeset.c:875:
+			if (drm_WARN_ON_ONCE(dev, modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||

-:329: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#329: FILE: drivers/gpu/drm/drm_client_modeset.c:876:
+					     (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {

total: 0 errors, 2 warnings, 0 checks, 298 lines checked
27ceaa597a9a drm/crtc: switch to drm device based logging
0ff12fa6095c drm/crtc-helper: switch to drm device based logging and warns
-:251: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#251: FILE: drivers/gpu/drm/drm_crtc_helper.c:785:
+				drm_dbg_kms(dev, "\t[CONNECTOR:%d:%s] set DPMS on\n", set->connectors[i]->base.id,

total: 0 errors, 1 warnings, 0 checks, 251 lines checked
fe4e0a0f9567 drm: prefer DRM_MODE_FMT/ARG over drm_mode_debug_printmodeline()
-:79: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#79: FILE: drivers/gpu/drm/drm_crtc_helper.c:769:
+			drm_dbg_kms(dev, "[CRTC:%d:%s] attempting to set mode from userspace: " DRM_MODE_FMT "\n",

-:118: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#118: FILE: drivers/gpu/drm/drm_modes.c:1816:
+					    DRM_MODE_ARG(mode), drm_get_mode_status_name(mode->status));

total: 0 errors, 2 warnings, 0 checks, 86 lines checked


