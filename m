Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAD9C282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 11:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375AD10E093;
	Fri, 28 Feb 2025 11:14:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDED10E093;
 Fri, 28 Feb 2025 11:14:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/fbc=3A_FBC_Dirty?=
 =?utf-8?q?_rect_feature_support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 11:14:01 -0000
Message-ID: <174074124150.3196042.6723475536345610310@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: FBC Dirty rect feature support (rev4)
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
commit 09526754c1731594de911b65aaf7848cf9876b89
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Fri Feb 28 11:38:02 2025 +0200

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
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 4e4a83bc30b77bb710641f0b43e6098bd04c5044 drm-intel
181c99bb94c2 drm/i915/fbc: remove one duplicate forward declaration
1f30dbc2fadb drm/damage-helper: add const qualifier in drm_atomic_helper_damage_merged()
9c0c749def2e drm/i915/display: update and store the plane damage clips
8e43d5f5de25 drm/i915/fbc: add register definitions for fbc dirty rect support
-:30: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:107:
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
5d1fea8032de drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
8d898cf8c3be drm/i915/fbc: avoid calling fbc activate if fbc is active
ef9ccb2efa0a drm/i915/fbc: dirty rect support for FBC
ab523774597e drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
09526754c173 drm/i915/fbc: handle dirty rect coords for the first frame


