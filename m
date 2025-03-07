Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05495C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 19:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72D410EC27;
	Fri,  7 Mar 2025 19:12:15 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF27F10EC30;
 Fri,  7 Mar 2025 19:12:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_sagv/bw_clean?=
 =?utf-8?q?up?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 19:12:14 -0000
Message-ID: <174137473484.3691.4292139376783708534@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307180139.15744-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250307180139.15744-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: sagv/bw cleanup
URL   : https://patchwork.freedesktop.org/series/146013/
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
commit 2edcd316b72cb1ad7365a522c61c4d8e302916da
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Mar 7 20:01:39 2025 +0200

    drm/i915: Eliminate intel_compute_sagv_mask()
    
    intel_compute_sagv_mask() has become pointless. Just inline
    its contents into the existing loop in skl_compute_wm().
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
618e9673814e drm/i915: Drop the cached per-pipe min_cdclk[] from bw state
0801eb63aaf1 drm/i915: s/intel_crtc_bw/intel_dbuf_bw/
e6cbe25098db drm/i915: Extract intel_dbuf_bw_changed()
d4b59746d264 drm/i915: Pass intel_dbuf_bw to skl_*_calc_dbuf_bw() explicitly
6448e541a973 drm/i915: Avoid triggering unwanted cdclk changes due to dbuf bandwidth changes
16bd3df5fdf4 drm/i915: Do more bw readout
ac425cad0534 drm/i915: Flag even inactive crtcs as "inherited"
693f64ecf8b5 drm/i915: Drop force_check_qgv
f94b76d7136f drm/i915: Extract intel_bw_modeset_checks()
ce834d0115f3 drm/i915: Extract intel_bw_check_sagv_mask()
-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5e8146251f7b', maybe rebased or not pulled?
#14: 
changed in commit 5e8146251f7b ("extract intel_bw_check_sagv_mask()")

total: 0 errors, 1 warnings, 0 checks, 117 lines checked
054cc0912474 drm/i915: Make intel_bw_check_sagv_mask() internal to intel_bw.c
1ef5f9ff27ae drm/i915: Make intel_bw_modeset_checks() internal to intel_bw_atomic_check()
c0db1c2e858d drm/i915: Skip bw stuff if per-crtc sagv state doesn't change
2edcd316b72c drm/i915: Eliminate intel_compute_sagv_mask()


