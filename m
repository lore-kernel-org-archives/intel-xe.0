Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66337D12663
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 08:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D3910E534;
	Tue,  5 Nov 2024 08:37:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C661010E545;
 Tue,  5 Nov 2024 08:37:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_use_hw_support_for_min/in?=
 =?utf-8?q?terim_ddb_allocation_for_async_flip?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 08:37:34 -0000
Message-ID: <173079585480.1410848.7407842368701003351@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105071600.235338-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241105071600.235338-1-vinod.govindapillai@intel.com>
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

Series: use hw support for min/interim ddb allocation for async flip
URL   : https://patchwork.freedesktop.org/series/140927/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a48b992490e107adbd28d512ab277db3659285bb
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Tue Nov 5 09:16:00 2024 +0200

    drm/i915/debugfs: add dbuf alloc status as part of i915_ddb_info
    
    From xe3 onwards, there is a provision to define and
    use min ddb and interim ddb allocations for async flip
    use case. Add the dbuf allocation status as part of
    i915_ddb_info as well to show if min or interim ddb
    is being used.
    
    Bspec: 72053
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 2af747587f44530eae7e5c7cee1f24c34613d61b drm-intel
e5ebb6fd371f drm/i915/display: update intel_enabled_dbuf_slices_mask to use intel_display
0cd8cf7bd657 drm/i9i5/display: use intel_display in intel_de_read calls of skl_watermark.c
ee63291136e7 drm/i915/display: update use_minimal_wm0_only to use intel_display
94d0f566d7ed drm/i915/display: update use_min_ddb to use intel_display
947e51e8f492 drm/i915/display: update skl_plane_wm_equals to use intel_display
6edcbdc5f788 drm/i915/display: update to plane_wm register access function
c9a72450b40c drm/i915/xe3: Use hw support for min/interim ddb allocations for async flip
-:147: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#147: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:382:
+							_PLANE_MIN_BUF_CFG_1_A, _PLANE_MIN_BUF_CFG_1_B, \

-:148: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#148: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:383:
+							_PLANE_MIN_BUF_CFG_2_A, _PLANE_MIN_BUF_CFG_2_B)

-:241: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#241: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:1549:
+	memset(crtc_state->wm.skl.plane_interim_ddb, 0, sizeof(crtc_state->wm.skl.plane_interim_ddb));

total: 0 errors, 3 warnings, 0 checks, 338 lines checked
a48b992490e1 drm/i915/debugfs: add dbuf alloc status as part of i915_ddb_info


