Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7650C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 05:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F9510E0F3;
	Tue, 13 May 2025 05:25:05 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C720910E0F3;
 Tue, 13 May 2025 05:25:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 05:25:03 -0000
Message-ID: <174711390381.72431.9014781990595636771@c664b1dc75d1>
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
commit befe263e70bbcefa301c7d2276d0014defe5c337
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
+ /mt/dim checkpatch ccbe266e6269fe62cb8f5d80cd9226134ea38e97 drm-intel
c70551eae3a4 drm/i915/vrr: Refactor vmin/vmax stuff
acde386a1fd3 drm/i915/display: Add source param for dc balance
1ca8b3da9562 drm/i915/display: Add pipe dmc registers and bits for DC Balance
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#25: 
Co-authored-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
631778461d17 drm/i915/display: Add VRR DC balance registers
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#16: 
Co-authored-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 60 lines checked
f54872036732 drm/i915/vrr: Add functions to read out vmin/vmax stuff
f856fc58f5e6 drm/i915/vrr: Add DC Balance params to crtc_state
3f404fb64e9e drm/i915/vrr: Add state dump for DC Balance params
acf2d9f35995 drm/i915/vrr: Add compute config for DC Balance params
f6ca924901ce drm/i915/vrr: Write DC balance params to hw registers
86775c7c7d1b drm/i915: Extract vrr_vblank_start()
d27775b27d9b drm/i915/vrr: Implement vblank evasion with DC balancing
5eb8a2315e9d drm/i915/dsb: Add pipedmc dc balance enable/disable
02ccd8ade0b2 drm/i915/vrr: Restructure VRR enablement bit
192e2fe5f523 drm/i915/vrr: Pause DC Balancing for DSB commits
0964533d5775 drm/i915/vrr: Add function to check if DC Balance Possible
4d3b2520db9d drm/i915/display: Add function to configure PIPEDMC_EVT_CTL
befe263e70bb drm/i915/vrr: Enable DC Balance bit


