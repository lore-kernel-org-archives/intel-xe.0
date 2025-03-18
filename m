Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2557C35FFA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 13:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA87A10E48B;
	Tue, 18 Mar 2025 13:44:48 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BD810E48B;
 Tue, 18 Mar 2025 13:44:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Underrun_on_idle_PSR_work?=
 =?utf-8?q?around_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Mar 2025 13:44:47 -0000
Message-ID: <174230548753.48645.16031269890856722958@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317081905.3683654-1-jouni.hogander@intel.com>
In-Reply-To: <20250317081905.3683654-1-jouni.hogander@intel.com>
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

Series: Underrun on idle PSR workaround (rev5)
URL   : https://patchwork.freedesktop.org/series/145987/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3a399cdc484a53297fe8747f041f263392efd604
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Mar 17 10:19:05 2025 +0200

    drm/i915/display: Rename vblank DC workaround functions and variables
    
    We have extended using vblank DC workaround mechanism for
    Wa_16025596647. Rename related functions and variables:
    
    vblank_wa_num_pipes -> vblank_enable_count
    vblank_dc_work -> vblank_notify_work
    intel_display_vblank_dc_work -> intel_display_vblank_notify_work
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
1212257715c1 drm/i915/display: Add new interface for getting dc_state
55edc4faa4d6 drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
b8d66c42154f drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
f21d3eb0719d drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
-:28: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:33:
+									   PIPEDMC_BLOCK_PKGC_SW_A, \

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
94b64922063c drm/i915/psr: Write PIPEDMC_BLOCK_PKGC_SW when enabling PSR
12c23d9304c6 drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
9c35f7495bb2 drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
e6311765fb90 drm/i915/psr: Add interface to notify PSR of vblank enable/disable
d5aedc239342 drm/i915/psr: Apply underrun on PSR idle workaround
7824c567fa31 drm/i915/display: Rename intel_psr_needs_block_dc_vblank
3a399cdc484a drm/i915/display: Rename vblank DC workaround functions and variables


