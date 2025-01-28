Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430FBC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 17:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFD110E125;
	Tue, 28 Jan 2025 17:27:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440D410E125;
 Tue, 28 Jan 2025 17:27:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3=3A_FBC_Dirty?=
 =?utf-8?q?_rect_feature_support_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 17:27:35 -0000
Message-ID: <173808525527.2016846.8558322977473191008@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128155418.305595-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250128155418.305595-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/xe3: FBC Dirty rect feature support (rev6)
URL   : https://patchwork.freedesktop.org/series/141526/
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
commit b6d31f794d558bb28ad7d4f11448bf4d3d8bb152
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Tue Jan 28 17:54:18 2025 +0200

    drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled
    
    It is not recommended to have both FBC dirty rect and PSR2
    selective fetch be enabled at the same time. If PSR2 selective
    fetch or panel replay is on, mark FBC as not possible.
    
    v2: fix the condition to disable FBC if PSR2 enabled (Jani)
    
    v3: use HAS_FBC_DIRTY_RECT()
    
    Bspec: 68881
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 20759526c04a7f776f477bee66300dae33b51872 drm-intel
911318d9032e drm/i915/xe3: add register definitions for fbc dirty rect support
-:24: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:107:
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
f29ae72ad1da drm/i915/xe3: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
1721f06a5e02 drm/i915/display: get old_plane_state to the check_plane routine
3e5fbb905e3c drm/i915/display: update and store the plane damage clips
0e341dc2cbba drm/i915/xe3: avoid calling fbc activate if fbc is active
e6e9f265ebff drm/i915/xe3: dirty rect support for FBC
b6d31f794d55 drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled


