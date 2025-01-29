Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD1C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 22:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E971410E18E;
	Wed, 29 Jan 2025 22:17:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74710E18E;
 Wed, 29 Jan 2025 22:17:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/ddi=3A_Fix/simpl?=
 =?utf-8?q?ify_port_enabling/disabling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 22:17:03 -0000
Message-ID: <173818902377.2530294.13997465259159435744@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129200221.2508101-1-imre.deak@intel.com>
In-Reply-To: <20250129200221.2508101-1-imre.deak@intel.com>
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

Series: drm/i915/ddi: Fix/simplify port enabling/disabling
URL   : https://patchwork.freedesktop.org/series/144121/
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
commit b6df110be19d1c2f8b2d2ec28dfca7e820904138
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Jan 29 22:02:21 2025 +0200

    drm/i915/ddi: Unify the platform specific functions enabling a port
    
    The functions enabling a port (as part of link training) for MTL+ and
    earlier platforms only differ by extra steps on MTL+:
    - enable the D2D link
    - set the link parameters
    - configure the PORT_BUF_CTL1 register
    
    and an extra step on earlier platforms:
    - apply an ADLP TypeC workaround
    
    All the extra steps are already/can be skipped on unrelated platforms.
    Combine the two functions accounting for the above differences, removing
    the duplication.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch c2a5da40b8b1c5af77dcdabed8516069949fea3b drm-intel
a8c3c1461d93 drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
ab4660e32a28 drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3638:
+#define  DDI_PORT_WIDTH(width)			(((width) == 3 ? 4 : ((width) - 1)) << 1)

total: 0 errors, 0 warnings, 1 checks, 16 lines checked
938c705c7d6a drm/i915/ddi: Make all the PORT_WIDTH macros work the same way
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:113:
+#define   XELPDP_PORT_WIDTH(width)			REG_FIELD_PREP(XELPDP_PORT_WIDTH_MASK, \
+								       (width) == 3 ? 4 : (width) - 1)

-:24: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:114:
+								       (width) == 3 ? 4 : (width) - 1)

total: 0 errors, 1 warnings, 1 checks, 51 lines checked
b95885a215fe drm/i915/ddi: Set missing TC DP PHY lane stagger delay in DDI_BUF_CTL
fd2a3a278fe2 drm/i915/ddi: Simplify the port enabling via DDI_BUF_CTL
9dcb0f032c1e drm/i915/ddi: Simplify the port disabling via DDI_BUF_CTL
f91d17d4b596 drm/i915/ddi: Simplify waiting for a port to idle via DDI_BUF_CTL
a6e5925d5dc2 drm/i915/ddi: Move platform checks within mtl_ddi_enable/disable_d2d_link()
629d79f5d60b drm/i915/ddi: Unify the platform specific functions disabling a port
18f195295f02 drm/i915/ddi: Add a helper to enable a port
19dcc4208437 drm/i915/ddi: Sanitize DDI_BUF_CTL register definitions
-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#47: FILE: drivers/gpu/drm/i915/i915_reg.h:3643:
+#define  DDI_PORT_WIDTH(width)			REG_FIELD_PREP(DDI_PORT_WIDTH_MASK, \
+							       (width) == 3 ? 4 : (width) - 1)

total: 0 errors, 0 warnings, 1 checks, 39 lines checked
2bb82657efc4 drm/i915/ddi: Configure/enable a port in DDI_BUF_CTL via read-modify-write
b05e58d6df62 drm/i915/ddi: Factor out a helper to get DDI_BUF_CTL's config value
067064e69297 drm/i915/ddi: Reuse helper to compute the HDMI DDI_BUF_CTL config
652f2e4ecb9c drm/i915/ddi: Reuse helper to compute the HDMI PORT_BUF_CTL1 config
530f0bad7987 drm/i915/ddi: Move platform/encoder checks within adlp_tbt_to_dp_alt_switch_wa()
b6df110be19d drm/i915/ddi: Unify the platform specific functions enabling a port


