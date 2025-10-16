Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95818CCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 10:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1C10E9A1;
	Thu, 16 Oct 2025 10:31:21 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8E810E9B5;
 Thu, 16 Oct 2025 10:31:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Optimize_vrr=2Eguardband_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 10:31:19 -0000
Message-ID: <176061067936.21751.1474360206780584623@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016093009.2139105-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251016093009.2139105-1-ankit.k.nautiyal@intel.com>
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

Series: Optimize vrr.guardband (rev2)
URL   : https://patchwork.freedesktop.org/series/155979/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4cfa51c7d17e794eef306a042123a1aa6aedf282
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Oct 16 15:00:09 2025 +0530

    drm/i915/vrr: Use the min static optimized guardband
    
    In the current VRR implementation, vrr.vmin and vrr.guardband are set such
    that they do not need to change when switching from fixed refresh rate to
    variable refresh rate. Specifically, vrr.guardband is always set to match
    the vblank length. This approach works for most cases, but not for LRR,
    where the guardband would need to change while the VRR timing generator is
    still active.
    
    With the VRR TG always active, live updates to guardband are unsafe and not
    recommended. To ensure hardware safety, guardband was moved out of the
    !fastset block, meaning any change now requires a full modeset.
    This breaks seamless LRR switching, which was previously supported.
    
    Since the problem arises from guardband being matched to the vblank length,
    solution is to use a minimal, sufficient static value, instead. So we use a
    static guardband defined during mode-set that fits within the smallest
    expected vblank and remains unchanged in case of features like LRR where
    vtotal changes. To compute this minimum guardband we take into account
    latencies/delays due to different features as mentioned in the Bspec.
    
    Introduce a helper to compute the minimal sufficient guardband.
    On platforms where the VRR timing generator is always ON, we optimize the
    guardband regardless of whether the display is operating in fixed or
    variable refresh rate mode.
    On platforms where the VRR timing generator is not always ON, we optimize
    the guardband only when VRR is enabled.
    
    Bspec: 70151
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch aaaff197c9186f4959c2bcb18035725188b950ed drm-intel
2c63e4cb372e drm/i915/vrr: prep patches for guardband optimization squashed
ac9598929244 drm/i915/prefill: Prefill latency calculations series squashed
-:204: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#204: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 751 lines checked
9de0678192e2 drm/i915/psr: Add helper to get min psr guardband
f535b2814c5c drm/i915/dp: Add helper to get min sdp guardband
5c92243f39b0 drm/i915/dp: Check if guardband can accommodate sdp latencies
4cfa51c7d17e drm/i915/vrr: Use the min static optimized guardband


