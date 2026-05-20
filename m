Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3365FCD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 08:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F236A10EF6F;
	Wed, 20 May 2026 08:08:57 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82C110EF6F;
 Wed, 20 May 2026 08:08:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic=3A_track_indiv?=
 =?utf-8?q?idual_colorop_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 May 2026 08:08:56 -0000
Message-ID: <177926453674.89640.14199117524561229115@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520073827.3395745-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260520073827.3395745-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/atomic: track individual colorop updates
URL   : https://patchwork.freedesktop.org/series/166922/
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
commit 962a6fd8c7a98ab40109472201c2f0966a3b397e
Author: Melissa Wen <mwen@igalia.com>
Date:   Wed May 20 13:08:27 2026 +0530

    drm/amd/display: use plane color_mgmt_changed to track colorop changes
    
    Ensure the driver tracks changes in any colorop property of a plane
    color pipeline by using the same mechanism of CRTC color management and
    update plane color blocks when any colorop property changes. It fixes an
    issue observed on gamescope settings for night mode which is done via
    shaper/3D-LUT updates.
    
    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Signed-off-by: Melissa Wen <mwen@igalia.com>
+ /mt/dim checkpatch 932f7b6e65abe652595c69ef3db000046b41474a drm-intel
1f0a20f2c55d drm/atomic: only add colorop state from active color pipeline
f00362abafde drm/atomic: reject colorop update from inactive color pipeline
f86be9f10477 drm/colorop: Remove read-only comments from interpolation fields
b3bb94f65388 drm/colorop: make lut(1/3)d_interpolation mutable
-:22: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#22: FILE: drivers/gpu/drm/drm_atomic.c:860:
+				  drm_get_colorop_lut1d_interpolation_name(state->lut1d_interpolation));

-:31: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#31: FILE: drivers/gpu/drm/drm_atomic.c:872:
+				  drm_get_colorop_lut3d_interpolation_name(state->lut3d_interpolation));

-:99: WARNING:TRAILING_SEMICOLON: trailing semicolon indicates no statements, indent implies otherwise
#99: FILE: drivers/gpu/drm/drm_colorop.c:524:
+		if(!drm_object_property_get_default_value(&colorop->base,
+							  colorop->lut1d_interpolation_property,
+							  &val));
+			colorop_state->lut1d_interpolation = val;

-:99: ERROR:SPACING: space required before the open parenthesis '('
#99: FILE: drivers/gpu/drm/drm_colorop.c:524:
+		if(!drm_object_property_get_default_value(&colorop->base,

-:99: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#99: FILE: drivers/gpu/drm/drm_colorop.c:524:
+		if(!drm_object_property_get_default_value(&colorop->base,
[...]
+							  &val));

-:106: ERROR:SPACING: space required before the open parenthesis '('
#106: FILE: drivers/gpu/drm/drm_colorop.c:531:
+		if(!drm_object_property_get_default_value(&colorop->base,

total: 3 errors, 3 warnings, 0 checks, 121 lines checked
6b2c747150de drm/atomic: track individual colorop updates
-:63: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#63: FILE: drivers/gpu/drm/drm_atomic_uapi.c:724:
+					      uint64_t val,

-:85: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#85: FILE: drivers/gpu/drm/drm_atomic_uapi.c:757:
+					   uint64_t val,

total: 0 errors, 0 warnings, 2 checks, 163 lines checked
962a6fd8c7a9 drm/amd/display: use plane color_mgmt_changed to track colorop changes


