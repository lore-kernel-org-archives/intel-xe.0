Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B9110A1E63
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 09:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188EA10E28D;
	Fri, 27 Mar 2026 09:40:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D210510E28D;
 Fri, 27 Mar 2026 09:40:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/lt=5Fphy=3A_Buil?=
 =?utf-8?q?d_HDMI_VDR_config_from_fields_and_use_VDR=5FNUM=5FREGISTERS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 09:40:50 -0000
Message-ID: <177460445083.405318.11173317280304114913@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327093531.1203339-1-mika.kahola@intel.com>
In-Reply-To: <20260327093531.1203339-1-mika.kahola@intel.com>
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

Series: drm/i915/lt_phy: Build HDMI VDR config from fields and use VDR_NUM_REGISTERS
URL   : https://patchwork.freedesktop.org/series/163975/
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
commit 88e845c3515f665fad6ddba9e0f1d17d9ab74227
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Fri Mar 27 09:35:31 2026 +0000

    drm/i915/lt_phy: Build HDMI VDR config from fields and use VDR_NUM_REGISTERS
    
    Stop hardcoding LT PHY VDR configuration register values for HDMI.
    Build VDR config[0] from the mode and (for FRL) the FRL rate encoding,
    and select DP PLL vs USB PLL programming (FRL10G uses USB PLL,
    so don’t set DP_PLL_ENABLE). Also build VDR config[1] from the PLL recipe
    bit and the number-of-registers field.
    
    Make intel_lt_phy_calculate_hdmi_state() static and pass
    struct intel_display for debug logging.
    
    Replace the hardcoded <= 12 (13-entry) VDR register loops with a shared
    constant (VDR_NUM_REGISTERS, 13 VDR entries) when programming, reading out
    and dumping LT PHY VDR state. Also remove a stray blank line at the end of
    intel_xe3plpd_pll_disable().
    
    BSpec:74667
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch a748e8ef327c92c865410957509417b30f026304 drm-intel
88e845c3515f drm/i915/lt_phy: Build HDMI VDR config from fields and use VDR_NUM_REGISTERS
-:116: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#116: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1673:
+	lt_state->config[1] = LT_PHY_VDR_PLL_RECIPE | LT_PHY_VDR_NUMBER_OF_REGISTERS(VDR_NUM_REGISTERS);

-:201: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#201: FILE: drivers/gpu/drm/i915/display/intel_lt_phy_regs.h:46:
+#define  LT_PHY_VDR_NUMBER_OF_REGISTERS(val)	REG_FIELD_PREP8(LT_PHY_VDR_NUMBER_OF_REGISTERS_MASK, val)

total: 0 errors, 2 warnings, 0 checks, 154 lines checked


