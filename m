Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DB4C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 15:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414D510E449;
	Mon, 12 May 2025 15:54:32 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A1210E449;
 Mon, 12 May 2025 15:54:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_refactor_VLV_?=
 =?utf-8?q?IOSF_SB_for_display_usage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 15:54:31 -0000
Message-ID: <174706527154.69697.10251390768573965297@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1747061743.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747061743.git.jani.nikula@intel.com>
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

Series: drm/i915: refactor VLV IOSF SB for display usage (rev3)
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
commit c3f8270e63256b643d104b5b1e22c64dc4ae0f8e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon May 12 17:56:59 2025 +0300

    drm/i915: ensure correct VLV IOSF SB units have been get/put
    
    Add some extra paranoia to check correct use of the VLV IOSF SB
    get/put/read/write.
    
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f3767db51c5d8bc3ba3f2b342332ab329044fe5b drm-intel
bc04035ddf43 drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
-:240: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#240: 
rename from drivers/gpu/drm/i915/vlv_sideband.c

total: 0 errors, 1 warnings, 0 checks, 207 lines checked
7744e6e53555 drm/i915: add generic read/write functions for VLV IOSF SB
-:152: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#152: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:31:
+static inline u32 vlv_iosf_sb_read(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr)

-:152: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#152: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:31:
 }
+static inline u32 vlv_iosf_sb_read(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr)

-:158: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#158: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:35:
+static inline int vlv_iosf_sb_write(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:158: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#158: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:35:
 }
+static inline int vlv_iosf_sb_write(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

total: 0 errors, 2 warnings, 2 checks, 130 lines checked
4430235b9af3 drm/i915: rewrite VLV IOSF SB unit specific read/write functions
ce74a5d54c05 drm/i915: switch i915 core to generic VLV IOSF SB functions
fb4c6df1eef8 drm/i915: move VLV IOSF SB unit specific helpers under display
-:168: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#168: 
new file mode 100644

-:313: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#313: FILE: drivers/gpu/drm/i915/display/vlv_sideband.h:90:
+}
+static inline void vlv_dpio_write(struct drm_i915_private *i915,

total: 0 errors, 1 warnings, 1 checks, 599 lines checked
09b3fd66a9e3 drm/i915: convert VLV IOSF SB interface to struct drm_device
-:1833: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1833: FILE: drivers/gpu/drm/i915/display/vlv_sideband.h:90:
 }
+static inline void vlv_dpio_write(struct drm_device *drm,

-:2258: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2258: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:30:
 }
+static inline u32 vlv_iosf_sb_read(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr)

-:2263: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#2263: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:34:
+static inline int vlv_iosf_sb_write(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:2263: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2263: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:34:
 }
+static inline int vlv_iosf_sb_write(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:2268: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2268: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:38:
 }
+static inline void vlv_iosf_sb_put(struct drm_device *drm, unsigned long ports)

total: 0 errors, 1 warnings, 4 checks, 2084 lines checked
eb05fca33738 drm/i915: rename VLV IOSF SB ports parameter to unit_mask
c3f8270e6325 drm/i915: ensure correct VLV IOSF SB units have been get/put


