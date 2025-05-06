Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DDCC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 16:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E82110E702;
	Tue,  6 May 2025 16:30:17 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9B210E701;
 Tue,  6 May 2025 16:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 16:30:16 -0000
Message-ID: <174654901650.52687.6143013545880752235@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB (rev4)
URL   : https://patchwork.freedesktop.org/series/148025/
State : success

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
commit 1376d60be9345b3c6723bbd116c656b3bf627ff4
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue May 6 20:25:17 2025 +0530

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
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 842c3c276c106040f9b96d72b9df35ed6aed9ae9 drm-intel
5358abe510e0 drm/i915/vrr: Fix the adjustment for the fixed rr vtotal for Display < 13
db2071e3663d drm/i915/vrr: Refactor vmin/vmax stuff
8bad2b3d5cbe drm/i915/display: Add source param for dc balance
ae1987189aa6 drm/i915/display: Add pipe dmc registers and bits for DC Balance
813aa89bbc26 drm/i915/display: Add VRR DC balance registers
8a64f87d9c6f drm/i915/vrr: Add functions to read out vmin/vmax stuff
bce481809cf1 drm/i915/vrr: Add DC Balance params to crtc_state
11d1768748b9 drm/i915/vrr: Add state dump for DC Balance params
3b4400d7a443 drm/i915/vrr: Add compute config for DC Balance params
4553afcaee86 drm/i915/vrr: Write DC balance params to hw registers
11e19770c353 drm/i915: Extract vrr_vblank_start()
68298b73b202 drm/i915/vrr: Implement vblank evasion with DC balancing
d79f5040801f drm/i915/dsb: Add pipedmc dc balance enable/disable
ec7e7917bddc drm/i915/vrr: Restructure VRR enablement bit
5352fed8bdef drm/i915/vrr: Pause DC Balancing for DSB commits
e5c0753f6de8 drm/i915/vrr: Add function to check if DC Balance Possible
1376d60be934 drm/i915/vrr: Enable DC Balance bit


