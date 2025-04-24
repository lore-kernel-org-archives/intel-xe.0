Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13FAC369C2
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 14:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C4010E07F;
	Thu, 24 Apr 2025 14:59:59 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2595E10E0A5;
 Thu, 24 Apr 2025 14:59:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Rework/Correction_on_mini?=
 =?utf-8?q?mum_hblank_calculation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 14:59:58 -0000
Message-ID: <174550679815.7100.7350667225367937677@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424-hblank-v6-0-3d10442d9a31@intel.com>
In-Reply-To: <20250424-hblank-v6-0-3d10442d9a31@intel.com>
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

Series: Rework/Correction on minimum hblank calculation (rev6)
URL   : https://patchwork.freedesktop.org/series/147360/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a854796ef51bcb995282b27e1f09b1123bc19184
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Apr 24 13:52:30 2025 +0530

    drm/i915/display: move min_hblank from dp_mst.c to dp.c
    
    Minimum HBlank is programmed to address jitter for high resolutions with
    high refresh rates that have small Hblank, specifically where Hblank is
    smaller than one MTP.
    
    TODO: Add the min_hblank calculation for hdmi as well.
    
    v2: move from intel_audio.c to intel_dp.c
        some correction in link_bpp_x16 (Imre)
    v3: min_hblank for 8b/10b MST and 128b/132b SST/MST
        handle error for intel_dp_mst_dsc_get_slice_count
        reset min_hblank before disabling transcoder (Imre)
    v4: compute link_bpp_x16 within compute_min_hblank,
        return error in case of compute failure
        call compute_min_hblank() before vrr_compute_config (Imre)
    v5: readout MIN_HBLAN reg for Xe3+
    
    Reviewed-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 6176f71822602f52bc4327965090275c5570ed0d drm-intel
dcb31d3e5b87 drm/display/dp: Export fn to calculate link symbol cycles
a854796ef51b drm/i915/display: move min_hblank from dp_mst.c to dp.c


