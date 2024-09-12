Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11FEEED60D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 14:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834D110EBB0;
	Thu, 12 Sep 2024 14:42:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2166510EBAF;
 Thu, 12 Sep 2024 14:42:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_add_s?=
 =?utf-8?q?napshot_capture/print_infra_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 14:42:50 -0000
Message-ID: <172615217013.992292.7631512361660654618@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726151571.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726151571.git.jani.nikula@intel.com>
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

Series: drm/i915/display: add snapshot capture/print infra (rev4)
URL   : https://patchwork.freedesktop.org/series/138150/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ea330c62a0771551dec6ae75f7f3baff7e268edb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Sep 12 17:34:14 2024 +0300

    drm/i915/display: move dmc snapshotting to new display snapshot
    
    Convert dmc error state printing to new snapshot capture/print division.
    
    v2: Rebase
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 33996ab92ebe57dd8b2c984fa7d0b0e622b32a03 drm-intel
9460708dd8e2 drm/i915: dump display parameters captured in error state, not current
-:35: WARNING:MACRO_ARG_UNUSED: Argument 'T' is not used in function-like macro
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

-:35: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

-:35: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

total: 0 errors, 2 warnings, 1 checks, 52 lines checked
fd44c02f666c drm/i915/display: add intel_display_snapshot abstraction
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:198: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#198: FILE: drivers/gpu/drm/i915/display/intel_overlay.h:65:
 }
+static inline void intel_overlay_snapshot_print(const struct intel_overlay_snapshot *error,

total: 0 errors, 1 warnings, 1 checks, 217 lines checked
633296094035 drm/i915/display: move device info and params handling to snapshot
ea330c62a077 drm/i915/display: move dmc snapshotting to new display snapshot


