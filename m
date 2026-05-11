Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618A1CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 13:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBBB10E53C;
	Mon, 11 May 2026 13:36:00 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BC910E53B;
 Mon, 11 May 2026 13:35:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_More_Fixes_for_color_pipe?=
 =?utf-8?q?line?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 May 2026 13:35:59 -0000
Message-ID: <177850655975.56530.10710105292744391659@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
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

Series: More Fixes for color pipeline
URL   : https://patchwork.freedesktop.org/series/166292/
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
commit 1d048fb189211d7a3f90858a6471c5fd5e1c75e5
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon May 11 11:02:13 2026 +0530

    drm/i915: Fix color blob reference handling in intel_plane_state
    
    Take proper references for hw color blobs (degamma_lut, gamma_lut,
    ctm, lut_3d) in intel_plane_duplicate_state() and drop them in
    intel_plane_destroy_state().
    
    v2:
    - handle blobs in hw state clear
    
    Fixes: 3b7476e786c2 ("drm/i915/color: Add framework to program PRE/POST CSC LUT")
    Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
    Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
    Reviewed-by: Pranay Samala <pranay.samala@intel.com> #v1
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 6cfe03d5832de891397bc05fe788e79de49c51cc drm-intel
16bc20f308e0 drm/i915/display: Copy color pipeline from plane in the primary joiner pipe
7bf67f489f50 drm/i915/display: Don’t use atomic state back-pointer to derive color pipeline
-:26: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#26: 
Assisted-by: GitHub Copilot:Claude Sonnet 4.6

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
ddb21f0454f9 drm/i915: Avoid programming color HW blocks for NV12 Y planes
-:19: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#19: 
Assisted-by: GitHub Copilot:Claude Sonnet 4.6

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
1d048fb18921 drm/i915: Fix color blob reference handling in intel_plane_state


