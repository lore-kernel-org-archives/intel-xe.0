Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A302CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 06:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B593210E58E;
	Tue,  2 Dec 2025 06:32:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5266910E58E;
 Tue,  2 Dec 2025 06:32:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_v9_19/20=5D_drm/i915/hist?=
 =?utf-8?q?ogram=3A_Histogram_changes_for_Display_20+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 06:32:58 -0000
Message-ID: <176465717833.48213.10233314791011152552@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
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

Series: v9 19/20] drm/i915/histogram: Histogram changes for Display 20+
URL   : https://patchwork.freedesktop.org/series/158355/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f299c0b99d827a632141d6651bc8f9c3d777a699
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Dec 2 11:56:55 2025 +0530

    v9 01/20] DO_NOT_REVIEW: plane/crtc color pipeline
    
    Squashed patch for plane and crtc pipeline implementation in drm.
    https://patchwork.freedesktop.org/series/152970/
    https://patchwork.freedesktop.org/patch/675255
    
    Note: Entire series is not taken
           AMD changes not take!
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 639f325d8cbdc690de963db2fe5840444ac7ea65 drm-intel
f299c0b99d82 v9 01/20] DO_NOT_REVIEW: plane/crtc color pipeline
-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/drm_atomic_uapi.c:428:
+			drm_dbg_atomic(dev,
+				"Setting DEGAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");

-:145: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#145: FILE: drivers/gpu/drm/drm_atomic_uapi.c:449:
+			drm_dbg_atomic(dev,
+				"Setting GAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");

-:174: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#174: FILE: drivers/gpu/drm/drm_atomic_uapi.c:757:
+drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
+				 struct drm_colorop *colorop)

-:204: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#204: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1107:
+		ret = drm_atomic_colorop_get_property(colorop,
+				colorop->state, property, val);

-:604: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#604: FILE: include/drm/drm_crtc.h:1368:
+int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
+					     const struct drm_prop_enum_list *pipelines,

total: 0 errors, 0 warnings, 5 checks, 598 lines checked


