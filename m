Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B944606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 19:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A66910F76A;
	Tue, 20 Oct 2026 19:03:23 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBDD10EA98;
 Tue, 20 Oct 2026 19:03:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pfit=3A_Make_GMC?=
 =?utf-8?q?H_panel_fitter_nicer_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 19:03:22 -0000
Message-ID: <179252300258.47940.12109546288904207933@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/pfit: Make GMCH panel fitter nicer (rev4)
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
commit 9bd5f29edebaca71ec011f3e9ee10cfd089b836d
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Oct 20 21:41:11 2026 +0300

    drm/i915/pfit: Allow downscaling on i966+
    
    The i965+ panel fitter supports downscaling. Allow it.
    
    v2: Limit to <2.0 instead of <=2.0 (sashiko)
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 0610db36f4635ed214d9f1de57f9141f36c78a31 drm-intel
27ec4bdb1e16 drm/i915/pfit: s/pch_pfit/pfit/
-:105: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#105: FILE: drivers/gpu/drm/i915/display/intel_casf.c:237:
+		convert_sharpness_coeff_binary(&crtc_state->pfit.casf.coeff[i],
 					      filter_coeff[i]);

total: 0 errors, 0 warnings, 1 checks, 433 lines checked
a485f1261f23 drm/i915/pfit: s/intel_pch_pfit/ilk_pfit/
9ecced5e23e9 drm/i915/pfit: Stop using HAS_PCH_SPLIT() in confusing places
e9e50d4e9401 drm/i915/pfit: Introduce intel_pfit_get_config()
1f0fa878540b drm/i915/pfit: Rename some pfit functions
0535be94f044 drm/i915/pfit: Extract i965_pfit_get_config()
67ca4366a946 drm/i915/pfit: Drop platform check for gmch_pfit.pgm_ratios
1292ca9acd85 drm/i915/pfit: Unconfuse panel_fitter_scaling()
29924a52485a drm/i915/pfit: Populate crtc_state->pfit.dst on GMCH platforms
79e78cd0b057 drm/i915/pfit: Check scaling factor on GMCH
98605d569542 drm/i915/pfit: Check panel fitter source size on GMCH
730f0a0891a5 drm/i915/pfit: Extract i9xx_pfit_vscale_ratio() and i9xx_pfit_is_one_line_mode()
-:104: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#104: FILE: drivers/gpu/drm/i915/display/intel_pfit.c:985:
+		return REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, tmp);
+	} else {

total: 0 errors, 1 warnings, 0 checks, 93 lines checked
b5e0709d6552 drm/i915/pfit: No pfit one line mode on i965+
cd0879cd8a9d drm/i915/pfit: Account for pfit downscaling in pixel rate on GMCH platforms
9bd5f29edeba drm/i915/pfit: Allow downscaling on i966+


