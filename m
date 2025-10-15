Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66304CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 04:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2929310E74B;
	Wed, 15 Oct 2025 04:22:04 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9510E73F;
 Wed, 15 Oct 2025 04:22:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_LT_PHY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 04:22:02 -0000
Message-ID: <176050212265.14406.10886372578262969832@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015040817.3431297-1-suraj.kandpal@intel.com>
In-Reply-To: <20251015040817.3431297-1-suraj.kandpal@intel.com>
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

Series: Enable LT PHY
URL   : https://patchwork.freedesktop.org/series/155954/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 538b63b073a20c64edcf306d7619eb74f96ee571
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Oct 15 09:38:17 2025 +0530

    drm/i915/ltphy: Implement HDMI Algo for Pll state
    
    Implement the HDMI Algorithm to dynamically create LT PHY state
    based on the port clock provided.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb drm-intel
b42665161ef4 drm/i915/ltphy: Add LT Phy related VDR and Pipe Registers
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
ca5a3eed9faa drm/i915/cx0: Change register bit naming for powerdown values
141cad4df386 drm/i915/ltphy: Phy lane reset for LT Phy
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 255 lines checked
32e341bc8c17 drm/i915/ltphy: Program sequence for PORT_CLOCK_CTL for LT Phy
fa6aa8e026e6 drm/i915/ltphy: Add a wrapper for LT Phy powerdown change sequence
586ae5f3eebd drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
e5a4a562ff43 drm/i915/ltphy: Add LT Phy Programming recipe tables
abf863cf8ab9 drm/i915/ltphy: Program the VDR PLL registers for LT PHY
4e20c036f784 drm/i915/ltphy: Update the ltpll config table value for eDP
5101d1f6ab2c drm/i915/ltphy: Enable SSC during port clock programming
2ba7aed6e698 drm/i915/ltphy: Add function to calculate LT PHY port clock
-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#40: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1244:
+#define REGVAL(i) (				\
+	(lt_state->data[i][3])		|	\
+	(lt_state->data[i][2] << 8)	|	\
+	(lt_state->data[i][1] << 16)	|	\
+	(lt_state->data[i][0] << 24)		\
+)

total: 0 errors, 0 warnings, 1 checks, 109 lines checked
d85f6c05355f drm/i915/ltphy: Program the P2P Transaction flow for LT Phy
-:91: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__lane' - possible side-effects?
#91: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:22:
+#define for_each_lt_phy_lane_in_mask(__lane_mask, __lane) \
+	for ((__lane) = 0; (__lane) < 2; (__lane)++) \
+		for_each_if((__lane_mask) & BIT(__lane))

-:167: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#167: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1071:
+	udelay(150);

-:258: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#258: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:51:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_A, \

-:259: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#259: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:52:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_B, \

-:260: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#260: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:53:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC1, \

-:261: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#261: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:54:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC2) \

-:262: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#262: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:55:
+										 + 0x60 + (lane) * 0x4)

-:263: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#263: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:56:
+#define XE3PLPD_PORT_P2M_MSGBUS_STATUS_P2P(port, lane)	 _XE3PLPD_PORT_P2M_MSGBUS_STATUS_P2P(__xe2lpd_port_idx(port), \

total: 0 errors, 6 warnings, 2 checks, 222 lines checked
467948560db9 drm/i915/ltphy: Program the rest of the PORT_CLOCK_CTL steps
10605e3e945e drm/i915/ltphy: Program the rest of the LT Phy Enable sequence
72d440c3f1e0 drm/i915/ltphy: Program LT Phy Non-TBT PLL disable sequence
6c75c1fc9141 drm/i915/ltphy: Hook up LT Phy Enable & Disable sequences
0000b57e505a drm/i915/ddi: Define LT Phy Swing tables
dfbbd574527f drm/i915/ltphy: Program LT Phy Voltage Swing
83cc06c167b2 drm/i915/ltphy: Enable/Disable Tx after Non TBT Enable sequence
e21ffd93b8e4 drm/i915/ltphy: Define the LT Phy state compare function
-:52: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#52: FILE: drivers/gpu/drm/i915/display/intel_display.c:5109:
+#define PIPE_CONF_CHECK_PLL_LT(name) do { \
+	if (!intel_lt_phy_pll_compare_hw_state(&current_config->name, \
+					       &pipe_config->name)) { \
+		pipe_config_lt_phy_pll_mismatch(&p, fastset, crtc, __stringify(name), \
+						&current_config->name, \
+						&pipe_config->name); \
+		ret = false; \
+	} \
+} while (0)

-:52: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'name' may be better as '(name)' to avoid precedence issues
#52: FILE: drivers/gpu/drm/i915/display/intel_display.c:5109:
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
56140e7f1b08 drm/i915/ltphy: Define function to readout LT Phy PLL state
bf377842dc72 drm/i915/ltphy: Define LT PHY PLL state verify function
027b7b82ae30 drm/i915/display: Aux Enable and Display powerwell timeouts
dd038b2eaf40 drm/i915/ltphy: Modify the step that need to by skipped
538b63b073a2 drm/i915/ltphy: Implement HDMI Algo for Pll state
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1362:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1362:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1369:
+#define MULQ32_U32(x, y)	\
+	(((u64)((x) >> 32) * (y) << 32) + (u64)((x) & 0xFFFFFFFF) * (y))

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'y' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1369:
+#define MULQ32_U32(x, y)	\
+	(((u64)((x) >> 32) * (y) << 32) + (u64)((x) & 0xFFFFFFFF) * (y))

total: 0 errors, 0 warnings, 4 checks, 339 lines checked


