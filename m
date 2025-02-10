Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B506C0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 16:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A8710E5B2;
	Mon, 10 Feb 2025 16:18:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E44210E5B3;
 Mon, 10 Feb 2025 16:18:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_Fix_DSB+V?=
 =?utf-8?q?RR_usage_for_PTL+_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 16:18:04 -0000
Message-ID: <173920428431.391597.2524914631295360630@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/vrr: Fix DSB+VRR usage for PTL+ (rev3)
URL   : https://patchwork.freedesktop.org/series/144152/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6d3dbca708b0b266b0a2ec384c26cf7d7b9371b5
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Sat Feb 8 00:31:59 2025 +0200

    drm/i915/dsb: Decode DSB error interrupts
    
    Decode the DSB error interrupts into human readable
    form for easier debugging.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch ac4a840cc62717e40a027c674a9dcb9a3e1088ef drm-intel
a2bfbcb09a72 drm/i915/dsb: Move the +1 usec adjustment into dsb_wait_usec()
14e79c6fd6fe drm/i915/vrr: Don't send push for legacy cursor updates
0e27e1796207 drm/i915/vrr: Account for TRANS_PUSH delay
b8afe5861972 drm/i915/dsb: Compute use_dsb earlier
874126611a18 drm/i915/dsb: Introduce intel_dsb_poll()
f90bcab4f2f6 drm/i915/vrr: Reorder the DSB "wait for safe window" vs. TRANS_PUSH
ec7c52a33224 drm/i915/vrr: Check that the push send bit is clear after delayed vblank
-:38: WARNING:TYPO_SPELLING: 'reponse' may be misspelled - perhaps 'response'?
#38: 
    there triggers a reponse timeout error on the DSB. VRR
                     ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 71 lines checked
6d3dbca708b0 drm/i915/dsb: Decode DSB error interrupts


