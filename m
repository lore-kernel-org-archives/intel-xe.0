Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C15CCCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 17:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33C710E178;
	Mon, 27 Oct 2025 17:23:05 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8B810E178;
 Mon, 27 Oct 2025 17:23:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/x3p=5Flpd=3A_FBC?=
 =?utf-8?q?_related_patches?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 17:23:04 -0000
Message-ID: <176158578490.59321.14699494825495577537@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027134001.325064-1-vinod.govindapillai@intel.com>
In-Reply-To: <20251027134001.325064-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/x3p_lpd: FBC related patches
URL   : https://patchwork.freedesktop.org/series/156587/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 07a989a2f13f5d5e9f20d6afb04b1dae495af030
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Mon Oct 27 15:40:01 2025 +0200

    drm/i915/xe3p_lpd: use pixel normalizer for fp16 formats for FBC
    
    There is a hw restriction that we could enable the FBC for FP16
    formats only if the pixel normalization block is enabled. Hence
    enable the pixel normalizer block with normalzation factor as
    1.0 for the supported FP16 formats to get the FBC enabled. Two
    existing helper function definitions are moved up to avoid the
    forward declarations as part of this patch as well.
    
    v2: sw/hw state differentiation on handling pixel normalizer (Jani)
    
    Bspec: 69863, 68881
    Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 6c42b2ca1a7f0fafa84f65690540d1e70096d469 drm-intel
e4bb8c56f20a drm/i915/xe3p_lpd: Extend FBC support to UINT16 formats
f19b0743716f drm/i915/xe3p_lpd: Add FBC support for FP16 formats
c83e7ee11151 drm/i915/xe3p_lpd: extract pixel format valid routine for FP16 formats
07a989a2f13f drm/i915/xe3p_lpd: use pixel normalizer for fp16 formats for FBC
-:170: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#170: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:463:
+								_PLANE_PIXEL_NORMALIZE_1_A, _PLANE_PIXEL_NORMALIZE_1_B, \

-:171: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#171: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:464:
+								_PLANE_PIXEL_NORMALIZE_2_A, _PLANE_PIXEL_NORMALIZE_2_B)

-:174: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#174: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:467:
+#define   PLANE_PIXEL_NORMALIZE_NORM_FACTOR(val)	REG_FIELD_PREP(PLANE_PIXEL_NORMALIZE_NORM_FACTOR_MASK, (val))

total: 0 errors, 3 warnings, 0 checks, 133 lines checked


