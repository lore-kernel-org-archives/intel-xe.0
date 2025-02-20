Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1BFC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 10:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958F910E93E;
	Thu, 20 Feb 2025 10:47:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096710E93E;
 Thu, 20 Feb 2025 10:47:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/fbc=3A_FBC_Dirty?=
 =?utf-8?q?_rect_feature_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 10:47:55 -0000
Message-ID: <174004847578.167678.6846886554611948066@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220104144.207526-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250220104144.207526-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: FBC Dirty rect feature support (rev3)
URL   : https://patchwork.freedesktop.org/series/144723/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit adbe800b247d5d0e05c2c3154c35445e671ff521
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Thu Feb 20 12:41:44 2025 +0200

    drm/i915/fbc: handle dirty rect coords for the first frame
    
    During enabling FBC, for the very first frame, the prepare dirty
    rect routine wouldnt have executed as at that time the plane
    reference in the fbc_state would be NULL. So this could make
    driver program some invalid entries as the damage area. Though
    fbc hw ignores the dirty rect values programmed for the first
    frame after enabling FBC, driver must ensure that valid dirty
    rect coords are programmed. So ensure that for the first frame
    correct dirty rect coords are updated to the HW.
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 1d579c3706d3698c87fddca8cf001e46e22efe0c drm-intel
1dce36f36e22 drm/damage-helper: add const qualifier in drm_atomic_helper_damage_merged()
a5a5f3a9e4fc drm/i915/display: update and store the plane damage clips
7066d374ab3b drm/i915/fbc: add register definitions for fbc dirty rect support
-:30: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:107:
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
8bad07c80719 drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
8bbbbeeccbe1 drm/i915/fbc: avoid calling fbc activate if fbc is active
c3dde92e186c drm/i915/fbc: dirty rect support for FBC
1e26c340a06d drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
adbe800b247d drm/i915/fbc: handle dirty rect coords for the first frame


