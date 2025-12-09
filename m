Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D0D3B7F6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 21:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A82910E214;
	Tue,  9 Dec 2025 21:31:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B21410E214;
 Tue,  9 Dec 2025 21:31:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cx0=3A_Convert_C?=
 =?utf-8?q?10_PHY_PLL_SSC_state_mismatch_WARN_to_a_debug_message_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 21:31:22 -0000
Message-ID: <176531588217.71614.18070929046556343538@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205122902.1724498-1-imre.deak@intel.com>
In-Reply-To: <20251205122902.1724498-1-imre.deak@intel.com>
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

Series: drm/i915/cx0: Convert C10 PHY PLL SSC state mismatch WARN to a debug message (rev2)
URL   : https://patchwork.freedesktop.org/series/158574/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b987e62cdf109b1d71be1903b876565c47149676
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Dec 9 17:34:07 2025 +0200

    drm/i915/cx0: Convert C10 PHY PLL SSC state mismatch WARN to a debug message
    
    On C10 PHY PLLs the SSC is enabled by programming the
    XELPDP_PORT_CLOCK_CTL / XELPDP_SSC_ENABLE_PLLB flag and the
    PHY_C10_VDR_PLL 4..8 registers:
    
    - If SSC is enabled XELPDP_SSC_ENABLE_PLLB is set and the
      PHY_C10_VDR_PLL registers are programmed to non-zero values.
    - If SSC is disabled XELPDP_SSC_ENABLE_PLLB is cleared and the
      PHY_C10_VDR_PLL registers are programmed to zeroed-out values.
    
    The driver's state checker verifies if the above settings are consistent,
    i.e. if XELPDP_SSC_ENABLE_PLLB being set corresponds to the
    PHY_C10_VDR_PLL registers being zeroed-out or not.
    
    On WCL the BIOS programs non-zero values to the PHY_C10_VDR_PLL 4..8
    registers, but does not set the XELPDP_SSC_ENABLE_PLLB flag. This will
    trigger the following PLL state check warning during driver loading:
    
    <4>[   44.457809] xe 0000:00:02.0: [drm] PHY B: SSC enabled state (no), doesn't match PLL configuration (SSC-enabled)
    <4>[   44.457833] WARNING: CPU: 4 PID: 298 at drivers/gpu/drm/i915/display/intel_cx0_phy.c:2281 intel_cx0pll_readout_hw_state+0x221/0x620 [xe]
    
    It's not clear whether the HW uses the PHY_C10_VDR_PLL 4..8 register
    values if the XELPDP_SSC_ENABLE_PLLB flag is cleared, or just ignores
    them in this case. Since the driver always programs the register values
    according to the above, it still makes sense to verify that the
    programming happened correctly.
    
    To avoid the state check WARN during driver loading due to the way BIOS
    programs the registers, convert the WARN to a debug message.
    
    While at it clarify the debug message.
    
    v2: Clarify the debug message. (Jani)
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Mika Kahola <mika.kahola@intel.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 12271f632915efe0c5d4171b9c0e90f57ecdfe01 drm-intel
b987e62cdf10 drm/i915/cx0: Convert C10 PHY PLL SSC state mismatch WARN to a debug message
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
<4>[   44.457809] xe 0000:00:02.0: [drm] PHY B: SSC enabled state (no), doesn't match PLL configuration (SSC-enabled)

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


