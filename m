Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42041C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 15:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE18210EDFE;
	Tue, 14 Jul 2026 15:33:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E5310EDF9;
 Tue, 14 Jul 2026 15:33:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Enable_UHB?=
 =?utf-8?q?R_link_rates_on_tunneled_links?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 15:33:46 -0000
Message-ID: <178404322620.189125.10951457481035124758@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714152700.555527-1-imre.deak@intel.com>
In-Reply-To: <20260714152700.555527-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Enable UHBR link rates on tunneled links
URL   : https://patchwork.freedesktop.org/series/170424/
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
commit 351a14a3af91735a75f41fd899224725417d0d66
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Jul 14 18:27:00 2026 +0300

    drm/i915/dp_tunnel: Add UHBR tunneling support
    
    Add support for UHBR link rates on Thunderbolt tunneled links.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 5974bf0dae59523b3ae9f53e67a394e76b926a04 drm-intel
2012777e6cfd drm/dp_tunnel: Add UHBR tunneling support
1adbd5a21932 drm/i915/dp: End link configuration loops properly
8e3b5c066f52 drm/i915/dp: Enable SST fallback between UHBR and non-UHBR rates
8bf4e58688e0 drm/i915/dp: Remove UHBR dependency from SST fallback kunit test
7ef0ce299d8c drm/i915/dp: Disable UHBR link configs with 1/2 lanes
351a14a3af91 drm/i915/dp_tunnel: Add UHBR tunneling support
-:34: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#34: FILE: drivers/gpu/drm/i915/display/intel_dp.c:210:
+	static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT == DP_UHBR10 &&

-:35: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#35: FILE: drivers/gpu/drm/i915/display/intel_dp.c:211:
+		      DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT == DP_UHBR13_5 &&

total: 0 errors, 2 warnings, 0 checks, 61 lines checked


