Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3C6C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 15:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F02210E08A;
	Tue, 13 May 2025 15:51:32 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DC110E08A;
 Tue, 13 May 2025 15:51:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 15:51:31 -0000
Message-ID: <174715149135.75839.4891660260914259421@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513051700.507389-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250513051700.507389-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB (rev5)
URL   : https://patchwork.freedesktop.org/series/148025/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 599d3d4c92881a0ca3824e6e7a7e7a2dff535de9
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue May 13 10:47:00 2025 +0530

    drm/i915/vrr: Enable DC Balance bit
    
    Enable DC Balance from vrr compute config and also add
    enable/disable frame counters for DC Balance odd and even
    frame count calculation.
    
    --v2:
    Update commit message
    
    --v3:
    - Driver should not control adjustment enable bit, as that
    is already being controlled by firmware. Release bit from
    driver computation.
    - Commit message update.
    
    --v4:
    - Configure PIPEDMC_EVT_CTL enable/disable call.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch d0d3c136f60cbee6ede33f207b4e6d6b2f04779d drm-intel
ce85aa7ec528 drm/i915/vrr: Refactor vmin/vmax stuff
212a68f758a7 drm/i915/display: Add source param for dc balance
b22f7f26c557 drm/i915/display: Add pipe dmc registers and bits for DC Balance
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#25: 
Co-authored-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
84e82a977de9 drm/i915/display: Add VRR DC balance registers
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#16: 
Co-authored-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 60 lines checked
4e80e0d36122 drm/i915/vrr: Add functions to read out vmin/vmax stuff
2422915c4ab7 drm/i915/vrr: Add DC Balance params to crtc_state
a155fe802278 drm/i915/vrr: Add state dump for DC Balance params
1984f1f95d23 drm/i915/vrr: Add compute config for DC Balance params
cd280b6e2fb4 drm/i915/vrr: Write DC balance params to hw registers
40afe574057f drm/i915: Extract vrr_vblank_start()
8766cb68320d drm/i915/vrr: Implement vblank evasion with DC balancing
3242b68f8144 drm/i915/dsb: Add pipedmc dc balance enable/disable
a84c1ed4ed5d drm/i915/vrr: Restructure VRR enablement bit
5a68c25251fe drm/i915/vrr: Pause DC Balancing for DSB commits
da458158f36c drm/i915/vrr: Add function to check if DC Balance Possible
1167243160d6 drm/i915/display: Add function to configure PIPEDMC_EVT_CTL
599d3d4c9288 drm/i915/vrr: Enable DC Balance bit


