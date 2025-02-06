Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4D8C02192
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 01:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D695610E1FF;
	Thu,  6 Feb 2025 01:23:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95C210E1FF;
 Thu,  6 Feb 2025 01:23:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=5Fmst=3A_Fix_?=
 =?utf-8?q?getting_display_pointer_in_intel=5Fdp=5Fmst=5Fcompute=5Fmin=5Fhbl?=
 =?utf-8?q?ank=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 01:23:38 -0000
Message-ID: <173880501888.1729529.2254010859683780851@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205232855.3017421-1-imre.deak@intel.com>
In-Reply-To: <20250205232855.3017421-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Fix getting display pointer in intel_dp_mst_compute_min_hblank()
URL   : https://patchwork.freedesktop.org/series/144388/
State : success

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
commit 84f1baafc7e080d28a44edafa8b2163e32f15020
Author: Imre Deak <imre.deak@intel.com>
Date:   Thu Feb 6 02:17:26 2025 +0200

    drm/i915/dp_mst: Fix getting display pointer in intel_dp_mst_compute_min_hblank()
    
    The MST intel_connector::encoder pointer is NULL if the connector hasn't
    been enabled before, so it can't be used to retrieve the display
    pointer. Use instead the crtc_state and drop the unused connector
    parameter.
    
    v2: Use the crtc_state and drop the unused connector parameter.
    
    Fixes: a5ebe00c2ace ("drm/i915/dp: Guarantee a minimum HBlank time")
    Reported-and-tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
    Closes: https://lore.kernel.org/all/16754ee4cd21d99c1e81c5953134b496dd07630f.camel@intel.com
    Reviewed-by: Khaled Almahallawy <khaled.almahallawy@intel.com> #v1
    Cc: Arun R Murthy <arun.r.murthy@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 7a632b6798b6a05b63725249e3209afea13ea499 drm-intel
84f1baafc7e0 drm/i915/dp_mst: Fix getting display pointer in intel_dp_mst_compute_min_hblank()


