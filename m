Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BAEC02198
	for <intel-xe@archiver.kernel.org>; Sun, 16 Feb 2025 20:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EA410E15E;
	Sun, 16 Feb 2025 20:15:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415AC10E15E;
 Sun, 16 Feb 2025 20:15:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/fbc=3A_FBC_Dirty?=
 =?utf-8?q?_rect_feature_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 16 Feb 2025 20:15:58 -0000
Message-ID: <173973695826.3045241.2324233962882043742@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213132559.136815-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250213132559.136815-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: FBC Dirty rect feature support (rev2)
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
commit d7680dd231782c484d621e95f7ec77c99db6a082
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Sun Feb 16 22:09:06 2025 +0200

    drm/i915/fbc: handle dirty rect coords for the first frame
    
    During enablig FBC, for the very first frame, the prepare dirty
    rect routine wouldnt have executed as at that time the plane
    reference in the fbc_state would be NULL. So this could make
    driver program some invalid entries as the damage area. Though
    fbc hw ignores the dirty rect values programmed for the first
    frame after enabling FBC, driver must ensure that valid dirty
    rect coords are programmed. So ensure that for the first frame
    prepare dirty rect is called at the time enabling FBC.
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 27f464a14e8d7d6c1e86e821a1f5ece6c0540e18 drm-intel
77f2a28b7534 drm/damage-helper: add const qualifier in drm_atomic_helper_damage_merged()
f7aff0382dcf drm/i915/display: update and store the plane damage clips
59e7ff50b56f drm/i915/fbc: add register definitions for fbc dirty rect support
-:26: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:107:
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
a976969bd239 drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
86f67e8427dd drm/i915/fbc: avoid calling fbc activate if fbc is active
c0f672d7d8b8 drm/i915/fbc: dirty rect support for FBC
d3c3ee543966 drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
d7680dd23178 drm/i915/fbc: handle dirty rect coords for the first frame


