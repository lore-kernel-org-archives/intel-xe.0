Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87887C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4059310E14A;
	Tue,  3 Jun 2025 20:04:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7010E223;
 Tue,  3 Jun 2025 20:04:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 20:04:25 -0000
Message-ID: <174898106506.45504.10542300708655618934@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603193522.2567092-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250603193522.2567092-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB (rev7)
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
commit c248f804b440b59182382ed6d82022c16f1dfeae
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Wed Jun 4 01:05:22 2025 +0530

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
+ /mt/dim checkpatch ba486e3b10ce5b4ee4d1ffc58aa4cc3b669c02a3 drm-intel
621d3b87f86b drm/i915/vrr: Refactor vmin/vmax stuff
5ab10dfdefc9 drm/i915/display: Add source param for dc balance
2c2a6d9a50da drm/i915/display: Add pipe dmc registers and bits for DC Balance
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#25: 
Co-authored-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
d9746b6acd08 drm/i915/display: Add VRR DC balance registers
7b821210dde4 drm/i915/vrr: Add functions to read out vmin/vmax stuff
2711afe1dd73 drm/i915/vrr: Add DC Balance params to crtc_state
bbcede0d0c1d drm/i915/vrr: Add state dump for DC Balance params
a974ee45c70f drm/i915/vrr: Add compute config for DC Balance params
edb37dc13ce6 drm/i915/vrr: Write DC balance params to hw registers
f20482e412c2 drm/i915: Extract vrr_vblank_start()
2f904f51f13a drm/i915/vrr: Implement vblank evasion with DC balancing
7c62a84d5685 drm/i915/dsb: Add pipedmc dc balance enable/disable
1c97467166ca drm/i915/vrr: Restructure VRR enablement bit
0a47431dd407 drm/i915/vrr: Pause DC Balancing for DSB commits
c737d60f425b drm/i915/vrr: Add function to check if DC Balance Possible
299c3970f19d drm/i915/display: Add function to configure PIPEDMC_EVT_CTL
c248f804b440 drm/i915/vrr: Enable DC Balance bit


