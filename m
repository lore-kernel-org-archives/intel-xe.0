Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A6ACD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C43112FC9;
	Mon,  1 Jun 2026 08:44:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CA8112FC9;
 Mon,  1 Jun 2026 08:43:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_harde?=
 =?utf-8?q?n_some_bit-shifting_operations_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 08:43:59 -0000
Message-ID: <178030343955.29600.3060943125844568703@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601081730.3146922-1-luciano.coelho@intel.com>
In-Reply-To: <20260601081730.3146922-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: harden some bit-shifting operations (rev4)
URL   : https://patchwork.freedesktop.org/series/166864/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9917261fbaff238429de06e0df29b3980c6950f9
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Mon Jun 1 11:14:35 2026 +0300

    drm/i915/display: remove unnecessary PHY_NONE definition
    
    PHY_NONE is not really used, but we define it and, thus, need to check
    for it in a few places we use phy.  The only potential places where
    phy may become PHY_NONE, is in intel_port_to_phy(), where it derives
    from port, which can be PORT_NONE.  Many of its callers don't check
    for PHY_NONE, which can cause unknown behavior.  Additionally, this
    can only happen if the encoder used has PORT_NONE, which should not be
    the case either, without unexpected consequences.
    
    Remove the PHY_NONE definition entirely and add a couple of WARNs at
    the relevant places, just to be sure.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 8133a9f4c4fd407e81df71530490836a1170bb2f drm-intel
6e3574055652 drm/i915/display: harden masks in HSW_AUD_PIN_ELD_CP_VLD macros
e498a54f7532 drm/i915/display: harden shifts in ICL_DPCLKA_CFGCR0_DDI_CLK_SEL macros
-:34: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'phy' may be better as '(phy)' to avoid precedence issues
#34: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2878:
+#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	_PICK(phy & 0x3, 0, 2, 4, 6)

-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'phy' - possible side-effects?
#35: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2879:
+#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy) \
+	REG_GENMASK(ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy) + 1, \
+		    ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

total: 0 errors, 0 warnings, 2 checks, 22 lines checked
af53bc500860 drm/i915/display: harden shift in intel_ddi_compute_config_late()
9917261fbaff drm/i915/display: remove unnecessary PHY_NONE definition


