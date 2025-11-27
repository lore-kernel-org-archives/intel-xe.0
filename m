Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67837D11183
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 09:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A8F10E7EB;
	Thu, 27 Nov 2025 09:22:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B59110E7EA;
 Thu, 27 Nov 2025 09:22:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 09:22:12 -0000
Message-ID: <176423533262.33971.58607391502300201@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127091614.648791-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20251127091614.648791-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB
URL   : https://patchwork.freedesktop.org/series/158157/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 97639065529bb0a4b0cd4cb3901628ecabe693a0
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Thu Nov 27 14:46:14 2025 +0530

    drm/i915/vrr: Enable DC Balance
    
    Enable DC Balance from vrr compute config and related hw flag.
    Also to add pipe restrictions along with this.
    
    --v2:
    - Use dc balance check instead of source restriction.
    --v3:
    - Club pipe restriction check with dc balance enablement. (Ankit)
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch e7a767430515c3a6e8aee91c2a68cba8b06fe884 drm-intel
041ede64a8b8 drm/i915/display: Add source param for dc balance
145f177f236a drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
ba061eb01683 drm/i915/vrr: Add VRR DC balance registers
-:61: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:24:
+								    _TRANS_VRR_DCB_ADJ_FLIPLINE_CFG_LIVE_A, \

-:62: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:25:
+								    _TRANS_VRR_DCB_ADJ_FLIPLINE_CFG_LIVE_B)

total: 0 errors, 2 warnings, 0 checks, 80 lines checked
738b670f6ff3 drm/i915/vrr: Add functions to read out vmin/vmax stuff
5e78c1242224 drm/i915/vrr: Add DC Balance params to crtc_state
d6cf9c01b06d drm/i915/vrr: Add state dump for DC Balance params
8cb94cdc651d drm/i915/vrr: Add compute config for DC Balance params
62da285b3064 drm/i915/vrr: Add function to reset DC balance accumulated params
7097aaa10ee2 drm/i915/display: Add DC Balance flip count operations
3b132fdafd95 drm/i915/vrr: Write DC balance params to hw registers
458e73e57083 drm/i915/vblank: Extract vrr_vblank_start()
b36229ce499b drm/i915/vrr: Implement vblank evasion with DC balancing
82065a937522 drm/i915/display: Wait for VRR PUSH status update
6f71e755ef0b drm/i915/dsb: Add pipedmc dc balance enable/disable
72798d8ea6c0 drm/i915/vrr: Pause DC Balancing for DSB commits
f6f614eb03f0 drm/i915/display: Add function to configure event for dc balance
97639065529b drm/i915/vrr: Enable DC Balance


