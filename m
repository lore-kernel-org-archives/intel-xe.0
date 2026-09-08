Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA4AC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AAD10EA32;
	Tue,  8 Sep 2026 06:57:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9160B10EA02;
 Tue,  8 Sep 2026 06:57:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Common_SD?=
 =?utf-8?q?P_Transmission_Line_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 06:57:04 -0000
Message-ID: <178885062459.132776.9902060296403911831@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for Common SDP Transmission Line (rev5)
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
commit afcd549c2b95f878b8c0744d0ba7ed415c6ffb20
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Sep 8 11:52:23 2026 +0530

    drm/i915/display: Dump DIP Transmission lines
    
    Add DIP transmission lines to the CRTC state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 1b610f06b6cdafb64a8f1743390944a30f37b4db drm-intel
6db98c96213a drm/i915/dip: Add new file to handle Data Island Packet hardware
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
ec88f9f2dd86 drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
5a93df8303e8 drm/i915/intel_dip: Add check for DP encoder
b17c96022b5c drm/i915/dip: Add helper to get AS SDP Transmission Line
174395e2de75 drm/i915/display: Add crtc state for DIP transmission lines
f2b71f2208aa drm/i915/dip: Store and use AS SDP transmission line from crtc state
c58b88bba517 drm/i915/dip_regs: Add register definitions for common SDP Transmission Line
-:32: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_dip_regs.h:25:
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
d02c55511a48 drm/i915/dip: Add HAS_COMMON_SDP_TL macro
2114c685bb86 drm/i915/dip: Store SDP transmission lines in crtc_state
6efcfbc9a5ed drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line
443eed2d92cf drm/i915/dip: Enable Common SDP Transmission line
afcd549c2b95 drm/i915/display: Dump DIP Transmission lines


