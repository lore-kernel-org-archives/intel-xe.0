Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BF1CCF2E7
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1BA10E6C5;
	Mon, 19 Oct 2026 14:01:59 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F9F10ED90;
 Mon, 19 Oct 2026 14:01:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pfit=3A_Make_GMC?=
 =?utf-8?q?H_panel_fitter_nicer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Oct 2026 14:01:57 -0000
Message-ID: <179241851765.41163.7962975467576495629@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/pfit: Make GMCH panel fitter nicer
URL   : https://patchwork.freedesktop.org/series/176401/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dfacdea70d3fa1c83815eefbf837b1cd86e6335c
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Oct 19 16:53:09 2026 +0300

    drm/i915/pfit: Allow downscaling on i966+
    
    The i965+ panel fitter supports downscaling. Allow it.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch a16b0e27155a8187d222dc914932a2d244d254b2 drm-intel
52589fd94ad9 drm/i915/pfit: s/pch_pfit/pfit/
-:104: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#104: FILE: drivers/gpu/drm/i915/display/intel_casf.c:237:
+		convert_sharpness_coeff_binary(&crtc_state->pfit.casf.coeff[i],
 					      filter_coeff[i]);

total: 0 errors, 0 warnings, 1 checks, 433 lines checked
7f63c170b3ab drm/i915/pfit: s/intel_pch_pfit/ilk_pfit/
160a095ba66e drm/i915/pfit: Stop using HAS_PCH_SPLIT() in confusing places
bbecbc9bc4a3 drm/i915/pfit: Introduce intel_pfit_get_config()
3e16ce61ff58 drm/i915/pfit: Rename some pfit functions
84538a9688bd drm/i915/pfit: Extract i965_pfit_get_config()
adf000edc24e drm/i915/pfit: Drop platform check for gmch_pfit.pgm_ratios
a40b5002e278 drm/i915/pfit: Unconfuse panel_fitter_scaling()
d43794005bec drm/i915/pfit: Populate crtc_state->pfit.dst on GMCH platforms
590e407b52a3 drm/i915/pfit: Check scaling factor on GMCH
4559f8434e8f drm/i915/pfit: Check panel fitter source size on GMCH
42d854a9bcb7 drm/i915/pfit: Extract i9xx_pfit_vscale_ratio() and i9xx_pfit_is_one_line_mode()
-:104: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#104: FILE: drivers/gpu/drm/i915/display/intel_pfit.c:982:
+		return REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, tmp);
+	} else {

total: 0 errors, 1 warnings, 0 checks, 93 lines checked
38082aacfe92 drm/i915/pfit: No pfit one line mode on i965+
cba24780688a drm/i915/pfit: Account for pfit downscaling in pixel rate on GMCH platforms
dfacdea70d3f drm/i915/pfit: Allow downscaling on i966+


