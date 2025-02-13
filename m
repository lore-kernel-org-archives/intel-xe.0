Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2F3C0219D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 13:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7363610E3F2;
	Thu, 13 Feb 2025 13:33:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9633F10E3F2;
 Thu, 13 Feb 2025 13:33:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/fbc=3A_FBC_Dirty?=
 =?utf-8?q?_rect_feature_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 13:33:03 -0000
Message-ID: <173945358361.1670787.4881335266685541181@b555e5b46a47>
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
commit 388f23cd4f0a4e87f245bd4b8b5deec034c8d111
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Thu Feb 13 15:25:58 2025 +0200

    drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
    
    It is not recommended to have both FBC dirty rect and PSR2
    selective fetch be enabled at the same time. Mark FBC as not
    possible, if PSR2 selective fetch is enabled.
    
    v2: fix the condition to disable FBC if PSR2 enabled (Jani)
    
    v3: use HAS_FBC_DIRTY_RECT()
    
    v4: Update to patch description
    
    Bspec: 68881
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch dbf65862427b99b51ac5279560a1f7995779480b drm-intel
014da90635cb drm/damage-helper: add const qualifier in drm_atomic_helper_damage_merged()
18fb031048ff drm/i915/display: update and store the plane damage clips
a902d5b63b9e drm/i915/fbc: add register definitions for fbc dirty rect support
-:26: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:107:
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
4fd2ad5b129e drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
3d1ad24a1d30 drm/i915/fbc: avoid calling fbc activate if fbc is active
ab1e7eb20435 drm/i915/fbc: dirty rect support for FBC
388f23cd4f0a drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled


