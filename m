Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B325C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6AD10E8C3;
	Wed, 12 Feb 2025 14:30:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9578B10E0CE;
 Wed, 12 Feb 2025 14:30:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/fbc=3A_FBC_Dirty?=
 =?utf-8?q?_rect_feature_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 14:30:54 -0000
Message-ID: <173937065460.1322011.18164532967354693032@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250212131420.60026-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: FBC Dirty rect feature support
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
commit cb6e9d7e3c01bede0df5b17ff1933ccbb8c2c1b4
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Wed Feb 12 15:14:20 2025 +0200

    drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled
    
    It is not recommended to have both FBC dirty rect and PSR2
    selective fetch be enabled at the same time. If PSR2 selective
    fetch or panel replay is on, mark FBC as not possible.
    
    v2: fix the condition to disable FBC if PSR2 enabled (Jani)
    
    v3: use HAS_FBC_DIRTY_RECT()
    
    Bspec: 68881
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 5bf5e8eecd1eaeb1f5c0c36b5047d6884b5b8668 drm-intel
24f7851ebe54 drm/damage-helper: add const qualifier in drm_atomic_helper_damage_merged()
e2b932baf08a drm/i915/xe3: update and store the plane damage clips
82680b90568b drm/i915/xe3: add register definitions for fbc dirty rect support
-:24: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:107:
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
7f51c8cba193 drm/i915/xe3: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
19bc7265d74c drm/i915/xe3: avoid calling fbc activate if fbc is active
738bbacc3cd5 drm/i915/xe3: dirty rect support for FBC
cb6e9d7e3c01 drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled


