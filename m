Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D314BCCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 10:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8874210EA3D;
	Fri, 24 Oct 2025 10:27:01 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAD610EA32;
 Fri, 24 Oct 2025 10:27:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_LT_PHY_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 10:27:00 -0000
Message-ID: <176130162049.51052.4009530600610736402@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024100712.3776261-1-suraj.kandpal@intel.com>
In-Reply-To: <20251024100712.3776261-1-suraj.kandpal@intel.com>
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

Series: Enable LT PHY (rev2)
URL   : https://patchwork.freedesktop.org/series/155954/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit acc01453b5d14706bd1dbcf38282e813988ec675
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Oct 24 15:37:12 2025 +0530

    drm/i915/ltphy: Implement HDMI Algo for Pll state
    
    Implement the HDMI Algorithm to dynamically create LT PHY state
    based on the port clock provided.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch c840596036111afb71465977a49618cd19ca6e8b drm-intel
9c1ed446aa53 drm/i915/ltphy: Add LT Phy related VDR and Pipe Registers
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
d8645dbcfa92 drm/i915/cx0: Change register bit naming for powerdown values
6b0cb6a4a75d drm/i915/ltphy: Phy lane reset for LT Phy
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 255 lines checked
73601ab8071f drm/i915/cx0: Move the HDMI FRL function to intel_hdmi
c684aa47d619 drm/i915/ltphy: Program sequence for PORT_CLOCK_CTL for LT Phy
222d914dd7a3 drm/i915/ltphy: Add a wrapper for LT Phy powerdown change sequence
24fc8b51665c drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
fd4c8673b9a5 drm/i915/ltphy: Add LT Phy Programming recipe tables
812888e4b3c1 drm/i915/ltphy: Program the VDR PLL registers for LT PHY
85630f32d3ca drm/i915/ltphy: Update the ltpll config table value for eDP
249e0e03008c drm/i915/ltphy: Enable SSC during port clock programming
f2d855a8b138 drm/i915/ltphy: Add function to calculate LT PHY port clock
-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#40: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1245:
+#define REGVAL(i) (				\
+	(lt_state->data[i][3])		|	\
+	(lt_state->data[i][2] << 8)	|	\
+	(lt_state->data[i][1] << 16)	|	\
+	(lt_state->data[i][0] << 24)		\
+)

total: 0 errors, 0 warnings, 1 checks, 103 lines checked
604fabd6fcfe drm/i915/ltphy: Program the P2P Transaction flow for LT Phy
-:91: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__lane' - possible side-effects?
#91: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:23:
+#define for_each_lt_phy_lane_in_mask(__lane_mask, __lane) \
+	for ((__lane) = 0; (__lane) < 2; (__lane)++) \
+		for_each_if((__lane_mask) & BIT(__lane))

-:168: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#168: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1073:
+	udelay(150);

-:259: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#259: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:48:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_A, \

-:260: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#260: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:49:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_B, \

-:261: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#261: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:50:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC1, \

-:262: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#262: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:51:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC2) \

-:263: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#263: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:52:
+										 + 0x60 + (lane) * 0x4)

-:264: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#264: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:53:
+#define XE3PLPD_PORT_P2M_MSGBUS_STATUS_P2P(port, lane)	 _XE3PLPD_PORT_P2M_MSGBUS_STATUS_P2P(__xe2lpd_port_idx(port), \

total: 0 errors, 6 warnings, 2 checks, 223 lines checked
e2cd8faeaa25 drm/i915/ltphy: Program the rest of the PORT_CLOCK_CTL steps
d557ba8259ce drm/i915/ltphy: Program the rest of the LT Phy Enable sequence
26ba351f99ce drm/i915/ltphy: Program LT Phy Non-TBT PLL disable sequence
26750e5f4bee drm/i915/ltphy: Hook up LT Phy Enable & Disable sequences
a4dfb099a9e3 drm/i915/ddi: Define LT Phy Swing tables
155d1f0bde8c drm/i915/ltphy: Program LT Phy Voltage Swing
4925369bb7fe drm/i915/ltphy: Enable/Disable Tx after Non TBT Enable sequence
3c2ed7786b08 drm/i915/ltphy: Define the LT Phy state compare function
-:53: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#53: FILE: drivers/gpu/drm/i915/display/intel_display.c:5115:
+#define PIPE_CONF_CHECK_PLL_LT(name) do { \
+	if (!intel_lt_phy_pll_compare_hw_state(&current_config->name, \
+					       &pipe_config->name)) { \
+		pipe_config_lt_phy_pll_mismatch(&p, fastset, crtc, __stringify(name), \
+						&current_config->name, \
+						&pipe_config->name); \
+		ret = false; \
+	} \
+} while (0)

-:53: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'name' may be better as '(name)' to avoid precedence issues
#53: FILE: drivers/gpu/drm/i915/display/intel_display.c:5115:
+#define PIPE_CONF_CHECK_PLL_LT(name) do { \
+	if (!intel_lt_phy_pll_compare_hw_state(&current_config->name, \
+					       &pipe_config->name)) { \
+		pipe_config_lt_phy_pll_mismatch(&p, fastset, crtc, __stringify(name), \
+						&current_config->name, \
+						&pipe_config->name); \
+		ret = false; \
+	} \
+} while (0)

total: 0 errors, 0 warnings, 2 checks, 111 lines checked
86203bc70be2 drm/i915/ltphy: Define function to readout LT Phy PLL state
0dd0a249398b drm/i915/ltphy: Define LT PHY PLL state verify function
1859e71a2e3d drm/i915/display: Aux Enable and Display powerwell timeouts
0c764b3828d2 drm/i915/ltphy: Modify the step that need to be skipped
acc01453b5d1 drm/i915/ltphy: Implement HDMI Algo for Pll state
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1364:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1364:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1371:
+#define MULQ32_U32(x, y)	\
+	(((u64)((x) >> 32) * (y) << 32) + (u64)((x) & 0xFFFFFFFF) * (y))

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'y' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1371:
+#define MULQ32_U32(x, y)	\
+	(((u64)((x) >> 32) * (y) << 32) + (u64)((x) & 0xFFFFFFFF) * (y))

total: 0 errors, 0 warnings, 4 checks, 339 lines checked


