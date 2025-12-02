Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3789D11700
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 08:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D9610E5B3;
	Tue,  2 Dec 2025 08:20:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C462810E5A9;
 Tue,  2 Dec 2025 08:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 08:20:30 -0000
Message-ID: <176466363079.48292.1390192439865119462@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251202073659.926838-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20251202073659.926838-1-mitulkumar.ajitkumar.golani@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/158361/
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
commit 68b306e26cd9f888a50d12bd3ec1dd4543e3a07d
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Dec 2 13:06:52 2025 +0530

    drm/i915/vrr: Enable DC Balance
    
    Enable DC Balance from vrr compute config and related hw flag.
    Also to add pipe restrictions along with this.
    
    --v2:
    - Use dc balance check instead of source restriction.
    --v3:
    - Club pipe restriction check with dc balance enablement. (Ankit)
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 639f325d8cbdc690de963db2fe5840444ac7ea65 drm-intel
8427f5840af6 drm/i915/display: Add source param for dc balance
5977f22b09fc drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
6c5bdca41d3f drm/i915/vrr: Add VRR DC balance registers
-:61: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:24:
+								    _TRANS_VRR_DCB_ADJ_FLIPLINE_CFG_LIVE_A, \

-:62: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:25:
+								    _TRANS_VRR_DCB_ADJ_FLIPLINE_CFG_LIVE_B)

total: 0 errors, 2 warnings, 0 checks, 80 lines checked
6d38657b6afd drm/i915/vrr: Add functions to read out vmin/vmax stuff
e42329ed9fc7 drm/i915/vrr: Add DC Balance params to crtc_state
f436d2ba7528 drm/i915/vrr: Add state dump for DC Balance params
b2e0cf53b7e1 drm/i915/vrr: Add compute config for DC Balance params
c5f1e1e983fc drm/i915/vrr: Add function to reset DC balance accumulated params
a7e3aab58d93 drm/i915/display: Add DC Balance flip count operations
fc1ea4eae593 drm/i915/vrr: Write DC balance params to hw registers
d818eecc5ba2 drm/i915/vblank: Extract vrr_vblank_start()
e4f57fe70c2b drm/i915/vrr: Implement vblank evasion with DC balancing
20600db52fcf drm/i915/display: Wait for VRR PUSH status update
b1951502cc40 drm/i915/dsb: Add pipedmc dc balance enable/disable
b4d878854c44 drm/i915/vrr: Pause DC Balancing for DSB commits
fbfa9fed5f20 drm/i915/display: Add function to configure event for dc balance
68b306e26cd9 drm/i915/vrr: Enable DC Balance


