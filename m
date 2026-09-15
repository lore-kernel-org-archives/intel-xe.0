Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10953C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40B110ED1B;
	Tue, 15 Sep 2026 17:31:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD7310E96B;
 Tue, 15 Sep 2026 17:31:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Common_SD?=
 =?utf-8?q?P_Transmission_Line_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Sep 2026 17:31:04 -0000
Message-ID: <178949346425.166934.872521614793045651@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for Common SDP Transmission Line (rev7)
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
commit b91996d8ac496cca7bbe93b7f9305bf3614856cd
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Sep 15 22:16:55 2026 +0530

    drm/i915/display: Dump DIP Transmission lines
    
    Add DIP transmission lines to the CRTC state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 drm-intel
e9e21f968703 drm/i915/dip: Add new file to handle Data Island Packet hardware
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:115: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#115: FILE: drivers/gpu/drm/i915/display/intel_dip.h:32:
+#define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display) == 1401 || \
+					 DISPLAY_VER(__display) >= 20)

total: 0 errors, 1 warnings, 1 checks, 128 lines checked
d74f316515fa drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
e9d5fcf6fb96 drm/i915/intel_dip: Add check for DP encoder
031f4f54c5d5 drm/i915/dip: Add helper to get AS SDP Transmission Line
5d797e1ce718 drm/i915/display: Add crtc state for DIP transmission lines
b97913e0991e drm/i915/dip: Store and use AS SDP transmission line from crtc state
9a1b18b08311 drm/i915/dip_regs: Add register definitions for common SDP Transmission Line
58c41e3f3597 drm/i915/dip: Add HAS_COMMON_SDP_TL macro
691b99257ac6 drm/i915/dip: Store SDP transmission lines in crtc_state
686cae1e3b7a drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line
9c8cc22e6d15 drm/i915/dip: Enable Common SDP Transmission line
1de9816f582b drm/i915/dp: Account VSC SDP in min guardband
a2077e42a734 drm/i915/dp: Adjust SDP guardband requirement for CMN_SDP_TL
b91996d8ac49 drm/i915/display: Dump DIP Transmission lines


