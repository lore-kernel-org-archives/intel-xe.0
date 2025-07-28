Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3036DC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 14:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26BB10E05E;
	Mon, 28 Jul 2025 14:47:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EBD10E05E;
 Mon, 28 Jul 2025 14:47:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Use_t?=
 =?utf-8?q?he_recomended_min=5Fhblank_values_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Jul 2025 14:47:25 -0000
Message-ID: <175371404515.193750.15984910477850495339@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250728-min_hblank-v6-1-8c8bae7db250@intel.com>
In-Reply-To: <20250728-min_hblank-v6-1-8c8bae7db250@intel.com>
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

Series: drm/i915/display: Use the recomended min_hblank values (rev4)
URL   : https://patchwork.freedesktop.org/series/150727/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 491053175c65659875b0d8ae11145de13c67f9b3
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Mon Jul 28 14:14:48 2025 +0530

    drm/i915/display: Use the recomended min_hblank values
    
    Use recommended values as per wa_14021694213 to compare with the
    calculated value and choose minimum of them.
    
    v2: corrected checkpatch warning and retain the restriction for
    min_hblank (Jani)
    v3: use calculated value to compare with recomended value and choose
    minimum of them (Imre)
    v4: As driver supported min bpc is 8, omit the condition check for
    bpc6 with ycbcr420. Added a note for the same (Imre)
    v5: Add a warn for the unexpected case of 6bpc + uhbr + ycbcr420
    v6: Reworded the comments and check fo anything < compressed bpp 8(Imre)
    
    Bspec: 74379
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch a26b2edee2a6d9d10ff2689a49f27a780af3cf24 drm-intel
491053175c65 drm/i915/display: Use the recomended min_hblank values
-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3197:
+		drm_WARN_ON(display->drm, (crtc_state->dsc.compression_enable &&
+			 crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 &&

total: 0 errors, 0 warnings, 1 checks, 26 lines checked


