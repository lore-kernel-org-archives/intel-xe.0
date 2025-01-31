Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F6C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 12:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74C710EAA5;
	Fri, 31 Jan 2025 12:57:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D3610EAA5;
 Fri, 31 Jan 2025 12:57:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_dsc_fix=2C?=
 =?utf-8?q?_refactoring_and_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 12:57:23 -0000
Message-ID: <173832824362.3208008.13053208530888741452@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738327620.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738327620.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: dsc fix, refactoring and cleanups
URL   : https://patchwork.freedesktop.org/series/144178/
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
commit c72d870ccc7f2819eb3ecf1568ca09391206b330
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jan 31 14:50:07 2025 +0200

    drm/i915/mst: Convert intel_dp_mtp_tu_compute_config() to .4 format
    
    Move towards always using the fxp q4 or .4 fixed point format for
    compressed bpp. We'll need to pass the more accurate bpp to this
    function later on.
    
    Always use _x16 naming for variables that are in .4 fixed point for
    clarity.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 7998f28da73c50ffddff38ac74f5aa48a76a0b0a drm-intel
c14b5957d508 drm/i915/dp: Iterate DSC BPP from high to low on all platforms
07b38ca84a52 drm/i915/dp: Add intel_dp_dsc_bpp_step_x16() helper to get DSC BPP precision
594613b83916 drm/i915/dp: Rename some variables in xelpd_dsc_compute_link_config()
c66a83809788 drm/i915/dp: Pass .4 BPP values to {icl, xelpd}_dsc_compute_link_config()
c3e7cf18acdf drm/i915/dp: Move max DSC BPP reduction one level higher
-:89: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#89: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2183:
+						     min_bpp_x16, max_bpp_x16, bpp_step_x16, timeslots);

total: 0 errors, 1 warnings, 0 checks, 72 lines checked
bcfda87d778e drm/i915/dp: Change icl_dsc_compute_link_config() DSC BPP iteration
6b4c8ac71c6f drm/i915/dp: Move force_dsc_fractional_bpp_en check to intel_dp_dsc_valid_bpp()
728cb339866d drm/i915/dp: Unify DSC link config functions
2910112d05ed drm/i915/dp: Inline do_dsc_compute_compressed_bpp()
af92fc33ab1e drm/i915/dp: Simplify input BPP checks in intel_dp_dsc_compute_pipe_bpp()
d8d605850348 drm/i915/dp: Use int for compressed BPP in dsc_compute_link_config()
71cfa57159f1 drm/i915/dp: Drop compute_pipe_bpp parameter from intel_dp_dsc_compute_config()
8cf9b1cf0613 drm/i915/dp: Pass connector state all the way to dsc_compute_link_config()
c72d870ccc7f drm/i915/mst: Convert intel_dp_mtp_tu_compute_config() to .4 format
-:72: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:252:
+		drm_dbg_kms(display->drm, "Limiting bpp to max DPT bpp (" FXP_Q4_FMT " -> " FXP_Q4_FMT ")\n",

-:79: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#79: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:257:
+	drm_dbg_kms(display->drm, "Looking for slots in range min bpp " FXP_Q4_FMT " max bpp " FXP_Q4_FMT "\n",

total: 0 errors, 2 warnings, 0 checks, 120 lines checked


