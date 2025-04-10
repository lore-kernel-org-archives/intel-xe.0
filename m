Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1BFC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 10:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D8410E92F;
	Thu, 10 Apr 2025 10:41:28 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E07B10E92F;
 Thu, 10 Apr 2025 10:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_final?=
 =?utf-8?q?_=28=3F!=29_mass_conversions_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 10:41:27 -0000
Message-ID: <174428168764.55177.18265049919376557267@e6b6f09ec485>
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
commit e55767cfd628a98f780798e801bd95b7441b686a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 9 21:17:55 2025 +0300

    drm/xe/compat: clean up unused platform check macros
    
    Clean up unused platform check macros from compat i915_drv.h. Display no
    longer uses any of the IS_*() platform checks. The remaining users are
    part of the soc/ code. Note that in a comment.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch e74ca4100a9da8d41d1024e16165f7fe17f09427 drm-intel
632728823d55 drm/i915/fb: convert intel_fbdev.[ch] and intel_fbdev_fb.[ch] to struct intel_display
3a4929a1a12f drm/i915/display: convert intel_modeset_setup.[ch] to struct intel_display
44b8f30a71b9 drm/i915/display: convert intel_modeset_verify.c to struct intel_display
2920013ffc70 drm/i915/sprite: convert intel_sprite_uapi.c to struct intel_display
67af3f873f05 drm/i915/frontbuffer: convert intel_frontbuffer.[ch] to struct intel_display
3c3f3ace4086 drm/i915/crt: switch to display->platform based platform detection
6c64e9773c55 drm/i915/dmc: switch to display->platform based platform detection
a1a09c15aeec drm/i915/dp-aux: switch to display->platform based platform detection
8dcb0f1223f1 drm/i915/dpio: switch to display->platform based platform detection
05f7213bb213 drm/i915/gmbus: switch to display->platform based platform detection
e6c256084640 drm/i915/hdmi: switch to display->platform based platform detection
a2f3b8206509 drm/i915/display: switch to display->platform.dgfx from IS_DGFX()
4472d86a3cfd drm/i915/audio: don't set LPE audio irq chip data, it's unused
e55767cfd628 drm/xe/compat: clean up unused platform check macros


