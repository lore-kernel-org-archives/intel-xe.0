Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233BBC369BA
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 11:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B4010E0DB;
	Mon, 14 Apr 2025 11:09:23 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6344810E0DB;
 Mon, 14 Apr 2025 11:09:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Underrun_on_idle_PSR_work?=
 =?utf-8?q?around_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 11:09:22 -0000
Message-ID: <174462896240.896.9361867758014528461@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414100508.1208774-1-jouni.hogander@intel.com>
In-Reply-To: <20250414100508.1208774-1-jouni.hogander@intel.com>
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

Series: Underrun on idle PSR workaround (rev6)
URL   : https://patchwork.freedesktop.org/series/145987/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5695cde9017c588f3db09fc7f3bd847c82c668d4
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Apr 14 13:05:08 2025 +0300

    drm/i915/display: Rename vblank DC workaround functions and variables
    
    We have extended using vblank DC workaround mechanism for
    Wa_16025596647. Rename related functions and variables:
    
    vblank_wa_num_pipes -> vblank_enable_count
    vblank_dc_work -> vblank_notify_work
    intel_display_vblank_dc_work -> intel_display_vblank_notify_work
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa drm-intel
da0bb0915f54 drm/i915/display: Add new interface for getting dc_state
48f1b102d57f drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
566e5c8fab83 drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
dbedc424d406 drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
-:29: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#29: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:33:
+									   PIPEDMC_BLOCK_PKGC_SW_A, \

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
44b2aa7bec8d drm/i915/dmc: Add interface to block PKG C-state
64e2fe86b9f7 drm/i915/psr: Block PKG C-State when enabling PSR
2f062418a75d drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
42e58e5a8beb drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
127a71828dfd drm/i915/psr: Add interface to notify PSR of vblank enable/disable
e19cc0fa006d drm/i915/dmc: Add interface to control start of PKG C-state exit
6ca0a636566c drm/i915/psr: Apply underrun on PSR idle workaround
-:172: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#172: FILE: drivers/gpu/drm/i915/display/intel_psr.c:2124:
+			intel_dmc_start_pkgc_exit_at_start_of_undelayed_vblank(display,
+								       intel_dp->psr.pipe,

total: 0 errors, 0 warnings, 1 checks, 203 lines checked
bfac781e565e drm/i915/display: Rename intel_psr_needs_block_dc_vblank
5695cde9017c drm/i915/display: Rename vblank DC workaround functions and variables


