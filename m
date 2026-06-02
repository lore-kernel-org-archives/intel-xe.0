Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD1CD6E5D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 22:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308E112FB6;
	Tue,  2 Jun 2026 22:05:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7743112A72;
 Tue,  2 Jun 2026 22:04:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic=3A_track_indiv?=
 =?utf-8?q?idual_colorop_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 22:04:58 -0000
Message-ID: <178043789881.37170.6673144428678593893@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602215743.914265-1-mwen@igalia.com>
In-Reply-To: <20260602215743.914265-1-mwen@igalia.com>
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
URL   : https://patchwork.freedesktop.org/series/167777/
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
commit 3bea47623b2b4604ca141349dfdd975112b35df9
Author: Melissa Wen <mwen@igalia.com>
Date:   Tue Jun 2 23:53:56 2026 +0200

    drm/amd/display: use plane color_mgmt_changed to track colorop changes
    
    Ensure the driver tracks changes in any colorop property of a plane
    color pipeline by using the same mechanism of CRTC color management and
    update plane color blocks when any colorop property changes. It fixes an
    issue observed on gamescope settings for night mode which is done via
    shaper/3D-LUT updates.
    
    Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in DEGAM block")
    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Reviewed-by: Alex Hung <alex.hung@amd.com>
    Signed-off-by: Melissa Wen <mwen@igalia.com>
+ /mt/dim checkpatch f059886850b97ea5c089703ba3e566a4f847fa19 drm-intel
b55d434da829 drm/colorop: Remove read-only comments from interpolation fields
e6e2dc5fdde4 drm/colorop: make lut(1/3)d_interpolation props correctly behave as mutable
-:26: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#26: FILE: drivers/gpu/drm/drm_atomic.c:913:
+				  drm_get_colorop_lut1d_interpolation_name(state->lut1d_interpolation));

-:35: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#35: FILE: drivers/gpu/drm/drm_atomic.c:925:
+				  drm_get_colorop_lut3d_interpolation_name(state->lut3d_interpolation));

total: 0 errors, 2 warnings, 0 checks, 121 lines checked
fb38db6cfe7f drm/atomic: track individual colorop updates
-:74: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#74: FILE: drivers/gpu/drm/drm_atomic_uapi.c:724:
+					      uint64_t val,

-:96: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#96: FILE: drivers/gpu/drm/drm_atomic_uapi.c:757:
+					   uint64_t val,

total: 0 errors, 0 warnings, 2 checks, 147 lines checked
3bea47623b2b drm/amd/display: use plane color_mgmt_changed to track colorop changes


