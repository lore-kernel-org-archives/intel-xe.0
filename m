Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7AFCA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 20:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE1610E937;
	Wed,  3 Sep 2025 20:38:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8978210E937;
 Wed,  3 Sep 2025 20:38:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D/fbdev?=
 =?utf-8?q?=3A_refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 20:38:07 -0000
Message-ID: <175693188755.300637.8764414976473476235@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1756931441.git.jani.nikula@intel.com>
In-Reply-To: <cover.1756931441.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}/fbdev: refactor
URL   : https://patchwork.freedesktop.org/series/153981/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 805867efda2422bd16b3fad672467b4b09520730
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 3 23:32:06 2025 +0300

    drm/i915/fbdev: drop dependency on display in i915 specific code
    
    This code is in fact i915 driver core rather than display specific. Stop
    using struct intel_display, and drop the dependency on display headers.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 09933716bb37eda75f5b3562a76e58a17c447647 drm-intel
ddf9f846e5c4 drm/{i915, xe}/fbdev: pass struct drm_device to intel_fbdev_fb_alloc()
1673056d681d drm/{i915,xe}/fbdev: add intel_fbdev_fb_pitch_align()
-:33: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_fbdev_fb.c:38:
+	mode_cmd.pitches[0] = intel_fbdev_fb_pitch_align(mode_cmd.width * DIV_ROUND_UP(sizes->surface_bpp, 8));

-:80: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#80: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:39:
+	mode_cmd.pitches[0] = intel_fbdev_fb_pitch_align(mode_cmd.width * DIV_ROUND_UP(sizes->surface_bpp, 8));

total: 0 errors, 2 warnings, 0 checks, 55 lines checked
82649a108feb drm/{i915, xe}/fbdev: deduplicate struct drm_mode_fb_cmd2 init
-:30: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:220:
+	mode_cmd->pitches[0] = intel_fbdev_fb_pitch_align(mode_cmd->width * DIV_ROUND_UP(sizes->surface_bpp, 8));

total: 0 errors, 1 warnings, 0 checks, 158 lines checked
8c097d0d7e80 drm/i915/fbdev: abstract bo creation
6b9ef32cec6e drm/xe/fbdev: abstract bo creation
45fb8c5e6d7d drm/{i915,xe}/fbdev: add intel_fbdev_fb_bo_destroy()
a5a5268480ec drm/{i915,xe}/fbdev: deduplicate fbdev creation
99d3fba7de4d drm/{i915, xe}/fbdev: pass struct drm_device to intel_fbdev_fb_fill_info()
805867efda24 drm/i915/fbdev: drop dependency on display in i915 specific code


