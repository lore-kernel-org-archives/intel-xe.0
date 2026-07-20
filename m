Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E880C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 13:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9610E194;
	Mon, 20 Jul 2026 13:17:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE60F10E194;
 Mon, 20 Jul 2026 13:17:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_CMRR_in_fixed-RR_V?=
 =?utf-8?q?RR_path_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 13:17:07 -0000
Message-ID: <178455342771.207232.18010427892387085043@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable CMRR in fixed-RR VRR path (rev3)
URL   : https://patchwork.freedesktop.org/series/168613/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e3485fad21426c2952ec69988fd26fe27b03aee
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Mon Jul 20 14:31:41 2026 +0530

    drm/i915/vrr: Enable cmrr
    
    Enable CMRR during compute config and add related state
    checker for the same.
    
    --v2:
    - Everything else except enable compute to handle before this patch
    (Chaitanya)
    
    --v3:
    - Remove redundant return from compute config
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch d92e401bb406456b14b34563e807dd7378413f9b drm-intel
e667aa562b66 drm/i915/vrr: Return from CMRR compute config in case of PSR2 enabled
-:16: WARNING:BAD_SIGN_OFF: Duplicate signature
#16: 
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
dd8b28b3ebe1 drm/i915/vrr: Restrict CMRR enable condition to VRR-TG-default platforms
af8f0485ab6c drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
0c5edfea3178 drm/i915/vrr: Update AS_SDP target_rr_divider based on CMRR config request
c197deea39ef drm/i915/display: Move CMRR crtc_state members under VRR
a082a62d6343 drm/i915/vrr: Compute CMRR fractional timings generically
56053212c2c4 drm/i915/vrr: Dump CMRR state in the crtc state dump
c6474d489bbb drm/i915/vrr: Program CMRR enable/disable from transcoder timings
4e3485fad214 drm/i915/vrr: Enable cmrr


