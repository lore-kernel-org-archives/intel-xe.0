Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14772D63923
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 10:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2310E6EA;
	Wed, 20 Nov 2024 10:42:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE8C10E6EA;
 Wed, 20 Nov 2024 10:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_DP_DSC_min/max_src_bpc_fi?=
 =?utf-8?q?xes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 10:42:04 -0000
Message-ID: <173209932486.678852.9840844690639298679@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120103802.134295-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241120103802.134295-1-ankit.k.nautiyal@intel.com>
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

Series: DP DSC min/max src bpc fixes (rev2)
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
commit 7f0480dc294746b4af70bd2a4cf4733849e24d93
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Nov 20 16:08:02 2024 +0530

    drm/i915/dp: Set the DSC link limits intel_dp_compute_config_link_bpp_limits
    
    The helper intel_dp_compute_config_link_bpp_limits is the correct place
    to set the DSC link limits. Move the code to this function and remove
    the #TODO item.
    
    v2: Add argument intel_connector to the helper to get correct connector
    for DP MST. (Imre)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch ccf64319402f90f68549e2047a7f985a46436e41 drm-intel
c0471df69518 drm/i915/dp: Refactor FEC support check in intel_dp_supports_dsc
1ef0ccff4d89 drm/i915/dp: Return early if DSC not supported
e7f860ed6beb drm/i915/dp: Separate out helper for compute fec_enable
506e79a7643f drm/i915/dp: Remove HAS_DSC macro for intel_dp_dsc_max_src_input_bpc
8735c86b12d9 drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
fba997220178 drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
66b82e95ed8a drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
43d00242c1f8 drm/i915/dp: Refactor pipe_bpp limits with dsc
435139c85fa1 drm/i915/dp_mst: Refactor pipe_bpp limits with dsc for mst
1921aae4068d drm/i915/dp: Use clamp for pipe_bpp limits with DSC
6681687ef797 drm/i915/dp: Make dsc helpers accept const crtc_state pointers
7f0480dc2947 drm/i915/dp: Set the DSC link limits intel_dp_compute_config_link_bpp_limits


