Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A6DC5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 16:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A7E10E247;
	Mon, 26 Aug 2024 16:38:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4427810E247;
 Mon, 26 Aug 2024 16:38:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_intel?=
 =?utf-8?q?=5Fdisplay=5Ftypes=2Eh_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 16:38:20 -0000
Message-ID: <172469030027.784925.12053509174808889344@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724689818.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724689818.git.jani.nikula@intel.com>
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

Series: drm/i915/display: intel_display_types.h cleanup
URL   : https://patchwork.freedesktop.org/series/137802/
State : warning

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
commit e971b906fa313b8bbd5d028c39c7170cafb33e46
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Aug 26 19:31:20 2024 +0300

    drm/i915/display: drop extra includes from intel_display_types.h
    
    Drop some unnecessary includes from intel_display_types.h.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ebf52522dc2395b7c809271ffdb908c9af876f4f drm-intel
2c1e96ff5929 drm/i915/wm: move struct intel_watermark_params to i9xx_wm.c
4ef42e605723 drm/i915/hdcp: split out intel_hdcp_shim.h for struct intel_hdcp_shim
-:183: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#183: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 297 lines checked
d75cb4840144 drm/i915/display: include drm/drm_probe_helper.h where needed
a5cb32681ec3 drm/i915/display: include drm/drm_vblank.h where needed
1d7d39bf2a46 drm/i915/display: include media/cec-notifier.h and linux/debugfs.h where needed
925de5d403a9 drm/i915/fb: hide the guts of intel_fb_obj()
e971b906fa31 drm/i915/display: drop extra includes from intel_display_types.h


