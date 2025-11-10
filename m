Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD665CCFA1A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 06:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE4510E049;
	Mon, 10 Nov 2025 06:26:18 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3C10E049;
 Mon, 10 Nov 2025 06:26:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/i915/ltphy=3A_Implement_HDMI_Algo_for_Pll_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Nov 2025 06:26:17 -0000
Message-ID: <176275597772.33974.11395666987236510327@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110061940.545183-1-suraj.kandpal@intel.com>
In-Reply-To: <20251110061940.545183-1-suraj.kandpal@intel.com>
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

Series: series starting with [v3,1/2] drm/i915/ltphy: Implement HDMI Algo for Pll state
URL   : https://patchwork.freedesktop.org/series/157300/
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
commit 7c5750ac60363403b7b1a8258b752f20b3144d0a
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Nov 10 11:49:41 2025 +0530

    drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorithm
    
    Return the lowest port clock for HDMI when the reverse algorithm
    calculates it to be 0 to avoid errors later but throw a warn.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 568f0845675b0c21185a5441e36c017e2bc095b4 drm-intel
2fe8df1b7d3c drm/i915/ltphy: Implement HDMI Algo for Pll state
-:208: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#208: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1539:
+#define DATA_ASSIGN(i, pll_reg)	\
+	do {			\
+		lt_state->data[i][0] = (u8)((((pll_reg).val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)((((pll_reg).val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)((((pll_reg).val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)((((pll_reg).val) & 0x000000FF));	\
+	} while (0)

-:208: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pll_reg' - possible side-effects?
#208: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1539:
+#define DATA_ASSIGN(i, pll_reg)	\
+	do {			\
+		lt_state->data[i][0] = (u8)((((pll_reg).val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)((((pll_reg).val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)((((pll_reg).val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)((((pll_reg).val) & 0x000000FF));	\
+	} while (0)

-:215: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#215: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1546:
+#define ADDR_ASSIGN(i, pll_reg)	\
+	do {			\
+		lt_state->addr_msb[i] = ((pll_reg).addr >> 8) & 0xFF;	\
+		lt_state->addr_lsb[i] = (pll_reg).addr & 0xFF;		\
+	} while (0)

-:215: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pll_reg' - possible side-effects?
#215: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1546:
+#define ADDR_ASSIGN(i, pll_reg)	\
+	do {			\
+		lt_state->addr_msb[i] = ((pll_reg).addr >> 8) & 0xFF;	\
+		lt_state->addr_lsb[i] = (pll_reg).addr & 0xFF;		\
+	} while (0)

-:421: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#421: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:89:
+#define PLL_REG_ADDR(base, pll_type)		((pll_type) ? (base) + PLL_TYPE_OFFSET : (base))

total: 0 errors, 0 warnings, 5 checks, 395 lines checked
7c5750ac6036 drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorithm


