Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AC0C44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 23:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DFE10E385;
	Thu, 16 Jul 2026 23:06:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA13210E385;
 Thu, 16 Jul 2026 23:06:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/4=5D_drm/xe/display=3A_Expose_plane_max_width/height_helpers_to_?=
 =?utf-8?q?global_scope?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 23:06:01 -0000
Message-ID: <178424316175.199042.11648926202256893173@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260716225956.555995-1-vinod.govindapillai@intel.com>
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

Series: series starting with [1/4] drm/xe/display: Expose plane max width/height helpers to global scope
URL   : https://patchwork.freedesktop.org/series/170606/
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
commit 6c39f8f282cc25631c8e9242cd566abf8b45d39b
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Fri Jul 17 01:59:56 2026 +0300

    drm/i915/fbc: xe2_lpd+ no more surface size restrictions for FBC
    
    From xe2_lpd+ platforms, enabling FBC do not depend on the
    surface size. So remove it.
    
    Bspec: 69560
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 0475e2d5dc3aa1940a612bfd5031c6656a925624 drm-intel
65d2d8682156 drm/xe/display: Expose plane max width/height helpers to global scope
-:71: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#71: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.h:51:
+int intel_plane_max_height(struct intel_plane *plane,
+			  const struct drm_framebuffer *fb,

total: 0 errors, 0 warnings, 1 checks, 48 lines checked
d37e36cd2957 drm/i915/fbc: refactor maximum plane size handling for fbc
f419252c1869 drm/i915/fbc: xe2_lpd+ don't require any hardcoded plane width limit
6c39f8f282cc drm/i915/fbc: xe2_lpd+ no more surface size restrictions for FBC


