Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70183E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 19:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3395910E657;
	Tue, 17 Dec 2024 19:45:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17B410E657;
 Tue, 17 Dec 2024 19:45:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_UHBR_?=
 =?utf-8?q?rates_for_Thunderbolt_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 19:45:25 -0000
Message-ID: <173446472598.3958402.5203262034850224052@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217143440.572308-1-mika.kahola@intel.com>
In-Reply-To: <20241217143440.572308-1-mika.kahola@intel.com>
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

Series: drm/i915/display: UHBR rates for Thunderbolt (rev2)
URL   : https://patchwork.freedesktop.org/series/142649/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f226731d7e7cf100728a30f5bab8066997b74703
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Tue Dec 17 16:34:40 2024 +0200

    drm/i915/display: UHBR rates for Thunderbolt
    
    tbt-alt mode is missing uhbr rates 10G and 20G. This requires
    requires pll clock rates 312.5 MHz and 625 MHz to be added,
    respectively. The uhbr rates are supported only form PTL+
    platforms.
    
    v2: Add drm_WARN_ON() to check if port clock is not supported by
        the platform (Imre)
        Combine forward ungate with mask parameter (Imre)
        Rename XE3LPDP_* to XE3D_* (Imre)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 1984b26a25a506f3437f63fd201cec704b99336a drm-intel
f226731d7e7c drm/i915/display: UHBR rates for Thunderbolt
-:87: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3148:
+		val |= XE3D_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(display, crtc_state->port_clock));

-:90: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#90: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3151:
+		val |= XELPDP_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(display, crtc_state->port_clock));

-:112: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#112: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:197:
+#define   XE3D_DDI_CLOCK_SELECT(val)			REG_FIELD_PREP(XE3D_DDI_CLOCK_SELECT_MASK, val)

total: 0 errors, 3 warnings, 0 checks, 93 lines checked


