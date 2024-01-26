Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735D4C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 22:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC4C10FF9D;
	Fri, 26 Jan 2024 22:50:34 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8571910FF9D;
 Fri, 26 Jan 2024 22:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Move_?=
 =?utf-8?q?some_LNL_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 26 Jan 2024 22:50:32 -0000
Message-ID: <170630943254.764817.13670349456673351076@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126224638.4132016-1-lucas.demarchi@intel.com>
In-Reply-To: <20240126224638.4132016-1-lucas.demarchi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/display: Move some LNL registers
URL   : https://patchwork.freedesktop.org/series/129225/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 43ca18769860a6164e0e31eee4f5c85f3ff8256e
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jan 26 14:46:37 2024 -0800

    drm/i915/xe2lpd: Move registers to PICA
    
    Some registers for DDI A/B moved to PICA and now follow the same format
    as the ones for the PORT_TC ports. The wrapper here deals with 2 issues:
    
            - Share the implementation between xe2lpd and previous
              platforms: there are minor layout changes, it's mostly the
              register location that changed
            - Handle offsets after TC ports
    
    v2:
      - Explain better the trick to use just the second range (Matt Roper)
      - Add missing conversions after rebase (Matt Roper)
      - Use macro instead of inline function, avoiding includes in the
        header (Jani)
      - Prefix old macros with underscore so they don't get used by mistake,
        and name the new ones using the previous names
    v3: Use the same logic for the recently-introduced XELPDP_PORT_MSGBUS_TIMER
        (Gustavo)
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch eeedb1b4360b100e4fa15a9c5c968a8f5a8de7ed drm-intel
8b6224d8d drm/i915/xe2lpd: Move D2D enable/disable
-:87: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 23)
#87: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3345:
+		if (DISPLAY_VER(dev_priv) >= 20)
+		       buf_ctl |= XE2LPD_DDI_BUF_D2D_LINK_ENABLE;

total: 0 errors, 1 warnings, 0 checks, 80 lines checked
43ca18769 drm/i915/xe2lpd: Move registers to PICA
-:384: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#384: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:27:
+#define __xe2lpd_port_idx(port)						\
+	(port >= PORT_TC1 ? port : PORT_TC4 + 1 + port - PORT_A)

-:384: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'port' may be better as '(port)' to avoid precedence issues
#384: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:27:
+#define __xe2lpd_port_idx(port)						\
+	(port >= PORT_TC1 ? port : PORT_TC4 + 1 + port - PORT_A)

-:397: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#397: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:39:
+#define XELPDP_PORT_M2P_MSGBUS_CTL(i915__, port, lane)				\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_M2P_MSGBUS_CTL(__xe2lpd_port_idx(port), lane) :		\
+	 _XELPDP_PORT_M2P_MSGBUS_CTL(port, lane))

-:397: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'lane' - possible side-effects?
#397: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:39:
+#define XELPDP_PORT_M2P_MSGBUS_CTL(i915__, port, lane)				\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_M2P_MSGBUS_CTL(__xe2lpd_port_idx(port), lane) :		\
+	 _XELPDP_PORT_M2P_MSGBUS_CTL(port, lane))

-:415: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#415: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:59:
+#define XELPDP_PORT_P2M_MSGBUS_STATUS(i915__, port, lane)			\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_P2M_MSGBUS_STATUS(__xe2lpd_port_idx(port), lane) :	\
+	 _XELPDP_PORT_P2M_MSGBUS_STATUS(port, lane))

-:415: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'lane' - possible side-effects?
#415: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:59:
+#define XELPDP_PORT_P2M_MSGBUS_STATUS(i915__, port, lane)			\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_P2M_MSGBUS_STATUS(__xe2lpd_port_idx(port), lane) :	\
+	 _XELPDP_PORT_P2M_MSGBUS_STATUS(port, lane))

-:432: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#432: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:90:
+#define XELPDP_PORT_BUF_CTL1(i915__, port)					\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_BUF_CTL1(__xe2lpd_port_idx(port)) :			\
+	 _XELPDP_PORT_BUF_CTL1(port))

-:450: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#450: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:115:
+#define XELPDP_PORT_BUF_CTL2(i915__, port)					\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_BUF_CTL2(__xe2lpd_port_idx(port)) :			\
+	 _XELPDP_PORT_BUF_CTL2(port))

-:467: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#467: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:138:
+#define XELPDP_PORT_BUF_CTL3(i915__, port)					\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_BUF_CTL3(__xe2lpd_port_idx(port)) :			\
+	 _XELPDP_PORT_BUF_CTL3(port))

-:484: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#484: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:161:
+#define XELPDP_PORT_MSGBUS_TIMER(i915__, port, lane)				\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_MSGBUS_TIMER(__xe2lpd_port_idx(port), lane) :		\
+	 _XELPDP_PORT_MSGBUS_TIMER(port, lane))

-:484: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'lane' - possible side-effects?
#484: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:161:
+#define XELPDP_PORT_MSGBUS_TIMER(i915__, port, lane)				\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_MSGBUS_TIMER(__xe2lpd_port_idx(port), lane) :		\
+	 _XELPDP_PORT_MSGBUS_TIMER(port, lane))

-:501: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#501: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:178:
+#define XELPDP_PORT_CLOCK_CTL(i915__, port)					\
+	(DISPLAY_VER(i915__) >= 20 ?						\
+	 _XELPDP_PORT_CLOCK_CTL(__xe2lpd_port_idx(port)) :			\
+	 _XELPDP_PORT_CLOCK_CTL(port))

total: 0 errors, 0 warnings, 12 checks, 574 lines checked


