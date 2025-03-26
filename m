Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD696C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 17:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D1010E742;
	Wed, 26 Mar 2025 17:45:46 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951F10E72D;
 Wed, 26 Mar 2025 17:45:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_sagv/bw_clean?=
 =?utf-8?q?up_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 17:45:45 -0000
Message-ID: <174301114587.5929.834345451352488476@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326162544.3642-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250326162544.3642-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: sagv/bw cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/146013/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5c72e1a42db4c72a144fba7d6711298d938f5a0
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Mar 26 18:25:44 2025 +0200

    drm/i915: Eliminate intel_compute_sagv_mask()
    
    intel_compute_sagv_mask() has become pointless. Just inline
    its contents into the existing loop in skl_compute_wm().
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 drm-intel
85c6f5ef33d9 drm/i915: Drop the cached per-pipe min_cdclk[] from bw state
ae62c4558ed5 drm/i915: s/intel_crtc_bw/intel_dbuf_bw/
677b65c927a1 drm/i915: Extract intel_dbuf_bw_changed()
c5df8538d5de drm/i915: Pass intel_dbuf_bw to skl_*_calc_dbuf_bw() explicitly
6da975ff457e drm/i915: Avoid triggering unwanted cdclk changes due to dbuf bandwidth changes
f52409ed7e36 drm/i915: Do more bw readout
ae3514cb702e drm/i915: Flag even inactive crtcs as "inherited"
44f88bf5fca2 drm/i915: Drop force_check_qgv
158ad6352a3a drm/i915: Extract intel_bw_modeset_checks()
8aedf85d315e drm/i915: Extract intel_bw_check_sagv_mask()
-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5e8146251f7b', maybe rebased or not pulled?
#14: 
changed in commit 5e8146251f7b ("extract intel_bw_check_sagv_mask()")

total: 0 errors, 1 warnings, 0 checks, 117 lines checked
a717e438d24f drm/i915: Make intel_bw_check_sagv_mask() internal to intel_bw.c
6d56e32bb3da drm/i915: Make intel_bw_modeset_checks() internal to intel_bw_atomic_check()
2072ae6f3a7e drm/i915: Skip bw stuff if per-crtc sagv state doesn't change
a5c72e1a42db drm/i915: Eliminate intel_compute_sagv_mask()


