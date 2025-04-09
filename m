Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C92C36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 18:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8694C10E762;
	Wed,  9 Apr 2025 18:27:30 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB46510E765;
 Wed,  9 Apr 2025 18:27:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_final?=
 =?utf-8?q?_=28=3F!=29_mass_conversions_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 18:27:29 -0000
Message-ID: <174422324982.53969.5814235381792471948@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744222449.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744222449.git.jani.nikula@intel.com>
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

Series: drm/i915/display: final (?!) mass conversions to struct intel_display
URL   : https://patchwork.freedesktop.org/series/147489/
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
commit fc9f79c49490cbe4e1cf47a604f4f42abfaaeb57
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 9 21:17:55 2025 +0300

    drm/xe/compat: clean up unused platform check macros
    
    Clean up unused platform check macros from compat i915_drv.h. Display no
    longer uses any of the IS_*() platform checks. The remaining users are
    part of the soc/ code. Note that in a comment.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ef33117e4583fab700ac35903cf68dd5309fa947 drm-intel
8e1c00bad22a drm/i915/fb: convert intel_fbdev.[ch] and intel_fbdev_fb.[ch] to struct intel_display
c3d5f34d9911 drm/i915/display: convert intel_modeset_setup.[ch] to struct intel_display
81a94947128b drm/i915/display: convert intel_modeset_verify.c to struct intel_display
f91e1549b6be drm/i915/sprite: convert intel_sprite_uapi.c to struct intel_display
ba625aedcb28 drm/i915/frontbuffer: convert intel_frontbuffer.[ch] to struct intel_display
e6c8b9c6ef62 drm/i915/crt: switch to display->platform based platform detection
1d73f7640ca5 drm/i915/dmc: switch to display->platform based platform detection
a1ef409c2bc7 drm/i915/dp-aux: switch to display->platform based platform detection
820f65bdbac3 drm/i915/dpio: switch to display->platform based platform detection
9490698bd704 drm/i915/gmbus: switch to display->platform based platform detection
cbd2aedd32d2 drm/i915/hdmi: switch to display->platform based platform detection
65680766739c drm/i915/display: switch to display->platform.dgfx from IS_DGFX()
3ec49a8996c5 drm/i915/audio: don't set LPE audio irq chip data, it's unused
fc9f79c49490 drm/xe/compat: clean up unused platform check macros


