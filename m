Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA106C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 10:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB9410E561;
	Tue, 11 Mar 2025 10:53:44 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B167210E561;
 Tue, 11 Mar 2025 10:53:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dsi=3A_let_HW_ma?=
 =?utf-8?q?intain_the_HS-TRAIL_timing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "William Tseng" <william.tseng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 10:53:43 -0000
Message-ID: <174169042372.17941.11545709356302278277@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20211110102354.5640-1-william.tseng@intel.com>
In-Reply-To: <20211110102354.5640-1-william.tseng@intel.com>
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

Series: drm/i915/dsi: let HW maintain the HS-TRAIL timing
URL   : https://patchwork.freedesktop.org/series/146128/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5acafa97718bf28924e9c973360663a196fa3f95
Author: William Tseng <william.tseng@intel.com>
Date:   Tue Mar 11 18:06:26 2025 +0800

    drm/i915/dsi: let HW maintain the HS-TRAIL timing
    
    This change is to avoid over-specification of the TEOT timing
    parameter, which is derived from software in current design.
    
    Supposed that THS-TRAIL and THS-EXIT have the minimum values,
    i.e., 60 and 100 in ns. If SW is overriding the HW default,
    the TEOT value becomes 150 ns, approximately calculated by
    the following formula.
    
      DIV_ROUND_UP(60/50)*50 + DIV_ROUND_UP(100/50))*50/2, where 50
      is LP Escape Clock time in ns.
    
    The TEOT value 150 ns is larger than the maximum value,
    around 136 ns if UI is 1.8ns, (105 ns + 12*UI, defined by MIPI
    DPHY specification).
    
    However, the TEOT value will meet the specification if THS-TRAIL
    is set to the HW default, instead of software overriding.
    
    The timing change is made for both data lane and clock lane.
    
    v1: initial version.
    v2: change clock lane dphy timings.
    v3: remove calculation of trail cnt.
    v4: rebase.
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13891
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
    Cc: Lee Shawn C <shawn.c.lee@intel.com>
    Cc: Cooper Chiou <cooper.chiou@intel.com>
    Signed-off-by: William Tseng <william.tseng@intel.com>
    Acked-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
+ /mt/dim checkpatch 777e1850811f9864aa8b55940634d3da19712bf7 drm-intel
5acafa97718b drm/i915/dsi: let HW maintain the HS-TRAIL timing


