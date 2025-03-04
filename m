Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825AFC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 11:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16289D99;
	Tue,  4 Mar 2025 11:18:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E44E10E30F;
 Tue,  4 Mar 2025 11:18:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rt_intel=5Fdisplay=2E=5Bch=5D_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 11:18:03 -0000
Message-ID: <174108708311.536516.2864060061157821560@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1741084010.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741084010.git.jani.nikula@intel.com>
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

Series: drm/i915/display: convert intel_display.[ch] to struct intel_display
URL   : https://patchwork.freedesktop.org/series/145758/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 122df7c820fffe22a84c76f3694f5f9ca6044049
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Mar 4 12:27:34 2025 +0200

    drm/i915/display: convert intel_display.c to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert as much as possible of intel_display.c to struct
    intel_display.
    
    This exposes a couple of outside issues that need to be fixed as well,
    in a register macro and a DSI PLL stub.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 1cf56e26a93292ca26fbf891368b75a67e8700dc drm-intel
0911149bdc16 drm/i915/display: convert various port/phy helpers to struct intel_display
6630c36ce754 drm/i915/display: convert some intel_display.[ch] functions to struct intel_display
-:90: CHECK:CAMELCASE: Avoid CamelCase: <ILK_eDP_A_DISABLE>
#90: FILE: drivers/gpu/drm/i915/display/intel_display.c:7649:
+	if (display->platform.ironlake && (intel_de_read(display, FUSE_STRAP) & ILK_eDP_A_DISABLE))

total: 0 errors, 0 warnings, 1 checks, 421 lines checked
c9a779693ea7 drm/i915/display: convert intel_has_pending_fb_unpin() to struct intel_display
a58c920be408 drm/i915/display: remove dupe intel_update_watermarks() declaration
122df7c820ff drm/i915/display: convert intel_display.c to struct intel_display
-:948: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#948: FILE: drivers/gpu/drm/i915/display/intel_display.c:2801:
+				     TRANSCONF(display, cpu_transcoder)) & TRANSCONF_INTERLACE_MASK_HSW;

total: 0 errors, 1 warnings, 0 checks, 2718 lines checked


