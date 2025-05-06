Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D73FC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 13:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F0B10E697;
	Tue,  6 May 2025 13:14:22 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0645110E691;
 Tue,  6 May 2025 13:14:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_irq=5Flock_re?=
 =?utf-8?q?factoring=2C_move_to_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 13:14:21 -0000
Message-ID: <174653726101.51226.12379793532044266724@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1746536745.git.jani.nikula@intel.com>
In-Reply-To: <cover.1746536745.git.jani.nikula@intel.com>
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

Series: drm/i915: irq_lock refactoring, move to display
URL   : https://patchwork.freedesktop.org/series/148637/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6e1a127291305b41eb4a6cf0c1f1ba1d205e7c23
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 6 16:06:50 2025 +0300

    drm/i915/irq: move i915->irq_lock to display->irq.lock
    
    Observe that i915->irq_lock is no longer used to protect anything
    outside of display. Make it a display thing.
    
    This allows us to remove the ugly #define irq_lock irq.lock hack from xe
    compat header.
    
    Note that this is slightly more subtle than it first looks. For i915,
    there's no functional change here. The lock is moved. However, for xe,
    we'll now have *two* locks, xe->irq.lock and display->irq.lock. These
    should protect different things, though. Indeed, nesting in the past
    would've lead to a deadlock because they were the same lock.
    
    With the i915 references gone, we can make a handful more files
    independent of i915_drv.h.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 9f365ea4cf81b0d81ad82903e5605894ca4aba98 drm-intel
0af28680f2fa drm/i915/irq: move locking inside vlv_display_irq_reset()
e10f1fcca39e drm/i915/irq: move locking inside valleyview_{enable, disable}_display_irqs()
dc95d845089a drm/i915/irq: move locking inside vlv_display_irq_postinstall()
fe96240a1509 drm/i915/irq: split out i915_display_irq_postinstall()
d5b5e7efa715 drm/i915/irq: split out i965_display_irq_postinstall()
5ea0118d752e drm/i915/irq: make i915_enable_asle_pipestat() static
362fac76ddfc drm/i915/rps: refactor display rps support
-:115: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#115: FILE: drivers/gpu/drm/i915/display/intel_display_rps.h:30:
+}
+static inline void intel_display_rps_mark_interactive(struct intel_display *display,

-:120: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#120: FILE: drivers/gpu/drm/i915/display/intel_display_rps.h:35:
+}
+static inline void ilk_display_rps_enable(struct intel_display *display)

-:123: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#123: FILE: drivers/gpu/drm/i915/display/intel_display_rps.h:38:
+}
+static inline void ilk_display_rps_disable(struct intel_display *display)

-:126: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#126: FILE: drivers/gpu/drm/i915/display/intel_display_rps.h:41:
+}
+static inline void ilk_display_rps_irq_handler(struct intel_display *display)

-:180: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#180: 
deleted file mode 100644

total: 0 errors, 1 warnings, 4 checks, 134 lines checked
6e1a12729130 drm/i915/irq: move i915->irq_lock to display->irq.lock


