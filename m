Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF17FB44B4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 06:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402D810F2AE;
	Fri, 24 Apr 2026 06:13:49 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A574B10F2AE;
 Fri, 24 Apr 2026 06:13:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/4=5D_drm/i915/display=3A_Don=E2=80=99t_use_atomic_state_bac?=
 =?utf-8?q?k-pointer_to_derive_color_pipeline?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 06:13:48 -0000
Message-ID: <177701122867.6490.11706433368048390530@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424054129.2148049-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260424054129.2148049-1-chaitanya.kumar.borah@intel.com>
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

Series: series starting with [v2,1/4] drm/i915/display: Don’t use atomic state back-pointer to derive color pipeline
URL   : https://patchwork.freedesktop.org/series/165398/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0b4d4eacc20a49fbeeb7a2fc413f3b83a2b1829a
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Fri Apr 24 11:11:29 2026 +0530

    drm/i915: Fix color blob reference handling in intel_plane_state
    
    Take proper references for hw color blobs (degamma_lut, gamma_lut,
    ctm, lut_3d) in intel_plane_duplicate_state() and drop them in
    intel_plane_destroy_state().
    
    v2:
    - handle blobs in hw state clear
    
    Fixes: 3b7476e786c2 ("drm/i915/color: Add framework to program PRE/POST CSC LUT")
    Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
    Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
    Reviewed-by: Pranay Samala <pranay.samala@intel.com> #v1
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 5419b04d9030e3c4138e51331169ef80441cc908 drm-intel
7dad12807d8d drm/i915/display: Don’t use atomic state back-pointer to derive color pipeline
-:23: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#23: 
Assisted-by: GitHub Copilot:Claude Sonnet 4.6

-:23: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:Claude Sonnet 4.6'
#23: 
Assisted-by: GitHub Copilot:Claude Sonnet 4.6

total: 1 errors, 1 warnings, 0 checks, 84 lines checked
b48eabd0d373 drm/i915/display: Copy color pipeline from plane in the primary joiner pipe
09f243ace7e9 drm/i915: Avoid programming color HW blocks for NV12 Y planes
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: GitHub Copilot:Claude Sonnet 4.6

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:Claude Sonnet 4.6'
#19: 
Assisted-by: GitHub Copilot:Claude Sonnet 4.6

total: 1 errors, 1 warnings, 0 checks, 47 lines checked
0b4d4eacc20a drm/i915: Fix color blob reference handling in intel_plane_state


