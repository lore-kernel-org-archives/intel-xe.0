Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E786C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 10:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEA210E12A;
	Tue, 24 Jun 2025 10:50:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96010E12A;
 Tue, 24 Jun 2025 10:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 10:50:38 -0000
Message-ID: <175076223810.104590.8344414744684384825@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624074948.671761-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250624074948.671761-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB (rev8)
URL   : https://patchwork.freedesktop.org/series/148025/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a2dc34c14d03b87d125259fab33998b8c83d7550
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Jun 24 13:19:48 2025 +0530

    drm/i915/vrr: Enable DC Balance
    
    Enable DC Balance from vrr compute config and related hw flag.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch fb5dada21e3cfa26179ca58e1d7c26cdad217201 drm-intel
7ed94d9a43c8 drm/i915/vrr: Refactor vmin/vmax stuff
a512eeaacd08 drm/i915/display: Add source param for dc balance
b5eca743cfd0 drm/i915/display: Add pipe dmc registers and bits for DC Balance
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#25: 
Co-authored-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
fad6a8f79ede drm/i915/display: Add VRR DC balance registers
4566a559ce73 drm/i915/vrr: Add functions to read out vmin/vmax stuff
348d5dec3a32 drm/i915/vrr: Add DC Balance params to crtc_state
f9014d5426d0 drm/i915/vrr: Add state dump for DC Balance params
93f42d962c67 drm/i915/vrr: Add compute config for DC Balance params
46d909ba4d17 drm/i915/vrr: Write DC balance params to hw registers
21ab1f87cbe8 drm/i915: Extract vrr_vblank_start()
f7ca6359b427 drm/i915/vrr: Implement vblank evasion with DC balancing
d28f0ebc72fc drm/i915/dsb: Add pipedmc dc balance enable/disable
-:49: CHECK:LINE_SPACING: Please don't use multiple blank lines
#49: FILE: drivers/gpu/drm/i915/display/intel_dmc.h:11:
 
+

total: 0 errors, 0 warnings, 1 checks, 42 lines checked
0ea9b21246ab drm/i915/vrr: Restructure VRR enablement bit
2725e846662f drm/i915/vrr: Pause DC Balancing for DSB commits
1772e7183319 drm/i915/vrr: Add function to check if DC Balance Possible
841802d1c29f drm/i915/display: Add function to configure PIPEDMC_EVT_CTL
cb0b86009ef2 drm/i915/vrr: Enable Adaptive sync counter bit
a2dc34c14d03 drm/i915/vrr: Enable DC Balance


