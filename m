Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55107C3601E
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 03:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167FC10E2D8;
	Mon, 14 Apr 2025 03:11:25 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10DB10E2D8;
 Mon, 14 Apr 2025 03:11:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/display=3A_Add_macro_for_checking_3_DSC_engines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 03:11:24 -0000
Message-ID: <174460028465.8530.651212859261965320@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250414024256.2782702-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250414024256.2782702-1-ankit.k.nautiyal@intel.com>
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

Series: series starting with [1/2] drm/i915/display: Add macro for checking 3 DSC engines
URL   : https://patchwork.freedesktop.org/series/147642/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7ccac502ba5340156d63d9e1f4c62f03a406a56b
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Apr 14 08:12:56 2025 +0530

    drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices
    
    DSC 12 slices configuration is used for some specific cases with
    Ultrajoiner. This can be supported only when each of the 4 joined pipes
    have 3 DSC engines each.
    
    Add the missing check for 3 DSC engines support before using 3 DSC
    slices per pipe.
    
    Fixes: be7f5fcdf4a0 ("drm/i915/dp: Enable 3 DSC engines for 12 slices")
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: <stable@vger.kernel.org> # v6.14+
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch a2c9cfa67f8b676a78d18d572daebb04b38a8dc5 drm-intel
557f8ad33740 drm/i915/display: Add macro for checking 3 DSC engines
7ccac502ba53 drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices


