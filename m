Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15515C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D223210E59E;
	Tue,  6 May 2025 07:05:33 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D4110E59E;
 Tue,  6 May 2025 07:05:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 07:05:33 -0000
Message-ID: <174651513313.50100.17441608914840537941@c664b1dc75d1>
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

Series: Enable/Disable DC balance along with VRR DSB (rev3)
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
commit d460a949786a7dc1cfb18d4e841b74d22eb8840f
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
+ /mt/dim checkpatch 1a6c04fe7312389e60a6004ee01d03a06a071cc1 drm-intel
d12864c82970 drm/i915/vrr: Fix the adjustment for the fixed rr vtotal for Display < 13
61a79fd83372 drm/i915/vrr: Refactor vmin/vmax stuff
80ac7d851f4a drm/i915/display: Add source param for dc balance
fa56383bf752 drm/i915/display: Add registers and bits for DC Balance
24c1ceefc5e9 drm/i915/vrr: Add functions to read out vmin/vmax stuff
ac60dd1d936b drm/i915/vrr: Add state checker for dc balance params
53410d79664d drm/i915/vrr: Add state dump for dc balance params
9c87149868d4 drm/i915/vrr: Add compute config for DC balance params
54b41fca055a drm/i915/vrr: Write DC balance params to hw registers
0a0791221e8e drm/i915: Extract vrr_vblank_start()
996e9d093ce3 drm/i915/vrr: Implement vblank evasion with DC balancing
245c1dfad064 drm/i915/dsb: Add pipedmc dc balance enable/disable
c91d40dbacdf drm/i915/vrr: Restructure VRR enablement bit
b1c3a16a0a55 drm/i915/vrr: Pause DC balancing for DSB commits
d460a949786a drm/i915/vrr: enable dc balance bit


