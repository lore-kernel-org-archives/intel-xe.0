Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD00ACCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 11:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF3F10EB7E;
	Fri, 31 Oct 2025 11:15:23 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740510EB56;
 Fri, 31 Oct 2025 11:15:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_LT_PHY_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 11:15:22 -0000
Message-ID: <176190932241.4698.16395623542118424431@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031103643.4147868-1-suraj.kandpal@intel.com>
In-Reply-To: <20251031103643.4147868-1-suraj.kandpal@intel.com>
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

Series: Enable LT PHY (rev3)
URL   : https://patchwork.freedesktop.org/series/155954/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d535b3a119becfd202c17cfe3ded4d140ed170cc
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Oct 31 16:06:43 2025 +0530

    drm/i915/ltphy: Modify the step that need to be skipped
    
    Bspec has changed the non tbt pll enable sequence now we skip
    steps 5-17 if no config change has occurred.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch faa2bfa5d5655c532cc4827c9c447ee014c64a9c drm-intel
ff4c9520dc27 drm/i915/ltphy: Add LT Phy related VDR and Pipe Registers
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
8f58dc72b746 drm/i915/cx0: Change register bit naming for powerdown values
5c8561e9eb7d drm/i915/ltphy: Phy lane reset for LT Phy
-:83: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#83: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 255 lines checked
eb237126ac9c drm/i915/cx0: Move the HDMI FRL function to intel_hdmi
10b1e996e4d7 drm/i915/ltphy: Program sequence for PORT_CLOCK_CTL for LT Phy
77153a11e09a drm/i915/ltphy: Add a wrapper for LT Phy powerdown change sequence
89e73e1a3b36 drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
260b64f2411e drm/i915/ltphy: Add LT Phy Programming recipe tables
707160464d0d drm/i915/ltphy: Program the VDR PLL registers for LT PHY
831e921c514a drm/i915/ltphy: Update the ltpll config table value for eDP
cf1e0f630f8d drm/i915/ltphy: Enable SSC during port clock programming
13591d132c76 drm/i915/ltphy: Add function to calculate LT PHY port clock
-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#40: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1242:
+#define REGVAL(i) (				\
+	(lt_state->data[i][3])		|	\
+	(lt_state->data[i][2] << 8)	|	\
+	(lt_state->data[i][1] << 16)	|	\
+	(lt_state->data[i][0] << 24)		\
+)

total: 0 errors, 0 warnings, 1 checks, 118 lines checked
29d0e3723ebc drm/i915/ltphy: Program the P2P Transaction flow for LT Phy
-:92: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__lane' - possible side-effects?
#92: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:23:
+#define for_each_lt_phy_lane_in_mask(__lane_mask, __lane) \
+	for ((__lane) = 0; (__lane) < 2; (__lane)++) \
+		for_each_if((__lane_mask) & BIT(__lane))

-:170: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#170: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1073:
+	udelay(150);

-:261: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#261: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:48:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_A, \

-:262: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#262: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:49:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_B, \

-:263: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#263: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:50:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC1, \

-:264: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#264: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:51:
+										 _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC2) \

-:265: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#265: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:52:
+										 + 0x60 + (lane) * 0x4)

-:266: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#266: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:53:
+#define XE3PLPD_PORT_P2M_MSGBUS_STATUS_P2P(port, lane)	 _XE3PLPD_PORT_P2M_MSGBUS_STATUS_P2P(__xe2lpd_port_idx(port), \

total: 0 errors, 6 warnings, 2 checks, 224 lines checked
8dca1403c8f0 drm/i915/ltphy: Program the rest of the PORT_CLOCK_CTL steps
98c9ccd10486 drm/i915/ltphy: Program the rest of the LT Phy Enable sequence
93ef1e74c5ae drm/i915/ltphy: Program LT Phy Non-TBT PLL disable sequence
b1bfd66fbe52 drm/i915/ltphy: Hook up LT Phy Enable & Disable sequences
10c2861e6b71 drm/i915/ddi: Define LT Phy Swing tables
f65e1b5072a2 drm/i915/ltphy: Program LT Phy Voltage Swing
71baffd6cc25 drm/i915/ltphy: Enable/Disable Tx after Non TBT Enable sequence
bb8acd47c01a drm/i915/ltphy: Define the LT Phy state compare function
-:53: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#53: FILE: drivers/gpu/drm/i915/display/intel_display.c:5148:
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
#53: FILE: drivers/gpu/drm/i915/display/intel_display.c:5148:
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
50d5f8d9dba3 drm/i915/ltphy: Define function to readout LT Phy PLL state
eeacf1de068f drm/i915/ltphy: Define LT PHY PLL state verify function
6e8b3fac75f0 drm/i915/display: Aux Enable and Display powerwell timeouts
d535b3a119be drm/i915/ltphy: Modify the step that need to be skipped


