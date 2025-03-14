Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DE2C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1CB10E9F9;
	Fri, 14 Mar 2025 13:59:59 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3C410E9F9;
 Fri, 14 Mar 2025 13:59:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Underrun_on_idle_PSR_work?=
 =?utf-8?q?around_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Mar 2025 13:59:58 -0000
Message-ID: <174196079837.34966.14541402361793625984@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314111839.1051945-1-jouni.hogander@intel.com>
In-Reply-To: <20250314111839.1051945-1-jouni.hogander@intel.com>
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

Series: Underrun on idle PSR workaround (rev3)
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
commit 4d38a3e26ed81a69362c991f01ff3f36b8ad47b0
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Mar 14 13:18:39 2025 +0200

    drm/i915/psr: Check transcoder Selective Update support for PR as well
    
    We need to ensure transcoder is supporting Selective Update in case of
    Panel Replay as well.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 83417b23792d937795320a8804fd97d50c4c6233 drm-intel
4aacdeb74c93 drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
4ebe9600b21c drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
66a0a842da53 drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
-:28: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:33:
+									   PIPEDMC_BLOCK_PKGC_SW_A, \

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
4742f8418466 drm/i915/psr: Write PIPEDMC_BLOCK_PKGC_SW when enabling PSR
b4414522a2ef drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
a73e1aac8151 drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
11d82a7a97cd drm/i915/psr: Add interface to notify PSR of vblank enable/disable
bce750acdf6c drm/i915/psr: Apply underrun on PSR idle workaround
917dcf815b28 drm/i915/display: Rename intel_psr_needs_block_dc_vblank
a3be38c23558 drm/i915/display: Rename vblank DC workaround functions and variables
4d38a3e26ed8 drm/i915/psr: Check transcoder Selective Update support for PR as well


