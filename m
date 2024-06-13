Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DA2C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708BA10EAB4;
	Thu, 13 Jun 2024 15:10:42 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5E710EAB4;
 Thu, 13 Jun 2024 15:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dsc=3A_don=27t_m?=
 =?utf-8?q?ess_up_splitter_state_in_joiner_or_dsc_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 15:10:40 -0000
Message-ID: <171829144049.73458.17137058833807869995@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613150424.262567-1-jani.nikula@intel.com>
In-Reply-To: <20240613150424.262567-1-jani.nikula@intel.com>
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

Series: drm/i915/dsc: don't mess up splitter state in joiner or dsc config
URL   : https://patchwork.freedesktop.org/series/134826/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ea300fead2cca7ec4a19acc7dc79f9199de28ff8
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 13 18:04:24 2024 +0300

    drm/i915/dsc: don't mess up splitter state in joiner or dsc config
    
    The driver handles splitter (for MSO) and joiner/dsc configuration in
    different places. Avoid messing up the splitter state when
    enabling/disabling joiner or dsc.
    
    Note: We should probably handle splitter for MSO as well as dual-link
    DSI in intel_vdsc.c. Also, we have intel_uncompressed_joiner_enable()
    but no corresponding disable.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1668
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch da370b38472debe8f38360e3beb4483e13c3e7b3 drm-intel
ea300fead2cc drm/i915/dsc: don't mess up splitter state in joiner or dsc config
-:79: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#79: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:40:
+#define  SPLITTER_STATE				(SPLITTER_ENABLE | SPLITTER_CONFIGURATION_MASK | OVERLAP_PIXELS_MASK)

total: 0 errors, 1 warnings, 0 checks, 48 lines checked


