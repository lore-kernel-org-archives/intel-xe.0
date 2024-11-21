Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A627AD6ED13
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 12:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7917510E402;
	Thu, 21 Nov 2024 12:22:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E1A10E402;
 Thu, 21 Nov 2024 12:22:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_use_hw_support_for_min/in?=
 =?utf-8?q?terim_ddb_allocation_for_async_flip_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 12:22:26 -0000
Message-ID: <173219174678.1108311.12057767729237439412@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121112726.510220-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241121112726.510220-1-vinod.govindapillai@intel.com>
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

Series: use hw support for min/interim ddb allocation for async flip (rev2)
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
commit 70a2e2b080fd50a1c7b9170e8037b2d416c2f6a1
Author: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date:   Thu Nov 21 13:27:26 2024 +0200

    drm/i915/xe3: Use hw support for min/interim ddb allocations for async flip
    
    Xe3 is capable of switching automatically to min ddb allocation
    (not using any extra blocks) or interim SAGV-adjusted allocation
    in case if async flip is used. Introduce the minimum and interim
    ddb allocation configuration for that purpose. Also i915 is
    replaced with intel_display within the patch's context
    
    v2: update min/interim ddb declarations and handling (Ville)
        update to register definitions styling
        consolidation of minimal wm0 check with min DDB check
    
    Bspec: 69880, 72053
    Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch e46649e7764a9f6868ccbcba7b8b23b413303380 drm-intel
3cff11f4fe3d drm/i915/display: update to plane_wm register access function
c93b20a5beef drm/i915/display: update to relative data rate handling
70a2e2b080fd drm/i915/xe3: Use hw support for min/interim ddb allocations for async flip
-:133: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#133: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:389:
+							_PLANE_MIN_BUF_CFG_1_A, _PLANE_MIN_BUF_CFG_1_B, \

-:134: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#134: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:390:
+							_PLANE_MIN_BUF_CFG_2_A, _PLANE_MIN_BUF_CFG_2_B)

-:139: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:395:
+#define	  PLANE_INTERIM_DBUF_BLOCKS(val)	REG_FIELD_PREP(PLANE_INTERIM_DBUF_BLOCKS_MASK, (val))

total: 0 errors, 3 warnings, 0 checks, 357 lines checked


