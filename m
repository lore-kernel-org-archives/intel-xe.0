Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50652CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 08:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D3210ED90;
	Thu, 11 Jun 2026 08:37:49 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7FB10ED90;
 Thu, 11 Jun 2026 08:37:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Common_SD?=
 =?utf-8?q?P_Transmission_Line_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 08:37:48 -0000
Message-ID: <178116706863.68362.11288176724904860191@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for Common SDP Transmission Line (rev4)
URL   : https://patchwork.freedesktop.org/series/162623/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1b9c2a93acdaaf34761f7309644cfc55c7203b64
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Jun 11 13:03:14 2026 +0530

    drm/i915/display: Dump DIP Transmission lines
    
    Add DIP transmission lines to the CRTC state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 4fdfaadba04dc0f2f2490dbc91922caa290463a5 drm-intel
6aca4b79afb0 drm/i915/dip: Add new file to handle Data Island Packet hardware
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:114: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#114: FILE: drivers/gpu/drm/i915/display/intel_dip.h:32:
+#define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display) == 1401 || \
+					 DISPLAY_VER(__display) >= 20)

-:141: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#141: FILE: drivers/gpu/drm/i915/display/intel_dip_regs.h:15:
+#define   EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))

total: 0 errors, 2 warnings, 1 checks, 127 lines checked
4f2c8b810cbd drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
f7eaaa2e3b92 drm/i915/intel_dip: Add check for DP encoder
ba82be4681c9 drm/i915/dp: Add helper to get AS SDP Transmission Line
3802cf18d9df drm/i915/display: Add crtc state for DIP transmission lines
66b85a0290c3 drm/i915/dip: Store and use AS SDP transmission line from crtc state
35e4bc6d1ec5 drm/i915/nvl: Add register definitions for common SDP Transmission Line
-:32: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_dip_regs.h:25:
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
ee7440721d61 drm/i915/display: Add HAS_COMMON_SDP_TL macro
d1c61369416b drm/i915/dp: Store SDP transmission lines in crtc_state
46d16c521f9d drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line
c88405c74653 drm/i915/dip: Enable Common SDP Transmission line
1b9c2a93acda drm/i915/display: Dump DIP Transmission lines


