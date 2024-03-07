Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374D0C54E4A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 20:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957C91124AC;
	Thu,  7 Mar 2024 20:48:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312321124AC;
 Thu,  7 Mar 2024 20:48:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_debug_logging_impr?=
 =?utf-8?q?ovements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 20:48:24 -0000
Message-ID: <170984450420.595445.17980636366235930198@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709843865.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709843865.git.jani.nikula@intel.com>
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

Series: drm: debug logging improvements
URL   : https://patchwork.freedesktop.org/series/130879/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5c1cb2cba33b4dbf46673f7edc69d06fde211945
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Mar 7 22:39:38 2024 +0200

    drm/client: switch to drm device based logging, and more
    
    Switch to drm device based logging and WARNs, and unify connector and
    crtc logging formats. Pass drm device around a bit more to be able to do
    this.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c4dc92fb11528a7a09b66d2036d05c9742e45d50 drm-intel
e337d4f1a384 drm/modes: add drm_mode_print() to dump mode in drm_printer
ffd70ef651f1 drm/probe-helper: switch to drm device based logging
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:290:DP-5] probed modes :

total: 0 errors, 1 warnings, 0 checks, 78 lines checked
1ac9d4da1d7b drm/modes: switch drm_mode_prune_invalid() to use struct drm_printer
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
[drm:drm_mode_debug_printmodeline] Modeline "6144x3456": 60 1378800 6144 6192 6224 6464 3456 3459 3464 3555 0x48 0x9

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
b2374d3d26d1 drm/modes: switch to drm device based error logging
d62b5ada55ce drm/sysfs: switch to drm device based logging
5c1cb2cba33b drm/client: switch to drm device based logging, and more
-:327: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#327: FILE: drivers/gpu/drm/drm_client_modeset.c:875:
+			if (drm_WARN_ON_ONCE(dev, modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||

-:328: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#328: FILE: drivers/gpu/drm/drm_client_modeset.c:876:
+					     (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {

total: 0 errors, 2 warnings, 0 checks, 298 lines checked


