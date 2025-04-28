Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763F1C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 06:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F05310E380;
	Mon, 28 Apr 2025 06:30:06 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A92410E37B;
 Mon, 28 Apr 2025 06:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 06:30:05 -0000
Message-ID: <174582180523.18084.8156188100001612782@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428062058.2811655-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250428062058.2811655-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB (rev2)
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
commit f295fd98b0709851a7fc8497740a88098484baa9
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Mon Apr 28 11:50:58 2025 +0530

    drm/i915/vrr: enable dc balance bit
    
    Enable dc balance from vrr compute config and enable
    double buffer adjustment bit when vrr is enabled in
    adaptive vtotal mode. Along with this enable frame
    counters for DC balance odd and even frame count
    calculation.
    
    --v2: Update commit message
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 3169be72c46a44190c6bb7dcf3a0b80986809319 drm-intel
342f6b04daa4 drm/i915/vrr: Fix the adjustment for the fixed rr vtotal for Display < 13
324ac0bd3f8e drm/i915/vrr: Refactor vmin/vmax stuff
7301de854524 drm/i915/display: Add source param for dc balance
091b4b2f031e drm/i915/display: Add registers and bits for DC Balance
fa4f5b5ef7b3 drm/i915/vrr: Add functions to read out vmin/vmax stuff
c1aa496c6fae drm/i915/vrr: Add state checker for dc balance params
84a09875cbdd drm/i915/vrr: Add state dump for dc balance params
afeeba023ec1 drm/i915/vrr: Add compute config for DC balance params
bfac1b0753a5 drm/i915/vrr: Write DC balance params to hw registers
e6d755809cc8 drm/i915: Extract vrr_vblank_start()
4509bfda4432 drm/i915/vrr: Implement vblank evasion with DC balancing
fc331e45fb15 drm/i915/dsb: Add pipedmc dc balance enable/disable
c58f580fb81a drm/i915/vrr: Restructure VRR enablement bit
8fa61c6a2a21 drm/i915/vrr: Pause DC balancing for DSB commits
f295fd98b070 drm/i915/vrr: enable dc balance bit


