Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32EBCD3447
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508AC10E1BE;
	Sat,  9 May 2026 16:47:07 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE810E1BE;
 Sat,  9 May 2026 16:47:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_casf_=26_scaler_refactori?=
 =?utf-8?q?ng?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 May 2026 16:47:05 -0000
Message-ID: <177834522599.54640.13701987762664678035@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260509164048.627399-1-michal.grzelak@intel.com>
In-Reply-To: <20260509164048.627399-1-michal.grzelak@intel.com>
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

Series: casf & scaler refactoring
URL   : https://patchwork.freedesktop.org/series/166252/
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
commit 1a46323f3d7a181f7c21bb917cf04c3ba05cc623
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Sat May 9 18:40:48 2026 +0200

    drm/i915/scaler: eliminate dead code
    
    We short-cut skl_scaler_get_config() when skl_pipe_scaler_get_hw_state()
    has failed. Remove codepaths that assume scaler_id < 0.
    
    Cc: Nemesa Garg <nemesa.garg@intel.com>
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 11d2d2a0077bf9aef71906f0db84bdab357ac773 drm-intel
37c0fe40f301 drm/i915/casf: fix comment typos
e9073e2a4b4a drm/i915/casf: rename *_coef*() into *_coeff*()
-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/i915/display/intel_casf.c:200:
+static void convert_sharpness_coeff_binary(struct scaler_filter_coeff *coeff,
 					  u16 coefficient)

-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: drivers/gpu/drm/i915/display/intel_casf.c:237:
+		convert_sharpness_coeff_binary(&crtc_state->pch_pfit.casf.coeff[i],
 					      filter_coeff[i]);

total: 0 errors, 0 warnings, 2 checks, 40 lines checked
cb87a628a660 drm/i915: rename t into tap
759e1566c577 drm/i915/casf: rename sumcoeff into sum_coeff
8317d8fbd21a drm/i915/scaler: s/i/scaler_id/ where appropriate
2fae462e4bbb drm/i915/scaler: remove id in favor of scaler_id
fe9d7f35346e drm/i915/scaler: unloop scaler readout that is run once
ff96ab6c6452 drm/i915/scaler: abstract scaler searching loop
1a46323f3d7a drm/i915/scaler: eliminate dead code


