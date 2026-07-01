Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461F1C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 20:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040CB10E3E9;
	Wed,  1 Jul 2026 20:35:27 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9347A10E1ED;
 Wed,  1 Jul 2026 20:35:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/mst=3A_limit_DP_?=
 =?utf-8?q?MST_ESI_service_loop_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 20:35:25 -0000
Message-ID: <178293812559.139769.462548996762038832@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625142204.1078287-1-jani.nikula@intel.com>
In-Reply-To: <20260625142204.1078287-1-jani.nikula@intel.com>
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

Series: drm/i915/mst: limit DP MST ESI service loop (rev2)
URL   : https://patchwork.freedesktop.org/series/169206/
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
commit 16022b952c226958ff9c4ba2771b22baea1c2639
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 25 17:22:04 2026 +0300

    drm/i915/mst: limit DP MST ESI service loop
    
    The loop in intel_dp_check_mst_status() keeps servicing interrupts
    originating from the sink without bound. Add an upper bound to the new
    interrupts occurring during interrupt processing to not get stuck on
    potentially stuck sink devices. Use arbitrary 32 tries to clear incoming
    interrupts in one go.
    
    Discovered using AI-assisted static analysis confirmed by Intel Product
    Security.
    
    Note: The condition likely pre-dates the commit in the Fixes: tag, but
    this is about as far back as a backport has any chance of
    succeeding. Before that, the retry had a goto.
    
    Reported-by: Martin Hodo <martin.hodo@intel.com>
    Fixes: 3c0ec2c2d594 ("drm/i915: Flatten intel_dp_check_mst_status() a bit")
    Cc: <stable@vger.kernel.org> # v5.8+
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 0cafeac0ca1baa5846a52337c6b7cd94f830da72 drm-intel
16022b952c22 drm/i915/mst: limit DP MST ESI service loop
-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#22: 
Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 3c0ec2c2d594 ("drm/i915: Flatten intel_dp_check_mst_status() a bit")

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


