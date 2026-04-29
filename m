Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982A0FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 12:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5828B10EFDC;
	Wed, 29 Apr 2026 12:14:17 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1378910EFDC;
 Wed, 29 Apr 2026 12:14:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_refactor_disp?=
 =?utf-8?q?lay_funcs=2C_add_display_irq_hooks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Apr 2026 12:14:16 -0000
Message-ID: <177746485607.24138.12371042788296452400@5ab824fced77>
X-Patchwork-Hint: ignore
References: <cover.1777458161.git.jani.nikula@intel.com>
In-Reply-To: <cover.1777458161.git.jani.nikula@intel.com>
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

Series: drm/i915: refactor display funcs, add display irq hooks
URL   : https://patchwork.freedesktop.org/series/165710/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5b39454654c4f162a593d6c08c4ddf71320c7db3
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 29 13:24:55 2026 +0300

    drm/i915/irq: add intel_display_irq_handler() to irq funcs
    
    Call the platform specific display irq handler hooks via
    intel_display_irq_handler(). Add master_ctl to struct
    intel_display_irq_state, and pass the state pointer to the handler where
    necessary.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 1db870ffb55b6414a78d7609ba7e08adf880dfc5 drm-intel
efdfe68ac66e drm/i915/display: move audio funcs under audio sub-struct
ed135fbba09a drm/i915/display: move color funcs under color sub-struct
59fc26e721b5 drm/i915/display: move fdi funcs under fdi sub-struct
4e9c8d59ea24 drm/i915/display: move watermark funcs under wm sub-struct
c1d30880ab53 drm/i915/display: move hotplug irq funcs under hotplug sub-struct
66e356137d8a drm/i915/display: move dpll funcs under dpll sub-struct
6a860fecd6e6 drm/i915/display: move cdclk funcs under cdclk sub-struct
81f753125b39 drm/i915/display: move display funcs under modeset sub-struct
c6eb9b9e70e1 drm/i915/irq: deduplicate dg1_de_irq_postinstall() and gen11_de_irq_postinstall()
5a2ba49577e7 drm/i915/irq: move VLV/CHV LPE irq handler call after irq acks
8b06b08a5762 drm/i915/irq: constify pipe stats parameters
-:53: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:81:
+void i915_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);

-:54: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:82:
+void i965_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);

-:55: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:83:
+void valleyview_pipestat_irq_handler(struct intel_display *display, const u32 pipe_stats[I915_MAX_PIPES]);

total: 0 errors, 3 warnings, 0 checks, 36 lines checked
2085541ee845 drm/i915/irq: add display irq funcs, start with intel_display_irq_reset()
a60a5e32ae71 drm/i915/irq: add intel_display_irq_postinstall() to irq funcs
df48e7e2e60d drm/i915/irq: add intel_display_irq_ack() to irq funcs
5b39454654c4 drm/i915/irq: add intel_display_irq_handler() to irq funcs
-:267: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#267: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:70:
+bool intel_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

total: 0 errors, 1 warnings, 0 checks, 357 lines checked


