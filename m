Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C313CCF9FE
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 05:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3869510E353;
	Mon,  3 Nov 2025 05:38:20 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239DA10E104;
 Mon,  3 Nov 2025 05:38:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 05:38:19 -0000
Message-ID: <176214829913.10382.7476087101824618742@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251103053002.3002695-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20251103053002.3002695-1-mitulkumar.ajitkumar.golani@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/156900/
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
commit 832c66709ffb9fa9039ce222d77e3cec8c27ee6c
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Mon Nov 3 11:00:02 2025 +0530

    drm/i915/vrr: Add function to check if DC Balance Possible
    
    Add function to check if DC Balance possibile on
    requested PIPE and also validate along with DISPLAY_VER
    check.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch b9356481c8ac3cba317f6c7af88db25452b0e515 drm-intel
19f6bb51cdca drm/i915/display: Add source param for dc balance
f9ee61d1bb6a drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
-:27: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#27: 
Co-authored-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
b09e282c1485 drm/i915/vrr: Add VRR DC balance registers
2fd70f9f18a7 drm/i915/vrr: Add functions to read out vmin/vmax stuff
1d19a937892a drm/i915/vrr: Add DC Balance params to crtc_state
1dc667c575ea drm/i915/vrr: Add state dump for DC Balance params
686d2ba125c0 drm/i915/vrr: Add compute config for DC Balance params
5c5d1155451e drm/i915/display: Add DC Balance flip counter in crtc
c91d39651fa7 drm/i915/vrr: Increment DC balance flip count on every flip
9d09aa08afa9 drm/i915/vrr: Add function to reset DC Balance flip count
f6846e48b7fa drm/i915/vrr: Add function reset DC balance accumulated params
66df3d187732 drm/i915/vrr: Write DC balance params to hw registers
032b8d82e68e drm/i915/vrr: Configure DC balance flipline adjustment
4cf4cb13ffc0 drm/i915/vblank: Extract vrr_vblank_start()
a6f61de563e3 drm/i915/vrr: Implement vblank evasion with DC balancing
b562a263dfc0 drm/i915/display: Wait for VRR PUSH status update
dcf16bf120d4 drm/i915/dsb: Add pipedmc dc balance enable/disable
c9cb8a7101b4 drm/i915/vrr: Pause DC Balancing for DSB commits
afea25da00e9 drm/i915/display: Add function to configure event for dc balance
9c2d6d83216e drm/i915/vrr: Enable Adaptive sync counter bit
bda864fff1ae drm/i915/vrr: Enable DC Balance
832c66709ffb drm/i915/vrr: Add function to check if DC Balance Possible


