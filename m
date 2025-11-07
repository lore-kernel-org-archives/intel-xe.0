Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64831CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 10:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFAE10EA56;
	Fri,  7 Nov 2025 10:13:11 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE4A10EA56;
 Fri,  7 Nov 2025 10:13:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/i915/ltphy=3A_Implement_HDMI_Algo_for_Pll_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 10:13:09 -0000
Message-ID: <176251038919.28862.1272234928442227336@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107093512.533577-1-suraj.kandpal@intel.com>
In-Reply-To: <20251107093512.533577-1-suraj.kandpal@intel.com>
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

Series: series starting with [v2,1/2] drm/i915/ltphy: Implement HDMI Algo for Pll state
URL   : https://patchwork.freedesktop.org/series/157210/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6e5bd5d5636f5d3c2a342a0488ca2a33ee7eec96
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Nov 7 15:05:12 2025 +0530

    drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorithm
    
    Return the lowest port clock for HDMI when the reverse algorithm
    calculates it to be 0 to avoid errors later but throw a warn.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 1f25afd37c14352cd24ada205fe16ff022784bd4 drm-intel
ce31ed6ee7e6 drm/i915/ltphy: Implement HDMI Algo for Pll state
-:138: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#138: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1471:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

-:138: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#138: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1471:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

-:145: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#145: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1478:
+#define ADDR_ASSIGN(i, pll_reg)	\
+	do {			\
+		lt_state->addr_msb[i] = ((pll_reg).addr >> 8) & 0xFF;	\
+		lt_state->addr_lsb[i] = (pll_reg).addr & 0xFF;		\
+	} while (0)

-:145: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pll_reg' - possible side-effects?
#145: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1478:
+#define ADDR_ASSIGN(i, pll_reg)	\
+	do {			\
+		lt_state->addr_msb[i] = ((pll_reg).addr >> 8) & 0xFF;	\
+		lt_state->addr_lsb[i] = (pll_reg).addr & 0xFF;		\
+	} while (0)

-:396: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#396: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:90:
+#define PLL_REG_ADDR(base, pll_type)		((pll_type) ? (base) + PLL_TYPE_OFFSET : (base))

total: 0 errors, 0 warnings, 5 checks, 370 lines checked
6e5bd5d5636f drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorithm


