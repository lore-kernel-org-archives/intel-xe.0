Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F47DC3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 10:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7F910E1F0;
	Thu,  8 May 2025 10:10:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C070410E1F0;
 Thu,  8 May 2025 10:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_refactor_VLV_?=
 =?utf-8?q?IOSF_SB_for_display_usage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 May 2025 10:10:11 -0000
Message-ID: <174669901178.59073.10394359973080824503@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1746698410.git.jani.nikula@intel.com>
In-Reply-To: <cover.1746698410.git.jani.nikula@intel.com>
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

Series: drm/i915: refactor VLV IOSF SB for display usage (rev2)
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
commit ed0c89c303763ef4980790cdca1c76440eb35c35
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu May 8 13:03:42 2025 +0300

    drm/i915: ensure correct VLV IOSF SB units have been get/put
    
    Add some extra paranoia to check correct use of the VLV IOSF SB
    get/put/read/write.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ca0305cadc2d34c8887b891b96226af17571b2a3 drm-intel
113a2c1dc7b9 drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
-:236: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#236: 
rename from drivers/gpu/drm/i915/vlv_sideband.c

total: 0 errors, 1 warnings, 0 checks, 207 lines checked
45ddaca768d5 drm/i915: add generic read/write functions for VLV IOSF SB
-:148: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#148: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:31:
+static inline u32 vlv_iosf_sb_read(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr)

-:148: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#148: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:31:
 }
+static inline u32 vlv_iosf_sb_read(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr)

-:154: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#154: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:35:
+static inline int vlv_iosf_sb_write(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:154: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#154: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:35:
 }
+static inline int vlv_iosf_sb_write(struct drm_i915_private *i915, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

total: 0 errors, 2 warnings, 2 checks, 130 lines checked
3b016ed40fc2 drm/i915: rewrite VLV IOSF SB unit specific read/write functions
ea2dd2a7084f drm/i915: switch i915 core to generic VLV IOSF SB functions
b1e295400ccb drm/i915: move VLV IOSF SB unit specific helpers under display
-:162: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#162: 
new file mode 100644

-:307: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#307: FILE: drivers/gpu/drm/i915/display/vlv_sideband.h:90:
+}
+static inline void vlv_dpio_write(struct drm_i915_private *i915,

total: 0 errors, 1 warnings, 1 checks, 599 lines checked
dc55478a4444 drm/i915: convert VLV IOSF SB interface to struct drm_device
-:1829: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1829: FILE: drivers/gpu/drm/i915/display/vlv_sideband.h:90:
 }
+static inline void vlv_dpio_write(struct drm_device *drm,

-:2254: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2254: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:30:
 }
+static inline u32 vlv_iosf_sb_read(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr)

-:2259: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#2259: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:34:
+static inline int vlv_iosf_sb_write(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:2259: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2259: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:34:
 }
+static inline int vlv_iosf_sb_write(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr, u32 val)

-:2264: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2264: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h:38:
 }
+static inline void vlv_iosf_sb_put(struct drm_device *drm, unsigned long ports)

total: 0 errors, 1 warnings, 4 checks, 2084 lines checked
172a6661545f drm/i915: rename VLV IOSF SB ports parameter to unit_mask
ed0c89c30376 drm/i915: ensure correct VLV IOSF SB units have been get/put


