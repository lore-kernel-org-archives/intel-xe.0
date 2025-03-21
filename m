Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56FEC35FF3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 07:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FC310E0EC;
	Fri, 21 Mar 2025 07:40:51 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7618C10E0EC;
 Fri, 21 Mar 2025 07:40:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rsions_to_struct_intel=5Fdisplay_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 07:40:50 -0000
Message-ID: <174254285048.62656.13891602588497049777@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1742481923.git.jani.nikula@intel.com>
In-Reply-To: <cover.1742481923.git.jani.nikula@intel.com>
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

Series: drm/i915/display: conversions to struct intel_display (rev4)
URL   : https://patchwork.freedesktop.org/series/144749/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78dcf71186667ef36c668c6320d16015fd404bda
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Mar 20 16:46:05 2025 +0200

    drm/i915/display: rename I915_HAS_HOTPLUG() to HAS_HOTPLUG
    
    Most of the other display feature check macros are just
    HAS_<something>. Follow suit with hotplug check.
    
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a64b76313c595c2995d37dbb95c85cf83c16e49b drm-intel
61874bb89ee4 drm/i915/color: prefer display->platform.<platform> checks
474d9b4aaef2 drm/i915/connector: convert intel_connector.c to struct intel_display
d59f1fec406e drm/i915/hotplug: convert intel_hotplug.[ch] to struct intel_display
2f9248b43d58 drm/i915/hotplug: convert hotplug debugfs to struct intel_display
8d9f4a408d7a drm/i915/hotplug: convert hotplug irq handling to intel_de_*()
37becfe8c5e8 drm/i915/hotplug: convert intel_hotplug_irq.[ch] to struct intel_display
13c34327623e drm/i915/irq: convert intel_display_irq.[ch] interfaces to struct intel_display
-:861: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#861: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:74:
+void i915_pipestat_irq_handler(struct intel_display *display, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);

-:862: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#862: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:75:
+void i965_pipestat_irq_handler(struct intel_display *display, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);

total: 0 errors, 2 warnings, 0 checks, 1501 lines checked
977e7431c675 drm/i915/irq: convert rest of intel_display_irq.[ch] to struct intel_display
78dcf7118666 drm/i915/display: rename I915_HAS_HOTPLUG() to HAS_HOTPLUG


