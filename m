Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF2C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 20:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B846510E694;
	Tue, 11 Mar 2025 20:20:30 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF7D10E239;
 Tue, 11 Mar 2025 20:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rsions_to_struct_intel=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 20:20:29 -0000
Message-ID: <174172442944.21707.16330928874516879300@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1741715981.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741715981.git.jani.nikula@intel.com>
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

Series: drm/i915/display: conversions to struct intel_display (rev2)
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
commit 95ea6912f96bd7b1efb657cace13a571700d03c6
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Mar 11 20:00:43 2025 +0200

    drm/i915/display: rename I915_HAS_HOTPLUG() to HAS_HOTPLUG
    
    Most of the other display feature check macros are just
    HAS_<something>. Follow suit with hotplug check.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch eb17816e52395a403aa0b447aa0befa9d2f86dd5 drm-intel
04b55f2c5ee1 drm/i915/color: prefer display->platform.<platform> checks
4326cffc63c2 drm/i915/connector: convert intel_connector.c to struct intel_display
432f7da0d64c drm/i915/hotplug: convert intel_hotplug.[ch] to struct intel_display
ab071cbd4557 drm/i915/hotplug: convert hotplug debugfs to struct intel_display
6aa75fe2a6a3 drm/i915/hotplug: convert hotplug irq handling to intel_de_*()
84217c72e315 drm/i915/hotplug: convert intel_hotplug_irq.[ch] to struct intel_display
3249dabeb621 drm/i915/irq: convert intel_display_irq.[ch] interfaces to struct intel_display
-:856: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#856: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:74:
+void i915_pipestat_irq_handler(struct intel_display *display, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);

-:857: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#857: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:75:
+void i965_pipestat_irq_handler(struct intel_display *display, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);

total: 0 errors, 2 warnings, 0 checks, 1501 lines checked
d672131db400 drm/i915/irq: convert rest of intel_display_irq.[ch] to struct intel_display
95ea6912f96b drm/i915/display: rename I915_HAS_HOTPLUG() to HAS_HOTPLUG


