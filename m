Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A763EC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 11:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6809A10E108;
	Fri,  7 Mar 2025 11:11:15 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E4E10E108;
 Fri,  7 Mar 2025 11:11:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Underrun_on_idle_PSR_work?=
 =?utf-8?q?around?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 11:11:14 -0000
Message-ID: <174134587473.930.1014916306415627110@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307105237.2909849-1-jouni.hogander@intel.com>
In-Reply-To: <20250307105237.2909849-1-jouni.hogander@intel.com>
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

Series: Underrun on idle PSR workaround
URL   : https://patchwork.freedesktop.org/series/145987/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c7fdfcf40b442948dd677cb5f1fa16f19264739
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Mar 7 12:52:37 2025 +0200

    drm/i915/display: Rename vblank DC workaround functions and variables
    
    We have extended using vblank DC workaround mechanism for
    Wa_16025596647. Rename related functions and variables:
    
    vblank_wa_num_pipes -> vblank_enable_count
    vblank_dc_work -> vblank_notify_work
    intel_display_vblank_dc_work -> intel_display_vblank_notify_work
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch d3c673d6b2da9b11915a2126613c30dec273df28 drm-intel
98a03aafe6ac drm/i915/display: Add new interface for getting dc_state
54acb5c6a942 drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
8fdc5a7c4603 drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
02547eb04dd3 drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
-:28: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:33:
+									   PIPEDMC_BLOCK_PKGC_SW_A, \

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
51fe85439504 drm/i915/psr: Write PIPEDMC_BLOCK_PKGC_SW when enabling PSR
977020616bf0 drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
cc0d74cc9f68 drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
5681774762c7 drm/i915/psr: Add interface to notify PSR of vblank enable/disable
423e0d18270b drm/i915/psr: Apply underrun on PSR idle workaround
21e34c5d6669 drm/i915/display: Rename intel_psr_needs_block_dc_vblank
2c7fdfcf40b4 drm/i915/display: Rename vblank DC workaround functions and variables


