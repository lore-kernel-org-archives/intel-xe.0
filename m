Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA7CD37AB
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 19:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F3A10E0D4;
	Tue,  3 Sep 2024 19:22:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5D210E0D4;
 Tue,  3 Sep 2024 19:22:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_add_s?=
 =?utf-8?q?napshot_capture/print_infra?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 19:22:55 -0000
Message-ID: <172539137523.920385.148123972729268649@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725372032.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725372032.git.jani.nikula@intel.com>
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

Series: drm/i915/display: add snapshot capture/print infra
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
commit 5470bda738786beac28c1e7997f40e21d89989dd
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 3 17:03:00 2024 +0300

    drm/i915/display: move dmc snapshotting to new display snapshot
    
    Convert dmc error state printing to new snapshot capture/print division.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 7378077b0be32160022a73b7050b963d52364618 drm-intel
62bed4abc65d drm/i915: dump display parameters captured in error state, not current
-:34: WARNING:MACRO_ARG_UNUSED: Argument 'T' is not used in function-like macro
#34: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

-:34: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#34: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

-:34: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#34: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

total: 0 errors, 2 warnings, 1 checks, 52 lines checked
cdc9a4f738be drm/i915/display: add intel_display_snapshot abstraction
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:176: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#176: FILE: drivers/gpu/drm/i915/display/intel_overlay.h:54:
 }
+static inline struct intel_overlay_snapshot *

-:183: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#183: FILE: drivers/gpu/drm/i915/display/intel_overlay.h:59:
 }
+static inline void intel_overlay_snapshot_print(const struct intel_overlay_snapshot *error,

total: 0 errors, 1 warnings, 2 checks, 207 lines checked
1ac87318f16d drm/i915/display: move device info and params handling to snapshot
5470bda73878 drm/i915/display: move dmc snapshotting to new display snapshot


