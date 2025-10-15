Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86140CCD199
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495C810E8B6;
	Wed, 15 Oct 2025 18:20:06 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B637710E8B5;
 Wed, 15 Oct 2025 18:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?b?4pyXIENJLmNoZWNrcGF0Y2g6IHdhcm5pbmcgZm9yIGRybS97aTkxNSx4ZX0vZmJk?=
 =?utf-8?b?ZXY6IGFkZCBpbnRlbF9mYmRldl9mYl9waXRjaF9hbGlnbigp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 18:20:05 -0000
Message-ID: <176055240573.19094.1898516228923641998@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015111922.2194539-1-jani.nikula@intel.com>
In-Reply-To: <20251015111922.2194539-1-jani.nikula@intel.com>
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

Series: drm/{i915,xe}/fbdev: add intel_fbdev_fb_pitch_align()
URL   : https://patchwork.freedesktop.org/series/155982/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aaae8b0a8419e7016513a2e0999942abc803c10a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 15 14:19:22 2025 +0300

    drm/{i915,xe}/fbdev: add intel_fbdev_fb_pitch_align()
    
    For reasons still unknown, xe appears to require a stride alignment of
    XE_PAGE_SIZE, and using 64 leads to sporadic failures. Go back to having
    separate stride alignment for i915 and xe, until the issue is root
    caused.
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6220
    Fixes: 4a36b339a14a ("drm/xe/fbdev: use the same 64-byte stride alignment as i915")
    Link: https://lore.kernel.org/r/ae51d1e224048bdc87bf7a56d8f5ebd0fbb6a383.1756931441.git.jani.nikula@intel.com
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 69ca30df000b382e7657f300148be505083377f2 drm-intel
aaae8b0a8419 drm/{i915,xe}/fbdev: add intel_fbdev_fb_pitch_align()
-:30: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:221:
+	mode_cmd->pitches[0] = intel_fbdev_fb_pitch_align(mode_cmd->width * DIV_ROUND_UP(sizes->surface_bpp, 8));

total: 0 errors, 1 warnings, 0 checks, 45 lines checked


