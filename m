Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17952CD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 11:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBF710E069;
	Tue, 19 May 2026 11:36:12 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10FF10E069;
 Tue, 19 May 2026 11:36:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_harde?=
 =?utf-8?q?n_some_bit-shifting_operations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 May 2026 11:36:10 -0000
Message-ID: <177919057098.85932.13770781153343286350@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519112243.1454375-1-luciano.coelho@intel.com>
In-Reply-To: <20260519112243.1454375-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: harden some bit-shifting operations
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
commit 3d79886c7e3875985266b50f85893790ddb67d15
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Tue May 19 14:11:16 2026 +0300

    drm/i915/display: harden shift in intel_pmdemand_update_phys_mask()
    
    BIT() takes a non-negative shift amount, but phy is of type enum phy,
    which can in theory be PHY_NONE (-1).
    
    This is not a problem with the current implementation, because phy is
    always valid when this code is reached (Type-C encoders are rejected
    earlier), but it's more robust to store it as unsigned int so the
    shifts are always well-defined.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 73a9c94fbdbf756097909e4288060fa4ccdd6fe9 drm-intel
f54dc9aab623 drm/i915/display: harden masks in HSW_AUD_PIN_ELD_CP_VLD macros
92b2dd10d8ec drm/i915/display: harden shifts in ICL_DPCLKA_CFGCR0_DDI_CLK_SEL macros
-:35: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2879:
+#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	((u32)3 << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-:36: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2880:
+#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	((u32)(pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

total: 0 errors, 2 warnings, 0 checks, 19 lines checked
4baa70c7ec5a drm/i915/display: harden shift in intel_ddi_compute_config_late()
-:27: CHECK:SPACING: No space is necessary after a cast
#27: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:4641:
+			~BIT((unsigned int) crtc_state->cpu_transcoder);

total: 0 errors, 0 warnings, 1 checks, 10 lines checked
3d79886c7e38 drm/i915/display: harden shift in intel_pmdemand_update_phys_mask()


