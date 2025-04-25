Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F260DC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 13:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0BD10E2AB;
	Fri, 25 Apr 2025 13:26:15 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CF310E2AB;
 Fri, 25 Apr 2025 13:26:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_refactor_VLV_?=
 =?utf-8?q?IOSF_SB_for_display_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 13:26:14 -0000
Message-ID: <174558757454.11389.6529976643684087528@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1745587049.git.jani.nikula@intel.com>
In-Reply-To: <cover.1745587049.git.jani.nikula@intel.com>
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

Series: drm/i915: refactor VLV IOSF SB for display usage
URL   : https://patchwork.freedesktop.org/series/148265/
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
commit 3b4fede966d66b770ce53aae10efa965a1578a35
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Apr 25 16:19:24 2025 +0300

    drm/i915: convert VLV IOSF SB interface to struct drm_device
    
    With users both in i915 core and display, struct drm_device is the
    common denominator for the VLV IOSF SB users. Also use drm_device for
    the helpers on the display side to keep the static inlines as simple as
    possible.
    
    We can drop a number of dependencies on i915_drv.h with this.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5c29806460a155cbfb176d48bd707cdf17bf259b drm-intel
731b8c34e590 drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
-:236: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#236: 
rename from drivers/gpu/drm/i915/vlv_sideband.c

total: 0 errors, 1 warnings, 0 checks, 207 lines checked
d25128b3d0d9 drm/i915: add generic read/write functions for VLV IOSF SB
-:70: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#70: FILE: drivers/gpu/drm/i915/vlv_iosf_sb.c:177:
+	if (drm_WARN_ONCE(&i915->drm, !port, "invalid unit %d\n", unit))
+	    return 0;

-:71: WARNING:TABSTOP: Statements should start on a tabstop
#71: FILE: drivers/gpu/drm/i915/vlv_iosf_sb.c:178:
+	    return 0;

-:86: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#86: FILE: drivers/gpu/drm/i915/vlv_iosf_sb.c:193:
+	if (drm_WARN_ONCE(&i915->drm, !port, "invalid unit %d\n", unit))
+	    return -EINVAL;

-:87: WARNING:TABSTOP: Statements should start on a tabstop
#87: FILE: drivers/gpu/drm/i915/vlv_iosf_sb.c:194:
+	    return -EINVAL;

-:146: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#146: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:31:
+static inline u32 vlv_iosf_sb_read(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr)

-:146: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#146: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:31:
 }
+static inline u32 vlv_iosf_sb_read(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr)

-:152: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#152: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:35:
+static inline int vlv_iosf_sb_write(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:152: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#152: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:35:
 }
+static inline int vlv_iosf_sb_write(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

total: 0 errors, 6 warnings, 2 checks, 130 lines checked
a1c540e118ed drm/i915: rewrite VLV IOSF SB unit specific read/write functions
242519bb0aa1 drm/i915: switch i915 core to generic VLV IOSF SB functions
0f99d65ae24a drm/i915: move VLV IOSF SB unit specific helpers under display
-:162: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#162: 
new file mode 100644

-:307: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#307: FILE: drivers/gpu/drm/i915/display/vlv_sideband.h:90:
+}
+static inline void vlv_dpio_write(struct drm_i915_private *i915,

total: 0 errors, 1 warnings, 1 checks, 599 lines checked
3b4fede966d6 drm/i915: convert VLV IOSF SB interface to struct drm_device
-:1827: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1827: FILE: drivers/gpu/drm/i915/display/vlv_sideband.h:90:
 }
+static inline void vlv_dpio_write(struct drm_device *drm,

-:2252: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2252: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:30:
 }
+static inline u32 vlv_iosf_sb_read(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr)

-:2257: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#2257: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:34:
+static inline int vlv_iosf_sb_write(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:2257: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2257: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:34:
 }
+static inline int vlv_iosf_sb_write(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:2262: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2262: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:38:
 }
+static inline void vlv_iosf_sb_put(struct drm_device *drm, unsigned long ports)

total: 0 errors, 1 warnings, 4 checks, 2084 lines checked


