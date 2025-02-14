Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F7CC021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 15:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3BA10E497;
	Fri, 14 Feb 2025 15:09:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDD310E497;
 Fri, 14 Feb 2025 15:09:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/ddi=3A_Fix/simpl?=
 =?utf-8?q?ify_port_enabling/disabling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 15:09:48 -0000
Message-ID: <173954578897.2070206.7755745184181621260@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214142001.552916-1-imre.deak@intel.com>
In-Reply-To: <20250214142001.552916-1-imre.deak@intel.com>
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

Series: drm/i915/ddi: Fix/simplify port enabling/disabling (rev2)
URL   : https://patchwork.freedesktop.org/series/144121/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2247bc9e0dcdc66fd475f330ddbf6eeac4b5d1ab
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Feb 14 16:20:01 2025 +0200

    drm/i915/ddi: Sanitize DDI_BUF_CTL register definitions
    
    Align the DDI_BUF_CTL register flag definitions with how this is done
    elsewhere.
    
    v2: Robustify macro calls with parens. (Jani)
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 57457d93f156d8b4bdff8d138127d81b8f97d8c9 drm-intel
a67e151699be drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
1d4ecf87a2ef drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#36: FILE: drivers/gpu/drm/i915/i915_reg.h:3642:
+#define  DDI_PORT_WIDTH(width)			(((width) == 3 ? 4 : ((width) - 1)) << 1)

total: 0 errors, 0 warnings, 1 checks, 16 lines checked
5c8f7a83aa1e drm/i915/ddi: Make all the PORT_WIDTH macros work the same way
-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#26: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:113:
+#define   XELPDP_PORT_WIDTH(width)			REG_FIELD_PREP(XELPDP_PORT_WIDTH_MASK, \
+								       ((width) == 3 ? 4 : (width) - 1))

-:27: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#27: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:114:
+								       ((width) == 3 ? 4 : (width) - 1))

total: 0 errors, 1 warnings, 1 checks, 51 lines checked
0f1f5eaacf6f drm/i915/ddi: Set missing TC DP PHY lane stagger delay in DDI_BUF_CTL
9093c1871e3a drm/i915/ddi: Simplify the port enabling via DDI_BUF_CTL
111a355ce423 drm/i915/ddi: Simplify the port disabling via DDI_BUF_CTL
8b7cf01f0c3e drm/i915/ddi: Simplify waiting for a port to get active/idle via DDI_BUF_CTL
c9bd26f1c1ac drm/i915/ddi: Move platform checks within mtl_ddi_enable/disable_d2d_link()
f96ad11fea30 drm/i915/ddi: Unify the platform specific functions disabling a port
a21e3e02a443 drm/i915/ddi: Add a helper to enable a port
2247bc9e0dcd drm/i915/ddi: Sanitize DDI_BUF_CTL register definitions
-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#50: FILE: drivers/gpu/drm/i915/i915_reg.h:3647:
+#define  DDI_PORT_WIDTH(width)			REG_FIELD_PREP(DDI_PORT_WIDTH_MASK, \
+							       ((width) == 3 ? 4 : (width) - 1))

total: 0 errors, 0 warnings, 1 checks, 39 lines checked


