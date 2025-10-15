Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A0CCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 17:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6910E89D;
	Wed, 15 Oct 2025 17:00:44 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5068E10E892;
 Wed, 15 Oct 2025 17:00:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Optimize_vrr=2Eguardband?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 17:00:43 -0000
Message-ID: <176054764332.17707.12226340789323527187@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015102241.1797828-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251015102241.1797828-1-ankit.k.nautiyal@intel.com>
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

Series: Optimize vrr.guardband
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
commit d3c12cc7e1fb4aa72226d5be2da3f96c2fdcbef8
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Oct 15 15:52:41 2025 +0530

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
+ /mt/dim checkpatch 69ca30df000b382e7657f300148be505083377f2 drm-intel
a991e98bae14 drm/i915/vrr: prep patches for guardband optimization squashed
44a5d7e8af0f drm/i915/prefill: Prefill latency calculations series squashed
-:204: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#204: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 808 lines checked
ef0af6f6f6ee drm/i915/dp: Add SDP latency computation helper
826fcefc1eaa drm/i915/psr: Add function to compute max link-wake latency
987af8fe93fd drm/i915/display: Add guardband check for feature latencies
d3c12cc7e1fb drm/i915/vrr: Use the min static optimized guardband


