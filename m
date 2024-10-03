Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23714CF857A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 10:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EA610E7F7;
	Thu,  3 Oct 2024 10:49:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B132910E7F6;
 Thu,  3 Oct 2024 10:49:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_DP_DSC_min/max_src_bpc_fi?=
 =?utf-8?q?xes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 10:49:46 -0000
Message-ID: <172795258672.1167531.10858062712755628583@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003104343.984060-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241003104343.984060-1-ankit.k.nautiyal@intel.com>
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

Series: DP DSC min/max src bpc fixes
URL   : https://patchwork.freedesktop.org/series/139490/
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
commit 61c2cf0ee30531ee3a579537962429d1913a2ade
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Oct 3 16:13:43 2024 +0530

    drm/i915/dp: Set the DSC link limits intel_dp_compute_config_link_bpp_limits
    
    The helper intel_dp_compute_config_link_bpp_limits is the correct place
    to set the DSC link limits. Move the code to this function and remove
    the #TODO item.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch af143300756485947a455fe84414adb35904c230 drm-intel
aed08459841a drm/i915/dp: Use HAS_DSC macro in intel_dp_dsc_max_src_input_bpc
8b2c7529d3cf drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
a7497fb6f852 drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
1d76cc728298 drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
6fe6682f622c drm/i915/dp: Refactor pipe_bpp limits with dsc
f9db0c3bd142 drm/i915/dp: Use clamp for pipe_bpp limits with DSC
61c2cf0ee305 drm/i915/dp: Set the DSC link limits intel_dp_compute_config_link_bpp_limits


