Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D0F513E9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 00:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCE310EC95;
	Fri,  6 Mar 2026 00:49:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195D10EC95;
 Fri,  6 Mar 2026 00:49:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Common_SD?=
 =?utf-8?q?P_Transmission_Line?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 00:49:09 -0000
Message-ID: <177275814977.323631.11959602032441514036@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305040118.2576312-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260305040118.2576312-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for Common SDP Transmission Line
URL   : https://patchwork.freedesktop.org/series/162623/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fb42043545a8cc8faa911c6bed415c2a3ed81946
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Mar 5 09:31:18 2026 +0530

    drm/i915/dp: Enable Common SDP Transmission line
    
    Enable the Common SDP Transmission line for the SDP packets.
    We get the clear picture about the SDPs and guardband only in
    intel_dp_sdp_compute_config_late() therefore we must configure the
    crtc_state members related to Common SDP Transmission line at this
    point.
    
    Currently, the stagger values are set as per the default policy of the
    Hardware. This can be optimized later if we come up with a specific
    driver policy to sequence the SDPs better.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 79792a2fc5d37b5446e543f1de05158ab0f551c9 drm-intel
f3ade5be0855 drm/i915/nvl: Add register definitions for common SDP Transmission Line
-:30: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2133:
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
53d8d21e3ebd drm/i915/dp: Add fields to store CMN_SDP_TL register state in crtc_state
ff840611d6ef drm/i915/dp: Add helper for AS SDP TL and fix documentation
04ddead1c9e5 drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line
fb42043545a8 drm/i915/dp: Enable Common SDP Transmission line


