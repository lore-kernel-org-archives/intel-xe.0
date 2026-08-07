Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6A4C2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 13:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CCB10F4BC;
	Fri,  7 Aug 2026 13:00:23 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD4710E41E;
 Fri,  7 Aug 2026 13:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Limit?=
 =?utf-8?q?_invalid_joiner_combinations_harder?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Aug 2026 13:00:22 -0000
Message-ID: <178610762289.29313.1682360884772917136@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1786105831.git.jani.nikula@intel.com>
In-Reply-To: <cover.1786105831.git.jani.nikula@intel.com>
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

Series: drm/i915/display: Limit invalid joiner combinations harder
URL   : https://patchwork.freedesktop.org/series/171796/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b340b587f0df8032240b70f56be49f14fa79f390
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Aug 7 15:34:07 2026 +0300

    drm/i915/debugfs: Reject invalid force_joined_pipes harder
    
    Reject invalid joiner forcing more thoroughly, taking into account
    whether bigjoiner or uncompressed joiner is available, and whether the
    requested number of pipes can actually be joined.
    
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 01d30c194951b8794c33f0d7f559bc4a1c9b7630 drm-intel
e8d23c0f1e12 drm/i915/display: Limit max joined dotclock on joiner pipes available
c1aef1efea71 drm/i915/dp: Limit for_each_joiner_candidate() on joiner pipes available
c81b9de9811d drm/i915/dp: Limit compute config joining to pipes that can actually join
-:33: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2929:
+		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))

-:48: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:774:
+		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))

total: 0 errors, 2 warnings, 0 checks, 27 lines checked
b340b587f0df drm/i915/debugfs: Reject invalid force_joined_pipes harder


