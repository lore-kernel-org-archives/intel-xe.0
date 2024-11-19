Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33D5D60D00
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 00:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A85C10E29E;
	Tue, 19 Nov 2024 00:44:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE6A10E29E;
 Tue, 19 Nov 2024 00:44:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3=3A_FBC_Dirty?=
 =?utf-8?q?_rect_feature_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 00:44:06 -0000
Message-ID: <173197704646.107714.9245911786621287804@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118235325.353010-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241118235325.353010-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/xe3: FBC Dirty rect feature support
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
commit 42c23d00a9feb96f0157c5fa0d49f6a41652b30c
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Tue Nov 19 01:53:25 2024 +0200

    drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled
    
    FBC dirty rect support and PSR2 selective fetch canno be enabled
    together. In xe3 driver enables the FBC dirty rect feature by
    default. So PSR2 is enabled, then mark that plane as FBC cannot
    be enabled. Later on we need to find a way to select between
    FBC and PSR2 based on amount of damaged areas.
    
    Bspec: 68881
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 drm-intel
017ccdf1decf drm/i915/display: update intel_fbc_atomic_check for dirty_fbc support
5b88c6350547 drm/i915/display: add register definitions for fbc dirty rect support
-:24: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:107:
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
d301c2c07490 drm/i915/xe3: add dirty rect support for FBC
-:129: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#129: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:1746:
+static void intel_fbc_compute_dirty_rect(struct intel_plane *plane,
+					struct intel_plane_state *old_plane_state,

total: 0 errors, 0 warnings, 1 checks, 193 lines checked
42c23d00a9fe drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled


