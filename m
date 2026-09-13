Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1777C88E65
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF1F10E123;
	Sun, 13 Sep 2026 15:22:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59D10E11E;
 Sun, 13 Sep 2026 15:22:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Common_SD?=
 =?utf-8?q?P_Transmission_Line_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 13 Sep 2026 15:22:57 -0000
Message-ID: <178931297775.156646.7567751823965864464@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for Common SDP Transmission Line (rev6)
URL   : https://patchwork.freedesktop.org/series/162623/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a28301d91ba52c7270ba41210c9db2b5e0b03cb
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Sun Sep 13 20:26:48 2026 +0530

    drm/i915/display: Dump DIP Transmission lines
    
    Add DIP transmission lines to the CRTC state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch d0f49187686a810b5b83216805c07814ad7542dc drm-intel
8e356b844175 drm/i915/dip: Add new file to handle Data Island Packet hardware
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:115: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#115: FILE: drivers/gpu/drm/i915/display/intel_dip.h:32:
+#define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display) == 1401 || \
+					 DISPLAY_VER(__display) >= 20)

-:142: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#142: FILE: drivers/gpu/drm/i915/display/intel_dip_regs.h:15:
+#define   EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))

total: 0 errors, 2 warnings, 1 checks, 127 lines checked
a427a934f03e drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
042c75abb6f4 drm/i915/intel_dip: Add check for DP encoder
7bb642dbc268 drm/i915/dip: Add helper to get AS SDP Transmission Line
972b2909c42b drm/i915/display: Add crtc state for DIP transmission lines
eb451f8e22d7 drm/i915/dip: Store and use AS SDP transmission line from crtc state
4526ec7970a4 drm/i915/dip_regs: Add register definitions for common SDP Transmission Line
-:33: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_dip_regs.h:25:
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
e91bd45fa89a drm/i915/dip: Add HAS_COMMON_SDP_TL macro
79deac9e8b5d drm/i915/dip: Store SDP transmission lines in crtc_state
f3a17d77b217 drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
- Use HAS_COMMON_SDP_TL(display) instead of checking crtc_state->dip.cmn_sdp_tl,

total: 0 errors, 1 warnings, 0 checks, 72 lines checked
441be7690b74 drm/i915/dip: Enable Common SDP Transmission line
ddcf7fcb172c drm/i915/dp: Adjust SDP guardband requirement for CMN_SDP_TL
9a28301d91ba drm/i915/display: Dump DIP Transmission lines


